# 🚀 Jenkins CI/CD Pipeline

This project demonstrates the CI/CD pipeline I built to automate deployments for **5–7 production web applications**.

## Workflow

1. Developers push and merge code to the **production branch** on the self-hosted GitLab server.
2. A **GitLab Webhook** automatically triggers the Jenkins pipeline.
3. Jenkins checks whether the project already exists:
   - If it is a new project, the repository is cloned.
   - If it already exists, Jenkins uses `git diff` to identify only the changed files and updates them.
4. Before deployment, Jenkins creates a backup of the current application by renaming it with a timestamp (e.g., `ordo-admin-old-20260728`).
5. Jenkins builds a new Docker image using the application's **Dockerfile**.
6. The image is pushed to **Docker Hub**.
7. The deployment server pulls the latest image and starts the updated container with minimal downtime.

## Technologies Used

- Jenkins
- GitLab
- GitLab Webhooks
- Docker
- Docker Hub
- Linux
- Shell Scripting

## Example Project Structure

```text
/var/lib/jenkins/workspace/ordosan/sanordo-admin/
├── Dockerfile
├── ordo-admin/
├── ordo-admin-old-20260728/
├── ssl/
└── ssl-vhost.conf
```

## Features

- ✅ Automatic deployment using GitLab Webhooks
- ✅ Incremental updates using `git diff`
- ✅ Automatic backup before deployment
- ✅ Docker image build and versioning
- ✅ Push images to Docker Hub
- ✅ Automated deployment on the production server
- ✅ Supports multiple production applications
