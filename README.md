# Compass 🧭

**A teacher-facing academic analytics dashboard built to give educators a clear, real-time picture of their students' performance.**

Compass was designed and built end-to-end as a solo senior seminar capstone project. It integrates a hand-authored relational database, a custom front-end interface, and a Power BI analytics dashboard — covering the full stack from data modeling to user-facing visualization.

---

## Table of Contents

- [Overview](#overview)
- [Key Skills Demonstrated](#key-skills-demonstrated)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Database Design](#database-design)
- [Front-End](#front-end)
- [Data Visualization (Power BI)](#data-visualization-power-bi)
- [User Research & Testing](#user-research--testing)
- [Project Structure](#project-structure)
- [Known Limitations & Future Work](#known-limitations--future-work)

---

## Overview

Compass is a classroom analytics tool for teachers. A teacher logs in and is presented with a Power BI dashboard embedded inside a lightweight HTML/CSS web interface. The dashboard surfaces student grade distributions, assignment completion rates, late submission tracking, and GPA trends — all pulled from a PostgreSQL database seeded with realistic classroom data.

The project was scoped, designed, built, tested, and documented entirely by one person.

---

## Key Skills Demonstrated

| Area | What Was Done |
|---|---|
| **SQL & Database Design** | Designed a normalized relational schema in PostgreSQL; wrote DDL, DML, joins, PL/pgSQL blocks, and aggregate queries from scratch |
| **Data Visualization** | Built and published a Power BI report (`.pbix`) tracking grades, GPA trends, and assignment completion; embedded it via the Power BI REST embed API |
| **Front-End Development** | Built a multi-page HTML/CSS interface with a custom animated side-nav, responsive layout, and Bootstrap 5 integration |
| **System Architecture** | Designed the full data flow from database → Power BI → embedded web UI; made deliberate technology choices at each layer |
| **UX Research** | Conducted structured user testing across two rounds; incorporated accessibility feedback (color-blind-safe palette, navigation clarity) into the final design |
| **Problem Scoping** | Wrote a formal project proposal and final report; defined user personas, success criteria, and system requirements independently |

---

## Features

- **Grade Distribution View** — see how a class is performing across letter grades at a glance
- **Assignment Completion Tracking** — per-student submission status and late submission flags
- **GPA Trend Analysis** — letter-grade-to-GPA mapping with aggregate class stats
- **Topic-Based Filtering** — assignments tagged by topic (e.g., DS & Algorithms, Machine Learning) for drill-down analysis
- **Animated Side Navigation** — slide-out nav with accessible iconography linking Dashboard, Class View, Settings, and Sign Out pages
- **Color-Blind Accessible Design** — palette and contrast choices validated through user testing

---

## Tech Stack

| Layer | Technology |
|---|---|
| Database | PostgreSQL (local) |
| Query Language | SQL + PL/pgSQL |
| Data Visualization | Microsoft Power BI Desktop + Power BI Service (embed) |
| Front-End | HTML5, CSS3, Bootstrap 5 |
| Fonts & Icons | Google Fonts (Montserrat), Icons8 |

---

## Database Design

The schema is fully normalized and models a single teacher's classroom. It was designed with referential integrity in mind using foreign keys throughout.

**Tables:**

| Table | Purpose |
|---|---|
| `classes` | Stores class records (e.g., CS101) with enrollment count |
| `teacher` | Teacher profile; linked to a class via foreign key |
| `assignments` | Master assignment catalog with names, dates, and topic tags |
| `assignmentsentry` | Per-student assignment records: grade, submission status, late flag, and numeric score |
| `gpa` | Lookup table mapping letter grades (A–F) to GPA values |
| `topics` | Topic categories for assignment classification |

**Notable SQL Techniques Used:**
- `SERIAL PRIMARY KEY` and explicit foreign key constraints
- `ALTER TABLE` for iterative schema evolution
- PL/pgSQL anonymous `DO $$ ... $$` block to randomly generate numeric scores within grade-appropriate ranges (using `RANDOM()`, `FLOOR()`, and grade boundary lookups)
- Multi-table `JOIN` queries (e.g., joining `teacher` and `classes`)
- `UPDATE ... WHERE ... LIKE` for pattern-based data backfill

The SQL files are located in [`OneDrive/Senior Seminor Project/SQL Code/`](OneDrive/Senior%20Seminor%20Project/SQL%20Code/).

---

## Front-End

The web interface is a static multi-page HTML/CSS site. It was deliberately kept lightweight to focus on data visualization rather than framework complexity.

**Pages:**

| File | Purpose |
|---|---|
| `index.html` | Main dashboard — embeds the Power BI report via `<iframe>` with the animated side-nav |
| `classview.html` | Class list view (placeholder; intended to list enrolled students per class) |
| `signin.html` | Login page (UI shell; full auth was out of scope due to time constraints) |
| `signout.html` | Sign-out confirmation page |
| `settings.html` | Settings page with icon attribution |
| `styles.css` | All styling: CSS custom properties, animated nav transitions, layout, and responsive sizing |

**Design Decisions:**
- CSS custom properties (`--accent-color`, `--base-color`) make the color scheme easy to swap
- The side-nav uses a CSS `transition` on the `left` property to animate in/out on hover — no JavaScript required
- Accessibility: the `#118DFF` blue accent was chosen for sufficient contrast and color-blind safety, validated in user testing

---

## Data Visualization (Power BI)

The core of the tool is a Power BI report (`.pbix`) that connects to the PostgreSQL database. It was built entirely from scratch and covers:

- **Class-wide grade distribution** (bar/pie charts by letter grade)
- **Per-student assignment completion** (submission status, late flags)
- **GPA trend analysis** (average GPA calculations using the `gpa` lookup table)
- **Assignment topic breakdowns** (filtering by DS & Algorithms, ML, Other)

The report is published to Power BI Service and embedded in `index.html` using the Power BI embed URL with `autoAuth=true` for seamless access.

The dashboard file is at [`OneDrive/Senior Seminor Project/Compass Project Documentation/Compass_Dashboard.pbix`](OneDrive/Senior%20Seminor%20Project/Compass%20Project%20Documentation/Compass_Dashboard.pbix).

---

## User Research & Testing

Two formal rounds of structured user testing were conducted and documented.

**Key findings that shaped the design:**
- Navigation flow was validated as intuitive — users could move between Dashboard, Class View, and Settings without instruction
- Color palette was tested for color-blind accessibility and updated based on feedback; the final `#118DFF` blue accent and light `#edf2f4` background passed all tests
- Icon labeling (text + icon) improved discoverability compared to icon-only nav items

User testing documents are in [`OneDrive/Senior Seminor Project/Compass Project Documentation/User Testing/`](OneDrive/Senior%20Seminor%20Project/Compass%20Project%20Documentation/User%20Testing/).

---

## Project Structure

```
Compass/
├── README.md
├── ARCHITECTURE.md                          # System architecture diagram & component map
└── OneDrive/Senior Seminor Project/
    ├── Compass Website/                     # Front-end source
    │   ├── index.html                       # Dashboard (Power BI embed)
    │   ├── classview.html                   # Class list view
    │   ├── signin.html                      # Login page (UI shell)
    │   ├── signout.html                     # Sign-out confirmation
    │   ├── settings.html                    # Settings + icon attribution
    │   ├── styles.css                       # All CSS
    │   └── Assets/                          # Icons and images
    ├── SQL Code/                            # All PostgreSQL DDL + DML
    │   ├── classes.sql
    │   ├── teacher.sql
    │   ├── assignments.sql
    │   ├── assignments_entry.sql
    │   ├── gpa.sql
    │   └── topics.sql
    ├── Compass Project Documentation/
    │   ├── Compass_Dashboard.pbix           # Power BI report source file
    │   ├── Steeve Nsangou – Compass - Final Report.pdf
    │   ├── Steeve Nsangou – Compass - Original Proposal.pdf
    │   └── User Testing/                    # Structured UX test documents
    └── Media/                               # Screenshots of the live tool
        ├── Landing Page.png
        ├── Classroom View.png
        ├── Student View.png
        └── Query View.png
```

---

## Known Limitations & Future Work

| Limitation | Notes |
|---|---|
| **No authentication** | `signin.html` is a UI shell; real auth (e.g., Microsoft SSO via Azure AD) was planned but cut due to time constraints |
| **`classview.html` is a stub** | The page is scaffolded but does not yet dynamically query and render class/student data |
| **Local database only** | PostgreSQL runs locally; a cloud-hosted instance (e.g., Supabase, Neon) would enable live data for the Power BI embed |
| **Single class** | The schema and seed data model one class (`CS101`) with 20 students; multi-class support is architecturally straightforward to add |

---

*Built by Steeve G. Nsangou. AI tools (ChatGPT) were used for assistance during development. All external resources are cited in the final project report.*
