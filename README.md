# DevOps CI/CD Portfolio Demo

A small end-to-end demo showing a CI/CD pipeline, containerization, configuration
management, and monitoring — the same core stack used in production environments,
rebuilt here as a public, non-proprietary example.

## What this shows
- **Custom Docker image built from scratch** (`Dockerfile`) — PHP + Apache + Node
- **Jenkins CI/CD pipeline** (`Jenkinsfile`) — Git-clone, build, Docker-image, manual approval, deploy
- **Ansible playbook** (`ansible/playbook.yml`) — automated server provisioning and deployment
- **Monitoring stack** (`monitoring/prometheus.yml`) — Prometheus + Grafana

## Architecture

```
GitHub push -> Jenkins pipeline -> Docker build -> Docker-Image -> approval -> deploy
                                                            |
                                                    Prometheus scrapes metrics
                                                            |
                                                       Grafana dashboard
```

## How to run it locally

**1. Build and run the app container via docker-compose.yml**
version: '3.9'
services:
  backend_client:
    build: ./bot_app_backend/backend_client
    container_name: backend_client
    ports:
      - "85:85"
      - "445:445"
    restart: always
``

**3. Provision with Ansible (against a target VM)**
```bash
ansible-playbook -i inventory.ini ansible/playbook.yml
```

## Why I built this
I work as a DevOps Engineer managing production CI/CD, containerization, and
monitoring for enterprise clients. Since that infrastructure is confidential,
this repo recreates the same patterns — Jenkins pipelines, custom Docker images,
Ansible automation, and Prometheus/Grafana monitoring — in a clean, shareable form.

## Tech stack
Docker · Jenkins · Ansible · Prometheus · Grafana · Apache · PHP

## Author
Sumit Kumar — DevOps Engineer
