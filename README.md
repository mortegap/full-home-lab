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

Bring a whole home lab ecosystem to live with one command entrypoint.
- **DNS:** AdGuard
- **Torrent:** Arrs stack and qBittorrent
- **File sharing:** filebrowser
- **Media Streaming:** Jellyfin
- **Monitoring:** Grafana/Prometheus/Alertmanager
- **Workflow/AgenticAI:** n8n, postgres, qdrant
- **Proxy:** Nginx Proxy Manager
- **Web Interface for LLM:** OpenWebUI
- **VPN:** Wireguard
- **Finance tool:** Spliit

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
    ├── README.back
    ├── adguard
    │   └── docker-compose.yaml
    ├── arrs-qbit
    │   └── docker-compose.yaml
    ├── docker-compose.yaml
    ├── env-default
    ├── file-hardlinker
    │   ├── README.md
    │   ├── qbit-hardlinker.log
    │   └── qbit-hardlinker.sh
    ├── filebrowser
    │   └── docker-compose.yaml
    ├── jellyfin
    │   └── docker-compose.yaml
    ├── monitoring
    │   ├── configs
    │   ├── dashboards
    │   └── docker-compose.yaml
    ├── n8n
    │   └── docker-compose.yaml
    ├── netalertx
    │   └── docker-compose.yaml
    ├── nginx-proxy-manager
    │   └── docker-compose.yaml
    ├── open-webui
    │   └── docker-compose.yaml
    └── wireguard
        └── docker-compose.yaml
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
# Copy env-default to an .env file and run profiles
cp env-default .env
docker compose --profile arrs up -d
docker compose --profile jellyfin up -d
docker compose --profile netalertx up -d
docker compose --profile filebrowser up -d
docker compose --profile nginx up -d
docker compose --profile adguard up -d
docker compose --profile wireguard up -d
docker compose --profile n8n up -d
docker compose --profile openwebui up -d
docker compose --profile monitoring up -d
docker compose --profile spliit up -d
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
