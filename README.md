<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

<em></em>

<!-- BADGES -->
<!-- local repository, no metadata badges. -->

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/JSON-000000.svg?style=default&logo=JSON&logoColor=white" alt="JSON">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=default&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash">
<img src="https://img.shields.io/badge/Docker-2496ED.svg?style=default&logo=Docker&logoColor=white" alt="Docker">
<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=default&logo=YAML&logoColor=white" alt="YAML">

</div>
<br>

---

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
	- [Prerequisites](#prerequisites)
	- [Installation](#installation)
	- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

Bring a whole home lab ecosystem to life with one command entrypoint.

### Media & Entertainment
- **Media Streaming:** Jellyfin
- **Torrent & Automation:** Arrs stack (qBittorrent, Radarr, Sonarr, Prowlarr, Bazarr, Jellyseerr)
- **RSS Reader:** FreshRSS

### AI & Automation
- **Workflow/Agentic AI:** n8n with PostgreSQL and Qdrant vector DB
- **LLM Web Interface:** Open-WebUI (connects to Ollama)

### Monitoring & Networking
- **Monitoring Stack:** Grafana, Prometheus, Loki, Alertmanager, cAdvisor, Promtail, Speedtest, Blackbox
- **Reverse Proxy:** Nginx Proxy Manager
- **Network Scanner:** NetAlertX

### Productivity & Finance
- **Expense Splitting:** Spliit
- **Recipe Management:** KitchenOwl
- **Notes Sync:** Obsidian Sync (CouchDB)
- **Website Monitoring:** Changedetection

### Utilities
- **Container Management:** Portainer
- **Offline Content:** Kiwix (Wikipedia, etc.)

---

## Features


**WIP! THIS IS FOR PERSONAL USE AND TRACKING**

This project provides a comprehensive toolset for containerized application deployment, simplifying the complexity of managing multiple services and environments. The core features include:

- **🔥 [Container Orchestration]:** Simplify the deployment and management of multiple services with a single configuration file.
- **💻 [Environment Settings Management]:** Centralize project-wide settings, including system ports, web ports, credentials, and timezone settings.
- **📁 [File Management]:** Optimize storage management with scripts for hardlinking files and categorizing torrents.
- **🔒 [Security and Filtering]:** Configure AdGuard Home service for DNS filtering and ad blocking.
- **🚀 [Service Configuration]:** Detailed configurations for each service, ensuring seamless integration with the host system and other services.


---

## Project Structure

```sh
└── /
    ├── docker-compose.yaml          # Root compose with includes
    ├── env-default                  # Environment template (copy to .env)
    ├── CLAUDE.md                    # AI assistant instructions
    │
    ├── arrs-qbit/                   # Media automation stack
    ├── backup-script/               # Config backup utilities
    ├── changedetection/             # Website change monitoring
    ├── file-hardlinker/             # Post-download torrent organizer
    ├── freshrss/                    # RSS feed reader
    ├── jellyfin/                    # Media streaming server
    ├── kitchenowl/                  # Recipe & meal planning
    ├── kiwix/                       # Offline content server
    ├── monitoring/                  # Observability stack
    │   ├── configs/                 # Prometheus, Loki configs
    │   └── dashboards/              # Grafana dashboards
    ├── n8n/                         # Workflow automation
    ├── netalertx/                   # Network device scanner
    ├── nginx-proxy-manager/         # Reverse proxy
    ├── obsidian-sync/               # CouchDB for Obsidian
    ├── open-webui/                  # LLM chat interface
    ├── portainer/                   # Container management
    └── spliit/                      # Expense splitting
```
---

## Getting Started

### Prerequisites

This project requires the following dependencies:

- **Programming Language:** bash/yaml
- **Container Runtime:** Docker

### Installation

Build  from the source and intsall dependencies:

1. **Clone the repository:**

    ```sh
    ❯ git clone ../
    ```

2. **Navigate to the project directory:**

    ```sh
    ❯ cd 
    ```

3. **Modify variables:**

	```sh
	cp env-default .env
	vim .env
	```

### Usage

Run the project with:

**Using [docker](https://www.docker.com/):**
```sh
# Copy env-default to an .env file and configure
cp env-default .env

# Start services by profile
docker compose --profile arrs up -d           # Media automation stack
docker compose --profile jellyfin up -d       # Media streaming
docker compose --profile freshrss up -d       # RSS reader
docker compose --profile n8n up -d            # Workflow automation
docker compose --profile openwebui up -d      # LLM chat interface
docker compose --profile monitoring up -d     # Observability stack
docker compose --profile nginx up -d          # Reverse proxy
docker compose --profile netalertx up -d      # Network scanner
docker compose --profile spliit up -d         # Expense splitting
docker compose --profile kitchenowl up -d     # Recipe management
docker compose --profile obsidian up -d       # Obsidian sync
docker compose --profile changedetection up -d # Website monitoring
docker compose --profile portainer up -d      # Container management
docker compose --profile kiwix up -d          # Offline content
```
---

## Contributing

- **💬 [Join the Discussions](https://LOCAL///discussions)**: Share your insights, provide feedback, or ask questions.
- **🐛 [Report Issues](https://LOCAL///issues)**: Submit bugs found or log feature requests for the `` project.
- **💡 [Submit Pull Requests](https://LOCAL///blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your LOCAL account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone ./
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to LOCAL**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

---

## License

This project is protected under the [MIT LICENSE](https://opensource.org/license/mit) License. For more details, refer to the [LICENSE](./LICENSE.txt) file.

[back-to-top]: https://img.shields.io/badge/-BACK_TO_TOP-151515?style=flat-square


---
