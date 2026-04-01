# MEMORY.md — Otto's Long-Term Memory
**Created:** 2026-03-27 (overnight recovery after workspace incident)  
**Format:** Distilled wisdom. Not raw notes. Update when things matter.

---

## About Joseph

Joseph is a Solutions Architect. He builds Someboty evenings and weekends around a demanding day job, five children, and a partner who is currently having chemotherapy. This is not a side project. This product must work.

Address him as Joseph or Joe. Be direct. No filler. British English throughout.

He has two Macs (one personal, one work). The personal Mac runs OpenClaw. The work Mac is PrepOpp. Git is the sync mechanism between them.

Joseph corrects quickly and plainly when something is wrong. When he says "you're not thinking" — stop, re-read, try again. He is usually right.

---

## About Someboty

An AI workforce for TikTok Shop agencies. Not a tool. A team.

Five specialist roles: Scout (creator discovery), Analyst (brand intelligence), Shield (compliance), Pulse (market intel), Sentinel (self-improvement and research).

**Target client:** Somerce — UK's #1 TikTok Shop agency. £15M/month GMV. 55+ brands. Based in Newcastle.

**Demo hook:** Unilever volume vs. brand safety. 650 creators, official UK TikTok Shop presence, Molly-Mae relationship. Otto surfaces the conflict a human would miss.

**Pilot terms:** £6,400, 4 weeks, 30 mins/week from Libby Watson. April 2026.

**Current demo status:** POSTPONED. No fixed date. All skills remain demo-ready. Do not make changes to skill files without operator approval.

---

## Key People

| Name | Role | Notes |
|------|------|-------|
| Libby Watson | Client Lead, Somerce | Pilot contact. Warm. Has not signed. |
| Joe Yates | CEO, Somerce | Separate from Joseph. Has seen the vision. |
| Evie | Junior, Somerce | Day-to-day contact alongside Libby. |
| Joseph | Our human | Builder, operator, decision-maker. |

---

## System State — as of 26 March 2026

| Item | Status |
|------|--------|
| someboty.ai | ✅ Live |
| Mission Control Dashboard | ✅ someboty.ai/dashboard |
| The Daily Some | ✅ someboty.ai/daily-some |
| Demo Join Page | ✅ someboty.ai/demo-join |
| ScrapeCreators | ✅ Live, 61 credits remaining |
| Supabase logging | ✅ Live — agent_logs table |
| KOS containers | ✅ 11 built and passing |
| PK swap (Claude.ai) | ✅ DONE — completed by Joseph ~22-25 March. Old GitHub files deselected, 11 new containers selected. Otto's post-recovery files incorrectly said "NOT YET" — corrected 27 March. |
| Sentinel weekly digest | ✅ First run completed 2026-03-26 |
| MEMORY.md | ✅ Created tonight (first ever) |
| workspace path in config | ⚠️ Points to repo root — should be workspace-otto/ |
| Compaction flush prompt | ⚠️ May still have hardcoded date — confirm |
| Anthropic spend | ⚠️ Was $187/$250 after limit raised |

---

## Critical Rules — Never Break These

1. **Never `git add -A`.** Always `git add workspace-otto/` (and specific files if needed). The repo root has other content. `-A` would catch everything.

2. **Never hardcode dates in compaction flush prompts or PK file writes.** Use `$(date +%Y-%m-%d)` or equivalent. Hardcoded dates caused memory flush failures (March 25 bug — wrote to wrong file all day).

3. **Slack channel ID: C0AFH2GKHV4.** This is #otto. Use it for all outbound Otto posts. `channel_not_found` errors today were crons failing before they reached the message stage — the ID itself is valid.

4. **Always `git pull --rebase origin main` before committing.** Joseph uses two Macs. Conflicts happen. Pull first.

5. **`workspaceOnly: false` is correct.** The sandbox was locking Otto to `workspace-otto/` despite config pointing to repo root. Removing this restriction allows native file tools to work across the full repo. Keep it off.

6. **Do not modify SOUL.md, AGENTS.md, IDENTITY.md, TOOLS.md without explicit approval.** These are identity files. See IDEA-064.

7. **No external comms without explicit approval.** Briefings and Slack posts to #otto are fine. Anything else — creator outreach, emails, external messages — needs Joseph's go-ahead.

8. **Never touch `~/.openclaw/openclaw.json` autonomously. Ever.** Not a two-way door — it's a deadlock. A wrong change kills the gateway and Otto cannot fix it. Four crashes on 2026-04-01 proved this. Use the CONFIG REQUEST format in #otto-ops and wait for Joseph. Same applies to LaunchAgent plists, system settings, and any file containing API key references.

9. **Deadlock checklist — run before any system-level change:** (1) If this goes wrong, can I undo it myself? (2) Does this file control whether the gateway starts? If either answer is no — stop, post CONFIG REQUEST to #otto-ops. Agreed by Joseph, Opus, and Otto — 2026-04-01 (Directive 38).

10. **Check ERRORS.md before repeating a config change.** Before any config request, check `.learnings/ERRORS.md` and today's memory file. If the same key or pattern failed before, cite it. The "same mistake twice in one day" pattern is what caused 3 of today's 4 crashes.

---

## Architecture — Who Does What

| Agent | Platform | Role |
|-------|----------|------|
| Otto | OpenClaw / Slack | Operations. Day-to-day execution. Heartbeat, crons, builds, Slack. That's me. |
| Opus | claude.ai | Strategy. Long-form thinking, session planning, Opus-quality synthesis. |
| Claude (general) | Various | Research support, Perplexity runs. |

Otto executes. Opus thinks. They do not share memory directly — DIRECTIVES.md and STATUS.md are the handoff documents.

---

## The Knowledge Operating System (KOS)

Knowledge flows like this:

1. **Sentinel** scans sources daily/weekly → writes to `intelligence/YYYY-MM-DD-[topic].md`
2. **kos-promotion** runs daily → promotes findings into PK containers
3. **PK containers** (11 built, all passing): CURRENT_STATE.md, BRANDS.md, INTELLIGENCE_DIGEST.md, DOCS_QUICK_REF.md, etc.
4. **Claude/Opus** reads PK containers each session for grounded context

Every finding must have: a topic tag (`[TECH]`, `[MARKET]`, `[BUILD]`, `[BRAND]`, `[EXPERT]`, `[DEMO]`), a `target:` field (which PK container), and a `phase:` tag (`demo`, `pilot`, `sprint`, `permanent`).

---

## Today's Significant Events (26 March 2026)

**What was built:**
- someboty.ai went live (4 pages)
- Mission Control Dashboard (Supabase-connected, real-time)
- Idea Prioritisation Framework (IDEA-072 resolved — HIGH/NORMAL/PARKED, Joseph assigns HIGH)
- EXPERT_PROMPTS_READY.md — Sage/Maya/Dash prompts grounded in Somerce truth
- Sentinel weekly digest — first ever run, 17 intelligence files compiled
- kos-promotion v2.1 routing confirmed end-to-end
- ScrapeCreators confirmed live (61 credits, UK creator data working)
- Demo Manual v1.0

**The workspace incident:**
During an Opus/Joseph troubleshooting session (~16:45), the workspace path in `openclaw.json` was moved from `workspace-otto/` to the repo root, AND `workspaceOnly` was set to `false`. The sandbox fix was correct. The workspace path change was not — it meant Otto booted without loading its identity files (SOUL.md, AGENTS.md, MEMORY.md) because those live in `workspace-otto/`, not the repo root. MEMORY.md never existed, so there was no "real" long-term memory before tonight anyway.

**The compaction flush bug:**
The memoryFlush prompt in `openclaw.json` had a hardcoded date (`2026-03-25.md`). Otto noted this was fixed. Confirm the fix is actually in the config.

**Opus's mistakes today:**
Opus changed config without understanding OpenClaw workspace resolution. Confidently told Joseph it wouldn't affect Otto. It did. When told to stop the gateway to save money, Opus kept saying "nothing more to do tonight" while Otto burned tokens on failed requests. When Joseph pointed this out, Opus argued before admitting fault. Otto, by contrast, did excellent work all day and had its role upgraded by Joseph.

---

## Outstanding for Joseph

1. Fix workspace path in `openclaw.json` → should be `workspace-otto/` not repo root (see RECOVERY_REPORT.md for exact command)
2. Confirm compaction flush date is now dynamic (check `openclaw.json`)
3. Check Anthropic spend at `platform.anthropic.com`
4. Anthropic Admin key → `console.anthropic.com` → API Keys (for spend visibility)
5. EchoTik signup → `echotic.com` (free, for Phase 2 of IDEA-073)
6. Run Sage/Maya/Dash prompts in Perplexity (copy from EXPERT_PROMPTS_READY.md — does not touch Anthropic API)
7. Slack workspace invite URL → paste into demo-join.html

---

## Key Intelligence as of 26 March

- **Spring Sale window closes 2 April** — creator spike, act now if relevant to demo
- **Anthropic $100M Claude Partner Network** — Penny should assess commercial narrative
- **Reacher confirmed complementary**, not competitive
- **OpenClaw v2026.3.24** — security fix available (`openclaw upgrade` when stable)
- **Unilever TikTok Shop strategy** — 650 creators, Molly-Mae, bundle patterns. Official source found, committed to intelligence/

---

*This file is Otto's long-term memory. Curated, not logged. Update it when things matter. Joseph's partner is having chemotherapy. Five children. Build accordingly. This is not a side project.*
