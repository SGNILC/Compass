# Compass — System Architecture

This document describes the architecture of the Compass classroom analytics tool: how data flows through the system, how each component relates to the others, and which files are active versus unused.

---

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        TEACHER (User)                           │
└──────────────────────────────┬──────────────────────────────────┘
                               │  Opens browser
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                  Web Interface (Static HTML/CSS)                 │
│                                                                 │
│   index.html  ──────────── styles.css                          │
│       │                                                         │
│       │  <iframe> embed                                         │
│       ▼                                                         │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              Power BI Service (Cloud)                    │   │
│  │                                                         │   │
│  │   Compass_Dashboard.pbix  (published report)            │   │
│  │   - Grade distribution charts                           │   │
│  │   - Assignment completion tables                        │   │
│  │   - GPA trend visuals                                   │   │
│  │   - Topic-based filters                                 │   │
│  └──────────────────────────┬──────────────────────────────┘   │
└─────────────────────────────│───────────────────────────────────┘
                              │  Power BI connects to data source
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│               PostgreSQL Database (Local)                        │
│                                                                 │
│   ┌──────────┐   ┌──────────┐   ┌───────────────────────┐      │
│   │  classes │   │ teacher  │   │      assignments       │      │
│   │──────────│   │──────────│   │───────────────────────│      │
│   │ classID  │◄──│ classID  │   │ assignmentID          │      │
│   │ class_   │   │ teacher- │   │ ass_name              │      │
│   │  name    │   │  ID      │   │ date_assigned         │      │
│   │ student_ │   │ first_   │   │ due_date              │      │
│   │  count   │   │  name    │   │ topic (FK → topics)   │      │
│   └──────────┘   │ last_    │   └───────────────────────┘      │
│                  │  name    │              │                     │
│                  └──────────┘              │ (topic reference)  │
│                                           ▼                     │
│   ┌──────────────────────┐   ┌──────────────────────────┐      │
│   │   assignmentsentry   │   │         topics           │      │
│   │──────────────────────│   │──────────────────────────│      │
│   │ assignmentID         │   │ topicID                  │      │
│   │ ass_name             │   │ topic_name               │      │
│   │ ass_grade            │   └──────────────────────────┘      │
│   │ points               │                                      │
│   │ date_assigned        │   ┌──────────────────────────┐      │
│   │ due_date             │   │           gpa            │      │
│   │ submission_status    │   │──────────────────────────│      │
│   │ late_status          │   │ gpaID                    │      │
│   │ studentID            │   │ letter_grade (A–F)       │      │
│   └──────────────────────┘   │ gpaVal (0.0–3.7)         │      │
│                              └──────────────────────────┘      │
└─────────────────────────────────────────────────────────────────┘
```

---

## Component Breakdown

### 1. Web Interface

**Location:** `OneDrive/Senior Seminor Project/Compass Website/`

The front-end is a static multi-page site. There is no build step or JavaScript framework — it runs directly in a browser.

| File | Status | Role |
|---|---|---|
| `index.html` | ✅ **Active** | Main page; embeds the Power BI dashboard via `<iframe>` and renders the animated side-nav |
| `styles.css` | ✅ **Active** | All visual styling: layout, CSS custom properties, animated nav, color scheme |
| `classview.html` | ⚠️ **Stub** | Intended to list class/student data dynamically; currently shows placeholder text only |
| `signin.html` | ⚠️ **Stub** | UI shell for a login page; links directly to `index.html` — no real auth implemented |
| `signout.html` | ✅ **Active** | Sign-out confirmation page with a return link |
| `settings.html` | ✅ **Active** | Settings page with icon attributions |
| `actions.js` | ❌ **Dead — can be deleted** | Contains a single empty `onClick()` function body with no logic and no callers; not imported anywhere |

---

### 2. Power BI Dashboard

**Location:** `OneDrive/Senior Seminor Project/Compass Project Documentation/Compass_Dashboard.pbix`

The `.pbix` file is the Power BI Desktop source for the report. It connects to the PostgreSQL database, models the data relationships, and defines all visualizations. The published report is then embedded in `index.html` using the Power BI embed URL:

```
https://app.powerbi.com/reportEmbed?reportId=...&autoAuth=true&ctid=...
```

**What the dashboard shows:**
- Grade distribution across the class (letter grades A–F)
- Per-student and per-assignment completion and late submission status
- GPA calculations derived from the `gpa` lookup table
- Topic-based breakdown (DS & Algorithms, Machine Learning, Other)

---

### 3. PostgreSQL Database

**Location:** `OneDrive/Senior Seminor Project/SQL Code/`

All tables are defined and seeded in these files. The database runs locally.

| File | Status | Role |
|---|---|---|
| `classes.sql` | ✅ **Active** | DDL + seed for the `classes` table |
| `teacher.sql` | ✅ **Active** | DDL + seed + JOIN query for the `teacher` table |
| `assignments.sql` | ✅ **Active** | DDL + seed for the master `assignments` catalog |
| `assignments_entry.sql` | ✅ **Active** | DDL + seed for per-student `assignmentsentry`; includes PL/pgSQL block for score generation |
| `gpa.sql` | ✅ **Active** | DDL + seed for the `gpa` letter-grade lookup table |
| `topics.sql` | ✅ **Active** | DDL + seed for the `topics` classification table |

---

### 4. Documentation & Assets

| File / Folder | Notes |
|---|---|
| `Compass Project Documentation/Steeve Nsangou – Compass - Final Report.pdf` | Full project report covering design decisions, implementation, and reflection |
| `Compass Project Documentation/Steeve Nsangou – Compass - Original Proposal.pdf` | Initial project scoping document |
| `Compass Project Documentation/User Testing/` | Two structured user test sessions + notes + questions |
| `Media/` | Screenshots: Landing Page, Classroom View, Student View, Query View |
| `OneDrive/Senior Seminor Project/README.md` | ❌ **Duplicate — can be deleted** | Identical to the root `README.md`; serves no additional purpose |

---

## Data Flow (Step by Step)

```
1. Schema defined in .sql files
       │
       ▼
2. Tables created & seeded in local PostgreSQL
       │
       ▼
3. Power BI Desktop connects to PostgreSQL
   → imports tables, defines relationships, builds visuals
       │
       ▼
4. Report published to Power BI Service (cloud)
       │
       ▼
5. index.html embeds the published report via <iframe>
       │
       ▼
6. Teacher opens index.html in browser
   → views live dashboard with grade, completion, and GPA data
```

---

## Files That Should Be Deleted

| File | Reason |
|---|---|
| `OneDrive/Senior Seminor Project/Compass Website/actions.js` | Empty stub — contains `function onClick() {}` with no body and no callers. No page imports this file. |
| `OneDrive/Senior Seminor Project/README.md` | Exact duplicate of the root `README.md` with no additional content. |

---

## Known Architecture Gaps (Honest Assessment)

| Gap | Detail |
|---|---|
| **No authentication layer** | `signin.html` is a UI placeholder. A real implementation would use Microsoft SSO (Azure AD), which is already hinted at by the `ctid=` parameter in the Power BI embed URL. |
| **`classview.html` is a stub** | The class list view has no backend connection; it would need a server-side component or a second Power BI embed to be functional. |
| **No server / API layer** | The site is fully static. Connecting `classview.html` to live data would require adding a backend (e.g., Node.js/Express or a serverless function) or using Power BI for all data-display pages. |
| **Local database only** | Moving PostgreSQL to a cloud host (e.g., Supabase, Neon, AWS RDS) would make the Power BI connection persistent and the project fully deployable. |
