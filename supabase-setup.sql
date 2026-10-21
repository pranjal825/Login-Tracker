-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run

create table if not exists public.tracker_data (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  session_id text,
  updated_at timestamptz not null default now()
);

alter table public.tracker_data enable row level security;

-- Users may only READ their own row. There are no insert/update/delete
-- policies, so all writes must go through the two functions below.
drop policy if exists "read own row" on public.tracker_data;
create policy "read own row" on public.tracker_data
  for select to authenticated using (auth.uid() = user_id);

-- Called on every sign-in: this device becomes the one active session.
-- Any other device holding an older session id is rejected on its next save.
create or replace function public.claim_session(p_session text)
returns void language plpgsql security definer set search_path = public as $$
begin
  insert into public.tracker_data (user_id, session_id)
  values (auth.uid(), p_session)
  on conflict (user_id) do update set session_id = excluded.session_id;
end $$;

-- Saves data only if the caller still owns the active session.
create or replace function public.save_data(p_session text, p_data jsonb)
returns boolean language plpgsql security definer set search_path = public as $$
declare n int;
begin
  update public.tracker_data
     set data = p_data, updated_at = now()
   where user_id = auth.uid() and session_id = p_session;
  get diagnostics n = row_count;
  return n > 0;
end $$;

revoke all on function public.claim_session(text) from public, anon;
revoke all on function public.save_data(text, jsonb) from public, anon;
grant execute on function public.claim_session(text) to authenticated;
grant execute on function public.save_data(text, jsonb) to authenticated;
