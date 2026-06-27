# VICTUALS — Deployment Guide

This guide outlines the steps to prepare and deploy the VICTUALS platform to a production-ready state.

## Pre-Deployment Checklist

### 1. Repository & Package Configuration
- [x] Monorepo structure with `apps/`, `services/`, `packages/`, `infra/` established
- [x] pnpm workspace configured
- [x] Turbo build system configured
- [ ] All package.json files updated to reference `@victuals/` scope (currently `@smart-food-stamp/`)
- [ ] Package versions aligned (recommend semver: v0.1.0 → v0.2.0)
- [ ] Build outputs configured for all packages

### 2. Environment Configuration
- [ ] `.env` files created for all deployment stages (local, staging, production)
- [ ] Secrets management system integrated (HashiCorp Vault / AWS Secrets Manager)
- [ ] Database credentials configured
- [ ] Blockchain RPC endpoints validated
- [ ] Third-party API keys provisioned

### 3. Build & Compilation
- [ ] All TypeScript packages compile without errors
- [ ] Solidity contracts compile successfully
- [ ] Contract ABIs generated and exported
- [ ] Build artifacts reproducible across environments

### 4. Testing & Quality
- [ ] Unit tests pass for all services
- [ ] Contract tests pass (forge/hardhat)
- [ ] Integration tests configured and passing
- [ ] Coverage reports generated (target: >80%)
- [ ] Linting passes across all packages

### 5. Database & Persistence
- [ ] Database schema migrations scripted
- [ ] Migration system tested (up/down)
- [ ] Redis/cache layer configured
- [ ] Seed data available for demo/testing

### 6. Blockchain Configuration
- [ ] Contracts deployed to testnet
- [ ] Contract addresses documented
- [ ] Multisig wallet configured
- [ ] Deployer keys secured in vault
- [ ] Contract verification completed

### 7. Infrastructure & Observability
- [ ] Docker images buildable for all services
- [ ] Kubernetes manifests validated
- [ ] Terraform modules tested
- [ ] Monitoring/logging configured (Prometheus, ELK, Sentry)
- [ ] Health checks implemented for all services

### 8. Security & Compliance
- [ ] Security audit completed (contracts + backend)
- [ ] OWASP Top 10 review completed
- [ ] API authentication/authorization tested
- [ ] Data encryption at rest and in transit
- [ ] Compliance requirements documented

### 9. Documentation
- [ ] API documentation (OpenAPI/Swagger)
- [ ] Deployment runbooks created
- [ ] Architecture decision records (ADRs) filed
- [ ] Troubleshooting guides available

---

## Deployment Stages

### Stage 1: Local Development Environment

```bash
# Install dependencies
pnpm install

# Build all packages
pnpm build

# Run tests
pnpm test
pnpm contracts:test

# Start development servers
pnpm dev
```

### Stage 2: Staging Environment

**Infrastructure Setup:**
- Deploy to staging VPC
- Use staging-grade resources (smaller instances)
- Configure staging DNS and TLS certificates
- Set up staging blockchain node/testnet

**Configuration:**
```bash
NODE_ENV=staging
CHAIN_ID=<testnet-chain-id>
RPC_URL_TESTNET=<testnet-rpc>
```

**Deployment:**
```bash
# Build production artifacts
pnpm build

# Deploy contracts to testnet
pnpm contracts:deploy:testnet

# Deploy services
# (Use Kubernetes/Docker manifests in infra/)
```

### Stage 3: Production Environment

**Pre-Deployment:**
- [ ] All staging tests passed
- [ ] Security audit completed
- [ ] Deployment plan reviewed
- [ ] Rollback strategy documented
- [ ] On-call team briefed

**Deployment:**
```bash
# Helm deploy or kubectl apply
kubectl apply -f infra/kubernetes/production/

# Monitor health checks
kubectl get pods -l app=victuals

# Verify service endpoints
curl -H "Authorization: Bearer $TOKEN" https://api.victuals.io/health
```

---

## Service Deployment Order

Deploy services in this order to maintain dependency chain:

1. **Packages** (no dependencies)
   - `@victuals/shared-types`
   - `@victuals/config`
   - `@victuals/contract-abis`
   - `@victuals/ui-kit`
   - `@victuals/sdk`

2. **Contracts** (depends on shared-types)
   - `@victuals/contracts` → deploy to blockchain

3. **Core Services** (depend on contracts)
   - `auth-service`
   - `registry-service`
   - `compliance-service`

4. **Processing Services** (depend on core services)
   - `redemption-service`
   - `payment-orchestrator`
   - `notification-service`
   - `analytics-service`

5. **Applications** (depend on all services)
   - `admin-console`
   - `merchant-portal`
   - `beneficiary-dapp`

---

## Environment Variables Template

See `.env.example` and configure for each stage:

```dotenv
# Application
NODE_ENV=production
LOG_LEVEL=info

# Blockchain
CHAIN_ID=1  # mainnet or appropriate testnet
RPC_URL=https://...
DEPLOYER_PRIVATE_KEY=***
MULTISIG_ADDRESS=0x...

# Authentication
JWT_SECRET=***
JWT_EXPIRY=3600
SIWE_DOMAIN=victuals.io
SIWE_URI=https://victuals.io

# Database
DATABASE_URL=postgresql://user:pass@host/victuals
DATABASE_POOL_SIZE=20
REDIS_URL=redis://host:6379

# Storage
S3_BUCKET=victuals-prod
S3_REGION=us-east-1
S3_ACCESS_KEY_ID=***
S3_SECRET_ACCESS_KEY=***

# Payment Provider
PAYMENT_PROVIDER_API_KEY=***
PAYMENT_PROVIDER_WEBHOOK_SECRET=***

# Observability
SENTRY_DSN=https://...
OTEL_EXPORTER_OTLP_ENDPOINT=https://...
```

---

## Health Checks & Monitoring

All services must expose health check endpoints:

```bash
# Service health
GET /health → { status: "healthy", timestamp, version }
GET /health/ready → { ready: true }
GET /health/live → { alive: true }

# Metrics (Prometheus format)
GET /metrics → prometheus metrics
```

---

## Rollback Strategy

1. **Canary Deployment**: Deploy to 10% of traffic first
2. **Monitor Metrics**: Watch for error rate, latency, resource usage
3. **Automatic Rollback**: If error rate > 5%, auto-rollback triggered
4. **Manual Rollback**: `kubectl rollout undo deployment/service`

---

## Performance Targets

| Metric | Target | Tool |
|--------|--------|------|
| API p99 latency | < 500ms | Prometheus |
| Error rate | < 0.5% | Sentry |
| Database query p99 | < 100ms | Datadog |
| Blockchain confirmation | < 30s | Custom monitoring |
| Service uptime | > 99.9% | Kubernetes |

---

## Disaster Recovery

**Backup Strategy:**
- Database: Daily snapshots, 30-day retention
- Blockchain state: Contract state exported weekly
- Secrets: Encrypted backup in separate secure location
- Configuration: Version controlled in Git

**Recovery Steps:**
1. Alert oncall team
2. Identify issue scope
3. Execute recovery plan (varies by component)
4. Post-incident review (PIR) within 24 hours

---

## Support & Troubleshooting

See `docs/` directory for:
- `TROUBLESHOOTING.md` — Common issues and fixes
- `RUNBOOKS.md` — Operational procedures
- `API.md` — Service endpoint reference
- `CONTRACTS.md` — Smart contract documentation
