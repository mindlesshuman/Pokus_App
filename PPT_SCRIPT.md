# Pokus — PowerPoint Slide Creation Script

> **Total Slides:** 24  
> **Estimated Duration:** 18–22 minutes  
> **Design Template:** Dark header bar, white body, Indigo (`#6B4EFF`) accent throughout  
> **Recommended Font:** Inter or Segoe UI — Bold for titles, Regular for body  

---

## 🎨 PPT Design Guidelines

Use these consistently across ALL slides:

| Element | Specification |
|---------|---------------|
| Slide size | Widescreen 16:9 |
| Title font | 32pt Bold, color `#1E1E2E` |
| Subtitle font | 18pt Regular, color `#6B7280` |
| Body font | 16pt Regular, color `#374151` |
| Accent color | `#6B4EFF` (Indigo) for highlights, icons, progress bars |
| Secondary accent | `#10B981` (Green) for success/checkmarks |
| Warning accent | `#F59E0B` (Amber) for alerts |
| Card backgrounds | `#F8F9FC` with `#EEF2FF` borders |
| All screenshots | Rounded corners 12px, subtle shadow |
| Footer | Slide number (right), "Pokus — Confidential" (left), 10pt, `#9CA3AF` |

---

## SLIDE 1 — Title Slide

**Layout:** Centered, dark background

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                                                             │
│                   [App Icon — large, centered]               │
│                                                             │
│                        P O K U S                             │
│          Productivity · Family Tracking · Habit Management   │
│                                                             │
│              Flutter + Material 3  |  iOS & Android          │
│                                                             │
│                                                             │
│                     Presented by [Your Name]                 │
│                         [Date]                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Background: Deep indigo-to-dark gradient (top-left `#6B4EFF` → bottom-right `#121218`)
- Title: White, 48pt, Bold, all caps, letter-spacing 8px
- Tagline: White at 70% opacity, 20pt
- "Flutter + Material 3" line: 14pt, white 50%, pill-shaped border around it

**Speaker Script:**
"Good morning everyone. Today I'm presenting **Pokus** — a unified productivity, family tracking, and habit management app built with Flutter and Material 3, targeting both iOS and Android from a single codebase."

---

## SLIDE 2 — Agenda

**Layout:** Two-column grid

```
┌─────────────────────────────────────────────────────────────┐
│  Agenda                                          Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   1.  Problem & Vision                                      │
│   2.  User Personas                                         │
│   3.  Design System                                         │
│   4.  Architecture                                          │
│   5.  Navigation Shell                                      │
│   6.  Reusable Widget Library                               │
│   7.  Screen Walkthrough (10 screens)                       │
│   8.  User Flows                                            │
│   9.  Technical Highlights                                  │
│  10.  Key Stats & Roadmap                                   │
│  11.  Q&A                                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Left column: 11 numbered items, each with a small indigo circle bullet
- Right column: Large Pokus mockup or app icon as decorative element
- Current item in bold indigo, others in grey

**Speaker Script:**
"Here's our agenda. We'll start with the problem we're solving, meet our users, then dive deep into the design system, architecture, and all 10 screens. I'll wrap up with technical highlights, key stats, and our roadmap before Q&A."

---

## SLIDE 3 — The Problem

**Layout:** Three pain-point cards, horizontal

```
┌─────────────────────────────────────────────────────────────┐
│  The Problem                                      Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   │
│  │  🔀  TOO     │   │  📱  KIDS    │   │  📊  NO      │   │
│  │  MANY APPS   │   │  & SCREENS   │   │  VISIBILITY  │   │
│  │              │   │              │   │              │   │
│  │ Users juggle │   │ Parents have │   │ No unified   │   │
│  │ 3+ separate  │   │ no insight   │   │ dashboard    │   │
│  │ apps for     │   │ into child   │   │ to track     │   │
│  │ tasks,family,│   │ screen time  │   │ progress     │   │
│  │ and habits   │   │ and habits   │   │ over time    │   │
│  └──────────────┘   └──────────────┘   └──────────────┘   │
│                                                             │
│          There is no single app that does all three.         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Three cards with rounded corners, light grey fill
- Each card: large emoji icon at top, bold title, 2-line description
- "There is no single app..." — indigo highlight bar below the cards

**Speaker Script:**
"The problem is threefold. First, users juggle multiple apps — a to-do list, a family tracker, a habit app. That's context-switching overhead. Second, parents have no visibility into their children's screen time and digital habits. Third, there's no unified dashboard to see progress across all these dimensions. Pokus solves all three in one app."

---

## SLIDE 4 — Vision & Solution

**Layout:** Left text + Right visual

```
┌─────────────────────────────────────────────────────────────┐
│  Our Vision                                       Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   "Be the single app that helps modern families              │
│    manage their time, attention, and habits — together."    │
│                                                             │
│                                                             │
│   ┌─────────────────────┐                                   │
│   │  🎯 Productivity    │──── Stay focused.                 │
│   │  👨‍👩‍👧‍👦 Family     │──── Stay connected.              │
│   │  ✅ Habits          │──── Build habits that last.       │
│   └─────────────────────┘                                   │
│                                                             │
│   Three pillars. One app. Zero context switching.           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Vision quote in large italic text, indigo quote marks
- Right side: Three stacked pill-shaped tags with icons and taglines
- Bottom: Bold summary line in indigo

**Speaker Script:**
"Our vision is to be the single app that helps modern families manage their time, attention, and habits together. Three pillars — personal productivity, family management, and habit building — unified in one experience. Zero context switching."

---

## SLIDE 5 — User Personas

**Layout:** Three persona cards in a row

```
┌─────────────────────────────────────────────────────────────┐
│  Who We're Building For                           Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │    ALEX      │  │    EMMA      │  │    SARAH     │     │
│  │  The Parent  │  │  The Child   │  │  Co-Parent   │     │
│  │              │  │              │  │              │     │
│  │  Age: 36     │  │  Age: 10     │  │  Age: 34     │     │
│  │  Working pro │  │  Student     │  │  Part-time   │     │
│  │              │  │              │  │              │     │
│  │  Goals:      │  │  Goals:      │  │  Goals:      │     │
│  │  • Manage    │  │  • Complete  │  │  • Coordinate│     │
│  │    routines  │  │    habits    │  │    family    │     │
│  │  • Track     │  │  • Earn      │  │    activities│     │
│  │    screen    │  │    streaks   │  │  • Share     │     │
│  │    time      │  │              │  │    goals     │     │
│  │              │  │              │  │              │     │
│  │  Pain:       │  │  Pain:       │  │  Pain:       │     │
│  │  Juggling   │  │  No visibility│  │  Communica- │     │
│  │  3 apps      │  │  into own    │  │  tion gaps   │     │
│  │              │  │  screen time │  │              │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Three cards with avatar circles at top (initials or icons)
- Name in bold, role in grey
- Goals as bullet points with small indigo dots
- Pain points in amber/red text at bottom of each card

**Speaker Script:**
"We have three core personas. **Alex**, the working parent — juggling three apps, needs a unified dashboard. **Emma**, the 10-year-old — wants to complete habits and see her streak, but has no visibility into her own screen time. **Sarah**, the co-parent — wants to coordinate family activities but faces communication gaps. Every feature in Pokus maps to at least one of these personas."

---

## SLIDE 6 — Design System: Colors

**Layout:** Color swatch grid

```
┌─────────────────────────────────────────────────────────────┐
│  Design System — Color Palette                    Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PRIMARY                    SECONDARY                      │
│  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐   │
│  │#6B4EFF│ │#8F79FF│ │#4A35CC│ │#10B981│ │#34D399│ │#059669│   │
│  │ Base  │ │Light │ │Dark  │ │ Base  │ │Light │ │Dark  │   │
│  └──────┘ └──────┘ └──────┘ └──────┘ └──────┘ └──────┘   │
│                                                             │
│  WARNING                    SEMANTIC                        │
│  ┌──────┐ ┌──────┐         ┌──────┐ ┌──────┐ ┌──────┐   │
│  │#F59E0B│ │#FBBF24│         │Online │ │Streak│ │Error │   │
│  │ Base  │ │Light │         │#10B981│ │#FF6B35│ │#EF4444│   │
│  └──────┘ └──────┘         └──────┘ └──────┘ └──────┘   │
│                                                             │
│  SURFACES                    NEUTRALS                       │
│  ┌──────┐ ┌──────┐         ┌──────┐ ┌──────┐ ┌──────┐   │
│  │#EEF2FF│ │#1E1E2E│         │#F8F9FC│ │#F3F4F6│ │#E5E7EB│   │
│  │Light  │ │Dark   │         │Bg Light│ │Grey100│ │Grey200│   │
│  └──────┘ └──────┘         └──────┘ └──────┘ └──────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Color swatches: filled rounded squares with hex code and label below
- Grouped with section labels on the left
- 16 total swatches in a clean grid

**Speaker Script:**
"Every pixel in Pokus pulls from this color system. Primary deep indigo for focus and trust. Secondary green for completion and growth. Amber for warnings and attention. And a full neutral scale from near-white to near-black. We support both light and dark themes — surfaces swap but the semantic colors stay consistent."

---

## SLIDE 7 — Design System: Typography & Shape

**Layout:** Two-column — Typography scale left, Shape specs right

```
┌─────────────────────────────────────────────────────────────┐
│  Design System — Type & Shape                     Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TYPOGRAPHY (M3 Scale)        SHAPE & ELEVATION             │
│                                                             │
│  Display Large  57px Bold     Cards:     16px radius, 2dp  │
│  Headline Medium 24px Bold    Buttons:   16px radius, 4dp  │
│  Title Large    18px W600     Chips:     24px radius (pill) │
│  Title Small    14px W600     Progress:   4px radius        │
│  Body Medium    14px W400     Icons:    10-12px radius     │
│  Label Small    10px W500                                   │
│                                                             │
│  Font: System sans-serif      Spacing: 20px screen padding │
│  (Inter when bundled)         16px card padding             │
│                               10-12px inter-element         │
│  All via:                    20-28px section gaps           │
│  Theme.of(context).textTheme                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Left: Actual rendered text samples showing each type scale entry
- Right: Shape specs with small visual diagram of each radius
- Bottom: Code snippet showing `Theme.of(context).textTheme`

**Speaker Script:**
"Typography follows Material 3's type scale — from 57px Display Large down to 10px Label Small. Bold for headers, semi-bold for titles, regular for body. All accessed through `Theme.of(context).textTheme` — never hardcoded. Cards use 16px rounded corners throughout. Buttons match at 16px. Chips use pill shapes at 24px. Every spacing value is consistent: 20px screen edges, 16px inside cards, 10-24px between elements."

---

## SLIDE 8 — Architecture

**Layout:** Directory tree visualization

```
┌─────────────────────────────────────────────────────────────┐
│  Architecture — Feature-First                     Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   lib/                                                      │
│   ├── core/                    Design Principles            │
│   │   ├── theme/               ┌─────────────────────────┐ │
│   │   │   └── global_theme.dart│ 1. Feature-first folders│ │
│   │   └── constants/           │ 2. Theme-driven, not    │ │
│   │       ├── app_colors.dart  │    hardcoded            │ │
│   │       └── app_assets.dart  │ 3. Reuse over duplicate │ │
│   ├── presentation/            │ 4. CustomPaint over     │ │
│   │   ├── widgets/  (5 files)  │    dependencies         │ │
│   │   └── screens/  (11 files) │ 5. Separation of        │ │
│   │       ├── main_navigation_ │    concerns             │ │
│   │       │   hub.dart         └─────────────────────────┘ │
│   │       ├── home/                                        │
│   │       ├── overview/        22 Dart files                │
│   │       ├── focus/           ~3,200 lines                 │
│   │       ├── family/          0 external dependencies      │
│   │       ├── child_usage/                                  │
│   │       ├── habits/                                       │
│   │       ├── commute/                                      │
│   │       ├── insights/                                     │
│   │       ├── alerts/                                       │
│   │       └── profile/                                      │
│   └── main.dart                                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Left: Directory tree with folder/file icons, indigo highlight on key files
- Right: Five design principles in a styled card
- Bottom: Stats bar — "22 Dart files | ~3,200 lines | 0 external dependencies"

**Speaker Script:**
"Our architecture follows five principles. First, feature-first folders — every screen lives in its own directory. Second, theme-driven styling — no hardcoded colors or fonts. Third, widget reuse — five shared components power all 10 screens. Fourth, custom painting over dependencies — our charts and rings are pure Flutter `CustomPainter` subclasses. Fifth, strict separation of concerns. The result: 22 Dart files, about 3,200 lines, and zero external UI dependencies."

---

## SLIDE 9 — Navigation Shell

**Layout:** Diagram with nav bar and screen labels

```
┌─────────────────────────────────────────────────────────────┐
│  Navigation — MainNavigationHub                   Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│    ┌───────────────────────────────────────────────┐       │
│    │                                               │       │
│    │           IndexedStack (5 children)           │       │
│    │                                               │       │
│    │   [0] Home   [1] Habits  [2] Commute         │       │
│    │   [3] Family  [4] Insights                   │       │
│    │                                               │       │
│    │   • Preserves tab state when switching        │       │
│    │   • All 5 remain in memory                    │       │
│    │                                               │       │
│    └───────────────────────────────────────────────┘       │
│                                                             │
│    ┌──────────────────────────────────────────────────┐    │
│    │  🏠 Home  │ ✅ Habits │ 🚗 Commute │ 👥 Family │ 📊 Insights │
│    │   home    │ check_box │ directions │  people   │ bar_chart │
│    └──────────────────────────────────────────────────┘    │
│                 Material 3 NavigationBar                    │
│                                                             │
│   Selected: Indigo fill, bold label    Unselected: Grey     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Top: Large rectangle showing `IndexedStack` concept — 5 screens stacked
- Bottom: Navigation bar mockup with 5 icons and labels
- Color coding: Selected tab in indigo, others in grey

**Speaker Script:**
"The navigation hub uses an `IndexedStack` — all five tab screens are created once and kept in memory. This means when you switch from Habits to Family and back, your scroll position and toggle states are preserved. The bottom bar is Material 3's `NavigationBar` with outlined icons for unselected, filled icons for selected, and indigo accent for the active tab."

---

## SLIDE 10 — Reusable Widgets

**Layout:** Five widget cards in a row/2-row grid

```
┌─────────────────────────────────────────────────────────────┐
│  Reusable Widget Library (5 Components)           Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │  CustomCard  │  │ ProgressRing │  │  StatTile    │     │
│  │              │  │              │  │              │     │
│  │  • 16px rad  │  │  • SweepGrad │  │  • Icon+label│     │
│  │  • Soft shadow│  │  • 2 painters│  │  • Value text│     │
│  │  • Tap action│  │  • Centered  │  │  • Linear bar│     │
│  │              │  │    child     │  │              │     │
│  │  Used: ALL   │  │              │  │              │     │
│  │  screens     │  │  Used: Focus │  │  Used:       │     │
│  │              │  │  + ChildUsage│  │  Overview(×4)│     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
│                                                             │
│  ┌──────────────┐  ┌──────────────┐                        │
│  │TimelineWidget│  │HabitCheckItem│                        │
│  │              │  │              │                        │
│  │  • Vert line  │  │  • Toggle    │                        │
│  │  • Dot nodes  │  │    animation │                        │
│  │  • Checkmarks │  │  • Progress  │                        │
│  │              │  │    bar       │                        │
│  │  Used:       │  │  • Colored   │                        │
│  │  Overview +  │  │    icon      │                        │
│  │  Commute     │  │              │                        │
│  │              │  │  Used:       │                        │
│  │              │  │  Habits (×7) │                        │
│  └──────────────┘  └──────────────┘                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Each widget in a card with: name, 3-4 bullet features, "Used in:" line at bottom
- Small icon or illustration representing each widget
- CustomCard card slightly larger to emphasize it's the most used

**Speaker Script:**
"Before diving into screens, let me introduce the five reusable widgets that power everything. **CustomCard** — used on every single screen, handles rounded corners, shadows, and tap gestures. **ProgressRing** — our custom gradient arc painter, used in Focus Mode and Child Usage. **StatTile** — used four times in the Overview grid alone. **TimelineWidget** — shared between Overview and Commute. And **HabitCheckItem** — used seven times on the Habits screen. Build once, use everywhere."

---

## SLIDE 11 — Screen 1: Home

**Layout:** Screenshot left, callouts right

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 1 — Home                                  Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐                                          │
│  │              │    COMPONENTS:                            │
│  │  [Screenshot │    ┌─────────────────────────────────┐   │
│  │   of Home    │    │ AppBar: "Pokus" + bell icon     │   │
│  │   Screen]    │    │                                 │   │
│  │              │    │ Greeting Hero:                   │   │
│  │              │    │ • "Good morning, Alex! 👋"      │   │
│  │              │    │ • Motivational subtitle         │   │
│  │              │    │ • Gradient illustration area    │   │
│  │              │    │                                 │   │
│  │              │    │ Today's Focus Banner:            │   │
│  │              │    │ • Indigo, glow shadow           │   │
│  │              │    │ • "Deep Work — 2 sessions"      │   │
│  │              │    │                                 │   │
│  │              │    │ Stats Row:                       │   │
│  │              │    │ • Productivity Score: 85% ring   │   │
│  │              │    │ • Focus Streak: 🔥 7 days       │   │
│  └──────────────┘    └─────────────────────────────────┘   │
│                                                             │
│   Tap Targets: Bell→Alerts | Banner→Focus | Card→Overview   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Left 40%: Actual device mockup with Home screen screenshot
- Right 60%: Annotated component breakdown with lines/arrows
- Bottom: Three tap-target badges showing navigation flow

**Speaker Script:**
"Home is the daily command center. Top: AppBar with the Pokus name and a notification bell. Below that: a contextual greeting — 'Good morning, Alex' — with a gradient illustration area. The Today's Focus banner uses our primary indigo with a glow shadow to draw attention. Stats row at the bottom: a circular progress indicator at 85% for productivity, and a fire icon with '7 days' for the focus streak. Everything is tappable — the bell opens Alerts, the banner opens Focus Mode, and the productivity card navigates to Overview."

---

## SLIDE 12 — Screen 2: Overview

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 2 — Overview                               Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    COMPONENTS:                            │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ Trend Card:                      │   │
│  │   of Overview│    │ • Indigo container               │   │
│  │   Screen]    │    │ • "+12% vs last week"            │   │
│  │              │    │ • Custom sparkline (↗ upward)    │   │
│  └──────────────┘    │                                   │   │
│                      │ 2×2 Stat Grid:                    │   │
│   KEY FEATURES:      │ • Screen Time: 2h 15m (amber)    │   │
│                      │ • Focus Time: 1h 45m (indigo)    │   │
│   ✓ Custom sparkline │ • Habits: 6/8 (green)            │   │
│     painter          │ • Morning Routine: 80% (orange)  │   │
│                      │                                   │   │
│   ✓ 4 StatTile       │ Timeline (6 items):              │   │
│     instances        │ • ✓ Meditation — 7:00 AM         │   │
│                      │ • ✓ Stand-up — 9:30 AM           │   │
│   ✓ 6 timeline items │ • ✓ Deep work — 10:00 AM          │   │
│                      │ • ○ Lunch — 12:00 PM              │   │
│                      │ • ○ Code review — 2:00 PM         │   │
│                      │ • ○ Evening walk — 5:30 PM        │   │
│                      └─────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"Overview gives you a deeper daily view. The trend card at top shows '+12% vs last week' with a custom-painted sparkline — no chart library, just Flutter's `CustomPainter` drawing a 10-point upward path with a highlighted endpoint. The 2×2 grid uses four identical `StatTile` widgets — same component, four different configurations. Below, a vertical timeline shows today's schedule: completed items in green with checkmarks, pending items as outlined circles. This same `TimelineWidget` is reused on the Commute screen."

---

## SLIDE 13 — Screen 3: Focus Mode

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 3 — Focus Mode (Dark Theme)               Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    WHY DARK THEME?                        │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ • Reduces visual noise          │   │
│  │   of Focus   │    │ • Helps user concentrate        │   │
│  │   Mode —     │    │ • Forced via Theme() wrapper    │   │
│  │   DARK]      │    │ • Not system-toggle — screen    │   │
│  │              │    │   knows its own context         │   │
│  └──────────────┘    └─────────────────────────────────┘   │
│                                                             │
│   CENTERPIECE: Gradient Progress Ring                       │
│   ┌────────────────────────────────────────────────────┐   │
│   │  Outer: SweepGradient arc (primary→light→green)    │   │
│   │  Inner: "45:00" in 40px bold white                 │   │
│   │  Below: "Focus Time" label                         │   │
│   │  Below: Shield chip "No Social Media Challenge"    │   │
│   │  Bottom: Full-width "Start Focus" CTA button       │   │
│   └────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"Focus Mode is where the dark theme really shines. The screen is wrapped in a `Theme` widget that forces dark mode — this isn't a system toggle, it's contextual. Dark backgrounds reduce visual noise for concentration. The centerpiece is our `ProgressRing` with a three-color `SweepGradient` arc — indigo to light indigo to green — showing progress toward 45 minutes. Inside the ring: large '45:00' at 40 pixels bold. Below: a shield chip for the 'No Social Media Challenge', and a full-width indigo 'Start Focus' button. High contrast against the dark background — impossible to miss."

---

## SLIDE 14 — Screen 4: Family

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 4 — Family                                 Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    3 TABS:                                │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ Children | Activity Feed | Goals│   │
│  │   of Family  │    └─────────────────────────────────┘   │
│  │   Screen]    │                                          │
│  │              │    CHILDREN TAB:                          │
│  └──────────────┘    ┌─────────────────────────────────┐   │
│                      │ • Emma 👧 Online 2.5h 🔥12d    │   │
│   TAP FLOW:          │ • Lucas 👦 Online 1.8h 🔥5d    │   │
│   Emma card ──→      │ • Sarah 👶 Offline 0.5h 🔥0d   │   │
│   ChildAppUsage      │                                 │   │
│                      │ Each card: Avatar + presence    │   │
│                      │ dot + screen time bar + streak  │   │
│                      └─────────────────────────────────┘   │
│                                                             │
│                      ACTIVITY FEED:                         │
│                      "Emma completed morning routine"       │
│                      "Lucas hit reading goal"               │
│                      "New challenge unlocked!"              │
│                                                             │
│                      GOALS: Empty state + "Create Goal" CTA │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"The Family screen uses a `DefaultTabController` with three tabs. The Children tab shows profile cards — each with an emoji avatar, green or grey presence dot, a screen time progress bar in amber, and a streak counter with a fire icon. Emma is online with 2.5 hours and a 12-day streak. Tapping Emma pushes to the Child App Usage detail screen. The Activity Feed tab shows recent family events chronologically. The Goals tab shows an empty state with a friendly prompt to create the first family goal."

---

## SLIDE 15 — Screen 5: Child App Usage

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 5 — Child App Usage (Emma)                Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    HERO METRIC:                           │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ ProgressRing (radius: 90)       │   │
│  │   of Child   │    │ Gradient: amber → orange        │   │
│  │   Usage]     │    │ Center: "53%" + "Used"          │   │
│  │              │    │ Caption: "53% of daily (4h)"    │   │
│  └──────────────┘    └─────────────────────────────────┘   │
│                                                             │
│   APP BREAKDOWN:                                            │
│   ┌────────────────────────────────────────────────────┐   │
│   │ 🔴 YouTube Kids    ████████░░░░  45 min           │   │
│   │ 🟢 Duolingo        █████░░░░░░░  30 min           │   │
│   │ 🟤 Minecraft       ████░░░░░░░░  25 min           │   │
│   │ 🟢 Spotify         ███░░░░░░░░░  20 min           │   │
│   │ 🔵 Khan Academy    ██░░░░░░░░░░  15 min           │   │
│   └────────────────────────────────────────────────────┘   │
│                                                             │
│   Same ProgressRing widget as Focus Mode — different config │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"This is Emma's App Usage screen. The hero metric is the same `ProgressRing` widget used in Focus Mode, but configured differently — smaller radius of 90, amber-to-orange gradient instead of indigo, and '53% Used' in the center. Below, five apps are broken down: YouTube Kids at 45 minutes, Duolingo at 30, and so on. Each row has a colored icon container, the app name, a progress bar relative to a 2-hour max, and the session duration. This demonstrates widget reuse — same `ProgressRing`, different context."

---

## SLIDE 16 — Screen 6: Habits

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 6 — Habits                                 Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    DATE NAVIGATOR:                        │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ 08  09  10 [11] 12  13  14    │   │
│  │   of Habits  │    │ Mon Tue Wed THU Fri Sat Sun   │   │
│  │   Screen]    │    │                                 │   │
│  │              │    │ Scrollable • Selected = indigo  │   │
│  └──────────────┘    └─────────────────────────────────┘   │
│                                                             │
│   7 HABIT ROWS (HabitCheckItem ×7):                         │
│   ┌────────────────────────────────────────────────────┐   │
│   │ 💧 Drink Water        ████░░░░  4/8 cups     [✓]  │   │
│   │ 🧘 Meditation         ██████████ 10/10 min    [✓]  │   │
│   │ 📖 Read 30 min        █████░░░░  15/30 min    [○]  │   │
│   │ 🏋️ Exercise           ░░░░░░░░░  0/45 min     [○]  │   │
│   │ 🍭 No Sugar Challenge █████░░░░  Day 4/7      [○]  │   │
│   │ ✍️ Journal            ██████████ ✓ Done       [✓]  │   │
│   │ 🧘 Evening Stretch    ██████░░░  10/15 min    [○]  │   │
│   └────────────────────────────────────────────────────┘   │
│                                                             │
│   FAB: [+ Add Habit]    Toggle: AnimatedContainer 200ms     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"The Habits screen starts with a horizontal date navigator — scrollable pill-shaped selectors. Today is highlighted in indigo with a glow shadow. Below: seven habit rows, each using our `HabitCheckItem` widget. Each row has a colored icon, the habit name, a linear progress bar, a fraction label, and an animated toggle circle on the right — tap it and it transitions from outlined to filled in 200 milliseconds using `AnimatedContainer`. The FAB at the bottom lets you add new habits."

---

## SLIDE 17 — Screen 7: Commute

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 7 — Commute                                Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    ACTIVE TRIP TIMELINE:                   │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ ✓ Home — Departed 8:18 AM       │   │
│  │   of Commute │    │ ✓ School — Passed 8:30 AM       │   │
│  │   Screen]    │    │ ○ Office — ETA 8:42 AM          │   │
│  └──────────────┘    └─────────────────────────────────┘   │
│                                                             │
│   Same TimelineWidget from Overview!                        │
│                                                             │
│   MAP PLACEHOLDER:                TRIP METRICS (2×2):       │
│   ┌─────────────────────┐        ┌─────────┬─────────┐     │
│   │                     │        │ ⏱ ETA   │ 🏃 Speed │     │
│   │    🗺 Route View    │        │ 8:42 AM │ 24 min  │     │
│   │                     │        ├─────────┼─────────┤     │
│   │ Home→Office 12.4km │        │ 🛣 Dist  │ 🚦Traffic│     │
│   │                     │        │ 12.4 km │ Moderate│     │
│   └─────────────────────┘        └─────────┴─────────┘     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"The Commute screen reuses our `TimelineWidget` — the same component from Overview — now showing trip milestones: Home departed, School passed, Office upcoming. Below is a map placeholder area — in production this would be a live Google Maps widget with a route polyline. The 2×2 metrics grid shows ETA, Duration, Distance, and Traffic — each in a `CustomCard` with a small colored icon container. This is widget reuse in action: one timeline component, two very different contexts."

---

## SLIDE 18 — Screen 8: Insights

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 8 — Insights                               Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐                                           │
│  │              │   PERFORMANCE CARDS (horizontally scroll): │
│  │  [Screenshot │   ┌──────────┬──────────┬──────────┐     │
│  │   of Insights│   │ 📈 Prod  │ 📱 Screen│ ✅ Habit │     │
│  │   Screen]    │   │   85%    │   3.2h   │   78%    │     │
│  │              │   │ +5% 🟢   │ -12% 🟢  │ -3% 🔴   │     │
│  └──────────────┘   └──────────┴──────────┴──────────┘     │
│                                                             │
│   WEEKLY BAR CHART:              ACHIEVEMENT BANNER:        │
│   ┌────────────────────────┐    ┌──────────────────────┐   │
│   │    ██                   │    │ 🏆 7-Day Streak! 🔥 │   │
│   │    ██ ██                │    │ You've been         │   │
│   │    ██ ██    ██ ██       │    │ productive every    │   │
│   │ ██ ██ ██ ██ ██ ██ ██   │    │ day this week.      │   │
│   │ Mo Tu We Th Fr Sa Su   │    └──────────────────────┘   │
│   │     Productivity +15%   │    Gold→Orange gradient       │
│   └────────────────────────┘                                │
│                                                             │
│   Bar chart: CustomPainter — 7 rounded gradient bars        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"Insights is the analytics dashboard. Three horizontally scrollable performance cards show Productivity, Screen Time, and Habit Score — each with a directional change indicator in green for positive trends and red for negative. Below, a custom-painted bar chart — seven bars with rounded tops and a vertical gradient fill from indigo to light indigo. Each bar represents a day, showing the upward productivity trend. At the bottom, an achievement banner with a gold-to-orange gradient celebrates the 7-day streak with a trophy icon."

---

## SLIDE 19 — Screen 9: Alerts

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 9 — Alerts                                 Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    NOTIFICATION TIMELINE:                  │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │ 🟣 Location update              │   │
│  │   of Alerts  │    │    Emma arrived at school       │   │
│  │   Screen]    │    │    5 min ago                    │   │
│  │              │    ├─────────────────────────────────┤   │
│  └──────────────┘    │ 🟠 Screen time limit            │   │
│                      │    Lucas at 90% of daily        │   │
│   6 ALERT TYPES:     │    30 min ago                   │   │
│   🟣 Location        ├─────────────────────────────────┤   │
│   🟠 Screen Time     │ 🟢 Habit completed! 🎉          │   │
│   🟢 Habits          │    7 days of meditation         │   │
│   🟠 Commute         │    1 hour ago                   │   │
│   🟣 Challenges      ├─────────────────────────────────┤   │
│   🟣 Reports         │ ...and 3 more                   │   │
│                      └─────────────────────────────────┘   │
│                                                             │
│   INTERACTIONS:                                             │
│   • Swipe left → Dismiss (Dismissible widget)               │
│   • "Clear All" in AppBar                                   │
│   • Empty state: "All caught up!" with icon                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"Alerts is a categorized notification feed. Six types of alerts — location updates in purple, screen time warnings in amber, habit completions in green, commute and challenge alerts in purple and orange. Each row has a color-coded icon container. Alerts support swipe-to-dismiss using Flutter's `Dismissible` widget — swipe left and it's gone. 'Clear All' in the AppBar resets everything, and when empty, we show a friendly 'All caught up!' empty state instead of a blank screen."

---

## SLIDE 20 — Screen 10: Profile

```
┌─────────────────────────────────────────────────────────────┐
│  Screen 10 — Profile (Dark Theme)                 Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐    USER BLOCK:                            │
│  │              │    ┌─────────────────────────────────┐   │
│  │  [Screenshot │    │         [A]                     │   │
│  │   of Profile │    │    Alex Johnson                 │   │
│  │   — DARK]    │    │    alex@email.com               │   │
│  │              │    │    [Premium Member] chip         │   │
│  └──────────────┘    └─────────────────────────────────┘   │
│                                                             │
│   SETTINGS GROUPS:                                          │
│   ┌────────────────────────────────────────────────────┐   │
│   │ ACCOUNT                                            │   │
│   │ 👤 Personal Information              ›            │   │
│   │ 🛡 Privacy & Security                ›            │   │
│   │ 🔔 Notifications                    ›            │   │
│   ├────────────────────────────────────────────────────┤   │
│   │ FAMILY                                             │   │
│   │ 👥 Family Members                   ›            │   │
│   │ 📱 Screen Time Limits               ›            │   │
│   │ 📍 Location Sharing                 ›            │   │
│   ├────────────────────────────────────────────────────┤   │
│   │ APP                                                │   │
│   │ 🎨 Appearance              System  ›            │   │
│   │ ❓ Help & Support                    ›            │   │
│   │ ℹ About                    v1.0.0  ›            │   │
│   └────────────────────────────────────────────────────┘   │
│                                                             │
│   [ Sign Out ]  — Red outlined button, full width           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"Profile, like Focus Mode, uses forced dark theme. At the top: a large centered avatar with the initial 'A', the user's name in white, their email in grey, and a 'Premium Member' chip using our amber palette. Settings are organized into three groups separated by dividers — Account, Family, and App. Each row has a leading icon in light indigo and a trailing chevron. The Appearance row shows the current value 'System', and About shows 'v1.0.0'. At the bottom: a red outlined 'Sign Out' button."

---

## SLIDE 21 — User Flows

**Layout:** Flow diagram — top to bottom

```
┌─────────────────────────────────────────────────────────────┐
│  Key User Flows                                   Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   MORNING ROUTINE:                                          │
│   Home → Check Focus → Overview → Review Day → Alerts       │
│                                                             │
│   FOCUS SESSION:                                            │
│   Home → Focus Banner → Focus Mode → Start → Complete       │
│                                                             │
│   FAMILY CHECK-IN:                                          │
│   Family Tab → Children → Tap Emma → App Usage → Back       │
│                                                             │
│   HABIT TRACKING:                                           │
│   Habits Tab → Select Date → Toggle Habits → Add Habit      │
│                                                             │
│   WEEKLY REVIEW:                                            │
│   Insights Tab → Scroll Cards → View Chart → Streak Banner  │
│                                                             │
│   7 distinct flows  ·  ~3 taps average per task             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Five horizontal flow rows, each with a bold title on the left
- Flow steps connected by arrows (→)
- Key screens highlighted in indigo pills
- Average tap count callout at bottom

**Speaker Script:**
"Let me show how these screens connect. The morning routine flow starts at Home, checks Today's Focus, dives into Overview for the daily schedule, then checks Alerts. That's four screens, all reachable in a few taps. The Focus session flow is just two taps deep. Family check-in: Family tab to Emma's usage detail. Habits and Insights are one tap from the bottom nav. Seven distinct flows, averaging about three taps to complete a task."

---

## SLIDE 22 — Technical Highlights

**Layout:** Two-column feature grid

```
┌─────────────────────────────────────────────────────────────┐
│  Technical Highlights                             Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  CUSTOM PAINTING            STATE & NAVIGATION              │
│  ┌────────────────────┐     ┌────────────────────────┐     │
│  │ Gradient Ring      │     │ IndexedStack           │     │
│  │ • SweepGradient    │     │ • Preserves tab state  │     │
│  │ • 2-layer painters │     │ • 5 screens in memory  │     │
│  │                     │     │                         │     │
│  │ Sparkline          │     │ Theme Wrapping          │     │
│  │ • 10-point path    │     │ • Focus Mode → dark     │     │
│  │ • Endpoint dot     │     │ • Profile → dark        │     │
│  │                     │     │ • Per-screen override   │     │
│  │ Bar Chart          │     │                         │     │
│  │ • 7 gradient bars  │     │ Animated Toggle         │     │
│  │ • Rounded tops     │     │ • 200ms transition      │     │
│  └────────────────────┘     │ • Outlined→Filled        │     │
│                              └────────────────────────┘     │
│                                                             │
│  0 EXTERNAL DEPENDENCIES  ·  4 CUSTOM PAINTERS  ·  22 FILES │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"A few technical highlights. All our visual flair — the gradient progress ring, the sparkline, the bar chart — are pure `CustomPainter` subclasses. No chart libraries. The progress ring uses two stacked painters: a solid background ring and a `SweepGradient` foreground arc. Navigation uses `IndexedStack` so tab state is never lost. Dark theme is applied per-screen via Flutter's `Theme` widget — Focus Mode and Profile get dark; everything else stays light. The habit toggle uses `AnimatedContainer` for a smooth 200ms transition. Zero external dependencies. Four custom painters. Twenty-two files."

---

## SLIDE 23 — Key Stats & Roadmap

**Layout:** Left stats, Right roadmap timeline

```
┌─────────────────────────────────────────────────────────────┐
│  By the Numbers & What's Next                    Pokus      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   CURRENT STATE              ROADMAP                        │
│                              ─────────────────────────────  │
│   ┌──────────────┐           PHASE 2 — Backend              │
│   │  10 Screens  │           ☐ Auth (email + social)        │
│   │  5 Widgets   │           ☐ Real habit data API          │
│   │  22 Files    │           ☐ Focus timer engine           │
│   │  3,200 Lines │           ☐ Push notifications           │
│   │  0 Ext Deps  │                                         │
│   │  2 Themes    │           PHASE 3 — Enhanced             │
│   │  2 Platforms │           ☐ Live maps integration        │
│   └──────────────┘           ☐ Screen Time API              │
│                              ☐ AI-powered insights           │
│   100% FRONTEND              ☐ Gamification system          │
│   PROTOTYPE COMPLETE                                        │
│                              PHASE 4 — Ecosystem            │
│                              ☐ Apple Watch / Wear OS        │
│                              ☐ Home screen widgets          │
│                              ☐ Family challenges            │
│                              ☐ Full dark mode toggle        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Speaker Script:**
"By the numbers: 10 screens, 5 reusable widgets, 22 Dart files, about 3,200 lines of code, zero external dependencies, two themes, targeting two platforms. The prototype is 100% frontend complete. Looking ahead: Phase 2 adds the backend — authentication, real habit data, the actual focus timer, and push notifications. Phase 3 brings live maps, real screen time APIs, AI insights, and gamification. Phase 4 expands to wearables, home screen widgets, and family challenges."

---

## SLIDE 24 — Thank You & Q&A

**Layout:** Centered, matching title slide

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                                                             │
│                                                             │
│                        P O K U S                             │
│                                                             │
│           "Stay focused. Build habits that last."            │
│                                                             │
│                                                             │
│                      Questions?                              │
│                                                             │
│              [Your Name]  |  [Your Email]                    │
│              [GitHub Repo Link]                              │
│                                                             │
│                                                             │
│              🤖 Generated with Claude Code                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Visual Notes:**
- Same dark gradient background as Slide 1
- "POKUS" in white, 48pt, Bold, all caps, letter-spacing 8px
- Tagline in white 70% opacity
- "Questions?" in indigo highlight style, 28pt
- Contact info in 14pt grey at bottom
- Claude Code attribution in 10pt at very bottom

**Speaker Script:**
"Pokus — stay focused, build habits that last. The prototype is complete, the architecture is clean, and the roadmap is clear. I'd love to answer your questions."

---

## 📋 Slide Index

| # | Slide Title | Type |
|---|-------------|------|
| 1 | Title Slide | Title |
| 2 | Agenda | Content |
| 3 | The Problem | Content |
| 4 | Vision & Solution | Content |
| 5 | User Personas | Content |
| 6 | Design System — Colors | Visual |
| 7 | Design System — Type & Shape | Visual |
| 8 | Architecture | Diagram |
| 9 | Navigation Shell | Diagram |
| 10 | Reusable Widget Library | Content |
| 11 | Screen 1 — Home | Screenshot + Callouts |
| 12 | Screen 2 — Overview | Screenshot + Callouts |
| 13 | Screen 3 — Focus Mode | Screenshot + Callouts |
| 14 | Screen 4 — Family | Screenshot + Callouts |
| 15 | Screen 5 — Child App Usage | Screenshot + Callouts |
| 16 | Screen 6 — Habits | Screenshot + Callouts |
| 17 | Screen 7 — Commute | Screenshot + Callouts |
| 18 | Screen 8 — Insights | Screenshot + Callouts |
| 19 | Screen 9 — Alerts | Screenshot + Callouts |
| 20 | Screen 10 — Profile | Screenshot + Callouts |
| 21 | User Flows | Diagram |
| 22 | Technical Highlights | Content |
| 23 | Key Stats & Roadmap | Content |
| 24 | Thank You & Q&A | Closing |

---

## 🛠 How to Build This PPT

### Step 1: Capture Screenshots
Run the app and take screenshots of all 10 screens. Crop to device frame (no status bar). Use a tool like `adb screencap` or the emulator's built-in screenshot.

### Step 2: Choose a Template
- **Option A:** Use a pre-built Material 3 PPT template (search "Material Design PowerPoint template")
- **Option B:** Build from scratch with the color specs above
- **Recommendation:** Use the Pokus brand colors: white slides, indigo accents, dark slides for Focus Mode/Profile pages

### Step 3: Build Slide Master
1. Set up a **Slide Master** with:
   - Dark header bar (32px) with "Pokus" on the left
   - Page number on the right
   - Font: Segoe UI or Inter
2. Create a **Title Slide Master** with the gradient background
3. Create a **Content Slide Master** with white background

### Step 4: Fill Content
For each of the 24 slides:
1. Copy the title text
2. Paste the body content (bullets, tables, or ASCII art layouts)
3. Add the screenshot (slides 11–20)
4. Apply accent colors as shown in the visual notes

### Step 5: Add Polish
- Add slide transitions (simple fade or push)
- Add subtle animations on bullet points (appear on click)
- Ensure all screenshots have the same size and framing
- Add a thin indigo line at the bottom of content slides

---

*Script complete. Total: 24 slides, ~18-22 minutes.*
