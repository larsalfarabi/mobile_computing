# Design Specification: Sports Team Directory Redesign (Warm Editorial Minimalist)

This document outlines the UI/UX design specifications for redesigning the Sports Team Directory Flutter application. The design is inspired by modern golf-club editorial styles and adheres to Human-Centered Design (HCD) principles and Usability Heuristics.

---

## 1. Design System & Visual Tokens

### 1.1 Color Palette
*   **Main Background (`AppColors.background`):** `Color(0xFFF3F2EC)` (Warm Matte Beige / Cream)
*   **Primary Accent (`AppColors.primary`):** `Color(0xFF6B7F43)` (Muted Olive / Moss Green)
*   **Card/Surface Background (`AppColors.surface`):** `Color(0xFFFFFFFF)` (Pure White)
*   **Card Border (`AppColors.border`):** `Color(0xFFE2E1D9)` (Very light warm grey)
*   **Primary Text (`AppColors.textPrimary`):** `Color(0xFF1E2019)` (Soft Dark Charcoal)
*   **Secondary/Muted Text (`AppColors.textSecondary`):** `Color(0xFF767773)` (Slate Grey)

### 1.2 Typography
*   **Dependencies:** `google_fonts` package.
*   **Headings / Title (All-Caps):** `GoogleFonts.oswald(fontWeight: FontWeight.bold)` with uppercase transformation.
*   **Body Text & Subtitles:** `GoogleFonts.plusJakartaSans()` or `GoogleFonts.inter()`.

### 1.3 Shapes & Spacing
*   **Card Corner Radius:** `24.0` (Soft rounded corner)
*   **Chip Corner Radius:** `20.0` (Full capsule shape)
*   **Button Corner Radius:** `16.0`
*   **Touch Targets:** Minimum height/width of `48.0` pixels for all tappable controls, aligned with touch target usability standards.

---

## 2. Page Specifications

### 2.1 Page 1: Sports Team List Page (`TeamListPage`)
*   **AppBar:** Clean, flat background matching `AppColors.background` (no heavy shadow, just a thin border line at the bottom).
*   **Header Section:** 
    *   Small capitalized category label: "SPORTS DIRECTORY"
    *   Large title: "SELECT TEAM" in bold, condensed uppercase oswald.
*   **Filters/Chips (Mockup for Heuristics):** Horizontal row containing capsule chips: "Teams" (active, filled with Olive Green), "Matches", and "Stats".
*   **ListView:** Built with `ListView.builder` using clean vertical spacing.
*   **Card Item (`TeamListItem`):**
    *   Outer container with 1px border `AppColors.border`, white background, corner radius `24.0`.
    *   Circular avatar on the left (54px size) with a 2px `AppColors.primary` (olive green) border.
    *   Team Name in bold uppercase Oswald.
    *   Star athlete info below the team name with a small user icon.
    *   Navigation arrow indicator on the right side in a small circular background.

### 2.2 Page 2: Player Detail Page (`PlayerDetailPage`)
*   **AppBar:** Back icon with team name title.
*   **Top Layout:**
    *   Dynamic large circular avatar (`160px` diameter) with `Hero` transition and a 3px olive green border.
    *   Player name in large uppercase bold Oswald font.
    *   Subtle "Tap image to view full size" instruction in small muted text.
*   **Description Card:**
    *   Rounded white container containing a section titled "PROFILE & ACHIEVEMENTS" in olive green.
    *   Description text in `AppColors.textSecondary` with line height set to `1.6` for optimal readability.

### 2.3 Page 3: Avatar Detail Page (`AvatarDetailPage`)
*   **Layout:** Pure fullscreen view.
*   **Interactive Viewer:** Allows zooming/panning of the player's avatar.
*   **AppBar:** Transparent with back icon and player name.
*   **Bottom Action:**
    *   Large, full-width button styled with `AppColors.primary` background.
    *   Icon: Home icon.
    *   Text: "KEMBALI KE DAFTAR" in bold uppercase Oswald.
    *   Navigation: Triggers `Navigator.popUntil(context, (route) => route.isFirst)` to skip Page 2 and return directly to Page 1.

---

## 3. Human-Centered Design & Usability Heuristics Integration

1.  **Aesthetic & Minimalist Design (Heuristic #8):** The Warm Beige background and Olive Green accents form a cohesive, calm color palette. Excessive neon glow and high-contrast gradients are replaced with clean whitespace, crisp typography contrast, and elegant border dividers.
2.  **User Control & Freedom (Heuristic #3):** The `Navigator.popUntil()` function on Page 3 is accompanied by a clear home icon and a prominent action label, giving users direct power to exit the deep stack structure.
3.  **Consistency & Standards (Heuristic #4):** Reusable design tokens (like `AppColors` and typography) ensure that cards, buttons, margins, and borders behave exactly the same way across all three pages.
4.  **Touch Target & Hit Box Usability:** Tap areas on list items, avatar triggers, and the primary exit buttons exceed the standard 48x48dp target sizes, and padding is set to at least 8px to prevent accidental taps.
