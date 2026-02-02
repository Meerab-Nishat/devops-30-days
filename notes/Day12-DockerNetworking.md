# 🌐 Day 12: Docker Networking & Service Discovery

## 🎯 Overview
Today I explored how containers communicate within a virtual environment. I moved away from individual container management to a networked multi-container system using Docker Compose.

---

##  Key Concepts Learned

### 1. Default Bridge Network
When using Docker Compose, Docker automatically creates a **Bridge Network**. This acts as a private "virtual switch" that connects all services defined in the `docker-compose.yml` file.

### 2. Service Name vs. Localhost 
- **The Localhost Trap:** Inside a container, `localhost` refers ONLY to that specific container. It cannot see the host machine or other containers.
- **Service Discovery:** Docker has an **Embedded DNS**. It allows containers to find each other using the service names defined in the YAML file (e.g., `db`, `api`, `web`).
- **Correct Connection String:** Instead of `localhost:5432`, my app now uses `db:5432`.

### 3. Custom Networks 
I learned how to create a manual network using `docker network create devops-net`. 
- By using `external: true` in Compose, I can attach my services to a pre-existing network, providing better isolation and security.

---

## 🛠 Commands Used
| Command | Purpose |
| :--- | :--- |
| `docker network ls` | Lists all available Docker networks. |
| `docker network inspect <name>` | Shows details of a network and which containers are attached to it. |
| `docker exec -it <container> sh` | Enters the container's shell for debugging. |
| `ping db` | Tests if the 'web' container can reach the 'db' container via DNS. |

---

## 💡 Troubleshooting & Debugging
During the lab, I encountered a common production scenario:
- **Missing Tools:** Production images are "slim" and often don't have `ping` or `nc`. 
- **The Fix:** I learned to use `apt-get update && apt-get install -y iputils-ping` to temporarily install debugging tools.
- **The Success:** Successfully pinged `db` from the `web` container, confirming the DNS-based networking is active.

---

## 💭 Reflection
Now I know exactly how my ASP.NET app "finds" the PostgreSQL database. 
