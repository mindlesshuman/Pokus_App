# Pokus — Complete Feature Document

> **Version:** 1.0.0  
> **Platform:** iOS & Android (Flutter)  
> **Design Language:** Material 3  
> **Status:** Prototype Complete

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Product Vision & Goals](#2-product-vision--goals)
3. [User Personas](#3-user-personas)
4. [Design System](#4-design-system)
5. [Architecture](#5-architecture)
6. [Navigation Shell](#6-navigation-shell)
7. [Screen-by-Screen Specifications](#7-screen-by-screen-specifications)
   - [7.1 HomeScreen](#71-homescreen)
   - [7.2 OverviewScreen](#72-overviewscreen)
   - [7.3 FocusModeScreen](#73-focusmodescreen)
   - [7.4 FamilyScreen](#74-familyscreen)
   - [7.5 ChildAppUsageScreen](#75-childappusagescreen)
   - [7.6 HabitsScreen](#76-habitsscreen)
   - [7.7 CommuteScreen](#77-commutescreen)
   - [7.8 InsightsScreen](#78-insightsscreen)
   - [7.9 AlertsScreen](#79-alertsscreen)
   - [7.10 ProfileScreen](#710-profilescreen)
8. [Reusable Widget Library](#8-reusable-widget-library)
9. [User Flows](#9-user-flows)
10. [Technical Specifications](#10-technical-specifications)
11. [Asset Inventory](#11-asset-inventory)
12. [State Management](#12-state-management)
13. [Future Roadmap](#13-future-roadmap)
14. [Appendix](#14-appendix)

---

## 1. Executive Summary

**Pokus** is a mobile application that unifies three essential life-management pillars into a single, cohesive experience:

| Pillar | Tagline | Core Value |
|--------|---------|------------|
| 🎯 **Personal Productivity** | "Stay focused." | Focus timers, daily overviews, productivity scoring, streak tracking |
| 👨‍👩‍👧‍👦 **Family Management** | "Stay connected." | Child screen time limits, app usage monitoring, location tracking, family goals |
| ✅ **Habit Building** | "Build habits that last." | Daily habit checklists, progress tracking, streak rewards, accountability |

The name **Pokus** is derived from "focus" spelled backward — reflecting the philosophy that sometimes the best way to find focus is to flip your perspective.

The application is built with **Flutter** using **Material 3**, targeting both **iOS and Android** from a single codebase. The prototype is fully functional frontend code with **zero external UI dependencies** — all charts, rings, and custom visuals are built with Flutter's `CustomPainter` API.

---

## 2. Product Vision & Goals

### Vision
To be the single app that helps modern families manage their time, attention, and habits — together.

### Core Goals

1. **Reduce context switching.** Instead of three separate apps (to-do list, family tracker, habit app), Pokus brings everything under one roof with consistent design language.

2. **Build healthy digital habits.** Screen time awareness for children, focus mode for adults — the app models the behavior it encourages.

3. **Make progress visible.** Every screen surfaces progress visually — rings, bars, charts, streaks. What gets measured gets improved.

4. **Support light and dark contexts.** Focus Mode and Profile use dark theme to reduce visual noise; all other screens default to light theme for daytime clarity.

### Success Metrics (Target)

| Metric | Target |
|--------|--------|
| Daily active users (families) | 10,000+ |
| Average session duration | 4–6 minutes |
| Habit completion rate | >70% |
| Screen time reduction (children) | 15–25% |
| Focus mode sessions per user/week | 5+ |

---

## 3. User Personas

### Persona 1: Alex (The Parent)
- **Age:** 36
- **Role:** Working professional, parent of two
- **Goals:** Manage morning routine, track kids' screen time, stay productive at work
- **Pain Points:** Juggling three apps for tasks, family, and habits; no unified dashboard
- **Pokus Features Used:** Home, Family, Child Usage, Commute, Insights

### Persona 2: Emma (The Child, Age 10)
- **Age:** 10
- **Role:** Student
- **Goals:** Complete daily habits, earn streak rewards
- **Pain Points:** No visibility into her own screen time; wants to feel accomplished
- **Pokus Features Used:** Habits (via parent-managed view), Child App Usage (viewed by parent)

### Persona 3: Sarah (The Secondary Parent)
- **Age:** 34
- **Role:** Part-time worker, primary caregiver for toddler
- **Goals:** Coordinate family activities, manage shared goals
- **Pain Points:** Communication gaps about kids' activities and screen time
- **Pokus Features Used:** Family Activity Feed, Family Goals, Alerts

---

## 4. Design System

### 4.1 Color Palette

| Token | Hex Code | Role |
|-------|----------|------|
| `primary` | `#6B4EFF` | Primary actions, selected states, focus banner |
| `primaryLight` | `#8F79FF` | Dark theme accent, gradient variants |
| `primaryDark` | `#4A35CC` | Pressed states |
| `secondary` | `#10B981` | Completion states, habit success, checkmarks |
| `secondaryLight` | `#34D399` | Light success variants |
| `warning` | `#F59E0B` | Screen time warnings, attention elements |
| `warningLight` | `#FBBF24` | Dark theme warning accent |
| `surfaceVariant` | `#EEF2FF` | Card backgrounds, illustration areas |
| `surfaceDark` | `#1E1E2E` | Dark theme card surfaces |
| `backgroundLight` | `#F8F9FC` | Light theme scaffold background |
| `backgroundDark` | `#121218` | Dark theme scaffold background |
| `grey100–800` | Grey scale | Text hierarchy, borders, dividers |
| `online` | `#10B981` | Presence indicator |
| `offline` | `#9CA3AF` | Offline presence indicator |
| `error` | `#EF4444` | Destructive actions, negative trends |
| `streak` | `#FF6B35` | Streak counters, achievement warmth |

### 4.2 Typography

- **Font Family:** System default sans-serif (Inter when bundled)
- **Scale:** Material 3 type scale — `displayLarge` through `labelSmall`
- **Weights:** `FontWeight.bold` for headers, `FontWeight.w600` for titles, `FontWeight.w400` for body
- **Usage:** Always accessed via `Theme.of(context).textTheme` — never hardcoded

### 4.3 Shape & Elevation

| Element | Border Radius | Elevation |
|---------|---------------|-----------|
| Cards | 16px | 2dp with 6% primary shadow |
| Buttons | 16px | 2–4dp |
| Chips | 24px (pill) | None |
| Progress bars | 4px | None |
| Icon containers | 10–12px | None |
| Navigation bar | — | 2dp |

### 4.4 Spacing Grid

- **Screen padding:** 20px horizontal, 12–16px vertical
- **Card padding:** 16px all sides (default), 14–18px for specialized cards
- **Inter-element gaps:** 10px, 12px, 20px, 24px (progressive)
- **Section spacing:** 20–28px between major sections

### 4.5 Theme Modes

| Mode | Used By | Characteristics |
|------|---------|-----------------|
| **Light** | Home, Overview, Family, Child Usage, Habits, Commute, Insights, Alerts | Light background, dark text, subtle shadows |
| **Dark** | Focus Mode, Profile | Dark background, white text, reduced visual noise |

Dark theme is applied per-screen via `Theme` widget wrapping — not globally toggled. This is intentional: Focus Mode and Profile benefit from reduced visual stimulation; daytime productivity screens benefit from high contrast.

---

## 5. Architecture

### 5.1 Directory Structure

```
pokus/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart        # All color tokens
│   │   │   └── app_assets.dart        # Asset path registry
│   │   └── theme/
│   │       └── global_theme.dart      # Light + dark ThemeData
│   ├── presentation/
│   │   ├── widgets/                   # Reusable widget library
│   │   │   ├── custom_card.dart
│   │   │   ├── progress_ring.dart
│   │   │   ├── stat_tile.dart
│   │   │   ├── timeline_widget.dart
│   │   │   └── habit_check_item.dart
│   │   └── screens/
│   │       ├── main_navigation_hub.dart
│   │       ├── home/home_screen.dart
│   │       ├── overview/overview_screen.dart
│   │       ├── focus/focus_mode_screen.dart
│   │       ├── family/family_screen.dart
│   │       ├── child_usage/child_app_usage_screen.dart
│   │       ├── habits/habits_screen.dart
│   │       ├── commute/commute_screen.dart
│   │       ├── insights/insights_screen.dart
│   │       ├── alerts/alerts_screen.dart
│   │       └── profile/profile_screen.dart
│   └── main.dart                       # App entry point
├── test/
│   └── pokus_test.dart                 # Theme + color unit tests
├── pubspec.yaml
├── analysis_options.yaml
├── PRESENTATION_SCRIPT.md
├── SLIDE_DECK.md
└── FEATURE_DOCUMENT.md
```

### 5.2 Design Principles

1. **Feature-first organization.** Each screen is self-contained in its own folder. Shared widgets live in a centralized library. Core concerns (theme, colors) are isolated in `core/`.

2. **Theme-driven, not hardcoded.** Every color, text style, and spacing value is derived from `Theme.of(context)`. No magic numbers for colors in screen code.

3. **Widget reuse over duplication.** Five reusable widgets (`CustomCard`, `ProgressRing`, `StatTile`, `TimelineWidget`, `HabitCheckItem`) are used across all 10 screens. New screens should first check if an existing widget fits before creating new ones.

4. **Custom painting over library dependencies.** Sparkline, bar chart, and gradient progress ring are all `CustomPainter` subclasses. This keeps the dependency tree at zero and gives full control over every pixel.

5. **Separation of concerns.** Screens handle layout only. Reusable widgets handle their own internal state (toggle, animation). Theme handles all visual styling. Navigation is centralized in the hub.

---

## 6. Navigation Shell

### 6.1 MainNavigationHub

**Widget Type:** `StatefulWidget`  
**File:** `lib/presentation/screens/main_navigation_hub.dart`

```dart
Scaffold
├── body: IndexedStack (preserves tab state)
│   ├── [0] HomeScreen
│   ├── [1] HabitsScreen
│   ├── [2] CommuteScreen
│   ├── [3] FamilyScreen
│   └── [4] InsightsScreen
└── bottomNavigationBar: NavigationBar (M3)
    ├── Home        (home_outlined / home)
    ├── Habits      (check_box_outlined / check_box)
    ├── Commute     (directions_car_outlined / directions_car)
    ├── Family      (people_outline / people)
    └── Insights    (bar_chart_outlined / bar_chart)
```

### 6.2 Navigation Patterns

| Pattern | Used For |
|---------|----------|
| Bottom tab switch | Primary 5-tab navigation |
| Push navigation | Home → Overview, Home → Alerts, Family → Child Usage, Home → Focus Mode |
| Pop navigation | Back arrow in AppBar on pushed screens |

### 6.3 Inter-Screen Navigation Map

```
Home ──bell──→ Alerts
Home ──productivity card──→ Overview
Home ──focus banner──→ Focus Mode
Family ──Emma card──→ Child App Usage
Overview ──back──→ (previous)
Alerts ──back──→ (previous)
Focus Mode ──X──→ (previous)
Child Usage ──back──→ Family
```

---

## 7. Screen-by-Screen Specifications

---

### 7.1 HomeScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/home/home_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatelessWidget` |
| **Scrollable** | Yes (`SingleChildScrollView`) |

#### Layout Hierarchy

```
Scaffold
├── AppBar
│   ├── title: "Pokus"
│   └── actions: [IconButton(notifications_outlined)]
└── body: SingleChildScrollView
    └── Column
        ├── _GreetingHero
        │   ├── Text("Good morning, Alex! 👋")       [headlineMedium, bold]
        │   ├── Text("Stay focused. Build habits...") [bodyLarge, grey600]
        │   └── Container (120px, gradient, rocket icon)
        ├── SizedBox(24)
        ├── _TodaysFocusBanner
        │   └── Container (primary bg, 16px radius, glow shadow)
        │       └── Row
        │           ├── Container (44px, white 20% bg, focus icon)
        │           ├── Column
        │           │   ├── Text("Today's Focus")     [labelMedium, white70]
        │           │   └── Text("Deep Work — 2...")  [15px, w600, white]
        │           └── Icon(arrow_forward_ios)
        ├── SizedBox(20)
        └── Row (stats)
            ├── CustomCard (_ProductivityScoreCard)
            │   └── Column
            │       ├── Row (trending_up icon + "Productivity")
            │       ├── CircularProgressIndicator(0.85, primary, 7px stroke)
            │       ├── Text("85") [headlineSmall, primary]
            │       └── Text("Score")
            └── CustomCard (_FocusStreakCard)
                └── Column
                    ├── Row (fire icon + "Focus Streak")
                    ├── Row (fire icon 36px + "7") [streak color]
                    └── Text("days")
```

#### Interactions

| Trigger | Action |
|---------|--------|
| Tap bell icon | Push → AlertsScreen |
| Tap Today's Focus banner | Push → FocusModeScreen |
| Tap Productivity Score card | Push → OverviewScreen |

#### States

| State | Behavior |
|-------|----------|
| Default | All data visible (morning greeting) |
| Time-based greeting | "Good morning" / "Good afternoon" / "Good evening" (future) |
| Zero streak | Fire icon greyed out, "0 days" |

---

### 7.2 OverviewScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/overview/overview_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatelessWidget` |
| **Scrollable** | Yes |

#### Layout Hierarchy

```
Scaffold
├── AppBar
│   ├── leading: IconButton(menu) → pop
│   ├── title: "Overview" (center)
│   └── actions: [IconButton(calendar_today)]
└── body: SingleChildScrollView
    └── Column
        ├── _TrendCard (primary bg, 16px radius)
        │   ├── Row (title "Your Trend" + chart icon)
        │   ├── Text("+12% vs last week") [headlineMedium, white]
        │   └── CustomPaint(_SparklinePainter, 48px height)
        │       └── 10-point upward path with endpoint dot
        ├── SizedBox(20)
        ├── Text("Today at a Glance") [titleLarge]
        ├── SizedBox(12)
        ├── GridView.count(crossAxisCount: 2)
        │   ├── StatTile (Screen Time, 2h 15m, 45%, warning bar)
        │   ├── StatTile (Focus Time, 1h 45m, 70%, primary bar)
        │   ├── StatTile (Habits Progress, 6/8, 75%, secondary bar)
        │   └── StatTile (Morning Routine, 80%, 80%, streak bar)
        ├── SizedBox(24)
        ├── Text("Your Schedule") [titleLarge]
        └── TimelineWidget (6 items)
            ├── Morning meditation ✓ 7:00 AM
            ├── Team stand-up ✓ 9:30 AM
            ├── Deep work block ✓ 10:00 AM
            ├── Lunch break ○ 12:00 PM
            ├── Code review ○ 2:00 PM
            └── Evening walk ○ 5:30 PM
```

#### SparklinePainter Details

- **Type:** `CustomPainter`
- **Data points:** 10 values trending from 70% to 20% (inverted Y to show upward)
- **Line:** White at 70% opacity, 2.5px width, round caps
- **Endpoint dot:** 4px radius, solid white, at rightmost position
- **No grid lines** — minimal design

---

### 7.3 FocusModeScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/focus/focus_mode_screen.dart` |
| **Theme** | **Dark** (forced via `Theme` wrapper) |
| **Widget Type** | `StatelessWidget` |
| **Scrollable** | No (centered column) |

#### Layout Hierarchy

```
Theme(dark)
└── Scaffold
    ├── AppBar
    │   ├── title: "Focus Mode" (center)
    │   └── actions: [IconButton(close) → pop]
    └── body: SafeArea
        └── Column(center)
            ├── Spacer(flex: 2)
            ├── ProgressRing (radius: 120, stroke: 14)
            │   ├── Background: white12 solid ring
            │   ├── Foreground: SweepGradient arc (primary → light → secondary)
            │   │   └── Progress: 0.45 (27 of 60 min elapsed)
            │   └── Child: Column
            │       ├── Text("45:00") [40px, bold, white]
            │       └── Text("Focus Time") [bodyMedium]
            ├── SizedBox(32)
            ├── Chip
            │   ├── avatar: Icon(shield, primaryLight, 18px)
            │   └── label: "No Social Media Challenge"
            ├── Spacer(flex: 2)
            └── ElevatedButton("Start Focus")
                └── Full width, 16px radius, 4dp elevation
```

#### ProgressRing Painter Details

- **Background ring:** Solid `white12` color, full circle
- **Foreground arc:** `SweepGradient` with 3 stops — `primary`, `primaryLight`, `secondary`
- **Start angle:** `-π/2` (top of circle, 12 o'clock position)
- **Sweep:** Clockwise, `2π * progress`
- **Stroke cap:** Round
- **Center:** Free space for child widget via `Stack`

---

### 7.4 FamilyScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/family/family_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatelessWidget` |
| **Tabs** | 3 (`DefaultTabController`) |

#### Tab 1: Children

```
ListView
└── _FamilyMemberTile × 3
    └── Card (16px radius)
        └── Row
            ├── Stack (avatar + presence dot)
            │   ├── CircleAvatar (radius 24, emoji)
            │   └── Positioned dot (12px, green/grey, white border)
            ├── Expanded
            │   └── Column
            │       ├── Row (name + Online/Offline text)
            │       └── Row (LinearProgressIndicator + hours)
            └── Column (fire icon + streak days)
```

**Family Members (Demo Data):**

| Name | Emoji | Status | Screen Time | Streak |
|------|-------|--------|-------------|--------|
| Emma | 👧 | Online | 2.5h (53%) | 12 days |
| Lucas | 👦 | Online | 1.8h (38%) | 5 days |
| Sarah | 👶 | Offline | 0.5h (12%) | 0 days |

#### Tab 2: Activity Feed

```
ListView
└── ListTile × 3
    ├── leading: CircleAvatar (surfaceVariant bg, primary icon)
    ├── title: Activity description
    ├── subtitle: Relative timestamp
    └── trailing: chevron_right icon
```

**Activities (Demo):**
1. "Emma completed her morning routine" — 2 min ago
2. "Lucas hit his reading goal" — 1 hour ago
3. "New family challenge unlocked!" — 3 hours ago

#### Tab 3: Family Goals

```
Center
└── Column
    ├── Icon(flag_outlined, 64px, grey400)
    ├── Text("Set family goals together")
    ├── Text(subtitle, centered, grey)
    └── ElevatedButton("Create First Goal")
```

---

### 7.5 ChildAppUsageScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/child_usage/child_app_usage_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatelessWidget` |
| **Parameters** | `name` (String), `screenTimePercent` (double, default 53) |

#### Layout Hierarchy

```
Scaffold
├── AppBar
│   ├── leading: IconButton(arrow_back) → pop
│   └── title: "$name - App Usage"
└── body: SingleChildScrollView
    └── Column
        ├── ProgressRing (radius: 90, stroke: 12)
        │   ├── Gradient: warning → streak (amber to orange)
        │   └── Child: Column
        │       ├── Text("53%") [headlineMedium, bold]
        │       └── Text("Used") [bodySmall]
        ├── SizedBox(8)
        ├── Text("53% of daily limit (4h)") [bodyMedium, centered]
        ├── SizedBox(28)
        ├── Text("App Usage Details") [titleLarge]
        └── ListView (shrinkWrap, 5 items)
            └── _AppUsageRow
                └── Row
                    ├── Container (42px, colored bg 10%, app icon)
                    ├── Expanded
                    │   └── Column
                    │       ├── Text(app name) [titleSmall]
                    │       └── LinearProgressIndicator (5px)
                    └── Text("X min") [labelMedium]
```

**Apps (Demo Data):**

| App | Icon | Color | Duration |
|-----|------|-------|----------|
| YouTube Kids | smart_display | #FF0000 | 45 min |
| Duolingo | language | #58CC02 | 30 min |
| Minecraft | grid_on | #795548 | 25 min |
| Spotify | music_note | #1DB954 | 20 min |
| Khan Academy | school | #0D7C86 | 15 min |

---

### 7.6 HabitsScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/habits/habits_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatefulWidget` |
| **State** | `_selectedDateIndex`, `_completions` (List<bool>) |

#### Layout Hierarchy

```
Scaffold
├── AppBar(title: "Habits")
├── body: Column
│   ├── Date Navigator (68px height)
│   │   └── ListView.builder (horizontal)
│   │       └── GestureDetector per date pill
│   │           └── AnimatedContainer (52px wide, 14px radius)
│   │               ├── Text(day) [16px, bold]
│   │               └── Text(weekday) [11px]
│   │   └── Selected: primary fill, white text, glow shadow
│   │   └── Unselected: card color, grey text, no shadow
│   ├── SizedBox(12)
│   └── Expanded → ListView (7 habits)
│       └── HabitCheckItem per habit
└── floatingActionButton: FloatingActionButton.extended("+ Add Habit")
```

**Habits (Demo Data):**

| Habit | Progress | Progress % | Icon | Color |
|-------|----------|------------|------|-------|
| Drink Water | 4/8 cups | 50% | water_drop | #3B82F6 |
| Morning Meditation | 10/10 min | 100% | self_improvement | #8B5CF6 |
| Read for 30 min | 15/30 min | 50% | menu_book | #F59E0B |
| Exercise | 0/45 min | 0% | fitness_center | #10B981 |
| No sugar challenge | Day 4/7 | 57% | no_food | #EF4444 |
| Journal writing | ✓ Done | 100% | edit_note | #6B4EFF |
| Evening stretch | 10/15 min | 67% | accessibility_new | #06B6D4 |

#### HabitCheckItem Toggle Behavior

- **Unchecked state:** Outlined circle (grey border, 2px), transparent fill
- **Checked state:** Filled circle (colored), white checkmark icon
- **Transition:** `AnimatedContainer` with 200ms duration
- **Progress bar:** `ClipRRect` + `LinearProgressIndicator` (5px height, 4px radius)

---

### 7.7 CommuteScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/commute/commute_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatelessWidget` |

#### Layout Hierarchy

```
Scaffold
├── AppBar(title: "Commute")
└── body: SingleChildScrollView
    └── Column
        ├── Text("Active Trip") [titleLarge]
        ├── TimelineWidget (3 milestones)
        │   ├── Home — Departed 8:18 AM ✓
        │   ├── School drop-off — Passed 8:30 AM ✓
        │   └── Office — ETA 8:42 AM ○
        ├── SizedBox(20)
        ├── Map Placeholder (200px)
        │   └── Container (surfaceVariant, 16px radius)
        │       └── Column (centered)
        │           ├── Icon(map_outlined, 56px, primary 40%)
        │           ├── Text("Route View") [labelLarge, grey600]
        │           └── Text("Home → Office · 12.4 km") [bodySmall]
        ├── SizedBox(20)
        ├── Text("Trip Metrics") [titleLarge]
        └── GridView.count (crossAxisCount: 2, aspectRatio: 1.35)
            ├── CustomCard → _MetricTile (ETA, 8:42 AM, timer icon, primary)
            ├── CustomCard → _MetricTile (Duration, 24 min, speed icon, secondary)
            ├── CustomCard → _MetricTile (Distance, 12.4 km, route icon, warning)
            └── CustomCard → _MetricTile (Traffic, Moderate, traffic icon, streak)
```

#### _MetricTileInternal Layout

```
Column
├── Container (36px, colored bg 10%, icon 20px)
├── Spacer
├── Text(value) [titleMedium]
└── Text(label) [bodySmall]
```

---

### 7.8 InsightsScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/insights/insights_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatelessWidget` |

#### Layout Hierarchy

```
Scaffold
├── AppBar(title: "Insights")
└── body: SingleChildScrollView
    └── Column
        ├── Text("Performance") [titleLarge]
        ├── SizedBox(12)
        ├── Horizontal Scroll (120px height)
        │   └── ListView.builder (horizontal)
        │       └── SizedBox(width: 160)
        │           └── CustomCard
        │               └── _MetricCard
        │                   ├── Row (icon + label)
        │                   ├── Text(value) [headlineSmall, color]
        │                   └── Text(change) [bodySmall, green/red]
        ├── SizedBox(24)
        ├── Text("Weekly Trends") [titleLarge]
        ├── SizedBox(12)
        ├── CustomCard
        │   └── Column
        │       ├── Row (title "Productivity" + "+15%")
        │       ├── CustomPaint(_BarChartPainter, 100px)
        │       └── Row (Mon–Sun labels, grey400)
        ├── SizedBox(24)
        └── Achievement Banner
            └── Container (gold→orange gradient, 16px radius)
                └── Row
                    ├── Container (48px, white 25%, trophy icon 26px)
                    └── Column
                        ├── Text("7-Day Streak! 🔥") [titleMedium, white]
                        └── Text(subtitle) [13px, white85]
```

**Performance Cards (Demo):**

| Metric | Value | Change | Color | Trend |
|--------|-------|--------|-------|-------|
| Productivity | 85% | +5% this week | primary | ↑ Green |
| Screen Time | 3.2h | -12% this week | warning | ↑ Green (good) |
| Habit Score | 78% | -3% this week | secondary | ↓ Red (bad) |

#### BarChartPainter Details

- **Type:** `CustomPainter`
- **Bars:** 7 vertical bars (Mon–Sun), 8px spacing
- **Values:** [0.55, 0.6, 0.7, 0.5, 0.75, 0.8, 0.9]
- **Fill:** `LinearGradient` from `primary` (top) to `primaryLight` (bottom)
- **Corners:** Top-left and top-right rounded at 4px
- **Height:** 100px canvas

---

### 7.9 AlertsScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/alerts/alerts_screen.dart` |
| **Theme** | Light |
| **Widget Type** | `StatefulWidget` |
| **State** | `_alerts` (List<_Alert>) |

#### Layout Hierarchy

```
Scaffold
├── AppBar
│   ├── leading: IconButton(arrow_back) → pop
│   ├── title: "Alerts"
│   └── actions: [TextButton("Clear All")] (if alerts exist)
└── body
    ├── If alerts exist: ListView.builder
    │   └── Dismissible (endToStart, archive icon background)
    │       └── _AlertTile
    │           └── Row
    │               ├── Container (44px, colored bg 10%, icon 22px)
    │               └── Expanded
    │                   └── Column
    │                       ├── Text(title) [titleSmall]
    │                       ├── Text(body) [bodyMedium]
    │                       └── Text(time) [labelSmall]
    └── If empty:
        └── Center
            └── Column
                ├── Icon(notifications_off, 64px, grey400)
                └── Text("All caught up!") [titleMedium]
```

**Alerts (Demo Data):**

| Title | Body | Time | Icon | Color |
|-------|------|------|------|-------|
| Location update | Emma arrived at Lincoln Elementary. | 5 min ago | location_on | primary |
| Screen time limit reached | Lucas has used 90% of his daily screen time. | 30 min ago | screen_lock | warning |
| Habit completed! 🎉 | You completed "Morning Meditation" for 7 days! | 1 hour ago | check_circle | secondary |
| Commute alert | Traffic is heavier than usual on your route. | 2 hours ago | traffic | streak |
| New family challenge | "Weekend Cooking" starts Friday. Join now! | Yesterday | emoji_events | #8B5CF6 |
| Weekly report ready | Your productivity score increased by 12%. | Yesterday | assessment | primary |

#### Swipe-to-Dismiss Behavior

- **Direction:** End to start (right to left)
- **Background:** Red-tinted with archive icon
- **Animation:** Standard `Dismissible` slide
- **Result:** Alert removed from list; if list empties, empty state shown

---

### 7.10 ProfileScreen

| Property | Value |
|----------|-------|
| **File** | `lib/presentation/screens/profile/profile_screen.dart` |
| **Theme** | **Dark** (forced via `Theme` wrapper) |
| **Widget Type** | `StatelessWidget` |

#### Layout Hierarchy

```
Theme(dark, custom ListTile + AppBar styles)
└── Scaffold
    ├── AppBar(title: "Profile")
    └── body: SingleChildScrollView
        └── Column
            ├── CircleAvatar (radius 44, primary bg, "A" initial)
            ├── SizedBox(12)
            ├── Text("Alex Johnson") [20px, bold, white]
            ├── SizedBox(2)
            ├── Text("alex.johnson@email.com") [14px, grey400]
            ├── Chip("Premium Member") [warning bg 15%, warningLight text]
            ├── SizedBox(28)
            ├── Divider
            ├── _SectionHeader("Account")
            ├── _SettingsTile(person, "Personal Information")
            ├── _SettingsTile(shield, "Privacy & Security")
            ├── _SettingsTile(notifications, "Notifications")
            ├── Divider
            ├── _SectionHeader("Family")
            ├── _SettingsTile(people, "Family Members")
            ├── _SettingsTile(screen_lock, "Screen Time Limits")
            ├── _SettingsTile(gps_fixed, "Location Sharing")
            ├── Divider
            ├── _SectionHeader("App")
            ├── _SettingsTile(palette, "Appearance", trailing: "System")
            ├── _SettingsTile(help, "Help & Support")
            ├── _SettingsTile(info, "About", trailing: "v1.0.0")
            ├── SizedBox(24)
            └── OutlinedButton("Sign Out")
                └── Full width, red border/foreground, 16px radius
```

#### _SettingsTileSpec

- **Leading:** Icon 22px, `primaryLight` color
- **Title:** 15px, w500, light grey
- **Trailing:** Optional text + `chevron_right` icon
- **Padding:** 20px horizontal, 4px vertical
- **On tap:** Callback (no-op in prototype)

#### Section Header Spec

- **Padding:** 20px horizontal, 16px top, 8px bottom
- **Style:** 13px, w600, grey400, 0.5px letter spacing
- **Appearance:** Uppercase-like visual weight via small size + spacing

---

## 8. Reusable Widget Library

### 8.1 CustomCard

```dart
CustomCard({
  Widget? child,
  Color? color,                    // defaults to Theme.cardColor
  EdgeInsetsGeometry? padding,     // defaults to EdgeInsets.all(16)
  VoidCallback? onTap,            // wraps in GestureDetector if provided
  double? width,
  double? height,
  BorderRadiusGeometry? borderRadius, // defaults to 16
})
```

**Decoration:**
- `BorderRadius.circular(16)`
- `BoxShadow`: primary at 6% opacity, 12px blur, 4px Y offset
- Background: `color ?? Theme.of(context).cardColor`

**Used in:** Every screen (Home stats, Overview grid, Insights cards, Commute metrics, etc.)

---

### 8.2 ProgressRing

```dart
ProgressRing({
  required double radius,
  required double strokeWidth,
  required double progress,       // 0.0–1.0
  List<Color> gradientColors,     // defaults to [primary, secondary]
  Color? backgroundColor,         // defaults to grey200
  Widget? child,                  // centered inside the ring
})
```

**Internals:**
- `_RingPainter`: Solid circle background
- `_GradientRingPainter`: `SweepGradient` arc from `-π/2` clockwise
- Both use `StrokeCap.round`
- Child rendered via `Stack` above both painters

**Used in:** FocusModeScreen, ChildAppUsageScreen

---

### 8.3 StatTile

```dart
StatTile({
  required IconData icon,
  required String label,
  required String value,
  double? progress,               // 0.0–1.0, null hides bar
  Color? progressColor,
  Color? iconColor,
  VoidCallback? onTap,
})
```

**Layout:**
```
CustomCard
└── Column
    ├── Row (icon 20px + label)
    ├── SizedBox(10)
    ├── Text(value) [headlineSmall, bold]
    └── [if progress != null]
        └── ClipRRect(4px radius)
            └── LinearProgressIndicator (6px, colored)
```

**Used in:** OverviewScreen (×4 in grid)

---

### 8.4 TimelineWidget

```dart
TimelineWidget({
  required List<TimelineItem> items,
})
```

**TimelineItem model:**
```dart
TimelineItem({
  required String title,
  String? subtitle,
  String? time,
  bool isCompleted = false,
})
```

**Layout per item:**
```
IntrinsicHeight → Row
├── SizedBox(width: 32)
│   └── Column
│       ├── [if not first] Expanded → Container (2px, grey200 line)
│       ├── Container (14px circle)
│       │   ├── Completed: secondary fill, white checkmark
│       │   └── Pending: transparent, grey400 border
│       └── [if not last] Expanded → Container (2px, grey200 line)
├── SizedBox(12)
└── Expanded
    └── Padding(bottom: 20)
        └── Column
            ├── Text(title)
            ├── [if subtitle] Text(subtitle)
            └── [if time] Text(time)
```

**Used in:** OverviewScreen, CommuteScreen

---

### 8.5 HabitCheckItem

```dart
HabitCheckItem({
  required String name,
  required String progressText,
  double? progress,               // 0.0–1.0, null hides bar
  bool isCompleted = false,
  VoidCallback? onToggle,
  IconData icon = Icons.check,
  Color? progressColor,
})
```

**Layout:**
```
Container (14px radius, card color)
└── Row
    ├── Container (40px, colored bg 10%, icon 20px)
    ├── SizedBox(12)
    ├── Expanded
    │   └── Column
    │       ├── Text(name) [titleSmall]
    │       └── Row
    │           ├── [if progress] Expanded → LinearProgressIndicator (5px)
    │           └── Text(progressText) [bodySmall / green if completed]
    └── GestureDetector → AnimatedContainer (28px, 200ms)
        ├── Unchecked: transparent, grey border
        └── Checked: color fill, white checkmark
```

**Used in:** HabitsScreen (×7 habits)

---

## 9. User Flows

### 9.1 Morning Routine Flow
```
App Launch → Home
  → Check Today's Focus
  → Tap Productivity Score → Overview
      → Review schedule timeline
      → Check stat grid
  → Back to Home
  → Tap bell → Alerts
      → Review overnight notifications
      → Swipe-dismiss irrelevant ones
  → Back to Home
```

### 9.2 Focus Session Flow
```
Home → Tap Focus Banner → Focus Mode
  → View timer and challenge
  → Tap "Start Focus" (starts timer in production)
  → Session completes → achievement notification
  → Tap X → return to Home
```

### 9.3 Family Check-In Flow
```
Bottom Nav → Family tab
  → View Children tab
      → See Emma online, screen time 53%
      → Tap Emma → Child App Usage
          → Review app breakdown
          → Back to Family
  → Switch to Activity Feed tab
      → See recent family activity
  → Switch to Family Goals tab
      → Review shared goals
```

### 9.4 Habit Tracking Flow
```
Bottom Nav → Habits tab
  → Swipe date navigator to select day
  → Tap toggle on completed habits
  → Review progress bars for incomplete habits
  → Tap FAB "+ Add Habit" (future: opens create form)
```

### 9.5 Commute Planning Flow
```
Bottom Nav → Commute tab
  → View active trip milestones
  → Check ETA and traffic in metrics grid
  → View route on map placeholder
```

### 9.6 Weekly Review Flow
```
Bottom Nav → Insights tab
  → Scroll performance cards
      → Productivity: +5%
      → Screen Time: -12%
      → Habit Score: -3%
  → View weekly bar chart
  → See achievement banner for active streak
```

### 9.7 Settings Flow
```
Any screen → Navigate to Profile
  → View user info and subscription
  → Scroll Account settings
  → Review Family settings
  → Check App version
  → [Sign Out if needed]
```

---

## 10. Technical Specifications

### 10.1 Technology Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.27+ |
| Language | Dart 3.6+ |
| Design System | Material 3 (`useMaterial3: true`) |
| State Management | `setState` (local widget state, current) |
| Navigation | Navigator 2.0-compatible push/pop + `IndexedStack` |
| Custom Graphics | `CustomPainter` API |
| Platform Targets | Android (SDK 21+), iOS (15+) |

### 10.2 CustomPainters

| Painter | File | Complexity |
|---------|------|------------|
| `_RingPainter` | `progress_ring.dart` | Low — filled circle arc |
| `_GradientRingPainter` | `progress_ring.dart` | Medium — `SweepGradient` shader arc |
| `_SparklinePainter` | `overview_screen.dart` | Medium — multi-point path + dot |
| `_BarChartPainter` | `insights_screen.dart` | Medium — 7 rounded gradient bars |

### 10.3 Animations

| Animation | Widget | Duration | Curve |
|-----------|--------|----------|-------|
| Habit toggle | `AnimatedContainer` | 200ms | Linear (default) |
| Date pill selection | `AnimatedContainer` | 200ms | Linear (default) |
| Swipe dismiss alert | `Dismissible` | Platform default | Platform default |
| Tab switch | Material 3 tabs | Platform default | Platform default |

### 10.4 Widget Count by Type

| Widget Type | Count |
|-------------|-------|
| `StatelessWidget` | 14 |
| `StatefulWidget` | 3 |
| `CustomPainter` | 4 |
| Private helper widgets | 18 |

### 10.5 Responsive Behavior

All screens use flexible layouts:
- **Cards:** Use `Expanded` in `Row`/`Column` — adapt to screen width
- **Grids:** Use `GridView.count` with fixed `crossAxisCount` — scales with screen
- **Lists:** Use `ListView.builder` with `shrinkWrap: true` where nested in `SingleChildScrollView`
- **Text:** Uses `TextOverflow.ellipsis` on labels inside constrained spaces
- **Horizontal scrolls:** Used for date navigator and performance cards

---

## 11. Asset Inventory

### 11.1 Current Assets (None Required)

The prototype uses **zero asset files** — all icons come from Flutter's built-in `Icons` class (Material Icons font).

### 11.2 Future Assets (Recommended)

| Asset | Path | Purpose |
|-------|------|---------|
| Inter font files | `assets/fonts/Inter-*.ttf` | Custom typography (4 weights) |
| App icon | `assets/icon/app_icon.png` | Launcher icon |
| Focus illustration | `assets/illustrations/focus.png` | Home screen hero |
| Map marker icons | `assets/icons/map_marker.png` | Commute map |
| Achievement badges | `assets/badges/*.png` | Streak milestones |

### 11.3 Icon Inventory

All icons used are from `Icons` class:

| Screen | Icons Used |
|--------|-----------|
| Home | `home_outlined`, `home`, `notifications_outlined`, `rocket_launch_rounded`, `center_focus_strong`, `trending_up`, `local_fire_department`, `arrow_forward_ios_rounded` |
| Overview | `menu`, `calendar_today_outlined`, `screen_lock_portrait_outlined`, `center_focus_strong_outlined`, `check_circle_outline`, `wb_sunny_outlined`, `show_chart`, `check` |
| Focus Mode | `close`, `shield_outlined` |
| Family | `people_outline`, `people`, `local_fire_department`, `check_circle_outline`, `menu_book`, `emoji_events_outlined`, `flag_outlined`, `chevron_right` |
| Child Usage | `arrow_back`, `smart_display_outlined`, `language`, `grid_on`, `music_note_outlined`, `school_outlined` |
| Habits | `check_box_outlined`, `check_box`, `add`, `water_drop_outlined`, `self_improvement_outlined`, `menu_book_outlined`, `fitness_center_outlined`, `no_food_outlined`, `edit_note_outlined`, `accessibility_new_outlined` |
| Commute | `directions_car_outlined`, `directions_car`, `map_outlined`, `timer_outlined`, `speed`, `route_outlined`, `traffic_outlined` |
| Insights | `bar_chart_outlined`, `bar_chart`, `trending_up`, `screen_lock_portrait_outlined`, `check_circle_outline`, `emoji_events_rounded` |
| Alerts | `arrow_back`, `notifications_off_outlined`, `location_on_outlined`, `screen_lock_portrait_outlined`, `check_circle_outline`, `traffic_outlined`, `emoji_events_outlined`, `assessment_outlined`, `archive_outlined` |
| Profile | `person_outline`, `shield_outlined`, `notifications_outlined`, `people_outline`, `screen_lock_portrait_outlined`, `gps_fixed_outlined`, `palette_outlined`, `help_outline`, `info_outline`, `chevron_right` |

---

## 12. State Management

### 12.1 Current Approach (Prototype)

The prototype uses **local widget state** (`setState`) in three widgets:

| Widget | State | Purpose |
|--------|-------|---------|
| `MainNavigationHub` | `_currentIndex` (int) | Currently selected bottom nav tab |
| `HabitsScreen` | `_selectedDateIndex` (int), `_completions` (List<bool>) | Selected date pill, habit toggle states |
| `AlertsScreen` | `_alerts` (List<_Alert>) | Active alerts (removed on dismiss/clear) |

### 12.2 Production Upgrade Path

For production, recommend migrating to a lightweight state management solution:

| Option | Pros | Cons |
|--------|------|------|
| **Riverpod** | Compile-safe, testable, no context needed | Learning curve |
| **Provider** | Official, simple, well-documented | Less type-safe |
| **BLoC** | Enterprise-grade, great for teams | Boilerplate-heavy for this scale |

**Recommended:** Riverpod — the app's feature-based architecture maps well to Riverpod's provider-per-feature model.

### 12.3 Data That Would Become Stateful

| Data | Source | Storage |
|------|--------|---------|
| User profile | Auth service | Remote DB |
| Family members | Family service | Remote DB |
| Habits & completions | Habits service | Remote + local sync |
| Focus sessions | Timer service | Local + remote |
| Screen time data | Device API | Local |
| Alerts/notifications | Push + in-app events | Remote + local cache |
| Commute data | Maps API | Remote |
| Settings | User preferences | Local (SharedPreferences) |

---

## 13. Future Roadmap

### Phase 2: Core Backend (Post-Prototype)

- [ ] **Authentication:** Email + social login (Google, Apple)
- [ ] **Family group creation:** Invite family members, set roles (parent/child)
- [ ] **Real habit data:** CRUD API for habits, daily completion logging
- [ ] **Focus timer engine:** Actual countdown timer with session history
- [ ] **Push notifications:** Habit reminders, screen time alerts, commute updates

### Phase 3: Enhanced Features

- [ ] **Real maps integration:** Google Maps / Mapbox for Commute screen with live traffic
- [ ] **Screen time API:** Android `UsageStatsManager` / iOS `Screen Time` API integration
- [ ] **Gamification:** XP points, levels, badges, family leaderboards
- [ ] **AI insights:** Weekly productivity summary, habit pattern detection
- [ ] **Calendar sync:** Two-way sync with Google Calendar / Apple Calendar

### Phase 4: Ecosystem

- [ ] **Apple Watch / Wear OS companion:** Quick habit check, focus timer control
- [ ] **Widget support:** Home screen widgets for habit streaks and focus timer
- [ ] **Family challenges:** Shared goals with collective progress tracking
- [ ] **Dark mode toggle:** System-wide theme preference support (currently per-screen)

---

## 14. Appendix

### A. File Inventory

| # | File | Lines (approx.) | Type |
|---|------|-----------------|------|
| 1 | `lib/main.dart` | 30 | Entry point |
| 2 | `lib/core/constants/app_colors.dart` | 45 | Constants |
| 3 | `lib/core/constants/app_assets.dart` | 18 | Constants |
| 4 | `lib/core/theme/global_theme.dart` | 470 | Theme |
| 5 | `lib/presentation/widgets/custom_card.dart` | 55 | Widget |
| 6 | `lib/presentation/widgets/progress_ring.dart` | 140 | Widget |
| 7 | `lib/presentation/widgets/stat_tile.dart` | 70 | Widget |
| 8 | `lib/presentation/widgets/timeline_widget.dart` | 120 | Widget |
| 9 | `lib/presentation/widgets/habit_check_item.dart` | 115 | Widget |
| 10 | `lib/presentation/screens/main_navigation_hub.dart` | 90 | Screen |
| 11 | `lib/presentation/screens/home/home_screen.dart` | 280 | Screen |
| 12 | `lib/presentation/screens/overview/overview_screen.dart` | 210 | Screen |
| 13 | `lib/presentation/screens/focus/focus_mode_screen.dart` | 115 | Screen |
| 14 | `lib/presentation/screens/family/family_screen.dart` | 280 | Screen |
| 15 | `lib/presentation/screens/child_usage/child_app_usage_screen.dart` | 165 | Screen |
| 16 | `lib/presentation/screens/habits/habits_screen.dart` | 215 | Screen |
| 17 | `lib/presentation/screens/commute/commute_screen.dart` | 155 | Screen |
| 18 | `lib/presentation/screens/insights/insights_screen.dart` | 210 | Screen |
| 19 | `lib/presentation/screens/alerts/alerts_screen.dart` | 180 | Screen |
| 20 | `lib/presentation/screens/profile/profile_screen.dart` | 220 | Screen |
| 21 | `pubspec.yaml` | 25 | Config |
| 22 | `analysis_options.yaml` | 8 | Config |
| 23 | `test/pokus_test.dart` | 20 | Test |

**Total: ~3,200 lines across 23 files**

### B. Dependency Tree

```
main.dart
└── PokusApp
    └── MaterialApp
        ├── GlobalTheme.light()
        ├── GlobalTheme.dark()
        └── MainNavigationHub
            ├── HomeScreen
            │   ├── CustomCard (×2)
            │   └── CircularProgressIndicator
            ├── HabitsScreen
            │   ├── HabitCheckItem (×7)
            │   └── FloatingActionButton.extended
            ├── CommuteScreen
            │   ├── TimelineWidget
            │   └── CustomCard (×4)
            ├── FamilyScreen
            │   ├── TabBar + TabBarView
            │   └── Card + ListTile
            └── InsightsScreen
                ├── CustomCard (×4)
                └── CustomPaint (×1)
```

### C. Glossary

| Term | Definition |
|------|-----------|
| **IndexedStack** | Flutter widget that displays one child at a time by index while keeping all children in memory (preserves state) |
| **CustomPainter** | Flutter API for drawing custom shapes, paths, and gradients on a canvas |
| **SweepGradient** | A gradient that sweeps around a center point (used for progress ring) |
| **M3 / Material 3** | The third generation of Google's Material Design system |
| **Feature-first** | Directory organization where each feature/screen is its own folder, as opposed to layer-first (all models together, all views together) |
| **CTA** | Call To Action — a prominent button that drives the primary user action |
| **FAB** | Floating Action Button — a circular button elevated above the content |
| **Presence indicator** | A small colored dot (green/offline) showing a user's current status |
| **Sparkline** | A small, simple line chart without axes, used to show trends at a glance |
| **Dismissible** | Flutter widget that can be swiped away to dismiss/remove |

---

> **Document Version:** 1.0.0  
> **Last Updated:** June 2026  
> **Author:** Pokus Development Team  
> **Status:** Prototype Complete
