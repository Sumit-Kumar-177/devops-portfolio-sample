# DevOps CI/CD Portfolio Demo

A small end-to-end demo showing a CI/CD pipeline, containerization, configuration
management, and monitoring — the same core stack used in production environments,
rebuilt here as a public, non-proprietary example.

## What this shows
- **Custom Docker image built from scratch** (`Dockerfile`) — PHP + Apache stack
- **Jenkins CI/CD pipeline** (`Jenkinsfile`) — build, health-check, manual approval, deploy
- **Ansible playbook** (`ansible/playbook.yml`) — automated server provisioning and deployment
- **Monitoring stack** (`monitoring/docker-compose.yml`) — Prometheus + Grafana

## Architecture

```
GitHub push -> Jenkins pipeline -> Docker build -> health check -> approval -> deploy
                                                            |
                                                    Prometheus scrapes metrics
                                                            |
                                                       Grafana dashboard
```

## How to run it locally

**1. Build and run the app container**
```bash
docker build -t devops-portfolio-demo .
docker run -d -p 8080:80 devops-portfolio-demo
# visit http://localhost:8080
```

**2. Run the monitoring stack**
```bash
cd monitoring
docker-compose up -d
# Prometheus: http://localhost:9090
# Grafana:    http://localhost:3000  (admin/admin)
```

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
[LinkedIn](#) · [Email](mailto:syjhagrolia99@gmail.com)
