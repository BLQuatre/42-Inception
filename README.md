<p align="center">
	<a href="https://github.com/ayogun/42-project-badges"><img src=".assets/badge.png" alt="Inception Badge (Bonus)"/></a>
</p>

<h1 align="center">
	Inception
</h1>

## Introduction
Inception is a project that introduces containerization using Docker and Docker Compose. The goal is to set up a multi-container system with various services, ensuring they run in isolation while communicating effectively.

## Features
- **Nginx**: Reverse proxy and web server.
- **MariaDB**: SQL database server.
- **WordPress**: Content Management System (CMS).
- **Redis**: In-memory caching system.
- **Adminer**: Web-based database management tool.
- **FTP Server**: For remote file transfers.
- **Self-Signed SSL Certificates**: Secure communication with HTTPS.
- **Monitoring (Uptime Kuma)**: Visualizing containers' uptime.

## Prerequisites
- Docker
- Docker Compose

## Installation & Setup

1. Clone the repository:
	```sh
	git clone <repository_url>
	cd inception
	```

2. Create the necessary directories for volumes:
	```sh
	mkdir -p /home/cauvray/data/wordpress /home/cauvray/data/mariadb /home/cauvray/data/uptimekuma
	```

3. Copy `.env.example` to `.env` and change all credentials to make it works
	```sh
	copy srcs/env.example srcs/.env

3. Build and start the containers:
	```sh
	make
	```

4. To stop and remove all containers and the network:
	```sh
	make down
	```

5. To link the wordpress to cauvray.42.fr
	```sh
	echo "127.0.0.1 cauvray.42.fr" >> /etc/hosts
	```

## Website adresses
🌐 [WordPress](https://cauvray.42.fr:443)<br>
🌐 [Portfolio / Small Static Website](http://localhost:7000)<br>
🌐 [Uptime Kuma / Monitoring System](http://localhost:3001)<br>
🌐 [Adminer / DB Management Tool](http://localhost:5000)<br>

## Bonus Implemented
✔️ Adminer for database management<br>
✔️ FTP server for file transfers<br>
✔️ Small static website like a portfolio<br>
✔️ Redis for Wordpress caching<br>
✔️ A container of our choice: I choose Uptime Kuma, a monitoring service<br>
