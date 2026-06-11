# Pokus — Slide-Ready Feature Summary

---

## Slide 1: Title

**Pokus**
*Productivity · Family Tracking · Habit Management*
Flutter + Material 3 | Android & iOS | Zero External Dependencies

---

## Slide 2: What Is Pokus?

A mobile app that combines **three pillars** into one experience:

| Pillar | Purpose |
|--------|---------|
| 🎯 **Personal Productivity** | Focus timers, daily overviews, streak tracking |
| 👨‍👩‍👧‍👦 **Family Management** | Screen time limits, child app usage, location tracking |
| ✅ **Habit Building** | Daily habit checklists, progress tracking, streaks |

---

## Slide 3: Design System

- **Deep Indigo** primary (`#6B4EFF`) — calm focus
- **Success Green** secondary (`#10B981`) — completion & growth
- **Amber/Orange** warning (`#F59E0B`) — attention & warmth
- **Material 3** with `BorderRadius.circular(16)` on all cards
- **Soft shadows**, clean sans-serif typography
- **Light + Dark themes** — auto-switching per screen context

---

## Slide 4: Architecture

```
Feature-first · 22 Dart files · ~2,000 lines

lib/
├── core/theme/         → Global light & dark ThemeData
├── core/constants/     → Color palette, asset registry
├── presentation/widgets/ → 5 reusable components
├── presentation/screens/ → 10 screens + nav shell
└── main.dart           → App entry point
```

**Design principles:**
- Every screen owns its own folder
- Shared widgets live in one centralized library
- Theme tokens never hardcoded — always via `Theme.of(context)`
- Zero third-party UI libraries — all custom painting

---

## Slide 5: Navigation Shell

**5-tab bottom navigation** (Material 3 `NavigationBar`)

| Tab | Icon |
|-----|------|
| Home | 🏠 |
| Habits | ✅ |
| Commute | 🚗 |
| Family | 👥 |
| Insights | 📊 |

Uses `IndexedStack` — tab state is preserved when switching.

---

## Slide 6: 5 Reusable Widgets

Built once, used everywhere:

| Widget | Used In | Purpose |
|--------|---------|---------|
| `CustomCard` | Every screen | Rounded container with shadow |
| `ProgressRing` | Focus, Child Usage | Gradient arc custom painter |
| `StatTile` | Overview | Grid cell with icon + progress bar |
| `TimelineWidget` | Overview, Commute | Vertical timeline with check nodes |
| `HabitCheckItem` | Habits | Toggleable habit row |

---

## Slide 7: Screen 1 — Home

> *Daily command center*

- Greeting hero: "Good morning, Alex! 👋" with motivational text
- Gradient illustration area with rocket icon
- **Today's Focus** banner — indigo, glow shadow, current deep-work plan
- **Productivity Score** — `CircularProgressIndicator` at 85%
- **Focus Streak** — fire icon + "7 days" in warm orange
- Bell icon → opens Alerts feed

---

## Slide 8: Screens 2-3 — Overview & Focus Mode

**Overview:**
- Indigo trend card with custom-painted sparkline (+12% vs last week)
- 2×2 stat grid: Screen Time, Focus Time, Habits, Morning Routine
- Vertical timeline showing today's schedule with checkmark nodes

**Focus Mode** *(forced dark theme):*
- Central gradient progress ring (`SweepGradient` custom painter)
- Large "45:00" timer with "Focus Time" label
- Shield chip: "No Social Media Challenge"
- Full-width "Start Focus" CTA button

---

## Slide 9: Screen 4-5 — Family & Child Usage

**Family:**
- 3-tab layout: Children / Activity Feed / Family Goals
- Children tab: profile cards with avatar emoji, online/offline dot, screen time bar, streak counter
- Activity Feed: chronological family activity log
- Goals tab: empty state with "Create First Goal" CTA

**Child App Usage** *(Emma):*
- Central percentage ring — 53% of daily limit
- App breakdown list: YouTube Kids (45m), Duolingo (30m), Minecraft (25m), etc.
- Each app row: colored icon, name, progress bar, duration

---

## Slide 10: Screen 6 — Habits

- **Horizontal date strip** — scrollable pill selector with selected-state highlight
- **7 habit rows** with animated toggle circles:
  - Drink Water (4/8), Meditation (done), Read (15/30), Exercise (0/45), No Sugar (Day 4/7), Journal (done), Stretch (10/15)
- Each row: colored icon, habit name, linear progress bar, fraction text, toggle
- **FAB**: "+ Add Habit" extended floating action button

---

## Slide 11: Screen 7 — Commute

- **Trip timeline**: Home → School → Office with completed/pending milestones
- **Map placeholder**: route summary "Home → Office · 12.4 km"
- **2×2 metrics grid**:
  - ETA: 8:42 AM | Duration: 24 min
  - Distance: 12.4 km | Traffic: Moderate

---

## Slide 12: Screen 8-9 — Insights & Alerts

**Insights:**
- 3 horizontally scrollable performance cards (Productivity +5%, Screen Time -12%, Habit Score -3%)
- **Custom bar chart** — 7-day gradient bar chart with rounded tops
- **Achievement banner** — gold gradient, trophy icon, "7-Day Streak! 🔥"

**Alerts:**
- Notification timeline with color-coded icon badges
- Categories: Location, Screen Time, Habit Completions, Commute, Challenges, Reports
- Swipe-to-dismiss each alert
- "Clear All" action in AppBar

---

## Slide 13: Screen 10 — Profile

> *Forced dark theme*

- Centered avatar circle with initial letter
- Name, email, "Premium Member" chip
- **3 settings groups** with dividers:
  - Account: Personal Info, Privacy, Notifications
  - Family: Members, Screen Time, Location
  - App: Appearance (System), Help, About (v1.0.0)
- Every row has leading icon + trailing chevron
- Red "Sign Out" outlined button at bottom

---

## Slide 14: Technical Highlights

| Feature | Implementation |
|---------|---------------|
| Gradient progress ring | `CustomPainter` with `SweepGradient` |
| Sparkline chart | `CustomPainter` path drawing |
| Bar chart | `CustomPainter` with gradient fill |
| Dark mode per screen | `Theme` widget wrapping specific screens |
| Tab state preservation | `IndexedStack` in nav shell |
| Animated habit toggle | `AnimatedContainer` 200ms transition |
| Swipe to dismiss alerts | `Dismissible` widget |

**No chart libraries. No UI kits. Pure Flutter.**

---

## Slide 15: Key Stats

| Metric | Value |
|--------|-------|
| Screens | 10 |
| Reusable widgets | 5 |
| Dart files | 22 |
| Lines of code | ~2,000 |
| External dependencies | 0 |
| Platforms | Android + iOS |
| Theme modes | Light + Dark |

---

## Slide 16: Thank You

**Pokus**
*Stay focused. Build habits that last.*

Questions?
