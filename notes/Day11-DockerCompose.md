# Day 11 – Docker Compose (Multi-Container Applications)

## Overview
Today I learned how to use **Docker Compose** to manage and run multiple containers together. 
Instead of running containers one by one, Docker Compose allows defining the entire application stack in a single YAML file.

This reflects how real-world applications are deployed.

---

## What is Docker Compose?
Docker Compose is a tool that:
- Runs **multiple containers together**
- Uses a single file (`docker-compose.yml`)
- Manages networking, volumes, and startup order automatically

It is commonly used for:
- Application + Database
- Microservices setups
- Local development environments

---

## Services Used
In today’s setup, I worked with two services:

### 1. Web Service (ASP.NET Core)
- Built from the local Dockerfile
- Exposes the application on a host port
- Uses environment variables for configuration

### 2. Database Service (PostgreSQL)
- Uses an official PostgreSQL image
- Configured using environment variables
- Stores data using Docker volumes

---

## Key Docker Compose Concepts

### services
Defines each container in the application (web, db, etc.).

### ports
Maps container ports to host ports:
host_port : container_port

### depends_on
Ensures containers start in the correct order (app waits for database).

### environment
Used to pass configuration values into containers.

### volumes
Used for persistent storage so data is not lost when containers stop.

---

## Volumes Explanation
Volumes are defined separately at the bottom of the file to:
- Persist database data
- Allow reuse across container restarts
- Keep storage independent of containers

Example:
```yaml
volumes:
  pgdata:

## Commands Practiced
docker compose up -d
docker compose ps
docker compose down
docker ps

