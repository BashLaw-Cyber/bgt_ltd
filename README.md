# Bashlaw Global Technologies LTD — Flutter Web Landing Page

A professional, fully-responsive Flutter web landing page for **Bashlaw Global Technologies LTD**, designed for Firebase Hosting.

---

## 🎨 Design Overview

- **Theme**: Deep Navy + Electric Cyan + Gold Accent — tech-forward, corporate confidence
- **Typography**: Rajdhani (headings) + Inter (body) — authoritative yet modern
- **Aesthetic**: Dark glassmorphism with grid backgrounds and glowing orbs
- **Fully Responsive**: Desktop, tablet, and mobile layouts

---

## 📁 Project Structure

```
bashlaw_web/
├── lib/
│   ├── main.dart                   # App entry point
│   ├── theme/
│   │   └── app_theme.dart          # Colors, fonts, constants
│   ├── pages/
│   │   └── landing_page.dart       # Main scroll-based page
│   └── widgets/
│       ├── navbar.dart             # Fixed navigation bar
│       ├── hero_section.dart       # Hero/banner section
│       ├── about_section.dart      # About + company objectives
│       ├── services_section.dart   # 6 service cards
│       ├── contact_section.dart    # Contact form + WhatsApp
│       └── footer_section.dart     # Footer with links
├── web/
│   ├── index.html                  # Optimised HTML shell
│   └── manifest.json               # PWA manifest
├── firebase.json                   # Firebase Hosting config
├── .firebaserc                     # Firebase project name
└── pubspec.yaml                    # Dependencies
```

---

## ⚙️ Setup & Customisation

### 1. Update Contact Details

Edit `lib/theme/app_theme.dart` and update:

```dart
static const String whatsappCEO = 'https://wa.me/YOUR_CEO_PHONE';
static const String whatsappHR  = 'https://wa.me/YOUR_HR_PHONE';
static const String phoneNumber = 'tel:+234XXXXXXXXXX';
static const String emailAddress = 'mailto:info@bashlawglobal.com';
```

Also update in:
- `lib/pages/landing_page.dart` — floating WhatsApp button
- `lib/widgets/contact_section.dart` — WhatsApp/call buttons

### 2. Phone Number Format for WhatsApp
WhatsApp links must use international format without `+` or spaces:
- Nigerian number `0812 345 6789` → `https://wa.me/2348123456789`

---

## 🚀 Build & Deploy to Firebase

### Prerequisites
```bash
# Install Flutter (if not installed)
# https://docs.flutter.dev/get-started/install

# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login
```

### Build for Web
```bash
cd bashlaw_web

# Get dependencies
flutter pub get

# Build optimised web release
flutter build web --release --web-renderer canvaskit
```

### Deploy to Firebase
```bash
# Initialise Firebase project (first time only)
firebase init hosting
# Select your project, set public dir to: build/web
# Configure as SPA: Yes
# Don't overwrite index.html: No

# Deploy
firebase deploy --only hosting
```

Your site will be live at:
`https://bashlaw-global-technologies.web.app`

---

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `url_launcher` | WhatsApp, phone calls, email links |
| `google_fonts` | Rajdhani + Inter fonts |
| `animate_do` | Fade/slide entrance animations |
| `font_awesome_flutter` | Social media icons |
| `visibility_detector` | Trigger animations on scroll |

---

## 🌐 Features

| Feature | Description |
|---------|-------------|
| ✅ Fixed Navbar | Scroll-aware with smooth section navigation |
| ✅ Hero Section | Animated grid background, company tagline |
| ✅ Services Grid | 6 cards covering all company objectives |
| ✅ About Section | Company story + objectives (A–F) |
| ✅ Contact Form | Opens mail client with pre-filled content |
| ✅ WhatsApp Links | CEO direct + HR direct |
| ✅ Phone Call | Tap-to-call floating button |
| ✅ Floating Buttons | Pulsing WhatsApp + Call FABs |
| ✅ Footer | Links, social, legal copyright |
| ✅ PWA Ready | Manifest + service worker support |
| ✅ Firebase Config | Ready-to-deploy `firebase.json` |
| ✅ SEO Meta Tags | Open Graph + description tags |
| ✅ Mobile Responsive | Adaptive layouts for all screens |

---

## 🔧 Common Firebase Commands

```bash
# Preview before deploying
firebase hosting:channel:deploy preview

# Deploy to production
firebase deploy --only hosting

# View live URL
firebase open hosting:site
```

---

## 📝 Customisation Checklist

Before going live, update:

- [ ] CEO WhatsApp number in `app_theme.dart` and `landing_page.dart`
- [ ] HR WhatsApp number in `contact_section.dart`
- [ ] Phone number (all files)
- [ ] Email address (all files)
- [ ] Company address
- [ ] LinkedIn / Twitter URLs in `app_theme.dart` and `footer_section.dart`
- [ ] Firebase project ID in `.firebaserc`
- [ ] Company logo / favicon in `web/icons/`
- [ ] Domain name (add custom domain in Firebase Console)

---

*Built with Flutter Web · Hosted on Firebase · © Bashlaw Global Technologies LTD*
