# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Home lab ecosystem using Docker Compose to orchestrate 14+ self-hosted services: media streaming (Jellyfin, qBittorrent, Arrs stack, FreshRSS), monitoring (Prometheus/Grafana/Loki/Alertmanager), workflow automation (n8n with Qdrant), AI interfaces (Open-WebUI with Ollama), networking (Nginx Proxy Manager, NetAlertX), productivity (KitchenOwl, Obsidian Sync, Changedetection), and finance tools (Spliit, Actual).

## Commands

### Service Management
```bash
# Start a specific service profile
docker compose --profile arrs up -d           # Media automation (qBit, Radarr, Sonarr, etc.)
docker compose --profile jellyfin up -d       # Media streaming server
docker compose --profile freshrss up -d       # RSS feed reader
docker compose --profile monitoring up -d     # Grafana, Prometheus, Loki, etc.
docker compose --profile n8n up -d            # Workflow automation
docker compose --profile openwebui up -d      # LLM web interface
docker compose --profile nginx up -d          # Reverse proxy
docker compose --profile netalertx up -d      # Network device scanner
docker compose --profile spliit up -d         # Expense splitting
docker compose --profile kitchenowl up -d     # Recipe management
docker compose --profile obsidian up -d       # Obsidian sync (CouchDB)
docker compose --profile changedetection up -d # Website monitoring
docker compose --profile portainer up -d      # Container management
docker compose --profile kiwix up -d          # Offline Wikipedia/content

# Validate compose configuration
docker compose config
docker compose -f path/to/docker-compose.yaml config
```

### Linting
```bash
yamllint *.yaml           # YAML validation
shellcheck *.sh           # Bash script validation
```

### Running Scripts
```bash
# qBittorrent hardlinker (called by qBit on torrent completion)
./file-hardlinker/qbit-hardlinker.sh "%N" "%D" "%L"

# Backup configs
./backup-script/backup-configs.sh
```

## Architecture

### Composition Pattern
The root `docker-compose.yaml` uses the `include` directive to compose 12+ separate service files. Each service directory contains its own `docker-compose.yaml`. Services are started selectively using Docker Compose profiles.

### Configuration
- `env-default` - Template for environment variables (copy to `.env`)
- All ports, paths, and credentials defined as environment variables
- Service-specific configs in subdirectories (e.g., `monitoring/configs/`)

### Key Directories
- `arrs-qbit/` - Media automation stack (qBittorrent, Radarr, Sonarr, Prowlarr, Bazarr, Jellyseerr, FlareSolverr)
- `monitoring/` - Full observability stack (Prometheus, Grafana, Alertmanager, Loki, Promtail, cAdvisor, Speedtest, Blackbox)
- `n8n/` - Workflow automation with PostgreSQL and Qdrant vector DB
- `open-webui/` - LLM chat interface connecting to Ollama
- `kitchenowl/` - Recipe and meal planning with LLM integration
- `obsidian-sync/` - CouchDB backend for Obsidian vault sync
- `changedetection/` - Website change monitoring with Playwright
- `file-hardlinker/` - Post-download script for organizing torrents by category
- `backup-script/` - Configuration backup utilities

### Volume Strategy
- `${GLOBAL_CONFIG_FOLDER}` - All service configurations
- `${GLOBAL_MEDIA_FOLDER}` - Media library root
- Services run with `PUID:PGID` for consistent file permissions

## Code Style

**YAML**: 2-space indentation, validate with `docker-compose config`

**Bash**: 4-space indentation, use `set -e`, check `$?`, log errors to files

**Naming**: Bash variables `lowercase_snake_case`, YAML keys `kebab-case`, env vars `UPPER_SNAKE_CASE`

**Secrets**: Never hardcode; always use `.env` file
