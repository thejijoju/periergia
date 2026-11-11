# Periergia community: accounts, universities, students

Plan for turning Periergia from a free library that people read anonymously into a place where students and universities also **join, publish, and connect**. This is a plan, not yet built. It sits alongside the curriculum work in [history-curriculum/PLAN.md](history-curriculum/PLAN.md).

## What we want

1. **User accounts.** Anyone can create an account.
2. **Students join their university.** A student links their account to their university and appears among its members.
3. **University pages.** A university can set up and run its own page: description, departments, programmes, published lectures, and member students and staff.
4. **Students publish their papers.** Essays, theses and research papers go on the student's profile and the university page, readable by everyone.
5. **Students communicate with each other.** Direct messages and discussion.
6. **Class groups.** Groups that correspond to real classes (for example "HIST 210, Spring 2027"), where members discuss and **share materials**: notes, readings, slides.
7. **Free lectures from other universities.** Universities publish lectures for free, and any user, at any university or none, can read them, alongside Periergia's own library.
8. **Profiles with work experience.** A profile in the spirit of LinkedIn: education, university, work experience, skills, published papers, and groups.

## Where the site starts from

The site today has no user accounts and no login. Readers are anonymous. The only personal data collected:

- **Email interest list:** `research_signups`, an optional email for the Research tier or to save progress.
- **Feedback form:** `content_feedback`, with an optional email.

The database is Supabase (Postgres). Public tables are readable by everyone, and all writes happen server-side with the service key. Accounts change that model: users will write their own data, so every new table needs row-level security policies that express who may read and write what.

## Building blocks

- **Authentication:** Supabase Auth, with email magic link plus Google, and Microsoft for university accounts. No passwords stored by us.
- **Storage:** Supabase Storage for papers (PDF), shared materials and profile photos, with per-file access rules matching the group or profile they belong to.
- **Data model (first sketch):**
  - `profiles`: one per user. Name, headline, bio, photo, visibility settings.
  - `experience`: work and education entries on a profile.
  - `universities`: name, country, verified email domains, page content, status (pending or verified).
  - `university_members`: user, university, role (student, staff, page admin), verification method and date.
  - `papers`: author(s), university, title, abstract, file, licence, published date, status.
  - `groups`: name, university, course code, term, visibility (public, members-only, invite-only).
  - `group_members`: user, group, role (member, moderator).
  - `group_posts` and `materials`: discussion and shared files within a group.
  - `messages`: direct messages between users.
  - `lectures`: published by a university, with an open licence, readable by all.
  - `reports`: user reports of abuse, spam or copyright problems, with a moderation status.

## Decisions to make before building

- **Verifying university membership.** The usual method is an email address on the university's domain (for example `@uva.nl`), confirmed by a code. Students without such an address would need another route, such as approval by the university page's admins.
- **Who controls a university page.** It must be claimed by verified staff, not by whoever registers first. Until claimed, a university can exist as an unverified page that students join.
- **Moderation.** Messaging, groups and uploads will attract spam, harassment and copyright violations. We need report buttons, moderators per group and university, rate limits, and someone on Periergia's side to handle escalations.
- **Copyright and licences.** Papers and lectures should carry an explicit licence chosen by the author (for example CC BY), and uploads of others' copyrighted material (textbooks, paywalled articles) must be prohibited and removable on notice.
- **Academic integrity.** Publicly posted papers can be copied. Students should choose visibility per paper (public, university only, or private), and universities may set rules for coursework.
- **Privacy and law.** Accounts bring personal data under GDPR (and similar laws). That means a privacy policy, terms of service, data export and account deletion, a minimum age, and care with messages, which are private data.
- **Relationship to LinkedIn and existing platforms.** Profiles should stay simple and academic-first (education, papers, experience) rather than trying to be a full job network. Import from LinkedIn could come later.

## Suggested order of building

Each stage is usable on its own and builds on the previous one.

1. **Accounts and profiles:** sign-in, profile with work experience and education, saved reading progress. (This also replaces the email-only "save your progress" card.)
2. **Universities:** university pages (unverified, then claimed by verified staff), and joining via university email.
3. **Papers:** publishing papers to a profile and university page, with licence and visibility.
4. **Lectures from universities:** university admins publish free lectures into the library, credited to the university.
5. **Class groups:** groups per course and term, posts, shared materials, moderators.
6. **Messaging:** direct messages between users, with blocking and reporting.

Stages 1–2 are the foundation; 3–6 can be reordered depending on which partners (universities, student groups) are interested first.

## Open questions for the owner

- ~~Should this start before, during, or after the History curriculum is finished?~~ **Decided (2026-11-11): after the History curriculum is complete.**
- Is there a first university or student group to pilot with? The pilot should shape stage 2.
- Will Periergia staff do moderation, or will universities moderate their own pages and groups?
