# VICTUALS Infrastructure

This directory contains infrastructure-as-code and operational configurations for deploying the VICTUALS platform.

## Structure

```
infra/
├── docker/          # Docker images and Compose configurations
├── kubernetes/      # Kubernetes manifests (K8s)
├── terraform/       # Infrastructure as Code (AWS/GCP/Azure)
└── observability/   # Monitoring, logging, tracing
```

## Quick Start

### Local Development with Docker Compose

```bash
cd .. && docker-compose up -d
```

This starts:
- PostgreSQL database
- Redis cache
- Local blockchain (Ganache)
- All VICTUALS services
- Web applications

### Environment Variables

All services require environment configuration. See `../.env.example` for template.

### Health Checks

```bash
# Check service health
curl http://localhost:3000/health
curl http://localhost:3001/health
curl http://localhost:3002/health
# ... etc for all services
```

## Kubernetes Deployment

```bash
cd kubernetes
kubectl apply -f namespaces.yaml
kubectl apply -f configmaps.yaml
kubectl apply -f secrets.yaml
kubectl apply -f deployments/
kubectl apply -f services/
```

## Security

- Store secrets in a vault (HashiCorp Vault, AWS Secrets Manager)
- Never commit `.env` files
- Use least-privilege access controls
- Enable network policies in Kubernetes
- Regularly rotate credentials and API keys

## Monitoring

Services emit metrics to Prometheus and logs to ELK stack.

### Prometheus Metrics

```
http://localhost:9090
```

### Log Aggregation

```
http://localhost:5601  # Kibana
```

## Support

See `../DEPLOYMENT_GUIDE.md` for comprehensive deployment instructions.
