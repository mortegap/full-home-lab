# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Home lab ecosystem using Docker Compose to orchestrate multiple self-hosted services: media streaming (Jellyfin, qBittorrent, Arrs stack), monitoring (Prometheus/Grafana/Loki), workflow automation (n8n with Ollama), networking (Nginx Proxy Manager, AdGuard, Wireguard), and various utilities.

## Commands

### Service Management
```bash
# Start a specific service profile
docker compose --profile arrs up -d
docker compose --profile jellyfin up -d
docker compose --profile monitoring up -d
docker compose --profile n8n up -d
docker compose --profile openwebui up -d
docker compose --profile spliit up -d
docker compose --profile portainer up -d

# Validate compose configuration
docker-compose config
docker-compose -f path/to/docker-compose.yaml config
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
- `arrs-qbit/` - Media automation stack (qBittorrent, Radarr, Sonarr, Prowlarr, Bazarr, Jellyseerr)
- `monitoring/` - Full observability stack (Prometheus, Grafana, Alertmanager, Loki, Promtail, cAdvisor)
- `n8n/` - Workflow automation with PostgreSQL and Qdrant vector DB
- `file-hardlinker/` - Post-download script for organizing torrents by category

### Volume Strategy
- `${GLOBAL_CONFIG_FOLDER}` - All service configurations
- `${GLOBAL_MEDIA_FOLDER}` - Media library root
- Services run with `PUID:PGID` for consistent file permissions

## Code Style

**YAML**: 2-space indentation, validate with `docker-compose config`

**Bash**: 4-space indentation, use `set -e`, check `$?`, log errors to files

**Naming**: Bash variables `lowercase_snake_case`, YAML keys `kebab-case`, env vars `UPPER_SNAKE_CASE`

**Secrets**: Never hardcode; always use `.env` file
