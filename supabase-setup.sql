-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run
-- (If you ran the earlier version of this file, that is fine; this does not conflict with it.)

create table if not exists public.tracker_sync (
  code_hash  text primary key,
  data       jsonb not null default '{}'::jsonb,
  version    int not null default 0,
  updated_at timestamptz not null default now()
);

-- No policies: nobody can read or write the table directly.
-- All access goes through the two functions below, which need the sync code.
alter table public.tracker_sync enable row level security;

create or replace function public.sync_load(p_code text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare h text; r record;
begin
  if p_code is null or length(p_code) < 12 then
    raise exception 'Sync code must be at least 12 characters';
  end if;
  h := encode(sha256(convert_to(p_code, 'utf8')), 'hex');
  insert into public.tracker_sync (code_hash) values (h) on conflict do nothing;
  select t.data, t.version into r from public.tracker_sync t where t.code_hash = h;
  return jsonb_build_object('data', r.data, 'version', r.version);
end $$;

-- Saves only if the caller has the latest version; returns the new version,
-- or null if another device saved first.
create or replace function public.sync_save(p_code text, p_data jsonb, p_ver int)
returns int language plpgsql security definer set search_path = public as $$
declare h text; v int;
begin
  if p_code is null or length(p_code) < 12 then
    raise exception 'Sync code must be at least 12 characters';
  end if;
  h := encode(sha256(convert_to(p_code, 'utf8')), 'hex');
  update public.tracker_sync
     set data = p_data, version = version + 1, updated_at = now()
   where code_hash = h and version = p_ver
  returning version into v;
  return v;
end $$;

revoke all on function public.sync_load(text) from public;
revoke all on function public.sync_save(text, jsonb, int) from public;
grant execute on function public.sync_load(text) to anon, authenticated;
grant execute on function public.sync_save(text, jsonb, int) to anon, authenticated;
