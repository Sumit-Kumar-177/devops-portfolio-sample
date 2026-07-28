# 🐳 Dockerized Application Deployment

Previously, deploying our CRM and PBX applications on a client server took **around 2 days**. The installation involved configuring multiple services manually, including the web server, MySQL, Node.js applications, and Asterisk.

To simplify this process, I containerized the complete application stack by creating Docker images for:

- CRM Application
- PBX Admin (Dialer)
- MySQL
- Node.js Applications
- Asterisk

I also created a **Docker Compose** configuration that automatically deploys and connects all required containers.

Now, the deployment team only needs to run:

```bash
docker compose up -d
```

The entire application stack is deployed automatically with minimal manual configuration.

## Results

- Reduced deployment time from **2 days to approximately 5 minutes**
- Standardized installations across all client servers
- Simplified deployment for both on-premises and cloud environments
- Eliminated manual installation errors
- Improved consistency and faster production rollouts

The repository also includes the **Dockerfiles** and **Docker Compose** configuration used to build and deploy the application stack.
