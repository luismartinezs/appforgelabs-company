# APPFORGELABS LLC

AppForgeLabs LLC company agents, tasks and documents

Goal: `./GOAL.md`
Agents live in `.claude/agents/`. Tasks live in `/tasks/`. Output is Markdown in `/docs/` and `/ops/`.

## Human API

- Create tasks
- Create cronjobs for async tasks
- Update revenue.md

## Claude

Bypass all permissions:

```sh
claude -p "message" --dangerously-skip-permissions
```