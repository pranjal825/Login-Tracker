# My Work Tracker

A simple, mobile-friendly working hours tracker. One HTML file and no build step. Accounts and cloud sync run on a free Supabase project.

## Features

- One-tap Login and Logout with automatic time recording
- Daily plus/minus balance against a configurable target (default 9h 06m)
- Running balance that carries forward; extra work recovers negative hours
- Leave adjustments (full day, half day, or custom minutes)
- Weekly and monthly totals, plus a month-by-month table with running balance
- Add or edit any past day manually
- CSV export for the selected month
- Full JSON backup and restore
- Light and dark mode

## Accounts, sync and single-session login

The app uses [Supabase](https://supabase.com) (free tier) for email/password accounts and cloud storage.

- Your records are saved to your account, so every device sees the same data.
- Only one session per account is active. Signing in on a new device or tab signs the previous one out automatically (within about 15 seconds, or immediately on its next save).
- The server rejects saves from an old session, so a signed-out device cannot overwrite newer data.
- Row Level Security means each user can only read their own row.

### Setup (about 10 minutes)
1. Create a free project at https://supabase.com.
2. Open **SQL Editor**, paste the contents of `supabase-setup.sql`, and run it.
3. Open **Project Settings -> API** and copy the **Project URL** and the **anon public** key.
4. In `index.html`, replace `PASTE_YOUR_SUPABASE_URL` and `PASTE_YOUR_SUPABASE_ANON_KEY` near the top of the script. The anon key is designed to be public; never use the `service_role` key.
5. Optional: in **Authentication -> Providers -> Email**, turn off "Confirm email" if you do not want a confirmation email on sign-up. To stop others creating accounts, turn off sign-ups after you create yours (**Authentication -> Sign In / Providers**).
6. Deploy (see below). Add your site URL under **Authentication -> URL Configuration**.

The first time you sign in on a browser that has records from the older offline version, the app offers to import them into your account.

## Run locally

Complete the Supabase setup above, then open `index.html` in Chrome, Edge, Firefox or Safari.

## Deploy

### GitHub Pages
1. Push this repository to GitHub.
2. Go to **Settings -> Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/ (root)`, then **Save**.
4. After a minute your site is live at `https://<your-username>.github.io/<repo-name>/`.

### Netlify
Drag this folder onto https://app.netlify.com/drop, or import the repository (no build command, publish directory `.`).

### Vercel
Import the repository at https://vercel.com/new. Framework preset: **Other**, no build command, no output directory.

## Customising

The daily target (in minutes) and an opening balance can be changed in the **Settings** card inside the app. The default target is 546 minutes (9h 06m), so a 9:00 AM to 7:00 PM day gives +54 minutes.
