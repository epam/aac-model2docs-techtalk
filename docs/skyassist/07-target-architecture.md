---
title: Target Architecture
parent: SkyAssist
nav_order: 7
---

# 7. Target Architecture

## 7.1 Conceptual View

### Overview

SkyAssist is a powerful AI companion that can handle a range of interactions and tasks and an extensible platform. Currently it has an Order Agent and the Travel Gear Finder agent. The orchestrator can handle any other agents to be connected, enabling the platform to grow and adapt to new business needs.

### System Context

![System Context](/images/skyassist/SystemContext.svg)
{: .svg-container}

SkyAssist operates within SkyCart's broader digital ecosystem, serving three primary user groups:

**Customers** interact with SkyAssist through:
- SkyCart's e-commerce website (skycart.com) via an embedded chat widget
- Mobile and web applications via Direct Line integration
- Seamless escalation to human customer service representatives when needed

**Customer Service Representatives** use the system to:
- Receive escalated customer inquiries through Zendesk integration
- Access full conversation history and context
- Provide human assistance when AI cannot resolve issues autonomously

**SkyCart Staff** engage with the agent through:
- Microsoft Teams integration for internal queries
- Dedicated Teams application providing secure access to agent capabilities (Travel Gear Finder primarily)

### Key Capabilities

The solution provides the following core capabilities:

1. **Multi-Channel Support**: Delivers consistent AI-powered assistance across web, mobile, and Microsoft Teams channels through a unified reverse proxy architecture

2. **Intelligent Orchestration**: Routes customer inquiries to specialized agents (Travel Gear Finder, Order Management) based on intent and context, ensuring optimal handling of diverse request types

3. **Travel gear finder**: Helps customers find products through natural language conversations, leveraging multiple search strategies and validation stages to provide accurate recommendations

4. **Order Management**: Assists customers with status checks and issue resolution by integrating with SkyCart's OneStock system

5. **Seamless Escalation**: Automatically escalates complex or sensitive issues to human customer service representatives through Sunshine Zendesk integration while maintaining full conversation context

6. **Grounding & Safety**: Ensures responses are accurate and appropriate through Azure AI Foundry content filters, blocklists, and web-grounded search capabilities

### Architectural Principles

The target architecture adheres to the following key principles:

1. **Microservices Architecture**: Specialized agents operate independently, enabling focused development and deployment
2. **API-First Design**: All interactions occur through well-defined APIs and webhooks
3. **Scalability**: Azure App Service and serverless components scale based on demand
4. **Security by Design**: Private endpoints, Key Vault integration, and content filtering protect data and interactions
5. **Observability**: Comprehensive logging, tracing, and monitoring through Application Insights and AI Foundry tracing
6. **Cloud-Native**: Leverages Azure PaaS services for reduced operational overhead

## 7.2 Logical View

### Container Architecture

The following diagram shows the high-level technical building blocks of the SkyAssist solution, including all containers, their responsibilities, and technologies used.

![Container Diagram](/images/skyassist/Containers.svg)
{: .svg-container}

The architecture is organized into the following key containers:

**Channel Adapters**:
- **Azure Bot**: Provides channel adapters for Microsoft Teams and Direct Line, enabling multi-channel access
- **Microsoft Teams App**: Dedicated Teams application for internal SkyCart staff

**Core Services**:
- **Chat Service**: Entry point handling webhooks, routing, and conversation management using Python and Semantic Kernel
- **Digital Agent Orchestrator**: Coordinates agent hand-offs and manages conversation flow between specialized agents

**Specialized Agents**:
- **Travel Gear Finder Agent**: Handles product discovery using AI Foundry agents and Hybris integration
- **Order Agent**: Manages order-related inquiries through OneStock integration, developed with Copilot Studio and integrated via Agent Framework

**AI Services**:
- **AI Foundry**: Shared resource providing blocklists, content filters, and safety controls
- **SkyAssist Project**: Project-specific AI Foundry workspace with tracing and agent execution services
- **Grounding with Bing**: Web search for LLM grounding across all environments

**Infrastructure & Storage**:
- **Reverse Proxy (Azure Front Door)**: Routes traffic, provides WAF protection, and health monitoring
- **Cosmos DB**: Stores conversation history and context for all agents
- **Static Content (Storage)**: Hosts widget files and conversation memory tables
- **Key Vault**: Manages secrets and credentials securely
- **Monitoring (Application Insights)**: Centralized telemetry and observability

### Runtime Behavior

The following diagrams illustrate the runtime behavior and interaction flows within the SkyAssist system.

### Uniform Dispatching Flow

This diagram shows the standard request-response flow through the system, demonstrating how messages are routed from customer-facing channels through the orchestration layer to specialized agents and back.

![Uniform Dispatching](/images/skyassist/UniformDispatching.svg)
{: .svg-container}

The flow demonstrates:
- Message routing through the reverse proxy and Azure Bot Service
- Orchestrator coordinating between Order Agent and Travel Gear Finder Agent
- Response chain returning through the same path to the originating channel

### Escalation Process Flow

This diagram illustrates how customer inquiries are escalated to human customer service representatives when the AI agent cannot resolve the issue autonomously.

![Escalation Process](/images/skyassist/EscalationProcess.svg)
{: .svg-container}

The escalation flow shows:
- Direct integration with Sunshine Zendesk for ticket creation
- Webhook-based communication for CS representative responses
- Bidirectional message flow ensuring seamless handoff between AI and human agents

### Travel Gear Finder Agent Workflow

This internal workflow diagram shows the multi-stage search and validation process within the Travel Gear Finder Agent.

![Travel Gear Finder Workflow](/images/skyassist/TravelGearFinderWorkflow.svg)
{: .svg-container}

The workflow demonstrates:
- Plan Builder orchestrating the search execution strategy
- Multiple parallel search agents (Classic, Wildcard, New) for comprehensive results
- Multi-stage validation through Match Validation and SkyCart Validation executors
- Result merging and completeness checking with iterative refinement

## 7.3 Integration View

## 7.4 Data View

### Data Persistence Flow

This diagram demonstrates how conversation data is stored and retrieved across all agents and services using Cosmos DB as the central persistence layer.

![Data Persistence Flow](/images/skyassist/DataPersistenceFlow.svg)
{: .svg-container}

Key aspects include:
- Each service (Chat Service, Orchestrator, Order Agent, Travel Gear Finder) maintains its own conversation memory
- All conversation histories are persisted to and retrieved from Cosmos DB
- Ensures conversation context is maintained across sessions and service restarts

## 7.5 Infrastructure / Deployment View

## 7.7 Addressing Key Quality Attributes

## 7.8 Architecture Constraints and Limitations

## 7.9 Risks and Mitigations

## 7.10 Solution Costs and Cost Management
