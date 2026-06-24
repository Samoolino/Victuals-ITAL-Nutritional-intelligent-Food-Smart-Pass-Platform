# Architecture Clarification and Implementation Roadmap

## Purpose
This document removes ambiguity around the Victuals platform model and aligns the repository structure, service map, and product vocabulary with the enterprise architecture.

## 1. Canonical Platform Model

### Platform name
- Victuals: the umbrella ecosystem, marketplace, and platform experience

### Intelligence layer
- ITAL: the Nutri Agent operating system that powers nutrition intelligence, recommendation, planning, and economic reasoning

## 2. Canonical Roles

The repository should consistently use the following roles:

- User: the recipient of nutrition access and plan entitlements
- Market owner / market hub: the operator of inventory, product eligibility, redemption, and commerce workflows
- Subscription plan owner: the organization or sponsor funding plans and policy rules
- Plan subscriber: the enrolled participant or entity consuming plan-based access
- Platform administrator / governance operator: the operator of platform governance, compliance, and administration

## 3. Canonical Architecture Layers

### Experience layer
- user-facing experience for access, wallet, and planning
- market-hub experience for merchants, market owners, and market operations
- plan-owner experience for subscription design and oversight
- admin and analytics experiences for platform governance

### Service layer
- user access and wallet services
- plan management services
- global registry services
- nutrition intelligence services
- marketplace matching and merchant network services
- settlement, payment, and reporting services
- compliance, auth, and notification services

### Registry and data layer
- global, regional, and national product and merchant registries
- nutrition metadata, certification, and provenance evidence

### Trust layer
- treasury and token logic
- access and entitlement controls
- redemption and settlement verification
- merchant and plan-linked trust mechanics

### Operations and governance layer
- deployment, monitoring, security, observability, and policy enforcement

## 4. Repository Interpretation

The repository is intended to be structured as a layered monorepo where:

- `apps/` hosts product experiences
- `services/` hosts business logic and workflow orchestration
- `global-registry/` hosts registry foundations
- `token-economy/` hosts treasury and allocation logic
- `wallet-system/` hosts wallet and authorization behavior
- `marketplace/` hosts product matching and commerce workflows
- `integrations/` hosts external data and payment connectors
- `packages/` hosts shared contracts and types
- `infra/` and `docs/` host operations and governance artifacts

## 5. Implementation Sequence

The implementation should follow this order:

1. Shared domain models, schemas, and contract interfaces
2. Global registry and nutrition intelligence services
3. Wallet, access, and plan management services
4. Marketplace, merchant workflow, and settlement services
5. Reporting, analytics, compliance, and governance services

## 6. Architectural Principles

- users, market owners, and plan owners are first-class roles
- nutrition intelligence is a core platform capability
- the registry is a shared foundation, not an afterthought
- settlement and treasury controls must be auditable and policy-driven
- governance and compliance must be built into the operating model from the start

## 7. Expected Outcome

With this model in place, Victuals becomes a coherent enterprise platform for nutritional access, intelligent commerce, subscription funding, and impact reporting, with ITAL acting as the coordinating intelligence layer.
