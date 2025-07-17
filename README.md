<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

<em>Streamline Your Home Lab with Ease and Efficiency</em>

<!-- BADGES -->
<!-- local repository, no metadata badges. -->

<em>Built with the tools and technologies:</em>

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
	- [Project Index](#project-index)
- [Getting Started](#getting-started)
	- [Prerequisites](#prerequisites)
	- [Installation](#installation)
	- [Usage](#usage)

---

## Overview

**Source Code Summaries**

**WIP! THIS IS FOR PERSONAL USE AND TRACKING**

This project provides a comprehensive toolset for containerized application deployment, simplifying the complexity of managing multiple services and environments. The core features include:

- **🔥 [Container Orchestration]:** Simplify the deployment and management of multiple services with a single configuration file.
- **💻 [Environment Settings Management]:** Centralize project-wide settings, including system ports, web ports, credentials, and timezone settings.
- **📁 [File Management]:** Optimize storage management with scripts for hardlinking files and categorizing torrents.
- **🔒 [Security and Filtering]:** Configure AdGuard Home service for DNS filtering and ad blocking.
- **🚀 [Service Configuration]:** Detailed configurations for each service, ensuring seamless integration with the host system and other services.

---

## Features

|      | Component       | Details                              |
| :--- | :-------------- | :----------------------------------- |
| ⚙️  | **Architecture**  | <ul><li>Monolithic architecture</li></ul> |
| 📄 | **Documentation** | <ul><li>Docker documentation available in `docker-compose.yaml` file</li></ul> |
| 🔌 | **Integrations**  | <ul><li>Integration with Docker and shell scripts</li></ul> |
| 📦 | **Dependencies**  | <ul><li>`env-default`, `docker-compose.yaml`, and `shell` as project dependencies</li></ul> |

---

## Project Structure

```sh
└── /
    ├── README.md
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
    ├── netalertx
    │   └── docker-compose.yaml
    ├── nginx-proxy-manager
    │   └── docker-compose.yaml
    └── wireguard
        └── docker-compose.yaml
```

### Project Index

<details open>
	<summary><b><code>/</code></b></summary>
	<!-- __root__ Submodule -->
	<details>
		<summary><b>__root__</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ __root__</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- Configures and orchestrates multiple containerized applications through Docker Compose.The file includes references to various services such as Jellyfin media server, NetAlertX alert system, FileBrowser file manager, AdGuard DNS filter, Nginx proxy manager, WireGuard VPN, and ARRs QBitTorrent client<br>- It enables users to easily manage and deploy these services in a containerized environment.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/env-default'>env-default</a></b></td>
					<td style='padding: 8px;'>- Configures global environment settings for the home-lab project, including system ports, web ports, and credentials<br>- Defines paths for media stacks, such as config folders, media storage, and download directories<br>- Establishes timezone and user settings to ensure consistent configuration across all components<br>- Provides a centralized location for managing project-wide settings.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- jellyfin Submodule -->
	<details>
		<summary><b>jellyfin</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ jellyfin</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/jellyfin/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>Configures the Jellyfin service within the Docker environment, defining its container settings, network mode, and volume mappings to ensure seamless integration with the host system and other services.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- netalertx Submodule -->
	<details>
		<summary><b>netalertx</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ netalertx</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/netalertx/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- Configures the Netalertx service within a Docker container environment, utilizing the jokobsk/netalertx image and mapping local configuration, database, and log directories to the containers file system<br>- Also sets environment variables for timezone and web UI port<br>- This setup enables deployment of the Netalertx application with specified configurations.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- filebrowser Submodule -->
	<details>
		<summary><b>filebrowser</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ filebrowser</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/filebrowser/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>One for media storage and another for configuration settings.Enables restart policy unless the container is manually stopped.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- nginx-proxy-manager Submodule -->
	<details>
		<summary><b>nginx-proxy-manager</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ nginx-proxy-manager</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/nginx-proxy-manager/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>Configures the Nginx Proxy Manager service within a Docker environment, exposing public HTTP, HTTPS, and admin web ports for external access while mapping internal volumes for data storage and Lets Encrypt configuration.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- file-hardlinker Submodule -->
	<details>
		<summary><b>file-hardlinker</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ file-hardlinker</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/file-hardlinker/qbit-hardlinker.sh'>qbit-hardlinker.sh</a></b></td>
					<td style='padding: 8px;'>- Hardlinks files from the downloads/complete directory to the downloads/peliculas directory based on torrent category, excluding certain categories and logging actions<br>- The script processes incoming torrents, categorizes them, and copies or links files accordingly, ensuring efficient storage management within the specified directories.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- wireguard Submodule -->
	<details>
		<summary><b>wireguard</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ wireguard</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/wireguard/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>A WireGuard VPN server* A WireGuard-UI interface for managing clients and configurationsIt defines container settings, network access, and dependencies between services.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- adguard Submodule -->
	<details>
		<summary><b>adguard</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ adguard</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/adguard/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- Configures and runs the AdGuard Home service within a Docker container environment, exposing DNS and web interface ports, and mounting configuration and working directories from the host system<br>- The service is restartable unless explicitly stopped, ensuring continuous operation of the ad blocking and filtering functionality.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- arrs-qbit Submodule -->
	<details>
		<summary><b>arrs-qbit</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ arrs-qbit</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/arrs-qbit/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- Configures and orchestrates the deployment of various media management containers, including qBittorrent, Radarr, Sonarr, Prowlarr, Bazarr, FlareSolverr, and Jellyseerr<br>- Defines environment variables, ports, volumes, and restart policies to ensure seamless operation and data synchronization across containers.</td>
				</tr>
			</table>
		</blockquote>
	</details>
</details>

---

## Getting Started

### Prerequisites

This project requires the following dependencies:

- **Programming Language:** Shell
- **Container Runtime:** Docker, docker compose

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

3. **Install the dependencies:**

<!-- SHIELDS BADGE CURRENTLY DISABLED -->
- docker runtime
- docker compose

### Usage

Run the project with:

**Using [docker](https://www.docker.com/):**
```sh
# Copy env-default to an .env file and run profiles
cp env-default .env
docker compose --profiles arrs up -d
docker compose --profiles jellyfin up -d
docker compose --profiles netalertx up -d
docker compose --profiles filebrowser up -d
docker compose --profiles nginx up -d
docker compose --profiles adguard up -d
docker compose --profiles wireguard up -d
docker compose --profiles n8n up -d
docker compose --profiles openwebui up -d
```
