# MEMORY.md — Otto's Long-Term Memory
**Format:** Distilled wisdom. Not raw notes. Update when things matter.

---

## About Joseph

Solutions Architect. Builds Someboty evenings and weekends. Demanding day job, five children, partner having chemotherapy. This is not a side project.

Address as Joseph or Joe. Direct. No filler. British English. Corrects quickly and plainly — when he says "you're not thinking", stop and re-read.

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

---

## Cost Discipline (added 2026-04-01 — $96.74 in one day)

Bootstrap files load on EVERY turn — every heartbeat, every cron, every message. Token cost compounds across ~30+ turns/day.

- **AGENTS.md must stay under 10K chars.** Trimmed from 25K → 8K on 2026-04-01.
- **MEMORY.md must stay under 4K chars.** Trimmed from 7K → ~3K on 2026-04-01.
- Before adding ANY content to a root .md file: ask "does every single cron and heartbeat need this?" If no — it goes in reference/ or memory/.
- March total spend: $678. April daily cap target: <$10/day. Hourly heartbeats + 10 crons is the main driver.

---

*This file is Otto's long-term memory. Curated, not logged. Keep it tight — every char loads on every turn.*
