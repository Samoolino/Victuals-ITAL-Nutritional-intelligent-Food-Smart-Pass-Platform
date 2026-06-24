# Victuals — The ITAL Nutritional Agent Marketplace

Victuals is the enterprise evolution of a nutrition access platform into a Global Nutritional Intelligence Network. The platform connects users, market owners, subscription plan owners, plan subscribers, food manufacturers, governments, schools, humanitarian organizations, and ecosystem operators through a secure, auditable, and extensible digital infrastructure.

The core intelligence layer is ITAL, a hierarchical multi-agent nutritional operating system designed to coordinate nutrition planning, product intelligence, commerce, economics, settlement, governance, and impact reporting.

## 1. Executive Summary

### Business Objective
To enable programmable nutrition access that improves food choices, supports healthier outcomes, and creates measurable impact for individuals and institutions through a trusted marketplace and funding model.

### Core Value Proposition
Victuals is not just a food pass or grocery marketplace. It is a nutrition intelligence and commerce platform that combines:

- user-centric nutritional planning
- global food product registry intelligence
- merchant and market-hub redemption workflows
- subscription plan funding and plan-owner governance
- tokenized access, allocation, and settlement controls
- nutrition and ESG impact reporting

### Target Audience
- Users who need nutrition access and plan-aware purchasing
- Market owners and market hubs who operate grocery inventory and redemption channels
- Subscription plan owners and plan subscribers who fund nutrition programs
- Platform administrators, compliance teams, and regulators
- Developers and ecosystem partners integrating with the platform

## 2. Product and Platform Vision

Victuals operates as a market-of-markets platform where:

- users receive nutrition-based entitlements and access
- market owners sell and redeem eligible food products
- plan owners and subscribers sponsor programs and allocate value
- ITAL evaluates nutrition suitability and plan eligibility
- smart contracts govern access, settlement, treasury, and redemption trust
- reporting measures nutritional and economic outcomes

The platform is structured around a Global Food Product Registry Infrastructure, where every product becomes a searchable nutritional asset and each country can become a registry node.

## 3. Role Model and Domain Vocabulary

The repository uses the following normalized roles:

- User: the recipient of nutrition access and plan entitlements
- Market owner / market hub: operational owner of merchant inventory, redemption, and marketplace engagement
- Subscription plan owner: an organization or sponsor funding plans and policy rules
- Plan subscriber: a participant or organization enrolled under a subscription plan
- Platform administrator: governance and operational operator

These roles replace older terminology such as beneficiary, sponsor, donor, and merchant-only concepts.

## 4. Architecture Overview

Victuals is organized as a layered enterprise system:

- Experience Layer: user portals, market-hub portals, plan-owner portals, admin, analytics, and registry administration surfaces
- Application Services Layer: access, plan management, registry, nutrition intelligence, marketplace matching, settlement, reporting, analytics, compliance, identity, and notifications
- Registry and Data Layer: global, regional, and national product registries with product, nutrition, certification, and merchant data
- Trust and Settlement Layer: smart contracts for treasury, allocation, access, settlement, merchant trust, and governance
- Operational Layer: deployment, observability, security, and governance automation

## 5. Repository Structure

```text
victuals-platform/

├── apps/
│   ├── user-dapp/
│   ├── market-hub-portal/
│   ├── plan-owner-portal/
│   ├── platform-admin/
│   ├── analytics-portal/
│   └── registry-admin/
├── services/
│   ├── user-access-service/
│   ├── plan-management-service/
│   ├── global-registry-service/
│   ├── nutrition-intelligence-service/
│   ├── marketplace-matching-service/
│   ├── merchant-network-service/
│   ├── settlement-service/
│   ├── wallet-service/
│   ├── reporting-service/
│   ├── compliance-service/
│   ├── auth-service/
│   ├── notification-service/
│   └── payment-orchestrator/
├── global-registry/
│   ├── global/
│   ├── regional/
│   └── national/
├── token-economy/
│   ├── treasury/
│   ├── reserve-assets/
│   ├── allocation-engine/
│   ├── expiry-engine/
│   └── burn-engine/
├── wallet-system/
│   ├── biometric-wallet/
│   ├── merchant-wallet/
│   ├── plan-owner-wallet/
│   └── treasury-wallet/
├── marketplace/
│   ├── merchant-network/
│   ├── inventory-matching/
│   ├── product-eligibility/
│   └── nutrition-commerce/
├── integrations/
│   ├── product-registry-apis/
│   ├── payments/
│   ├── blockchain/
│   └── merchant-apis/
├── packages/
│   ├── contracts/
│   ├── shared-types/
│   ├── sdk/
│   └── contract-abis/
├── infra/
│   ├── docker/
│   ├── kubernetes/
│   ├── terraform/
│   └── observability/
└── docs/
    ├── architecture/
    ├── api/
    ├── governance/
    ├── nutrition/
    └── contracts/
```

## 6. ITAL: Nutri Agent Master Structure

ITAL is designed as a hierarchical multi-agent nutritional operating system.

```text
ITAL (Nutri Agent)

├── Orchestrator Agent
├── Human Nutrition Layer
├── Product Intelligence Layer
├── Commerce Layer
├── Plan Management Layer
├── Registry Layer
├── Economic Layer
├── Settlement Layer
├── Population Nutrition Layer
├── Learning Layer
└── Governance Layer
```

### Orchestrator Agent
The chief nutrition executive.

Responsibilities:
- receive user requests
- determine which specialized agents are required
- coordinate execution
- aggregate results
- resolve conflicts
- issue the final recommendation

Example:
- user requests nutrition guidance within a budget
- orchestrator invokes diagnostic, disease, budget, meal planning, registry, and commerce agents
- results are merged into a single recommendation

## 7. ITAL Agent Hierarchy

### 7.1 Human Nutrition Layer

#### Diagnostic Agent
Collects anthropometric and lifestyle data such as:
- age
- gender
- weight
- height
- body composition
- activity level
- medical conditions
- biomarkers

Outputs a nutrition baseline profile.

#### Nutritional Specialist Agent
Converts baseline data into nutrient targets based on:
- RDA
- RDI
- DRI
- WHO guidance
- national dietary guidance
- sports and clinical nutrition standards

#### Disease and Clinical Agent
Maps health conditions to nutritional constraints for:
- diabetes
- hypertension
- obesity
- kidney disease
- pregnancy
- malnutrition
- anemia

#### Biochemical Pathway Agent
Maps nutrition inputs into physiological pathways such as:
- glucose and fructose metabolism
- lactose handling
- protein and lipid processing
- glycogen use
- amino acid utilization
- ATP production
- hormonal response

This enables recommendations based on metabolic pathways rather than only calories.

### 7.2 Product Intelligence Layer

#### Product Registry Agent
Searches global, regional, national, and merchant inventory sources to retrieve:
- ingredients
- nutrition facts
- certifications
- allergens
- origin
- manufacturer

#### Product Composition Agent
Breaks products down into their core nutritional components, such as:
- protein sources
- fat sources
- carbohydrate sources
- fiber sources
- vitamin sources
- mineral sources

#### Nutrient Translation Agent
Converts products into standardized nutrition metrics, such as:
- protein grams
- calories
- fiber
- iron
- fats
- micronutrients

### 7.3 Commerce Layer

#### Grocery Agent
Finds available products, nearby or online merchants, and delivery or redemption options.

#### Budget Agent
Calculates nutrition value per cost unit, including:
- cost per protein gram
- cost per calorie
- cost per iron unit
- cost per fiber unit

It produces a nutrition ROI perspective for users and plan owners.

#### Merchant Agent
Coordinates merchant inventory, pricing, settlement status, and reporting.

### 7.4 Plan Management Layer

#### Subscription Plan Agent
Designs plans such as:
- athlete plans
- student plans
- pregnancy plans
- military plans
- school feeding plans
- humanitarian plans

#### Token Utility Agent
Determines which products, merchants, and wallets are eligible for spending, blocking, or allocation.

#### Allocation Agent
Translates funding into token releases, spending limits, and expiry rules based on:
- plan size
- plan duration
- enrollment count
- funding amount
- target nutrition outcomes

### 7.5 Economic Layer

#### Nutritional Economics Agent
Calculates cost per nutrient, cost per meal, cost per household, and cost per program.

#### Pricing Strategy Agent
Supports plan owners and subscribers in answering:
- how much funding is required
- how many users can be served
- how many weeks can be sustained

#### Treasury Agent
Monitors reserve assets, locked supply, circulating supply, burn rates, and settlement demand.

### 7.6 Population Nutrition Layer

#### Population Agent
Tracks nutrition delivery across regions, communities, schools, cities, and countries.

#### Humanitarian Agent
Designs emergency, relief, and intervention programs for humanitarian use cases.

### 7.7 Learning Layer

#### User Feedback Agent
Collects ratings, purchase patterns, meal completion, skipped foods, and consumption behavior to improve recommendations.

#### AI Critic Agent
Checks recommendations for nutrition compliance, medical safety, plan compliance, and policy constraints.

#### Reinforcement Learning Agent
Improves meal recommendations, product rankings, merchant rankings, and plan recommendations using reward signals.

### 7.8 Governance Layer

#### Nutrition Governance Agent
Applies WHO guidance, national standards, food laws, religious dietary standards, and allergen constraints.

#### Compliance Agent
Validates GS1 and registry standards, labeling rules, import rules, and country-specific regulatory conditions.

## 8. User-to-Settlement Flow

```text
User
↓
Wallet
↓
ITAL Nutri Agent
↓
Plan Agent
↓
Registry Agent
↓
Eligible Products
↓
Market Hub / Marketplace
↓
Purchase
↓
Smart Contract
↓
Settlement
↓
Reporting
↓
Learning Feedback
```

## 9. Smart Contract and Trust Layer

The trust layer is designed around two primary contract domains:

### Treasury and Token Layer
Responsible for:
- mint and burn
- allocation
- lock and unlock
- treasury reserve handling
- merchant settlement
- expiry and burn mechanics

### Access and Registry Layer
Responsible for:
- plan creation
- user entitlement and wallet access
- product eligibility
- merchant and market-hub authorization
- access verification
- reporting and settlement evidence

This supports stable-asset conversion, fiat settlement hooks, merchant redemption, treasury freeze/hold logic, and investor-governance confidence where required.

## 10. Technical Stack

### Smart Contracts
- Solidity
- Foundry and Hardhat-compatible tooling

### Application Layer
- TypeScript-first architecture
- shared SDK and shared domain models
- web applications for user, market-hub, plan-owner, admin, and analytics experiences

### Integrations
- product registry APIs
- payment and stable-asset providers
- blockchain data and event indexing services
- merchant and marketplace APIs

## 11. Development and Delivery Strategy

### Development Lifecycle
1. define shared domain schemas and contracts
2. implement registry and intelligence services
3. wire wallet and access services
4. connect marketplace, plan, and settlement flows
5. deliver reporting and governance workflows

### Testing Strategy
- unit tests
- contract and integration tests
- end-to-end testing across user, market-hub, and plan-owner journeys

### Security and Governance
- auditable state transitions
- role separation and signed approvals
- wallet-safe authentication boundaries
- secret management through configuration and environment controls

## 12. Out of Scope

For initial architecture and repository foundation, the following remain out of scope unless explicitly introduced later:

- full consumer-facing fiat on-ramp orchestration
- centralized custody for user funds
- legacy migration from unrelated systems
- regulatory UI enforcement beyond governance and reporting hooks

## 13. Governance and Contribution

The repository should evolve through architecture decision records, shared schemas, documented service boundaries, and auditable contract upgrades.

Contribution principles:
- keep domain boundaries explicit
- preserve shared types and contract compatibility
- maintain auditable flows across access, commerce, and settlement
- document governance changes and contract upgrades
- avoid hardcoded secrets and insecure configuration

## 14. Implementation Status

The repository now reflects:
- a restructured enterprise monorepo for Victuals
- a merged architecture-first README for the platform and ITAL Nutri Agent
- a multi-agent operating-system model for nutrition intelligence
- explicit support for subscription plan owners and plan subscribers

Victuals is now positioned as the enterprise foundation for the ITAL Nutritional Agent Marketplace and the Global Nutritional Intelligence Network.
