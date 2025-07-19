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
	- [Project Index](#project-index)
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
					<td style='padding: 8px;'><b><a href='/README.back'>README.back</a></b></td>
					<td style='padding: 8px;'>- The <code>README.back</code> file is a draft README file for a home lab project<br>- It outlines the projects purpose (streamlining a home lab), lists the technologies used (Bash, Docker, YAML), and provides a table of contents for a more complete description (currently a work in progress)<br>- The files content suggests it's intended to serve as introductory documentation within the larger project's codebase.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- It orchestrates the deployment of multiple Dockerized applications<br>- The <code>docker-compose.yaml</code> file aggregates configurations from various sub-projects, including ARRs-qBittorrent, Jellyfin, NetAlertX, FileBrowser, AdGuard, Nginx Proxy Manager, WireGuard, n8n, and Open-WebUI, enabling their simultaneous management and execution within a single Docker Compose environment.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/env-default'>env-default</a></b></td>
					<td style='padding: 8px;'>- The <code>env-default</code> file centralizes configuration settings for a home-lab environment<br>- It defines user and group IDs, time zone, domain name, and crucial paths for media management<br>- Furthermore, it specifies port assignments for various web applications (e.g., Jellyfin, Radarr, Nginx) and system services (e.g., WireGuard, Redis), along with essential credentials and database parameters for applications like N8n.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- n8n Submodule -->
	<details>
		<summary><b>n8n</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ n8n</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/n8n/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- The <code>docker-compose.yaml</code> file configures a multi-container Docker environment for n8n, a workflow automation tool<br>- It defines services for a PostgreSQL database, the n8n application itself, and Qdrant, a vector database<br>- The configuration establishes networking, data volume persistence, and environment variable management, ensuring proper interaction between the components<br>- The file facilitates easy deployment and management of the n8n application.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- open-webui Submodule -->
	<details>
		<summary><b>open-webui</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ open-webui</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/open-webui/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- Docker-compose.yaml` configures the Open-WebUI Docker container<br>- It defines the container image, mounts a data volume, maps ports for external access, and sets environment variables to configure the application, including connections to external services like Ollama and Google Custom Search<br>- The configuration ensures the application runs persistently and accesses necessary resources.</td>
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
					<td style='padding: 8px;'>- Docker Compose orchestrates the Jellyfin media server deployment<br>- It defines a Jellyfin container using the latest image, maps host directories for configuration, cache, and media, and specifies network settings and restart policies<br>- Environment variables customize the setup, enabling user and group ID, timezone, and optional URL configuration<br>- The configuration facilitates easy deployment and management of the Jellyfin server within a Docker environment.</td>
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
					<td style='padding: 8px;'>- Docker Compose orchestrates the Netalertx service<br>- It defines the Netalertx container, utilizing a pre-built image and specifying host networking<br>- Configuration, database, and log volumes are mounted, enabling external management of these resources<br>- Environment variables manage time zone and port settings, ensuring flexible deployment.</td>
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
					<td style='padding: 8px;'>- Docker Compose configures the Filebrowser service<br>- It utilizes the <code>hurlenko/filebrowser</code> image, maps ports and volumes for persistent storage and configuration, and sets environment variables for base URL<br>- The service runs as a specified user and restarts unless manually stopped, integrating Filebrowser into the broader applications media management.</td>
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
					<td style='padding: 8px;'>- Docker Compose orchestrates the Nginx Proxy Manager application<br>- It defines the applications container image, port mappings for HTTP, HTTPS, and admin access, and environment variables for configuration<br>- Crucially, it manages persistent storage for application data and Lets Encrypt certificates, ensuring data persistence across container restarts<br>- The configuration facilitates easy deployment and management of the reverse proxy.</td>
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
					<td style='padding: 8px;'>- The script selectively hardlinks completed torrent downloads to designated movie or series directories based on their category<br>- It filters downloads by category, logging successes and failures<br>- Downloads categorized as movies or series are moved; others are skipped<br>- The script enhances a download management system by automating post-processing organization.</td>
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
					<td style='padding: 8px;'>- A WireGuard server and a WireGuard-UI web interface<br>- The configuration manages networking, ports, volumes for persistent data and configuration, and dependencies between the services, enabling easy setup and management of the VPN<br>- Environment variables control settings like email notifications and user authentication.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- monitoring Submodule -->
	<details>
		<summary><b>monitoring</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ monitoring</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/monitoring/docker-compose.yaml'>docker-compose.yaml</a></b></td>
					<td style='padding: 8px;'>- The <code>docker-compose.yaml</code> file orchestrates a Docker-based monitoring stack<br>- It defines and configures services including Grafana, Prometheus, Alertmanager, Loki, and Promtail for metrics collection, visualization, and log aggregation<br>- Cadvisor and Node Exporter provide container and host metrics<br>- The stack uses a shared network and persistent storage volumes.</td>
				</tr>
			</table>
			<!-- configs Submodule -->
			<details>
				<summary><b>configs</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ monitoring.configs</b></code>
					<!-- grafana Submodule -->
					<details>
						<summary><b>grafana</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ monitoring.configs.grafana</b></code>
							<!-- provisioning Submodule -->
							<details>
								<summary><b>provisioning</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ monitoring.configs.grafana.provisioning</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='/monitoring/configs/grafana/provisioning/datasources.yml'>datasources.yml</a></b></td>
											<td style='padding: 8px;'>- Datasources.yml configures Grafana to connect with Prometheus, Alertmanager, and Loki<br>- It specifies connection details like URLs and access methods for each data source, enabling Grafana to pull metrics and logs for monitoring and alerting<br>- The configuration facilitates integration within the broader monitoring system.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='/monitoring/configs/grafana/provisioning/dashboards.yml'>dashboards.yml</a></b></td>
											<td style='padding: 8px;'>- Grafana dashboard provisioning is managed via a YAML configuration file<br>- It specifies the configuration for automatically importing and updating dashboards from a designated directory<br>- The configuration dictates the update frequency, prevents accidental deletion, and disables user interface-based modifications, ensuring consistent dashboard management within the Grafana instance.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<!-- alertmanager Submodule -->
					<details>
						<summary><b>alertmanager</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ monitoring.configs.alertmanager</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/alertmanager/alertmanager-fallback-config.yml'>alertmanager-fallback-config.yml</a></b></td>
									<td style='padding: 8px;'>- Alertmanager-fallback-config.yml defines a fallback configuration for the Alertmanager component<br>- It routes alerts to a custom receiver, uncomplicated-alert-receiver, bypassing standard notification channels<br>- This ensures alerts are still processed even if the primary Alertmanager configuration fails, providing a safety net for critical system monitoring<br>- The configuration suppresses resolved alert notifications.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/alertmanager/alertmanager-email-config.yml'>alertmanager-email-config.yml</a></b></td>
									<td style='padding: 8px;'>- Alertmanager-email-config.yml configures email alerts within a Prometheus monitoring system<br>- It defines alert grouping, repetition, and routing, specifically sending notifications to a designated recipient via SendGrids SMTP server<br>- The configuration ensures alerts are aggregated and delivered efficiently, based on criteria like alert name, cluster, and severity<br>- This facilitates timely and relevant incident communication.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/alertmanager/alertmanager-slack-config.yml'>alertmanager-slack-config.yml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/alertmanager/alertmanager-pushover-config.yml'>alertmanager-pushover-config.yml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/alertmanager/alertmanager-opsgenie-config.yml'>alertmanager-opsgenie-config.yml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- loki Submodule -->
					<details>
						<summary><b>loki</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ monitoring.configs.loki</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/loki/loki.yaml'>loki.yaml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/loki/rules.yaml'>rules.yaml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- promtail Submodule -->
					<details>
						<summary><b>promtail</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ monitoring.configs.promtail</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/promtail/promtail.yaml'>promtail.yaml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- prometheus Submodule -->
					<details>
						<summary><b>prometheus</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ monitoring.configs.prometheus</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/prometheus/prometheus.yml'>prometheus.yml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/prometheus/alerting-rules.yml'>alerting-rules.yml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='/monitoring/configs/prometheus/recording-rules.yml'>recording-rules.yml</a></b></td>
									<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- dashboards Submodule -->
			<details>
				<summary><b>dashboards</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ monitoring.dashboards</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='/monitoring/dashboards/container-metrics.json'>container-metrics.json</a></b></td>
							<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='/monitoring/dashboards/log-search.json'>log-search.json</a></b></td>
							<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='/monitoring/dashboards/node-metrics.json'>node-metrics.json</a></b></td>
							<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
						</tr>
					</table>
				</blockquote>
			</details>
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
					<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
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
					<td style='padding: 8px;'>Code>❯ REPLACE-ME</code></td>
				</tr>
			</table>
		</blockquote>
	</details>
</details>

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

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://LOCAL{///}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=/">
   </a>
</p>
</details>

---

## License

 is protected under the [LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

[back-to-top]: https://img.shields.io/badge/-BACK_TO_TOP-151515?style=flat-square


---
