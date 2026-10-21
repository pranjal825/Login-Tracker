# ⏱️ Login Tracker — Personal Work Hours Dashboard

A simple, responsive, and user-friendly **Work Hours Tracker** to record login and logout times, monitor daily working hours, manage overtime and deficits, and keep track of your weekly and monthly work balance.

Built with HTML, CSS, and JavaScript, this lightweight application runs directly in your browser without requiring any installation or build tools.

## ✨ Features

- **One-Click Login & Logout** — Record your working session with automatic timestamps.
- **Daily Working Hours** — Track your total working time against your daily target.
- **Automatic Balance Calculation** — Calculate daily overtime or deficits automatically.
- **Running Balance** — Carry forward accumulated positive and negative balances.
- **Overtime Management** — Use extra working hours to recover previous deficits.
- **Leave Adjustments** — Record full-day leave, half-day leave, or custom-minute adjustments.
- **Weekly & Monthly Reports** — Review your work hours and accumulated balance over time.
- **Historical Editing** — Add or edit previous workday records manually.
- **CSV Export** — Export monthly records for reporting and analysis.
- **Backup & Restore** — Download a JSON backup of your records and restore it when needed.
- **Light & Dark Mode** — Switch between themes for a comfortable viewing experience.
- **Responsive Interface** — Access the tracker on supported desktop and mobile browsers.

## 🕘 Working Hours & Balance Logic

The tracker compares your recorded working time against a configurable daily target.

| Setting | Default |
|---|---|
| Standard login time | 9:00 AM |
| Standard logout time | 7:00 PM |
| Daily target | 9 hours 6 minutes |
| Balance for 9:00 AM–7:00 PM | +54 minutes |

**How it works:**

- Work more than your daily target to earn a positive balance.
- Work less than your target to record a deficit.
- Carry your accumulated balance forward across working days.
- Use additional working time to recover negative balances.
- Apply leave adjustments according to your leave duration.

The daily target and opening balance can be configured in the application's settings.

## 🛠️ Built With

- **HTML5** — Application structure
- **CSS3** — Styling and responsive layout
- **JavaScript** — Time tracking and balance calculations
- **Browser Local Storage** — Saving records locally on your device
- **CSV & JSON** — Data export, backup, and restoration

## 🚀 Getting Started

### Run Locally

No installation or build process is required.

1. Clone or download this repository.
2. Extract the downloaded ZIP file if necessary.
3. Open `index.html` in your browser.
4. Start recording your login and logout times.

### Run from GitHub

You can access the project source code here:

**[Login-Tracker Repository](https://github.com/pranjal825/Login-Tracker)**

### Deploy with GitHub Pages

1. Open the repository on GitHub.
2. Navigate to **Settings → Pages**.
3. Under **Build and deployment**, select **Deploy from a branch**.
4. Select the `main` branch and the `/ (root)` folder.
5. Click **Save** and wait for deployment to finish.

Once published, your application will be available at:

`https://pranjal825.github.io/Login-Tracker/`

*Note: This is the expected GitHub Pages URL; the site must be successfully deployed before it becomes accessible.*

## 🔒 Data Storage & Privacy

The current application stores work records in your browser's local storage.

- Your records are stored locally on the device and browser you use.
- Records do not automatically synchronize between devices or browsers.
- Clearing browser data can permanently erase saved records.
- Use the built-in JSON backup feature to protect your data.
- Avoid private or incognito browsing sessions if you want records to persist.

**Important:** The current version does not use a cloud database or provide automatic cross-device synchronization.

## 📂 Project Structure

```text
Login-Tracker/
├── index.html
├── README.md
├── work-tracker-repo/
└── work-tracker-site.zip
```

The repository includes the main HTML application along with the existing project folder and ZIP archive.

## 🎯 Project Goal

The goal of Login Tracker is to make working-hour management easier by providing a simple way to record attendance, calculate overtime, recover deficits, manage leave, and review work history without relying on spreadsheets.

## 🔮 Future Improvements

Potential enhancements include:

- Secure user authentication
- Cloud database and cross-device synchronization
- Automatic daily and monthly summaries
- More detailed attendance analytics
- Improved reporting and dashboard visualizations

## 👨‍💻 Author

**Pranjal Dwivedi**

GitHub: [@pranjal825](https://github.com/pranjal825)

---

If you find this project useful, consider giving the repository a ⭐ on GitHub!

