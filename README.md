# VICTUALS — Smart Nutritional Food Plan Pass Platform

VICTUALS is the next-stage evolution of the Smart Food Pass concept: a programmable, nutrition-aware food access platform that connects eligible beneficiaries, merchants, sponsors, and public institutions through a shared trust layer. The repository is structured as a monorepo for product cataloging, nutrition intelligence, wallet orchestration, settlement, compliance, and app experiences.

## Audit summary

This repository has been audited against the current pull request context (PR #38) and the state of the main branch. The result is a strong foundation for a transition from the legacy Smart Food Pass scaffold to a VICTUALS platform, but the implementation remains in an early, partially scaffolded phase.

### What is already present
- A monorepo structure with `apps/`, `services/`, `packages/`, and `infra/`.
- A Solidity-based contract package under `packages/contracts`.
- A shared-types package under `packages/shared-types`.
- Service scaffolds for registry, redemption, payment orchestration, analytics, compliance, auth, and notification.
- Infrastructure directories for Docker, Kubernetes, Terraform, and observability.
- Architecture and contract documentation under `docs/`.

### What is still incomplete or placeholder
- `apps/admin-console`, `apps/merchant-portal`, and `apps/beneficiary-dapp` are scaffolds rather than production-ready applications.
- `apps/beneficiary-dapp/legacy-nextjs` should remain as a legacy reference, not the primary VICTUALS experience.
- Service boundaries exist, but business logic, APIs, persistence, and operational workflows are not yet fully implemented.
- The root README still reflected the earlier Smart Food Stamp language rather than the VICTUALS product thesis.

### Recommended transition posture
The repository should continue progressing in the order already defined by the upgrade plan:
1. Terminology migration to VICTUALS.
2. Architecture and domain documentation.
3. Shared domain types and message schemas.
4. Contract module expansion.
5. Product registry and nutrition integrations.
6. Wallet, QR redemption, and settlement services.
7. App-level implementation and UX rollout.

---

## Product thesis

VICTUALS is designed to make food access more intelligent, measurable, and impact-driven. It links the redemption of food benefits to nutrition outcomes, merchant participation, and accountable funding flows. The platform is intended to support:
- sponsor or program-funded food access;
- beneficiary eligibility and wallet management;
- merchant onboarding and accreditation;
- nutrition-aware product eligibility and recommendation logic;
- transparent settlement and auditability;
- ESG and nutritional impact reporting.

---

## Functional requirements

### 1. Identity, entitlement, and access
- Register beneficiaries, merchants, sponsors, and administrators.
- Maintain eligibility rules and policy-driven entitlements.
- Support role-based access control and auditable identity changes.
- Allow program administrators to create and update benefit rules.

### 2. Benefit wallet and pass lifecycle
- Issue and manage a digital food plan pass or wallet state.
- Track plan balance, validity window, and policy constraints.
- Support QR-based or wallet-based redemption workflows.
- Support pass suspension, cancellation, and restoration.

### 3. Product registry and nutrition intelligence
- Maintain a canonical product registry with product metadata, nutrition facts, and provenance.
- Score food products against nutrition quality, healthiness, allergen, and suitability rules.
- Support dietary preferences, restricted ingredients, and health goals.
- Produce recommendation and eligibility outcomes that are explainable.

### 4. Merchant onboarding and redemption
- Onboard merchants and verify accreditation criteria.
- Accept redemption requests from approved merchant channels.
- Enforce policy checks for allowed products, benefit types, and redemption windows.
- Record settlement and dispute events in an auditable format.

### 5. Settlement and funding flows
- Orchestrate sponsor-to-merchant settlement.
- Support ledger-based accounting and reconciliation.
- Emit event logs for funding, redemption, settlement, and rollback operations.
- Enable reporting for program finance and compliance stakeholders.

### 6. Reporting, analytics, and governance
- Produce operational dashboards for program managers and administrators.
- Generate nutrition and ESG impact reports.
- Expose metrics for beneficiary outcomes, merchant participation, and fund efficiency.
- Support regulator-safe audit trails and evidence export.

---

## Non-functional requirements

### Security and trust
- Protect identity and transaction data using least-privilege access controls.
- Ensure that contract-mediated state changes are auditable and tamper-evident.
- Secure secrets, keys, and private configuration through managed secret stores.
- Enforce signed approvals and role separation for privileged actions.

### Privacy and data protection
- Minimize personal data collection and retain only what is needed.
- Separate identity data from transaction and nutrition decision data where possible.
- Support consent-driven data handling and export/delete workflows.

### Reliability and resilience
- Design services to tolerate transient failures and recover gracefully.
- Support idempotent redemption and settlement operations.
- Provide health checks, retries, and operational alerts.

### Performance and scalability
- Support growing beneficiary and merchant volumes without major architecture churn.
- Keep user-facing flows responsive for mobile and desktop experiences.
- Ensure asynchronous workflows can scale independently.

### Interoperability and maintainability
- Use clear shared types and canonical schemas across services and applications.
- Preserve compatibility with external data providers, payment rails, and verification services.
- Keep domain boundaries explicit to avoid unnecessary coupling.

### Accessibility and inclusion
- Support mobile-first interactions and inclusive design.
- Ensure the experience remains usable for underserved and low-connectivity contexts.
- Expose plain-language explanations for nutrition decisions and benefit outcomes.

### Compliance and governance
- Support policy versioning, internal review, and audit evidence generation.
- Prepare for regulatory oversight, subsidy program requirements, and ethical AI review where applicable.
- Maintain a record of schema changes, contract upgrades, and operational controls.

---

## Architecture and system design

The platform is organized as a layered system so that user experiences, business services, trust infrastructure, and impact reporting can evolve independently.

### Layered architecture

- L-1: Human and ecosystem layer
  - Beneficiaries, merchants, sponsors, program administrators, and regulators.
  - Real-world behaviors: food purchasing, eligibility verification, redemption, and impact observation.

- L-2: Experience and interaction layer
  - `apps/beneficiary-dapp` for beneficiary experience.
  - `apps/merchant-portal` for merchant operations.
  - `apps/admin-console` for program administration.
  - Notification and communication surfaces.

- L-3: Application services layer
  - `services/registry-service` for product and merchant registration.
  - `services/redemption-service` for redemption processing.
  - `services/payment-orchestrator` for settlement orchestration.
  - `services/compliance-service` for policy and evidence evaluation.
  - `services/auth-service` and `services/notification-service` for identity and communication.

- L-4: Domain modeling and shared contracts layer
  - `packages/shared-types` for common domain models.
  - `packages/sdk` for client integration.
  - `packages/contract-abis` and `docs/contracts` for contract interface definitions.

- L-5: Data, intelligence, and analytics layer
  - Product catalog, nutrition scoring models, eligibility reasoners, and analytics pipelines.
  - Derives recommendation, eligibility, and impact outputs from structured and external data sources.

- L-6: Trust and transaction layer
  - `packages/contracts` and Solidity modules for policy, registry, redemption, settlement, and access control.
  - Provides immutable state, event logging, and auditable business transitions.

- L-7: Platform operations layer
  - `infra/docker`, `infra/kubernetes`, `infra/terraform`, and `infra/observability`.
  - CI/CD, environment provisioning, monitoring, logging, secret handling, and deployment automation.

- L-8: Impact, governance, and reporting layer
  - ESG dashboards, nutritional outcome reporting, program audits, and institutional reporting.
  - Supports cross-program impact evaluation and public accountability.

### Runtime flow
1. A beneficiary interacts through the app layer.
2. The application services evaluate eligibility and plan state.
3. Product and nutrition rules are checked against shared domain models and contract state.
4. Redemption and settlement events are committed through the trust layer.
5. Operational telemetry and impact metrics are emitted for analytics and governance.

---

## Nutritional impact and impactfulness design

VICTUALS is explicitly designed not just as a food pass but as a nutrition-impact instrument. The platform should encourage healthier purchasing patterns and produce evidence that can be shared with sponsors, program managers, and ESG stakeholders.

### Nutrition-focused design principles
- Prioritize nutrient-dense products over ultra-processed, low-value options where the policy permits.
- Support explainable recommendations rather than opaque scoring.
- Make nutritional eligibility and product suitability transparent to beneficiaries and admins.
- Connect food redemption to measurable health, equity, and sustainability outcomes.

### Reportable ESG nutritional metrics

| Metric | What it measures | Suggested reporting cadence |
| --- | --- | --- |
| Healthy Basket Score | Share of redeemed basket that meets nutritional quality thresholds | Monthly |
| Nutrient Density Index | Average nutrient density of redeemed products | Monthly |
| Protein and Fiber Adequacy Rate | Percentage of households or users meeting minimum protein/fiber thresholds | Quarterly |
| Sugar / Sodium Compliance Rate | Share of redeemed products within defined thresholds | Monthly |
| Fruit and Vegetable Serving Ratio | Relative contribution of fruit/vegetable intake vs total basket | Monthly |
| Food Waste Avoided | Estimated reduction in food waste from better purchasing or product matching | Quarterly |
| Emissions Intensity | Estimated CO2e impact per household or per redeemed basket | Quarterly |
| Local / Smallholder Procurement Share | Portion of spend connected to local or responsible suppliers | Quarterly |
| Equity Coverage Index | Reach of nutritional support across underserved segments | Quarterly |
| Program Impact Confidence | Composite confidence score based on data completeness and auditability | Quarterly |

These metrics should be generated by the analytics and reporting layer and exposed as role-based dashboards and downloadable reports.

---

## Repository structure

```text
apps/                 user-facing experiences
services/             domain services and orchestration
packages/             shared types, contracts, SDK, tooling
infra/                deployment, observability, infrastructure as code
docs/                 architecture, contracts, compliance, runbooks
```

---

## Build and execution order

The repository should be built in a staged order to preserve logical dependencies:
1. Shared packages and type definitions.
2. Contracts and trust layer modules.
3. SDK and interface artifacts.
4. Core services.
5. Admin and partner portals.
6. Beneficiary-facing app experiences.

Typical developer commands:

```bash
pnpm install
pnpm dev
pnpm build
pnpm test
pnpm contracts:test
```

---

## Implementation status and next milestones

Current focus should be:
- finalize VICTUALS terminology and domain vocabulary;
- complete shared domain types and schema contracts;
- implement the product registry and nutrition intelligence service;
- wire the wallet and redemption lifecycle into the trust and service layers;
- implement reporting for nutritional and ESG outcomes.

This repository is now positioned as the foundation for a nutrition-aware, auditable, and measurable food access platform rather than only a Smart Food Pass prototype.
