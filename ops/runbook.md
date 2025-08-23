```sh
# daily
0 8 * * * cd /home/deploy/company && claude -p "Use the atlas-ceo subagent to handle task ./tasks/ceo-onboard.md" >> logs/conversation.log 2>&1 && git add logs/conversation.log && git commit -m "ops: append conversation log" || true && git push origin main

# weekly
55 23 * * 0 cd /home/deploy/company && test -f logs/conversation.log && mv logs/conversation.log "logs/conversation-$(date +\%G-\%V).log" && git add logs/conversation-*.log && git commit -m "ops: rotate conversation logs" && git push origin main
```
