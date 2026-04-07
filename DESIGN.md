# Design System Documentation: High-End Editorial Health Experience

## 1. Overview & Creative North Star
This design system is built upon the Creative North Star of **"The Serene Curator."**

Unlike standard health apps that rely on clinical coldness or stereotypical "feminine" pinks, this system treats user health data as a premium editorial experience. We prioritize breathing room, organic shapes, and a sophisticated tonal palette that feels supportive rather than prescriptive.

To break the "template" look, we utilize **Intentional Asymmetry**. Layouts should not always be perfectly centered; rather, they should use the 8pt grid to create weighted balances—for example, a `headline-lg` left-aligned with a significant right-side margin to create a sense of calm, open space. Elements should occasionally overlap (e.g., a floating action chip over a card boundary) to create a custom, layered feel that suggests the interface is an adaptive, living organism.

---

## 2. Colors
Our palette is rooted in nature-derived, muted tones that provide a "clinical-soft" aesthetic.

### The Palette (Material Design Convention)
- **Primary:** `#446655` (Sage Green) — Used for authoritative actions and brand presence.
- **Secondary:** `#6c5c4d` (Muted Rose/Beige) — Used for secondary supportive elements.
- **Surface:** `#faf9f4` (Off-white) — Our primary canvas.
- **Semantic:** Success (`#c6ebd5`), Error (`#a83836`), Warning (`#f9e6c7`).

### The "No-Line" Rule
**Explicit Instruction:** Do not use 1px solid borders to section off content. In this design system, boundaries are defined exclusively through background color shifts or subtle tonal transitions. For example, a `surface-container-low` section should sit directly against a `surface` background. This creates a high-end "magazine" feel rather than a "software" feel.

### Surface Hierarchy & Nesting
Treat the UI as a series of physical layers—like stacked sheets of fine, heavy-stock paper.
- **Surface (Base):** `#faf9f4`
- **Surface Container Low:** `#f4f4ee` (Use for large background sections)
- **Surface Container Lowest:** `#ffffff` (Use for primary content cards to create "pop")
- **Surface Container Highest:** `#e1e3db` (Use for inset elements like search bars or inactive states)

### The "Glass & Gradient" Rule
To add visual "soul," use a subtle linear gradient on main CTAs or Hero backgrounds: `primary` (`#446655`) to `primary_dim` (`#395a49`). For floating navigation bars or overlays, use **Glassmorphism**: a semi-transparent `surface` color with a 20px-30px backdrop blur to allow underlying content colors to bleed through softly.

---

## 3. Typography
We use a high-contrast pairing of **Manrope** and **Inter** to achieve an editorial authority.

- **Display & Headlines (Manrope):** These are our "Voice." Large, bold, and modern. Use `display-lg` (3.5rem) for milestone health data and `headline-md` (1.75rem) for screen titles. The wider tracking of Manrope conveys confidence.
- **Titles & Body (Inter):** Our "Information." Inter is used for high legibility in health tracking. `title-md` (1.125rem) is the workhorse for card headers.
- **Hierarchy:** Maintain a clear gap between headline and body sizes. A `headline-lg` should be paired with a `body-md` to create a "Big/Small" typographic rhythm that feels curated and intentional.

---

## 4. Elevation & Depth
We eschew traditional shadows in favor of **Tonal Layering**.

- **The Layering Principle:** Place a `surface-container-lowest` (#ffffff) card onto a `surface-container-low` (#f4f4ee) background. The 4-step color delta provides all the "lift" required for a premium look.
- **Ambient Shadows:** Only use shadows for floating "Action" elements (like a FAB or a Tooltip). Shadows must be extra-diffused:
- *Blur:* 24px-32px
- *Opacity:* 4-6%
- *Color:* Tinted with `on-surface` (`#30332e`) rather than pure black.
- **The "Ghost Border" Fallback:** If accessibility requires a stroke (e.g., in high-contrast modes), use `outline-variant` (`#b1b3ab`) at **15% opacity**. Never use a 100% opaque border.

---

## 5. Components

### Cards
- **Construction:** Use `xl` (1.5rem / 24px) corner radius.
- **Constraint:** Forbid the use of divider lines inside cards. Use vertical white space (`spacing-4` or `spacing-6`) to separate content blocks.
- **Layout:** Cards should utilize the "DNA Risk" pattern seen in inspiration: a clean white surface with a soft interior gradient for data visualization.

### Buttons
- **Primary:** `primary` background with `on_primary` text. `xl` roundedness. Sizing: `height: 3.5rem`.
- **Secondary:** `surface-container-highest` background. No border.
- **Tertiary/Ghost:** Text only with a trailing icon. Use `primary` for the label.

### Input Fields
- **Styling:** Use a `surface-variant` background with a subtle bottom-heavy padding. No 4-sided border. The active state is indicated by a 2px `primary` underline or a subtle background shift to `surface-container-lowest`.

### Chips
- **Action Chips:** `secondary-container` background. `full` (9999px) roundedness.
- **Selection Chips:** When selected, use a soft glow (diffused `primary` shadow) instead of a thick border.

### Contextual Components (PCOS Specific)
- **Symptom Tracker Toggles:** Large, circular `surface-container-highest` buttons that transition to a soft `primary-container` when selected.
- **Insight Banners:** Use `tertiary-container` (#f9e6c7) with a `tertiary` (#6b5d45) icon for supportive, non-alarming health education.

---

## 6. Do's and Don'ts

### Do
- **Do** use generous white space. If a layout feels crowded, increase the spacing from `4` (1.4rem) to `6` (2rem).
- **Do** use "soft" Success/Error states. A success message should feel like a relief (soft sage), not a neon sign.
- **Do** use asymmetric image placement to give the app a boutique, premium feel.

### Don't
- **Don't** use pure black (#000000) for text. Always use `on-surface` (#30332e) to keep the contrast "gentle."
- **Don't** use standard 4px or 8px rounded corners. Stick to the `xl` (24px) scale for a friendlier, organic feel.
- **Don't** use "beauty app" tropes like glitter, script fonts, or hyper-saturated pinks. This is a medical-grade tool wrapped in high-end design.
