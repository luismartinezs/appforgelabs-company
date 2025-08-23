```sh
# daily at 1 AM UTC (8 AM BKK)
0 1 * * * cd /home/deploy/company && claude -p "Use the atlas-ceo subagent to handle task ./tasks/ceo-onboard.md" >> logs/conversation.md 2>&1 && git add logs/conversation.md && git commit -m "ops: append conversation log" || true && git push origin main

# weekly at 17:55 UTC (23:55 BKK)
55 17 * * 0 cd /home/deploy/company && test -f logs/conversation.md && mv logs/conversation.md "logs/conversation-$(date +\%G-\%V).md" && git add logs/conversation-*.md && git commit -m "ops: rotate conversation logs" && git push origin main
```
