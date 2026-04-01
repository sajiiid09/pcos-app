# DOCUMENTATION.md

# PCOS Companion — Patient-Side Product Documentation

## 1. Project Overview

### 1.1 Product Name
**Working name:** PCOS Companion  
**Platform:** Flutter mobile app (patient-side only)  
**Target users:** Women diagnosed with PCOS / PCOD, or users who suspect they may have PCOS and want structured self-management support.

### 1.2 Product Vision
PCOS Companion is a patient-side lifestyle and self-management mobile application designed to help users organize their daily routine, track symptoms, manage prescribed medications, maintain healthy habits, and access evidence-based educational content about PCOS.

The app is **not** intended to diagnose, prescribe, or replace clinicians. Its role is to help patients:
- understand their condition better,
- stay consistent with treatment and lifestyle plans,
- track symptoms and cycles,
- receive reminders,
- organize medication usage,
- prepare better for doctor consultations,
- and interact with a safe, source-grounded AI assistant through RAG.

### 1.3 Product Positioning
This app should feel:
- clinically responsible,
- emotionally supportive,
- modern and premium,
- simple enough for everyday use,
- and intelligent without pretending to be a doctor.

### 1.4 Core Product Principles
1. **Safety before intelligence**  
   The app must avoid acting like a clinician. It can organize and explain, but not prescribe or diagnose.

2. **Lifestyle-first approach**  
   PCOS management is strongly tied to sleep, stress, movement, diet, and adherence. Lifestyle support is central.

3. **Low-friction daily use**  
   The user should be able to log key information in seconds.

4. **Source-grounded AI**  
   The AI assistant must answer from curated medical knowledge and structured app data, not free-form hallucinated advice.

5. **Progress visibility**  
   Users should clearly see how habits, medication adherence, cycle patterns, and symptoms evolve over time.

6. **Privacy-conscious design**  
   Sensitive health data must be treated carefully at the UX and architecture levels.

---

## 2. Product Scope

### 2.1 In Scope
Patient-side mobile app only, including:
- onboarding,
- user profile,
- PCOS goal setup,
- symptom tracking,
- menstrual cycle tracking,
- medication management,
- reminder flows,
- lifestyle habit tracking,
- educational content,
- AI chat with RAG,
- health summaries and reports,
- settings and privacy controls.

### 2.2 Out of Scope for Now
The following are intentionally excluded from this documentation's implementation scope:
- doctor-side dashboard,
- admin panel,
- hospital/clinic management tools,
- fertility clinic workflow integration,
- telemedicine consultation system,
- lab integrations in the initial phase,
- insurance / payment billing,
- community social network as a first-class module.

### 2.3 Target Release Strategy
The project should be staged:

- **Phase 1:** MVP foundation
- **Phase 2:** Medication and reminder expansion
- **Phase 3:** AI and RAG integration
- **Phase 4:** Personalization, reports, and advanced insights
- **Phase 5:** Future ecosystem expansion

---

## 3. User Persona

### 3.1 Primary Persona
A woman aged 18–38 diagnosed with PCOS / PCOD who wants a structured way to:
- track her symptoms,
- stay consistent with medications,
- manage diet and exercise habits,
- understand what changes help,
- and ask health-related questions safely.

### 3.2 Secondary Persona
A newly diagnosed or suspected user who feels overwhelmed and wants:
- simple guidance,
- symptom logging,
- cycle awareness,
- educational clarity,
- and reminders.

### 3.3 Emotional Context
Users may feel:
- anxious,
- confused by conflicting online information,
- frustrated by slow progress,
- guilty about inconsistency,
- uncertain about medications,
- and unsupported between doctor visits.

The product should therefore be:
- reassuring,
- not alarmist,
- not overly technical,
- and non-judgmental.

---

## 4. Product Goals

### 4.1 Primary Goals
- help users manage PCOS consistently,
- improve adherence to lifestyle and treatment routines,
- help users track health patterns,
- provide evidence-based educational support,
- support better doctor visits and follow-up.

### 4.2 Secondary Goals
- reduce confusion about daily self-management,
- increase engagement with healthy habits,
- provide an organized medication and reminder system,
- create a premium, trustworthy patient experience.

### 4.3 Non-Goals
The app should **not**:
- diagnose PCOS,
- prescribe treatment,
- recommend initiating medications,
- advise stopping prescribed medications,
- claim guaranteed clinical outcomes,
- act as emergency medical support.

---

## 5. Information Architecture

The patient app will be organized around the following major areas:

1. **Onboarding**
2. **Home**
3. **Track**
4. **Medications**
5. **Lifestyle**
6. **Learn**
7. **AI Assistant**
8. **Reports**
9. **Profile / Settings**

Recommended bottom navigation for production:
- Home
- Track
- Meds
- Learn
- Profile

Some sections such as Lifestyle, Reports, and AI can be nested within tabs depending on final UX.

---

## 6. Complete Screen Documentation

This section documents every patient-side screen planned for the app. Each screen includes purpose, major content, components, states, and design notes for Figma.

---

## 6.1 Splash Screen

### Purpose
Initial branded entry screen while app loads local state, auth state, or onboarding status.

### Main Elements
- app logo,
- app name,
- subtle background illustration or gradient,
- loading indicator.

### States
- loading,
- error fallback (rare),
- route decision.

### Design Notes
Should feel calm, premium, and health-oriented. Keep it minimal.

---

## 6.2 Welcome / Intro Carousel

### Purpose
Introduce the product value before onboarding.

### Slides (recommended)
1. Track symptoms and cycle
2. Manage medications and reminders
3. Build healthier habits
4. Learn with evidence-based AI support

### Main Elements
- illustration or visual card,
- title,
- subtitle,
- pagination indicator,
- Continue / Skip.

### Design Notes
Not too many slides. Three to four maximum.

---

## 6.3 Account Access Screen (Optional by release stage)

### Purpose
Allow the user to sign in, create an account, or continue in limited local mode.

### Main Elements
- Sign up,
- Log in,
- Continue without account (optional),
- short privacy note.

### Design Notes
If authentication is deferred, this can be removed from early versions.

---

## 6.4 Create Account Screen

### Purpose
Create a user account for sync, reminders, and cloud-based features.

### Fields
- email,
- password,
- confirm password.

### Optional
- social login,
- phone auth in later stage.

### States
- valid,
- invalid email,
- weak password,
- loading,
- success.

---

## 6.5 Login Screen

### Purpose
Access existing account.

### Fields
- email,
- password,
- forgot password.

---

## 6.6 Forgot Password Screen

### Purpose
Password reset flow.

### Main Elements
- email field,
- reset CTA,
- confirmation state.

---

## 6.7 Consent / Privacy Notice Screen

### Purpose
Obtain user acknowledgement for health data handling and app limitations.

### Content
- this app supports self-management,
- not a replacement for professional medical care,
- data privacy summary,
- AI safety limitations.

### Actions
- Accept,
- Learn more.

---

## 6.8 Core Onboarding Screen Set

This should likely be a progressive multi-step flow rather than one long form.

### 6.8.1 Basic Profile Screen
#### Fields
- first name or nickname,
- age range,
- country / region (optional),
- height,
- weight (optional),
- time zone.

### 6.8.2 Diagnosis Status Screen
#### Options
- diagnosed with PCOS,
- diagnosed with PCOD,
- suspected but not confirmed,
- not sure.

### 6.8.3 Primary Goals Screen
#### Options
- regulate cycle,
- reduce symptoms,
- improve consistency,
- manage weight,
- improve sleep,
- improve nutrition,
- manage medications,
- prepare for doctor appointments.

### 6.8.4 Main Symptoms Screen
#### Selectable symptoms
- irregular periods,
- acne,
- weight gain,
- hair fall,
- excess hair growth,
- mood changes,
- fatigue,
- sleep issues,
- cravings,
- pelvic pain,
- fertility concerns,
- bloating.

### 6.8.5 Medication Usage Screen
#### Options
- currently taking medications,
- not taking any,
- prefer to add later.

### 6.8.6 Reminder Preference Screen
#### Options
- medication reminders,
- meal reminders,
- sleep reminders,
- movement reminders,
- water reminders,
- symptom check-in reminders.

### 6.8.7 AI Usage Introduction
Short educational screen that explains:
- AI answers are informational,
- answers come from curated sources,
- emergency or prescription advice is not provided.

### Onboarding Completion Screen
- welcome message,
- summary of chosen goals,
- CTA: Go to dashboard.

### Design Notes
Onboarding should feel conversational, not clinical or bureaucratic.

---

## 6.9 Home Dashboard

### Purpose
This is the app's main operational screen. It should answer:  
**What do I need to do today, and how am I doing?**

### Main Sections
1. Greeting and date
2. Quick summary card
3. Today's reminders
4. Cycle status card
5. Medication adherence card
6. Habit progress card
7. Symptom trend snapshot
8. Quick actions
9. AI shortcut

### Components
- header with user greeting,
- day/date display,
- notification icon,
- progress rings or progress cards,
- reminder list,
- CTA buttons,
- mini charts,
- contextual tips.

### Suggested Home Cards
#### A. Daily Focus Card
Shows today's priority:
- take medicine,
- log symptoms,
- go for a walk,
- sleep target,
- hydration goal.

#### B. Cycle Status Card
Shows:
- current cycle phase if available,
- last period logged,
- next expected period estimate (only as estimate, clearly labeled),
- cycle irregularity flag if sufficient data exists.

#### C. Medication Card
Shows:
- next medication reminder,
- number due today,
- missed yesterday,
- adherence streak.

#### D. Lifestyle Card
Shows:
- sleep target,
- movement,
- meals logged,
- hydration.

#### E. Symptom Snapshot
Shows:
- latest pain,
- acne,
- mood,
- energy,
- top symptom trend.

#### F. Quick Actions
- Log symptoms
- Start period
- Add medicine
- Ask AI
- View report

### States
- first-time empty state,
- returning user state,
- no medication added state,
- no cycle data state,
- reminders disabled state.

### Design Notes
This screen should feel rich but not overcrowded. Card-based layout recommended.

---

## 6.10 Notifications Center

### Purpose
Central view for reminders, nudges, educational notices, and important warnings.

### Types
- medication reminder,
- habit reminder,
- symptom logging reminder,
- educational suggestion,
- AI safety notice,
- data sync issue,
- report ready notice.

### Actions
- mark as read,
- open linked module,
- clear all.

---

## 6.11 Track Hub

### Purpose
Central access point for all tracking-related modules.

### Sections
- symptoms,
- cycle,
- weight,
- sleep,
- mood,
- food,
- movement,
- hydration.

### Design
Can be a grid or grouped card list.

---

## 6.12 Symptom Log Screen

### Purpose
Let the user record how they feel today in a fast, structured way.

### Fields
- date,
- pain level,
- mood,
- energy,
- sleep quality,
- acne severity,
- bloating,
- cravings,
- hair fall,
- facial/body hair change,
- notes.

### Input Types
- sliders,
- chips,
- segmented controls,
- emoji-assisted mood selector,
- textarea.

### States
- new entry,
- edit existing entry,
- duplicate from previous day (future convenience feature).

### Design Notes
This should be optimized for sub-60-second usage.

---

## 6.13 Symptom History Screen

### Purpose
Show symptom logs in chronological form.

### Views
- list view,
- calendar view,
- simple chart view.

### Filter Options
- last 7 days,
- last 30 days,
- custom range,
- symptom type.

---

## 6.14 Menstrual Cycle Overview Screen

### Purpose
Provide cycle-related overview and history.

### Content
- current status,
- period history,
- cycle length history,
- estimated next period,
- irregularity indicators,
- symptom overlays.

### Design Notes
Do not overstate predictive accuracy. Predictions should be labeled estimates.

---

## 6.15 Start Period Screen

### Purpose
Quick action for period start logging.

### Fields
- start date,
- flow level,
- notes optional.

---

## 6.16 End Period Screen

### Purpose
Complete current period entry.

### Fields
- end date,
- summary notes optional.

---

## 6.17 Cycle Calendar Screen

### Purpose
Calendar-based visual representation of cycle logs and symptom markers.

### Highlights
- period days,
- symptom days,
- medication days,
- note indicators.

---

## 6.18 Weight Tracker Screen

### Purpose
Support optional body weight tracking without making the app feel weight-obsessed.

### Content
- current weight,
- trend chart,
- log weight CTA,
- notes about fluctuations.

### Design Notes
This screen must be sensitive and non-judgmental.

---

## 6.19 Sleep Tracker Screen

### Purpose
Track sleep duration and quality.

### Fields
- sleep time,
- wake time,
- total duration,
- sleep quality,
- notes.

### Future
Can later integrate with device health APIs.

---

## 6.20 Mood Tracker Screen

### Purpose
Track mental and emotional state.

### Fields
- mood selection,
- stress level,
- anxiety level,
- notes,
- triggers optional.

### Design Notes
Should be calm and simple.

---

## 6.21 Food Log / Meal Guidance Screen

### Purpose
Help users maintain dietary consistency without turning the app into a calorie-heavy diet platform.

### Core MVP Direction
Prefer behavior-based logging over calorie obsession.

### Components
- meal timing,
- meal category,
- quality score or healthy plate guidance,
- cravings,
- notes.

### Future Expansion
- meal templates,
- anti-inflammatory meal suggestions,
- dietitian-approved content,
- grocery guidance.

---

## 6.22 Hydration Tracker Screen

### Purpose
Track water intake.

### Components
- quick add buttons,
- daily target,
- visual progress.

---

## 6.23 Movement / Exercise Tracker Screen

### Purpose
Track physical activity and movement consistency.

### Components
- activity type,
- duration,
- intensity,
- completion state,
- weekly overview.

### Future
- walking goals,
- gentle exercise recommendations,
- home workout cards.

---

## 6.24 Habit Tracker Screen

### Purpose
Track user-defined or recommended wellness habits.

### Example Habits
- slept before 11 PM,
- 30-minute walk,
- drank enough water,
- reduced sugary snacks,
- took medication,
- stress management practice.

### Components
- daily checklist,
- streaks,
- weekly completion.

---

## 6.25 Medications Hub

### Purpose
The main medication management home.

### Sections
- active medications,
- next reminder,
- missed doses,
- medication history,
- add medication CTA,
- safety info notices.

---

## 6.26 Add Medication Screen

### Purpose
Allow the user to manually add a prescribed or already-used medication.

### Fields
- medication name,
- form,
- dosage,
- frequency,
- duration,
- start date,
- end date,
- instructions,
- prescribed by,
- notes.

### UX Notes
Use searchable medicine names if data source is connected. Manual input fallback required.

---

## 6.27 Medication Detail Screen

### Purpose
Detailed view of a single medication entry.

### Content
- medicine name,
- dosage,
- schedule,
- start/end dates,
- adherence history,
- notes,
- reminder settings,
- basic official information,
- caution notices.

### Actions
- edit,
- pause,
- archive,
- delete,
- mark taken.

---

## 6.28 Medication Schedule Screen

### Purpose
Calendar/list view of all scheduled medicine doses.

### Views
- Today,
- Upcoming,
- Weekly schedule.

---

## 6.29 Dose Reminder Screen

### Purpose
Focus screen launched from notification.

### Content
- medication name,
- dose,
- time,
- quick actions:
  - Taken
  - Skip
  - Snooze
  - View medicine

---

## 6.30 Medication Adherence History Screen

### Purpose
Show medication consistency.

### Content
- adherence percentage,
- missed doses,
- weekly/monthly charts,
- streaks.

---

## 6.31 Medication Interaction Warning Screen

### Purpose
Display conservative warnings when a potential interaction or caution is detected.

### Important Constraint
This screen must **not** replace pharmacist or clinician advice.

### Content
- medications involved,
- severity or caution category if available,
- explanation,
- recommendation to consult doctor/pharmacist,
- source transparency.

### Design Notes
Should look serious but not panic-inducing.

---

## 6.32 Learn Hub

### Purpose
Provide structured, evidence-based educational content.

### Categories
- PCOS basics,
- symptoms,
- lifestyle,
- food and nutrition,
- exercise,
- sleep and stress,
- medications basics,
- fertility / reproductive health,
- mental health,
- myths vs facts,
- when to seek medical help.

---

## 6.33 Article List Screen

### Purpose
Browse educational articles or topic cards.

### Components
- category chips,
- search,
- featured articles,
- recent / saved articles.

---

## 6.34 Article Detail Screen

### Purpose
Read educational content.

### Components
- article title,
- author/source,
- updated date,
- body,
- key takeaways,
- related articles,
- save / bookmark,
- share.

---

## 6.35 Myth vs Fact Screen

### Purpose
Counter misinformation.

### Content Pattern
- claim,
- fact,
- explanation,
- sources.

---

## 6.36 FAQ Screen

### Purpose
Quick-answer structured knowledge section.

### Examples
- Can PCOS be cured?
- Is weight gain always present?
- Are irregular periods normal with PCOS?
- Does everyone with PCOS need medicine?
- What should I ask my doctor?

---

## 6.37 AI Assistant Landing Screen

### Purpose
Introduce the chat assistant and set usage expectations.

### Content
- what the AI can help with,
- what it cannot do,
- privacy note,
- examples of safe questions.

### Example Prompts
- What does irregular ovulation mean?
- What habits help manage PCOS?
- Help me summarize my last 30 days for my doctor.
- Explain my medication reminders.

---

## 6.38 AI Chat Screen

### Purpose
Allow the user to interact with a source-grounded assistant.

### Core Capabilities
- answer educational questions,
- explain symptom and lifestyle topics,
- summarize user-tracked data,
- help prepare doctor questions,
- explain medication instructions at a high level,
- answer only from curated knowledge + app context.

### Components
- chat thread,
- input field,
- suggested prompts,
- source citations,
- warning banner for unsafe asks,
- regenerate,
- copy,
- feedback.

### Safety Behaviors
The AI should refuse or redirect:
- diagnosis requests,
- dose adjustment requests,
- medication substitution requests,
- emergency situations,
- pregnancy-critical risk questions beyond allowed informational scope.

### Design Notes
Sources must be visible. Trust depends on transparency.

---

## 6.39 AI Response Detail / Sources Screen

### Purpose
Show the origin of AI answers.

### Content
- source list,
- source excerpts,
- content type,
- last updated.

---

## 6.40 Saved Questions / Chat History Screen

### Purpose
Allow users to review prior chats.

### Components
- searchable history,
- saved answers,
- delete history,
- pin important chats.

---

## 6.41 Reports Hub

### Purpose
Central place for summaries and exports.

### Types of Reports
- symptom summary,
- cycle summary,
- medication adherence report,
- lifestyle consistency report,
- doctor visit summary.

---

## 6.42 Doctor Visit Summary Screen

### Purpose
Generate a clean summary users can share before or during appointments.

### Content
- top symptoms,
- symptom trends,
- cycle pattern summary,
- medications and adherence,
- recent notes,
- user questions for doctor.

### Actions
- export PDF,
- share,
- print,
- copy summary.

---

## 6.43 Insights / Trends Screen

### Purpose
Display structured patterns from tracked data.

### Examples
- sleep vs energy,
- medication adherence vs symptom consistency,
- cycle trend,
- mood trend,
- acne trend.

### Design Notes
Should be visually simple and avoid pseudo-scientific claims.

---

## 6.44 Goals Screen

### Purpose
Set and review personal health goals.

### Examples
- sleep 7+ hours,
- log symptoms 5 times a week,
- complete medication on time,
- walk 30 minutes,
- reduce sugary snacks.

### Components
- goal cards,
- progress bars,
- edit goal,
- achievement states.

---

## 6.45 Profile Screen

### Purpose
Manage personal profile and app-level identity.

### Sections
- account,
- diagnosis status,
- personal goals,
- reminders,
- privacy,
- linked devices future,
- support.

---

## 6.46 Edit Profile Screen

### Fields
- name,
- age range,
- diagnosis status,
- weight / height optional,
- personal goals,
- time zone.

---

## 6.47 Reminder Settings Screen

### Purpose
Manage notification preferences.

### Sections
- medication reminders,
- meal reminders,
- hydration reminders,
- sleep reminders,
- symptom log reminders,
- AI prompt nudges,
- quiet hours.

---

## 6.48 Privacy & Data Control Screen

### Purpose
Allow user-level transparency and control over health data.

### Options
- export data,
- delete data,
- manage AI data usage,
- local-only mode if supported,
- sync settings,
- privacy policy,
- terms.

---

## 6.49 Language / Localization Screen

### Purpose
Manage language settings.

### Notes
Important if multilingual support is part of roadmap.

---

## 6.50 Notification Permissions Screen

### Purpose
Explain why notification access is useful and allow enable flow.

---

## 6.51 Help & Support Screen

### Purpose
Provide support access.

### Content
- FAQs,
- contact support,
- report bug,
- app version,
- emergency disclaimer.

---

## 6.52 Empty States and Edge Screens

These screens are not primary screens but must be designed:
- no medications added,
- no symptom data yet,
- no cycle data,
- no internet,
- AI unavailable,
- notification permission denied,
- report empty state,
- onboarding incomplete,
- maintenance / downtime state.

These matter for final product quality and must be included in Figma flows.

---

## 7. Detailed Feature Modules

---

## 7.1 Symptom Tracking Module

### Objective
Enable users to log and review symptoms consistently.

### MVP Scope
- daily symptom log,
- symptom history list,
- simple charts,
- notes.

### Future Scope
- symptom correlation,
- smart nudges,
- custom symptoms,
- clinician summary generation.

---

## 7.2 Cycle Tracking Module

### Objective
Allow users to track menstrual patterns and see historical trends.

### MVP Scope
- start period,
- end period,
- calendar overview,
- historical cycle list.

### Future Scope
- estimated next cycle,
- irregularity pattern analysis,
- symptom overlay,
- ovulation estimate only if clinically framed and conservative.

---

## 7.3 Medication Module

### Objective
Help users organize prescribed medications and stay consistent.

### MVP Scope
- add medication,
- reminder schedule,
- mark taken / skipped,
- medication history.

### Future Scope
- refill reminders,
- medication interaction warnings,
- medication info sheets,
- prescription image upload,
- pharmacy integration.

---

## 7.4 Lifestyle Module

### Objective
Support sustainable self-management habits.

### Submodules
- meals,
- hydration,
- sleep,
- exercise,
- daily habits,
- stress support.

### MVP Scope
- simple habit completion,
- hydration tracker,
- movement tracker,
- sleep tracker.

### Future Scope
- personalized suggestions,
- meal templates,
- anti-inflammatory food guidance,
- routine recommendations.

---

## 7.5 Education Module

### Objective
Provide trustworthy, curated content.

### MVP Scope
- category hub,
- articles,
- FAQs,
- myths vs facts.

### Future Scope
- interactive learning plans,
- content personalization,
- saved learning journeys,
- clinician-reviewed updates.

---

## 7.6 AI / RAG Module

### Objective
Deliver a safe, grounded assistant.

### Scope
- source-grounded answers,
- symptom education,
- app data summarization,
- doctor-prep assistance,
- habit guidance.

### Technical Rules
- retrieval only from curated corpus + user context,
- source citation mandatory,
- hard safety layer,
- no unsupported free-form medical reasoning.

### Future Scope
- personalized daily explanations,
- intelligent summaries,
- proactive question suggestions.

---

## 7.7 Reports Module

### Objective
Turn logs into useful summaries.

### MVP Scope
- symptom summary,
- cycle summary,
- medication adherence snapshot,
- export-ready doctor summary.

### Future Scope
- branded report templates,
- longitudinal analysis,
- shareable insights.

---

## 8. User Flows

---

## 8.1 First-Time User Flow
1. Splash
2. Welcome carousel
3. Account access / local mode
4. Consent and privacy
5. Onboarding steps
6. Notification permissions
7. Home dashboard

---

## 8.2 Symptom Logging Flow
1. Home quick action or Track hub
2. Symptom log screen
3. Save
4. Success feedback
5. Dashboard updates summary

---

## 8.3 Cycle Logging Flow
1. Home quick action / Track
2. Start period or End period
3. Save
4. Calendar / dashboard update

---

## 8.4 Medication Setup Flow
1. Medications hub
2. Add medication
3. Configure dosage / frequency
4. Configure reminders
5. Save
6. Medication detail
7. Dashboard reminder card updates

---

## 8.5 Daily Medication Reminder Flow
1. Notification received
2. Dose reminder screen
3. Mark taken / skipped / snooze
4. Adherence history updates

---

## 8.6 AI Education Flow
1. Learn hub or AI tab
2. AI landing screen
3. Ask question
4. AI answer with sources
5. Save / follow-up / open related content

---

## 8.7 Doctor Report Flow
1. Reports hub
2. Select report type
3. Generate summary
4. Preview report
5. Export / share

---

## 9. Design System Guidance for Figma

### 9.1 Design Direction
The design should feel:
- premium,
- calming,
- feminine without being stereotypical,
- clinical enough to feel trustworthy,
- minimal and readable.

### 9.2 Visual Personality
Recommended qualities:
- soft rounded corners,
- clean cards,
- clear hierarchy,
- subtle supportive illustrations,
- low-noise interfaces,
- generous spacing.

### 9.3 Suggested UI Pattern Language
- dashboard cards,
- bottom sheet interactions,
- segmented controls,
- progress rings,
- mini trend charts,
- timeline components,
- health stat chips,
- friendly empty states.

### 9.4 Color Direction
Avoid over-saturated “beauty app” aesthetics.  
A balanced palette should feel:
- warm,
- trustworthy,
- calm,
- health-oriented.

Potential direction:
- muted rose / mauve accent,
- soft beige / neutral background,
- deep slate text,
- low-contrast supportive surfaces,
- red/orange only for warnings.

### 9.5 Typography Direction
Prioritize readability:
- strong section headers,
- medium-weight body text,
- high line height,
- minimal decorative typography.

### 9.6 Component Groups Required in Figma
Design system should include:
- buttons,
- inputs,
- chips,
- selectors,
- toggles,
- cards,
- list rows,
- tab bars,
- nav bars,
- bottom sheets,
- modals,
- toasts/snackbars,
- charts,
- stat pills,
- reminder cards,
- medication tiles,
- article cards,
- chat bubbles,
- AI source cards,
- empty states.

---

## 10. Data Model Overview

Below is the high-level conceptual data model.

### 10.1 User
- id
- email
- profile data
- diagnosis status
- goals
- preferences
- reminder settings

### 10.2 SymptomEntry
- id
- userId
- date
- painLevel
- mood
- energy
- sleepQuality
- acne
- cravings
- bloating
- hairFall
- notes

### 10.3 CycleEntry
- id
- userId
- startDate
- endDate
- flowLevel
- notes

### 10.4 Medication
- id
- userId
- name
- dose
- frequency
- schedule
- startDate
- endDate
- instructions
- notes
- status

### 10.5 MedicationLog
- id
- medicationId
- scheduledAt
- takenAt
- status
- snoozed
- notes

### 10.6 HabitEntry
- id
- userId
- habitType
- date
- completed
- value optional

### 10.7 SleepEntry
- id
- userId
- sleepTime
- wakeTime
- duration
- quality

### 10.8 WeightEntry
- id
- userId
- date
- weight

### 10.9 WaterEntry
- id
- userId
- date
- amount

### 10.10 ExerciseEntry
- id
- userId
- activityType
- duration
- intensity
- date

### 10.11 Article
- id
- title
- category
- content
- source
- updatedAt

### 10.12 ChatThread
- id
- userId
- title
- createdAt

### 10.13 ChatMessage
- id
- threadId
- role
- content
- sources
- createdAt

### 10.14 Report
- id
- userId
- type
- generatedAt
- summary
- exportPath

---

## 11. Technical Product Direction

### 11.1 Frontend
- Flutter
- Riverpod
- GoRouter
- local notifications
- responsive design for different mobile sizes

### 11.2 Local Storage
Likely:
- Isar or Drift for structured local persistence
- secure storage for auth tokens and sensitive settings

### 11.3 Backend
Patient-side app will later connect to:
- FastAPI backend
- PostgreSQL
- vector database / pgvector for RAG
- authentication provider
- storage for reports and content

### 11.4 AI/RAG Stack
- curated PCOS knowledge base
- embedding pipeline
- retrieval filtering
- safety layer
- response citations
- app-context summarization

---

## 12. Privacy, Safety, and Medical Boundaries

### 12.1 Clinical Boundary
The app must clearly state:
- it is for education and self-management,
- it does not replace doctor advice,
- it does not diagnose,
- it does not prescribe,
- medication interactions shown are informational and should be confirmed.

### 12.2 AI Boundary
The AI must not:
- recommend starting or stopping medicine,
- change doses,
- interpret emergencies as routine chat,
- provide high-risk medical decisions without escalation.

### 12.3 Red Flag Handling
The app should detect certain dangerous prompts and redirect:
- severe pain,
- heavy uncontrolled bleeding,
- fainting,
- suicidal ideation,
- chest pain,
- severe allergic reaction.

### 12.4 Privacy UX
The app should make it easy to:
- see what data is stored,
- export it,
- delete it,
- control notifications,
- control AI-related data behavior.

---

## 13. Release Planning

### Phase 1 — Foundation MVP
- onboarding,
- home dashboard basic,
- symptom tracking,
- cycle tracking,
- local persistence,
- simple profile,
- reminder groundwork.

### Phase 2 — Medications and Habits
- medication management,
- reminder flows,
- habit tracker,
- hydration,
- sleep,
- movement.

### Phase 3 — Education and AI
- learn hub,
- articles,
- FAQs,
- AI landing,
- source-grounded chat.

### Phase 4 — Reports and Insights
- trends,
- summary generation,
- doctor visit report,
- exports.

### Phase 5 — Advanced Future Features
- medication caution engine,
- lab data support,
- wearables,
- advanced personalization,
- multilingual support,
- premium features if applicable.

---

## 14. Future Features Backlog

These are not required for first release but should remain in project context.

### 14.1 Smart Features
- intelligent reminder optimization,
- personalized daily routines,
- anomaly detection in consistency patterns,
- adherence coaching.

### 14.2 Data Integrations
- Apple Health / Google Fit,
- smart scale integration,
- wearable sleep/activity sync,
- pharmacy APIs,
- clinician portal linkage.

### 14.3 Advanced Content
- recipe recommendations,
- guided meal plans,
- stress management exercises,
- meditation content,
- fertility planning education.

### 14.4 Social / Support Expansion
- coach support,
- partner mode,
- care circle,
- moderated support community.

### 14.5 Accessibility Expansion
- multilingual support,
- screen-reader optimization,
- dyslexia-friendly mode,
- high contrast mode,
- low-literacy content mode.

---

## 15. Figma Handoff Notes

The documentation should be used to design:
1. full onboarding flow,
2. full dashboard,
3. all tracking screens,
4. full medication flow,
5. educational content flow,
6. AI chat flow,
7. reports flow,
8. settings and privacy flow,
9. all key empty states,
10. all reminder / notification states.

### Priority for Figma Round 1
Design these first:
- splash,
- onboarding,
- home dashboard,
- track hub,
- symptom log,
- cycle calendar,
- meds hub,
- add medication,
- dose reminder,
- learn hub,
- article detail,
- AI chat,
- report summary,
- profile/settings.

### Priority for Figma Round 2
Design:
- trends,
- adherence history,
- privacy controls,
- notification center,
- goals,
- empty/error states,
- future advanced modules.

---

## 16. Final Product Summary

PCOS Companion should be designed as a premium, trustworthy, lifestyle-centered self-management app for women dealing with PCOS. It should combine:
- clean tracking,
- medication organization,
- helpful reminders,
- educational clarity,
- and safe AI assistance.

The most important product quality is **clarity with restraint**.  
This app becomes strong not by acting like a doctor, but by helping users stay informed, organized, and consistent every day.

---