# APPFORGELABS LLC

AppForgeLabs LLC company agents, tasks and documents

Goal: `./GOAL.md`
Agents live in `.claude/agents/`. Tasks live in `/tasks/`. Output is Markdown in `/docs/` and `/ops/`.

## Human tasks

- Create agentic tasks
- Create cronjobs for async tasks
- Update revenue.md

## Claude

Bypass all permissions:

```sh
claude -p "message" --dangerously-skip-permissions
```

## Cronjobs

```sh
# ssh to server
crontab -e
# update cron jobs
```

Run script using absolute paths, e.g. `/home/deploy/full/path/script-name.sh`
Use absolute paths also within script to prevent bugs