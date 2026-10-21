# My Work Tracker

A simple, mobile-friendly working hours tracker. One HTML file, no build step, no server, no dependencies.

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

## Data and privacy

All records are stored in your browser's `localStorage` on the device you use. Nothing is sent to any server.

- Records do not sync between devices or browsers.
- Clearing browser data erases them. Use **Backup all data (JSON)** regularly.
- Do not use private/incognito windows if you want to keep your records.

## Run locally

Open `index.html` in Chrome, Edge, Firefox or Safari.

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
