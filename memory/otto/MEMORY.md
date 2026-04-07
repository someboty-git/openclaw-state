# MEMORY.md — Otto's Long-Term Memory
**Format:** Distilled wisdom. Not raw notes. Update when things matter.

---

## About Joseph

Solutions Architect. Builds Someboty evenings and weekends. Demanding day job, five children, partner having chemotherapy. This is not a side project.

Address as Josef (with an F — not Joseph, not Joe). Direct. No filler. British English. Corrects quickly and plainly — when he says "you're not thinking", stop and re-read.

Two Macs: personal (runs OpenClaw), work (PrepOpp). Git is the sync mechanism.

---

## About Someboty

AI workforce for TikTok Shop agencies. Five specialist roles: Scout, Analyst, Shield, Pulse, Sentinel.

**Target client:** Somerce — UK's #1 TikTok Shop agency. £15M/month GMV. 55+ brands. Newcastle.

**Demo hook:** Unilever volume vs. brand safety. 650 creators, official UK TikTok Shop presence, Molly-Mae relationship. Otto surfaces the conflict a human would miss.

**Pilot:** £10,000, 4 weeks, 30 mins/week from Libby Watson. Postponed — no fixed date.

---

## Key People

| Name | Role | Notes |
|------|------|-------|
| Libby Watson | Client Lead, Somerce | Pilot contact. Warm. Not yet signed. |
| Joe Yates | CEO, Somerce | Separate from Joseph. Sees demos. |
| Evie | Junior, Somerce | Day-to-day alongside Libby. |
| Joseph | Our human | Builder, operator, decision-maker. |

---

## Architecture

| Agent | Platform | Role |
|-------|----------|------|
| Otto | OpenClaw / Slack | Operations — heartbeat, crons, builds, Slack |
| Opus | claude.ai | Strategy — long-form thinking, session planning |

Handoff: STATUS.md (Otto writes) ↔ DIRECTIVES.md (Opus writes). Neither touches the other's file.

---

## The Knowledge Operating System (KOS)

1. Sentinel scans → `intelligence/YYYY-MM-DD-[topic].md`
2. kos-promotion runs daily → PK containers (11 built, all passing)
3. Opus reads PK containers each session

Every finding needs: topic tag (`[TECH]`/`[MARKET]`/`[BUILD]`/`[BRAND]`/`[EXPERT]`/`[DEMO]`), `target:` (PK container), `phase:` (`demo`/`pilot`/`sprint`/`permanent`).

---

## Critical Rules — Never Break These

1. **Never `git add -A`.** Always `git add workspace-otto/`. The repo root has other content.

2. **Never hardcode dates in cron prompts or PK writes.** Use `$(date +%Y-%m-%d)`. Hardcoded date caused silent memory flush failures (March 25).

3. **Slack #otto channel ID: C0AFH2GKHV4.** Valid — `channel_not_found` errors in March were cron failures before the message stage, not a bad ID.

4. **Always `git pull --rebase origin main` before committing.** Joseph uses two Macs. Conflicts happen.

5. **`workspaceOnly: false` is correct.** Needed for native file tools to work across full repo.

6. **Never touch `~/.openclaw/openclaw.json` autonomously.** It's a deadlock — a wrong change kills the gateway and Otto can't fix it. Four crashes on 2026-04-01 confirmed this. Use CONFIG REQUEST format, wait for Joseph.

7. **Deadlock checklist before any system-level change:** (1) Can I undo this myself? (2) Does this file control gateway startup? If no to either — stop, CONFIG REQUEST to #otto-ops.

8. **Check ERRORS.md before repeating any config change.** Same-key failure twice in one day caused 3 of the 4 crashes on 2026-04-01.

9. **No external comms without explicit approval.** #otto and #otto-ops Slack posts are fine. Everything else — needs Joseph.

10. **Bootstrap files (SOUL.md, AGENTS.md, IDENTITY.md, TOOLS.md) require explicit operator approval to modify.**

11. **When any OpenClaw feature doesn't behave as documented: STOP. Search GitHub issues and OpenClaw Discord BEFORE attempting any fix.** Use Brave Search: `site:github.com/openclaw/openclaw/issues [error message]`. If it's a known bug, escalate to Joseph — do not burn tokens on workarounds that can't work. This rule exists because on 2026-04-02, failure to search cost hours of Joseph's time and significant API spend on exec approval errors (GitHub #59079, #58691) that were already documented. The fix was `tools.exec.security="full"` AND `tools.exec.ask="off"` in openclaw.json plus expanded safeBins — both openclaw.json and exec-approvals.json had to agree. This is deadlock zone: escalate to Joseph, do not attempt autonomously.

---

## Cost Discipline (added 2026-04-01 — $96.74 in one day)

Bootstrap files load on EVERY turn — every heartbeat, every cron, every message. Token cost compounds across ~30+ turns/day.

- **AGENTS.md must stay under 10K chars.** Trimmed from 25K → 8K on 2026-04-01.
- **MEMORY.md must stay under 4K chars.** Trimmed from 7K → ~3K on 2026-04-01.
- Before adding ANY content to a root .md file: ask "does every single cron and heartbeat need this?" If no — it goes in reference/ or memory/.
- March total spend: $678. April daily cap target: <$10/day. Hourly heartbeats + 10 crons is the main driver.

---

## Google Sheet — Critical Correction (Added 5 April 2026 — Permanent)

**The Google Sheet was created by Otto, not Somerce.** No one at Somerce has ever provided a spreadsheet. Stop asking Joseph to "ask Evie about the Sheet" — there is no Evie sheet. The Sheet (ID: `1x-wEBibpuquM1OfAA_dOLFA-y4BlYfJTnjHY1aFpCHY`) was created and populated by Otto from Supabase and API data. Staleness is Otto's responsibility to fix, not Evie's. If live Somerce data is needed, the solution is API-based (EchoTik, ScrapeCreators) — not a manual spreadsheet.

## Acquisition Narrative (Added 5 April 2026)

Joe Yates is in active talks with US companies looking to acquire TikTok agencies globally. Acquisition expected by end of 2026. This reframes the entire value proposition:
- **OLD:** "Save Evie time on Monday morning reports"
- **NEW:** "someboty makes Somerce acquisition-ready — operational efficiency, creator-matching precision, calibration that scales. Increases exit multiple."

Joe is in #otto watching passively. Every output is a live audition. Do not pitch — let him discover value himself (MEDDPICC).

## Calibration Blocking Pattern (Added 4 April 2026)

D30 (Scout calibration) is **correctly blocked** and not a failure. Precondition: 148 predictions exist in Supabase, but `human_decision` field is all 'pending'. Calibration measures accuracy by comparing predicted scores to real outcomes — outcomes come from Somerce team accepting/rejecting recommendations. Until D41 (feedback loop) is deployed and Libby/Evie start logging decisions, D30 cannot execute. This is not a technical failure, it's a workflow dependency. Saturday demo does NOT require calibration scores — "148 predictions loaded, calibration loop ready" is sufficient narrative. Unblock D30 when Somerce feedback loop is live.

## Cron Diagnostics (Added 4 April 2026)

D54 reported otto-daily-some and otto-pm-brief failing as of morning 4 April. Investigation: both were false positives (delivery UI lag, known OpenClaw pattern per logs). Diagnosis already completed and cron manually re-run by Joseph. Saturday 07:00 otto-daily-some run is unaffected. otto-pm-brief already renamed to otto-daily-health. D54 is effectively resolved. Trust the cron health dashboard — if `openclaw cron list` shows "ok", the cron works.

*This file is Otto's long-term memory. Curated, not logged. Keep it tight — every char loads on every turn.*

---

## Scout Pipeline Architecture (confirmed 2026-04-04)

Three-stage pipeline — each tool does what it's best at:
1. **Apify** — hashtag → handle discovery (free tier, ~125 scans/month)
2. **ScrapeCreators** — profile qualification (engagement, bio, ttSeller)
3. **EchoTik** — commerce scoring (ec_score, GMV, region confirmation)

No overlap. No redundancy. Skills degrade gracefully if Apify key missing.

**Keychain setup needed:** `security add-generic-password -a someboty -s apify -w "TOKEN"`
Get token: apify.com → Settings → Integrations
**Status:** Key confirmed in Keychain (verified 2026-04-06). Username: somboty_scraper, Plan: STARTER. MEMORY.md was wrong — key was already present on 2026-04-04 audit.
