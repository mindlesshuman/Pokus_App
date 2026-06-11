# 🚀 Pokus — Prototype Presentation Script

> **Duration:** ~8–10 minutes  
> **Format:** Live walkthrough of 10 screens + navigation shell  
> **Audience:** Stakeholders, team, or workshop reviewers

---

## 🎬 0. Opening Hook (30 sec)

> *(App is on the Home screen. Stand next to the screen or share it.)*

**Speaker:**
"Good morning / afternoon, everyone. I'm excited to walk you through **Pokus** — a productivity, family tracking, and habit management app built entirely in Flutter with Material 3.

The name 'Pokus' comes from *focus* spelled backward — because sometimes the best way to find focus is to flip your perspective.

This is a fully functional frontend prototype. Everything you see is real Flutter code, not mockups. Let's dive in."

---

## 🏠 1. Home Screen (60 sec)

> *(Scroll the Home screen slowly from top to bottom.)*

**Speaker:**
"This is the Home screen — your daily command center. Let's break it down from top to bottom:

**Header:** Clean AppBar with the Pokus name and a notification bell. Tapping the bell opens the Alerts feed — we'll see that later.

**Greeting hero:** Contextual greeting — 'Good morning, Alex!' — with a motivational subheading. The gradient illustration area uses a soft indigo-to-purple gradient and a rocket icon, visually communicating ambition and forward momentum. All colors come from our theme tokens, so this scales perfectly in dark mode.

**Today's Focus banner:** A full-width indigo card with subtle glow shadow. It shows the current deep-work plan — two sessions — with an arrow inviting you to tap in. This is the primary call-to-action. The semi-transparent icon container inside the card adds depth without distraction.

**Stats row:** Two cards side by side:
- Productivity Score at 85% with a circular progress indicator using our primary indigo color
- Focus Streak with a fire icon and '7 days' — this uses our warm accent orange to create emotional warmth around streaks

Notice everything uses `BorderRadius.circular(16)` and soft shadows — this consistent card language is applied across every screen. That's the design system at work."

> *(Tap the notification bell icon to open Alerts.)*

---

## 🔔 Visit Alerts (45 sec)

> *(Alerts screen opens. Scroll through the list.)*

**Speaker:**
"Quick detour — the Alerts screen. This is a notification timeline with categorized icon badges.

Each alert has a distinct color-coded icon container: purple for location updates, amber for screen time limits, green for habit completions, orange for commute alerts.

The alerts are **swipe-to-dismiss** — watch." *(Swipe one away.)* "And 'Clear All' in the AppBar resets everything. When empty, we show a friendly 'All caught up!' empty state.

"Let me go back to Home."

> *(Press back, or tap Home in the bottom nav.)*

---

## 📊 2. Overview Screen (60 sec)

> *(Tap the Productivity Score card to navigate to Overview.)*

**Speaker:**
"The Overview screen gives you a deeper daily dashboard.

**Trend card:** A full-width indigo container with 'Your Trend' title and '+12% vs last week'. Below that is a **custom-painted sparkline** — a `CustomPainter` widget that draws a smooth upward line with a highlighted endpoint dot. No chart library needed — we own every pixel.

**Today at a Glance:** A 2×2 grid of stat tiles. Each tile has an icon, label, value, and a colored linear progress bar:
- Screen Time: 2h 15m with amber warning bar
- Focus Time: 1h 45m with indigo bar
- Habits Progress: 6/8 with green bar
- Morning Routine: 80% with orange bar

All four tiles reuse the same `StatTile` widget — one component, four configurations. That's the power of our widget library.

**Timeline:** Below is a vertical timeline showing today's schedule. Completed items show green filled circles with checkmarks; pending items show outlined circles. Each node has a title, subtitle, and time. This is driven by a reusable `TimelineWidget` and a simple `TimelineItem` model — we reuse this same component later on the Commute screen."

> *(Press back, return to Home.)*

---

## 🧘 3. Focus Mode (60 sec)

> *(From Home, tap the Today's Focus banner, OR navigate via any Focus entry point.)*

**Speaker:**
"This is Focus Mode — and notice the theme shift. The entire screen is **forced to dark mode** using a `Theme` wrapper widget. This is intentional — dark mode reduces visual noise and helps users concentrate.

**Layout:** Vertically centered. Everything orbits the timer.

**Timer ring:** The centerpiece. It's built with a custom `ProgressRing` widget using a `SweepGradient` painter. Three colors blend around the arc: deep indigo, light indigo, and success green — visually communicating progress toward completion.

Inside the ring: large '45:00' digital timer text at 40px bold, with 'Focus Time' as a secondary label.

**Challenge chip:** Below the timer, a styled chip with a shield icon: 'No Social Media Challenge'. The chip uses a transparent primary background so it harmonizes with the dark theme rather than fighting it.

**CTA:** A full-width 'Start Focus' elevated button at the bottom, 16px rounded, indigo background, white bold text. High contrast against the dark background — impossible to miss."

> *(Press X or back to exit Focus Mode.)*

---

## 👨‍👩‍👧‍👦 4. Family Screen (60 sec)

> *(Tap the Family tab in the bottom navigation bar — the people icon.)*

**Speaker:**
"The Family screen uses a `DefaultTabController` with three tabs:

**Children tab:** Shows family member cards. Each card has:
- Avatar circle with emoji and a green/offline presence dot
- Name with online/offline text
- A screen time progress bar — amber-colored for visibility
- Streak counter with fire icon on the right

Emma is online with 2.5h screen time and a 12-day streak. Sarah is offline with only 0.5h. Each card is tappable.

**Activity Feed tab:** A chronological feed — 'Emma completed morning routine', 'Lucas hit reading goal', 'New challenge unlocked'. Each with timestamp and icon.

**Family Goals tab:** An empty state with a friendly illustration area and 'Create First Goal' button — good UX for first-time users."

> *(Tap on Emma's card to navigate to Child Usage.)*

---

## 📱 5. Child App Usage Screen (45 sec)

> *(Emma's App Usage screen is now showing.)*

**Speaker:**
"Deep dive into a child's device usage.

**Hero ring:** A `ProgressRing` widget at 53% — same component used in Focus Mode, but different configuration. Amber-to-orange gradient and a smaller radius. Shows '53% Used' with '53% of daily limit (4h)' context below.

**App Usage Details list:** Five apps with colored icons, progress bars, and session durations:
- YouTube Kids: 45 min
- Duolingo: 30 min
- Minecraft: 25 min
- Spotify: 20 min
- Khan Academy: 15 min

Each row follows the same internal layout pattern: colored icon container, name + progress bar, duration label. Again, consistency through the widget system."

> *(Press back to return to Family.)*

---

## ✅ 6. Habits Screen (60 sec)

> *(Tap the Habits tab — the checkbox icon in the bottom nav.)*

**Speaker:**
"The Habits screen is your daily tracker.

**Date navigator:** A horizontal scrolling row of date pills. The selected date — today — gets the indigo fill with white text and a subtle drop shadow. Unselected dates use the card surface color. Tapping a different date would load that day's habits.

**Habit list:** Seven habits, each using the `HabitCheckItem` widget:
- Drink Water: 4/8 cups with blue progress bar
- Morning Meditation: completed, green
- Read for 30 min: 15/30, amber
- Exercise: 0/45, green — showing zero state
- No sugar challenge: Day 4/7, red
- Journal writing: done, purple
- Evening stretch: 10/15, cyan

Each row has a trailing toggle circle — tap it to mark complete. Watch." *(Tap one toggle to demonstrate the animation.)* "The toggle uses an `AnimatedContainer` for a smooth 200ms transition from outlined to filled.

**FAB:** Standard Flutter `FloatingActionButton.extended` labeled '+ Add Habit' — the indigo circle with white icon, following Material 3 conventions."

---

## 🚗 7. Commute Screen (45 sec)

> *(Tap the Commute tab — the car icon.)*

**Speaker:**
"The Commute screen is a trip planner.

**Active Trip timeline:** Same `TimelineWidget` from the Overview screen, repurposed. Three milestones: Home (departed), School drop-off (passed), Office (ETA 8:42). The first two are green-checked; the last is pending.

**Map placeholder:** A 200px tall container with a map icon and route summary — 'Home → Office · 12.4 km'. In production this would be a real map widget with a polyline route.

**Trip Metrics grid:** 2×2 grid of `CustomCard` tiles:
- ETA: 8:42 AM — indigo
- Duration: 24 min — green
- Distance: 12.4 km — amber
- Traffic: Moderate — orange

Each tile has a tiny colored icon container in the top-left corner — a micro interaction that adds polish."

---

## 📈 8. Insights Screen (60 sec)

> *(Tap the Insights tab — the bar chart icon.)*

**Speaker:**
"The Insights screen is your analytics dashboard.

**Performance cards:** Three horizontally scrollable metric cards:
- Productivity: 85% — up 5%, green indicator
- Screen Time: 3.2h — down 12%, also green (less is better)
- Habit Score: 78% — down 3%, red indicator

The red/green change indicators provide at-a-glance directional context. The cards are 160px wide and scroll horizontally to allow adding more metrics without layout changes.

**Weekly Trends chart:** A `CustomCard` containing a `CustomPainter` bar chart. Seven bars with a gradient fill from primary to primaryLight — each representing a day. The bars have rounded top corners. Below are day labels. '+15%' sits in the header.

**Achievement banner:** A gold-to-orange gradient container with a trophy icon and '7-Day Streak!' heading. The semi-transparent white icon background and subtle text create a celebratory feel without being gaudy. This banner rewards the user for their consistency."

---

## 👤 9. Profile Screen (45 sec)

> *(Navigate to Profile — accessible from various entry points or as a dedicated screen.)*

**Speaker:**
"Finally, the Profile screen — forced to dark theme, matching Focus Mode's atmospheric feel.

**User block:** Large centered avatar circle with initial 'A' in indigo. Name 'Alex Johnson' in white, email below in grey, and a 'Premium Member' chip using the warning/amber palette — status signaling through color alone.

**Settings groups:** Three clear sections separated by dividers:
- **Account:** Personal Information, Privacy & Security, Notifications — each with leading icons in light indigo
- **Family:** Family Members, Screen Time Limits, Location Sharing
- **App:** Appearance (shows 'System' as trailing text), Help & Support, About (shows 'v1.0.0')

Every row has a chevron-right indicator at the end — standard mobile convention for navigable items. Section headers use uppercase-style small text in grey with letter spacing — distinct from the clickable rows.

**Sign Out:** Red outlined button at the bottom, full width, clear but not dominant — it's there when needed but doesn't distract."

> *(Return to the Home tab in the bottom nav.)*

---

## 🎨 10. Design System Recap (30 sec)

> *(Back on Home screen.)*

**Speaker:**
"Before we wrap up, I want to highlight what's under the hood:

- **One theme, two modes.** `GlobalTheme.light()` and `GlobalTheme.dark()` both in a single file, sharing the same `ColorScheme.fromSeed()` generation. Every screen inherits from a single source of truth.
- **Five reusable widgets.** `CustomCard`, `ProgressRing`, `StatTile`, `TimelineWidget`, `HabitCheckItem` — used across all 10 screens multiple times.
- **Zero external dependencies.** No chart libraries, no UI kits — just vanilla Flutter. The sparkline, bar chart, and gradient ring are all `CustomPainter` subclasses. We own every pixel.
- **Feature-first architecture.** Each screen lives in its own folder. The widget library is centralized. The theme is in `core/`. Clean separation of concerns.

The codebase is **22 Dart files, ~2,000 lines**, and compiles to both Android and iOS from a single codebase."

---

## 🏁 11. Closing (15 sec)

**Speaker:**
"That's Pokus — a productivity, family tracking, and habit management app with a consistent design language, dark/light theme support, custom painting, and a modular architecture.

The prototype is ready for feedback. What questions do you have?"

---

## 📋 Appendix: Demo Flow Cheat Sheet

| Order | Screen | Entry Point | Duration |
|-------|--------|-------------|----------|
| 1 | Home | App launch | 60s |
| — | Alerts | Tap bell icon | 45s |
| 2 | Overview | Tap "Productivity Score" card | 60s |
| 3 | Focus Mode | Navigate manually | 60s |
| 4 | Family | Bottom nav tab | 60s |
| 5 | Child Usage | Tap "Emma" card | 45s |
| 6 | Habits | Bottom nav tab | 60s |
| 7 | Commute | Bottom nav tab | 45s |
| 8 | Insights | Bottom nav tab | 60s |
| 9 | Profile | Navigate manually | 45s |
| 10 | Recap | Back to Home | 30s |
| — | Closing | — | 15s |

**Total: ~8 minutes**

---

## 🔧 Pre-Presentation Checklist

- [ ] `flutter clean && flutter pub get && flutter run` — app launches clean
- [ ] All 5 bottom nav tabs are responsive
- [ ] Dark theme screens (Focus Mode, Profile) render correctly
- [ ] Swipe-to-dismiss works on Alerts
- [ ] Toggle habits work on Habits screen
- [ ] Phone is on Do Not Disturb mode
- [ ] Screen brightness is maxed
- [ ] Presenter has practiced the transitions

---

*Script prepared for Pokus prototype presentation. Adapt timing and emphasis to your audience.*
