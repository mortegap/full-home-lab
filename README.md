# WHOLE PERSONAL HOME LAB 
## IMPORTANT: WIP!
## Apps in repo:
- AdGuard
- Arrs
- Jellyfin
- file-browser
- netalertx
- Nginx Proxy Manager
- wireguard

## How To:

```
# Copy env-default to an .env file and run profiles
cp env-default .env
docker compose --profiles arrs up -d
docker compose --profiles jellyfin up -d
docker compose --profiles netalertx up -d
```
