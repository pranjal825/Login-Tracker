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

## Sync without a login page

The app syncs your records through a free [Supabase](https://supabase.com) project. There is no email or password screen. Instead, your data is stored under a **sync code** that only you know.

- Choose a long, hard-to-guess code (at least 12 characters), for example a few random words and numbers.
- Either leave `SYNC_CODE` empty in `index.html` and type the code once per device when asked, or put it in `SYNC_CODE` to skip the prompt. Anything written in `index.html` is visible to anyone who opens the page source, so the prompt option is safer.
- Anyone who knows your code can read and edit your records. Nobody can read the table directly.
- If two devices edit at once, the later one is told the data changed and loads the latest version, so records are never silently overwritten.
- Other devices pick up changes within about 20 seconds, or immediately when you switch back to the tab.

### Setup
1. Create a free project at https://supabase.com.
2. Open **SQL Editor**, paste the contents of `supabase-setup.sql`, and run it.
3. Open **Project Settings -> API Keys** and copy the Project URL and the anon (or publishable) key.
4. In `index.html`, replace `PASTE_YOUR_SUPABASE_URL` and `PASTE_YOUR_SUPABASE_ANON_KEY` near the top of the script. Never use the `service_role` or secret key.
5. Deploy (see below), open the site, and enter your sync code.

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
