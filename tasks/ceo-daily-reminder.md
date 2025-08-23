# Task: Daily revenue check-in and status ping
## Context
Luis maintains `/ops/revenue.md`. Atlas must remind and report daily status.
## Deliverable
1) Append today’s status line to `docs/journal/YYYY-MM-DD.md` (create if missing) under **Focus** and **Next tasks**.
2) Create `docs/decisions/YYYY-MM-DD-revenue-checkin.md` with:
   - One-paragraph status summary (what moved, blockers).
   - “Revenue update requested” note (Luis-owned).
   - Top next task for Atlas, one line.
3) Send Telegram via `scripts/notify_telegram.sh`:
   `Atlas CEO — YYYY-MM-DD: <10–15 word status>. Luis: please update /ops/revenue.md if changed. Next: <top next task>.`
## Done when
- Journal updated for today.
- Decision doc exists at the exact path above.
- Telegram reports success (exit 0).
## Constraints
- No external data sources. Keep total edits ≤ 60 lines.
