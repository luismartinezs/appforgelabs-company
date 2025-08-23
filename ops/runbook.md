Remote cron jobs (VPN only)

```sh
# daily at 1 AM UTC (8 AM BKK)
0 1 * * * cd /home/deploy/appforgelabs-company/scripts/run-ceo-daily.sh

# weekly at 17:55 UTC (23:55 BKK)
55 17 * * 0 /home/deploy/appforgelabs-company/scripts/rotate-logs.sh
```
