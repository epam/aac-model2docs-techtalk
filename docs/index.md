---
title: Home
nav_order: 1
permalink: /
---

# SkyCart Architecture Documentation

Welcome to the architecture documentation for SkyCart's digital transformation initiative, with a focus on the AI-powered Agents system.

## About SkyCart

SkyCart is a mid-size e-commerce marketplace specializing in outdoor and travel gear. Operating across multiple countries, SkyCart supports both direct sales and third-party sellers, managing seasonal promotions with significant traffic spikes.

## Architecture Overview

This documentation covers the comprehensive architecture for SkyCart's SkyAssist – an intelligent, multi-agent conversational platform designed to transform customer service delivery and enhance operational efficiency.

### Key Systems

- **SkyAssist**: Intelligent customer service platform (primary focus)
- **Marketplace API**: Core business logic and orchestration
- **Catalog Service**: Product information and inventory
- **Order Service**: Order management and fulfillment
- **Seller Portal**: Third-party seller management
- **Payment & Shipping Integrations**: External service integrations

## Documentation Structure

This site contains:

- **[SkyAssist](skyassist/digital-agent.md)**: Complete architecture documentation
  - Executive Summary
  - Introduction & Scope
  - Context & Requirements
  - Architecture Views (System, Container, Component, Deployment)
  - Quality Attributes
  - Solution Governance

- **[Technical Decision Log](tdl/technical-decision-log.md)**: Key architectural decisions and rationale

## Architecture Philosophy

The architecture follows these principles:

- **Modular Design**: Agent-based architecture with specialized capabilities
- **Cloud-Native**: Built on Microsoft Azure for scalability and resilience
- **AI-Powered**: Leveraging Azure AI Foundry and Azure OpenAI
- **Multi-Channel**: Supporting web, mobile, and Microsoft Teams
- **Enterprise Integration**: Deep integration with existing SkyCart systems

## Technology Stack

- **Cloud Platform**: Microsoft Azure (UK-South region)
- **AI/ML**: Azure AI Foundry, Azure OpenAI, Semantic Kernel
- **Runtime**: Azure App Services (Python, FastAPI)
- **Data**: Azure Cosmos DB, Azure Storage
- **Communication**: Azure Bot Service, Azure Front Door
- **Observability**: Azure Monitor, Application Insights

## Getting Started

Explore the architecture:

1. Start with the [Executive Summary](skyassist/01-executive-summary.md)
2. Review the [System Context](skyassist/digital-agent.md)
3. Dive into detailed [Container](skyassist/07-target-architecture.md) and Component views
4. Understand key [Technical Decisions](tdl/technical-decision-log.md)

## Source Code

The architecture is defined using Structurizr DSL and follows the C4 model. All source models are available in the [GitHub repository]({{ site.github.repository_url }}).

---

*This is a living document. For questions or contributions, please refer to the repository's contribution guidelines.*
