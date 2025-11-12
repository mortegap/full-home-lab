# AGENTS.md - Coding Guidelines for Home Lab Repository

## Project Overview

This repository contains a comprehensive Docker-based home lab ecosystem with multiple services for media management, monitoring, automation, and more. It provides a single-entrypoint deployment for a full home lab setup.

### Key Services
- **DNS & Security**: AdGuard Home (DNS filtering, ad blocking)
- **Torrenting**: Arrs stack (Radarr, Sonarr, Prowlarr, Bazarr, Jellyseerr) + qBittorrent
- **Media Streaming**: Jellyfin
- **Monitoring**: Grafana, Prometheus, Alertmanager, Loki, Promtail, cAdvisor
- **Automation/Workflows**: n8n (with PostgreSQL, Qdrant, Redis)
- **Proxy**: Nginx Proxy Manager
- **LLM Interface**: OpenWebUI (with Ollama integration)
- **VPN**: WireGuard
- **Finance**: Spliit (with PostgreSQL)
- **Container Management**: Portainer
- **Additional**: NetAlertX (network scanning), ChangeDetection (website monitoring), Kiwix (offline Wikipedia), Obsidian Sync, KitchenOwl (recipe management), Actual (budgeting)

### Utilities
- **backup-script**: Automated backup of service configurations
- **file-hardlinker**: Storage optimization script for qBittorrent downloads using hardlinks

## Project Structure

```
/
├── docker-compose.yaml          # Main compose file including all services
├── env-default                  # Default environment variables template
├── AGENTS.md                    # This file - coding guidelines
├── README.md                    # Project documentation
├── LICENSE.txt                  # MIT License
├── .gitignore                   # Git ignore rules
├── actual/                      # Budgeting service
├── arrs-qbit/                   # Torrenting stack
├── backup-script/               # Backup utilities
├── changedetection/             # Website change monitoring
├── file-hardlinker/             # Hardlinking utility
├── jellyfin/                    # Media server
├── kitchenowl/                  # Recipe management
├── kiwix/                       # Offline content
├── monitoring/                  # Observability stack
├── n8n/                         # Workflow automation
├── netalertx/                   # Network device scanning
├── nginx-proxy-manager/         # Reverse proxy
├── obsidian-sync/               # Note syncing
├── open-webui/                  # LLM web interface
├── portainer/                   # Docker management
└── spliit/                      # Expense splitting
```

Each service directory contains a `docker-compose.yaml` file with service-specific configuration.

## Environment Variables

Environment variables are managed via the `env-default` file. Copy this to `.env` and customize before deployment:

```bash
cp env-default .env
# Edit .env with your values
```

### Categories:
- **Global**: PUID/PGID (user/group IDs), UMASK, TIMEZONE, DOMAIN_NAME, SSL_EMAIL, OLLAMA_SERVER
- **Media Folders**: GLOBAL_CONFIG_FOLDER, GLOBAL_MEDIA_FOLDER, DOWNLOAD_COMPLETE_FOLDER, MOVIES_FOLDER, SERIES_FOLDER, STATIC_WEB_FOLDER
- **Web Ports**: Individual service web UI ports (e.g., WEBUI_PORT_JELLYFIN=8096, WEBUI_PORT_GRAFANA=3001)
- **System Ports**: Internal ports for torrenting (QBIT_PORT), DNS (ADGUARD_DNS), VPN (WIREGUARD_PORT), databases (POSTGRES_PORT, COUCHDB_PORT), Redis (REDIS_PORT)
- **Credentials**: WIREGUARD_USERNAME/PASSWORD, SERVER_PUBLIC_IP, OPENWEBUI_SECRET_KEY, GOOGLE_PSE_API_KEY/ENGINE_ID, POSTGRES_PASSWORD/USER, COUCHDB_USER/PASSWORD, KITCHENOWL_JWT_SECRET_KEY, OPENAI_API_KEY
- **Service-Specific**: N8N_ENCRYPTION_KEY, N8N_USER_MANAGEMENT_JWT_SECRET, N8N_DEFAULT_BINARY_DATA_MODE, SUBDOMAIN, POSTGRES_DB

**Security Note**: Never commit `.env` file. Use `.gitignore` to exclude it.

## Docker Compose Profiles

Services are organized into profiles for selective deployment. Use profiles to run only needed services:

```bash
docker compose --profile <service> up -d
```

Available profiles: `arrs`, `jellyfin`, `netalertx`, `nginx`, `n8n`, `openwebui`, `monitoring`, `spliit`, `portainer`, `obsidian`, `kitchenowl`, `changedetection`, `kiwix`, `actual`

Example: `docker compose --profile monitoring up -d` starts the full observability stack.

## Scripts and Utilities

### backup-script/
- **backup-configs.sh**: Automates backup of service configurations to prevent data loss
- **Usage**: `./backup-script/backup-configs.sh` - customize paths in script before running

### file-hardlinker/
- **qbit-hardlinker.sh**: Optimizes storage by creating hardlinks for qBittorrent downloads, saving disk space
- **README.md**: Documentation for the hardlinking utility
- **qbit-hardlinker.log**: Execution logs
- **Usage**: `./file-hardlinker/qbit-hardlinker.sh` - configure source/destination paths

## Build/Lint/Test Commands
- **Build**: `docker compose --profile <service> up -d` (e.g., `docker compose --profile monitoring up -d`)
- **Lint**: `yamllint *.yaml` for YAML files; `shellcheck *.sh` for Bash scripts; `docker-compose config` to validate compose files
- **Test**: No automated tests. Run Bash scripts manually: `./script.sh arg1 arg2 arg3`. Verify logs and file moves. After deployment, check service logs with `docker-compose logs <service>`.

## Code Style Guidelines
- **Imports/Formatting**: YAML: 2-space indentation, consistent quoting. Bash: 4-space indentation, no tabs.
- **Types/Naming**: Bash vars/functions: lowercase_snake_case. YAML keys: kebab-case. Env vars: UPPER_SNAKE_CASE.
- **Error Handling**: Bash: Use `set -e`, check `$?`, log errors to files. YAML: Validate with docker-compose config.
- **General**: Follow shellcheck/yamllint recommendations. Add comments for complex logic. No hardcoded secrets; use .env.

## Security and Best Practices

- **Environment Variables**: Never commit `.env` file to version control. Use `.gitignore` to exclude it.
- **Secrets Management**: Store sensitive credentials (API keys, passwords) in environment variables, not in code.
- **Network Security**: Services are exposed on configured ports; use firewall rules to restrict access.
- **Updates**: Regularly update Docker images to patch security vulnerabilities.
- **Backups**: Use the backup-script to maintain configuration backups.
- **Access Control**: Configure authentication for web UIs and APIs where available.

No Cursor or Copilot rules found.