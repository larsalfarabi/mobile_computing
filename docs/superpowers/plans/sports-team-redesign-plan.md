# Implementation Plan: Sports Team Directory Redesign (Warm Editorial Minimalist)

This document outlines the step-by-step execution plan to implement the redesign of the Sports Team Directory app.

## Steps

### Step 1: Add Google Fonts Dependency
*   Add the `google_fonts` package to `pubspec.yaml`.
*   Run `flutter pub get`.

### Step 2: Define Color Tokens (`lib/constants/app_colors.dart`)
*   Define the color palette extracted from the reference image:
    *   `background = Color(0xFFF3F2EC)` (Warm Matte Beige / Cream)
    *   `primary = Color(0xFF6B7F43)` (Muted Olive Green)
    *   `surface = Color(0xFFFFFFFF)` (Pure White Card Surface)
    *   `border = Color(0xFFD1CFC7)` (Slightly darker warm beige for thin borders)
    *   `textPrimary = Color(0xFF1E2019)` (Soft Dark Charcoal)
    *   `textSecondary = Color(0xFF767773)` (Muted Grey)
    *   `accentLight = Color(0xFFE2E1D9)` (Very light warm beige for unselected states)

### Step 3: Implement Visual Layout & Design System
*   **Typography:**
    *   Configure `GoogleFonts.oswald` for Headings (condensed uppercase).
    *   Configure `GoogleFonts.plusJakartaSans` for Body and Subtitles.
*   **Theme configuration in `lib/main.dart`:**
    *   Set the app background color, primary color, and appBar theme globally to match the design.

### Step 4: Redesign Halaman 1 Components
*   **`lib/sports_team/widgets/team_list_item.dart`:**
    *   Update `TeamListItem` to use:
        *   Container with white background, 1px border (`AppColors.border`), and corner radius `24.0`.
        *   Avatar with `Hero` tag and a circular border of 2px `AppColors.primary` (Olive Green) with padding.
        *   Team name in bold uppercase Oswald.
        *   Star athlete info with a small icon and secondary text.
        *   Clean circle arrow forward icon in `AppColors.background` background.
*   **`lib/sports_team/pages/team_list_page.dart`:**
    *   Update the top header to show:
        *   Category: "SPORTS DIRECTORY"
        *   Main Title: "SELECT TEAM" in Oswald (bold, uppercase).
        *   Horizontal row of capsule chips: "Teams" (active, filled olive), "Matches" (inactive), "Stats" (inactive).
        *   A stylized search bar mockup for high-fidelity feel.
        *   `ListView.builder` using BouncingScrollPhysics and comfortable padding.

### Step 5: Redesign Halaman 2 (Player Detail Page)
*   **`lib/sports_team/pages/player_detail_page.dart`:**
    *   Set background to `AppColors.background`.
    *   Medium circular avatar (160px) in a Hero widget with a 3px olive green border.
    *   Subtle "Tap image to view full size" prompt with a search-in/zoom icon.
    *   Bold player name in Oswald uppercase.
    *   Achievements/Description card in white container with `AppColors.border` border and radius `24.0`.
    *   Apply proper line spacing (1.6) to description text.

### Step 6: Redesign Halaman 3 (Avatar Detail Page)
*   **`lib/sports_team/pages/avatar_detail_page.dart`:**
    *   Fullscreen layout.
    *   Keep `InteractiveViewer` for pinch-to-zoom usability.
    *   Bottom button "KEMBALI KE DAFTAR" in olive green background, rounded capsule form (`16.0` radius), 56px height.
    *   Verify `Navigator.popUntil(context, (route) => route.isFirst)` navigation stack behavior.

### Step 7: Testing & Verification
*   Check for compile errors.
*   Verify touch target sizing and spacing.
*   Verify Hero transitions and stack popping behavior.
