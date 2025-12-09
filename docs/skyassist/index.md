---
title: SkyAssist Architecture
nav_order: 2
has_children: true
permalink: /skyassist/
---

# SkyAssist Solution Architecture

Welcome to the comprehensive architecture documentation for SkyAssist - SkyCart's intelligent, AI-powered customer service platform.

## Overview

SkyAssist is a cloud-native, multi-agent conversational AI system built on Microsoft Azure. It delivers 24/7 customer support across multiple channels, provides intelligent product recommendations, handles order inquiries, and seamlessly escalates to human agents when needed.

![System Context](/images/skyassist/SystemContext.svg)
{: .svg-container}

## Architecture Documentation Structure

This documentation follows industry-standard Solution Architecture Document (SAD) template and includes:

### [1. Executive Summary](01-executive-summary.md)
High-level overview of the solution, business context, key architectural decisions, and expected benefits.

### [2. Introduction](02-introduction.md)
Document scope, stakeholders, definitions, and acronyms used throughout the architecture.

### [3. Context](03-context.md)
Technology strategy alignment, business architecture, data architecture, infrastructure context, and security framework.

### [4. Requirements](04-requirements.md)
Business goals, functional requirements (product recommendations, order tracking, escalation), and comprehensive non-functional requirements.

### [5. Quality Attributes](05-quality-attributes.md)
Detailed quality attribute scenarios for performance, scalability, availability, security, observability, maintainability, and cost efficiency.

### [6. Baseline Architecture](06-baseline-architecture.md)
Current state analysis showing traditional customer service approach and the business drivers for transformation.

### [7. Target Architecture](07-target-architecture.md)
Comprehensive target architecture including:
- **Conceptual View**: High-level solution concept and value proposition
- **Logical View**: Container and component diagrams with agent architecture
- **Integration View**: External system integrations (Catalog, Order Service, Zendesk)
- **Data View**: Data models and persistence architecture
- **Infrastructure View**: Deployment across Dev/Test/Production environments
- **Dynamic Views**: Request flows and interaction patterns
- **Quality Attributes**: How architecture addresses key quality concerns
- **Constraints & Risks**: Known limitations and mitigation strategies
- **Costs**: Cost structure and optimization strategies

### [8. Transition / Migration](08-transition-migration.md)
Phased rollout approach with detailed migration roadmap from baseline to target architecture.

### [9. Solution Architecture Governance](09-solution-architecture-governance.md)
Governance guidelines for architecture design, development standards, DevOps practices, quality assurance, and ongoing maintenance.

## Key Features

- **Multi-Agent Architecture**: Specialized agents for different capabilities (orchestration, product recommendation, order tracking)
- **AI-Powered**: Leverages Azure AI Foundry, Azure OpenAI (GPT-5.1), and Microsoft Agent Framework
- **Multi-Channel**: Web widget, mobile apps, and Microsoft Teams integration
- **Cloud-Native**: Built on Azure with Container Apps, Cosmos DB, and Azure Front Door
- **Scalable**: Auto-scaling to handle 10x traffic spikes during peak seasons
- **Secure**: Defense-in-depth security with WAF, private endpoints, and comprehensive monitoring

## Architecture Diagrams

All architecture diagrams are generated from Structurizr DSL models and follow the C4 model:

- **System Landscape**: Overall SkyCart ecosystem
- **System Context**: SkyAssist in context of external systems
- **Containers**: Major components and their interactions
- **Components**: Detailed views of key containers (agents, services)
- **Deployment**: Infrastructure across environments
- **Dynamic**: Workflows and interaction flows

## Technology Stack

- **Cloud Platform**: Microsoft Azure
- **AI Services**: Azure AI Foundry, Azure OpenAI (GPT-5.1)
- **Agent Framework**: Microsoft Agent Framework, Semantic Kernel
- **Compute**: Azure Container Apps
- **Data**: Azure Cosmos DB, Azure Storage
- **Security**: Azure Key Vault, Azure Front Door with WAF
- **Monitoring**: Application Insights, Log Analytics
- **Languages**: Python (backend), React.js (frontend)

## Related Documentation

- [Technical Decision Log](../tdl/technical-decision-log.md): Key architectural decisions and rationale
- [GitHub Repository](https://github.com/epam/aac-model2docs-techtalk): Source code and DSL models

---

**Document Version**: 1.0  
**Last Updated**: December 9, 2025  
**Status**: Approved for Implementation
