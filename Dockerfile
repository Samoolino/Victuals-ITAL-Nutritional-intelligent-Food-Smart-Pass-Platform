# Multi-stage Docker build for VICTUALS platform

# ============================================================================
# Stage 1: Build dependencies and compile all packages
# ============================================================================
FROM node:18-alpine AS builder

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@10.0.0

# Copy workspace root files
COPY pnpm-workspace.yaml package.json pnpm-lock.yaml* ./
COPY packages ./packages
COPY services ./services
COPY apps ./apps

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build all packages
RUN pnpm build

# ============================================================================
# Stage 2: Build contracts
# ============================================================================
FROM node:18-alpine AS contracts-builder

WORKDIR /app

RUN npm install -g pnpm@10.0.0

# Install Foundry
RUN apk add --no-cache curl
RUN curl -L https://foundry.paradigm.xyz | bash
RUN ~/.foundry/bin/foundryup

COPY pnpm-workspace.yaml package.json pnpm-lock.yaml* ./
COPY packages ./packages

RUN pnpm install --frozen-lockfile
RUN pnpm --filter @victuals/contracts build

# ============================================================================
# Stage 3: Base runtime image with production dependencies
# ============================================================================
FROM node:18-alpine AS runtime-base

WORKDIR /app

RUN npm install -g pnpm@10.0.0

COPY pnpm-workspace.yaml package.json pnpm-lock.yaml* ./
COPY packages ./packages
COPY services ./services
COPY apps ./apps

# Install production dependencies only
RUN pnpm install --prod --frozen-lockfile

# Copy built artifacts from builder
COPY --from=builder /app/packages /app/packages
COPY --from=builder /app/services /app/services
COPY --from=builder /app/apps /app/apps

# Copy contract artifacts
COPY --from=contracts-builder /app/packages/contracts/artifacts /app/packages/contracts/artifacts

# ============================================================================
# Stage 4: API Gateway / Backend Services
# ============================================================================
FROM runtime-base AS api-gateway

WORKDIR /app/services/api-gateway

EXPOSE 3000

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3000/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 5: Auth Service
# ============================================================================
FROM runtime-base AS auth-service

WORKDIR /app/services/auth-service

EXPOSE 3001

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3001/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 6: Registry Service
# ============================================================================
FROM runtime-base AS registry-service

WORKDIR /app/services/registry-service

EXPOSE 3002

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3002/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 7: Redemption Service
# ============================================================================
FROM runtime-base AS redemption-service

WORKDIR /app/services/redemption-service

EXPOSE 3003

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3003/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 8: Payment Orchestrator
# ============================================================================
FROM runtime-base AS payment-orchestrator

WORKDIR /app/services/payment-orchestrator

EXPOSE 3004

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3004/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 9: Compliance Service
# ============================================================================
FROM runtime-base AS compliance-service

WORKDIR /app/services/compliance-service

EXPOSE 3005

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3005/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 10: Analytics Service
# ============================================================================
FROM runtime-base AS analytics-service

WORKDIR /app/services/analytics-service

EXPOSE 3006

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3006/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 11: Notification Service
# ============================================================================
FROM runtime-base AS notification-service

WORKDIR /app/services/notification-service

EXPOSE 3007

ENV NODE_ENV=production
ENV LOG_LEVEL=info

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3007/health || exit 1

CMD ["node", "dist/index.js"]

# ============================================================================
# Stage 12: Beneficiary DApp
# ============================================================================
FROM runtime-base AS beneficiary-dapp

WORKDIR /app/apps/beneficiary-dapp

EXPOSE 3008

ENV NODE_ENV=production
NEXT_TELEMETRY_DISABLED=1

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3008/health || exit 1

CMD ["node", ".next/standalone/server.js"]

# ============================================================================
# Stage 13: Merchant Portal
# ============================================================================
FROM runtime-base AS merchant-portal

WORKDIR /app/apps/merchant-portal

EXPOSE 3009

ENV NODE_ENV=production
NEXT_TELEMETRY_DISABLED=1

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3009/health || exit 1

CMD ["node", ".next/standalone/server.js"]

# ============================================================================
# Stage 14: Admin Console
# ============================================================================
FROM runtime-base AS admin-console

WORKDIR /app/apps/admin-console

EXPOSE 3010

ENV NODE_ENV=production
NEXT_TELEMETRY_DISABLED=1

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3010/health || exit 1

CMD ["node", ".next/standalone/server.js"]
