---
title: Context
parent: SkyAssist
nav_order: 3
---

# 3. Context

## 3.1 Technology Strategy

SkyCart currently employs Hybris as its primary e-commerce platform, which will host the chat widget for the new conversational agent. Additionally, support for other channels such as Facebook and WhatsApp is required. Customer service operations are managed through Zendesk, and the organization utilizes various other systems and data technologies, including Data Bricks and potentially Microsoft Fabric. The agent is intended to be developed using generative AI (GenAI) technologies and is planned to be implemented within the Microsoft technology stack.

Given the diverse and complex technological landscape at SkyCart, the following aspects have been taken into account:

### Integration Strategy

**Hybris Integration**: Ensure seamless integration of the agent within the Hybris e-commerce platform. This involves API-level integration for data exchange and UI embedding for the chat widget.

**Zendesk Integration**: Since customer service operations are managed through Zendesk, the agent should be capable of interfacing with Zendesk to fetch customer service data and trigger actions, including 'escalation' hand-off flow, based on customer interactions.

**Delivery Providers Integration**: The system should be capable of integrating with different delivery providers to gather information about the delivery process.

### Architecture Principles

**Decoupling and Modular Architecture**: Given the interconnected nature of SkyCart's systems, adopting a modular architecture for the agent is crucial. This approach will facilitate easier maintenance and scalability.

**Compliance and Security**: Ensure that all integrations and data exchanges comply with relevant data protection laws and industry standards. Implement robust security measures to protect customer data and prevent unauthorized access to the systems.

**Interface**: The conversational user interface should include limited graphical elements capabilities to enhance user interaction while maintaining simplicity.

### Technology Landscape

Technologies already being used in "sibling" streams:

- **Cloud**: Azure, Power Platform
- **Backend**: Power Automate
- **Frontend**: Power Pages + JS, Canvas
- **VCS provider**: GitHub
- **CI**: GitHub Actions
- **Software repository**: GitHub
- **Static code analysis**: None

### Technology Roadmap

The SkyAssist solution aligns with SkyCart's strategic direction towards:

- **Microsoft Azure**: Primary cloud platform for infrastructure and AI services
- **Azure AI Foundry**: LLM management, agent services creation, and content safety
- **Generative AI Technologies**: Leveraging Azure OpenAI for natural language processing and conversational capabilities
- **Modular Microservices**: Python-based services using FastAPI and Agent Framework for agent orchestration
- **Enterprise Integration**: RESTful API integration with existing systems (Hybris, OneStock, Zendesk, CDC, etc.)

## 3.2 Business Architecture

The SkyAssist solution supports SkyCart's customer service business model by:

- **Customer Self-Service**: Enabling customers to resolve inquiries autonomously through conversational AI across multiple channels
- **Customer Service Representative Augmentation**: Providing intelligent support to reduce CSR workload while maintaining human escalation paths
- **Multi-Channel Engagement**: Supporting web, mobile applications, and Microsoft Teams for both customer-facing and internal use cases
- **Enterprise System Integration**: Connecting with core business systems for order management, product information, customer data, and support ticketing

### Key Business Capabilities Supported

1. **Product Discovery**: Travel gear recommendations through AI-powered conversations with web search grounding
2. **Order Management**: Order status inquiries, tracking, and basic order operations
3. **Customer Support**: Issue resolution, information retrieval, and escalation to human agents when necessary
4. **Internal Operations**: SkyCart staff access via Microsoft Teams for operational support

## 3.3 Data Architecture

SkyAssist integrates with SkyCart's data architecture through:

### Data Sources

- **Hybris**: Product catalog, pricing, and e-commerce data
- **OneStock**: Order management and inventory data
- **CDC (Customer Data Center)**: Customer relationship management data
- **Zendesk**: Customer support history and ticketing information
- **GCDB (Gift Card Database)**: Gift card information and balances
- **CDP (Customer Data Platform)**: Customer behavior and preference data (Insider platform)
- **FOTW (Fragrance of the World)**: Travel gear product catalog and characteristics
- **Scurri**: Shipping and delivery tracking data
- **WINS**: Commerce and transaction data
- **Adobe**: Brand preferences and marketing data

### Data Storage

- **Azure Cosmos DB**: Conversation history and session state for all agents and services
- **Azure Table Storage**: Chat gateway and agents conversation memory
- **Azure Blob Storage**: Static content and widget assets

### Data Flow Principles

- **API-First Integration**: RESTful API consumption from enterprise systems
- **Conversation Persistence**: Conversation context stored for 30 minutes for continuity within active sessions
- **Real-Time Data Access**: Live queries to source systems for current information
- **Data Privacy**: Secure handling of customer data with encryption at rest and in transit

## 3.4 Infrastructure Architecture

The solution is deployed on Microsoft Azure in the UK-South region with the following infrastructure principles:

### Cloud Infrastructure

- **Azure Resource Groups**: Separate resource groups for environment isolation (dev, test, prod) and shared resources
- **Azure App Service Plans**: Managed hosting for Python-based microservices
- **Azure Front Door**: Global entry point with Web Application Firewall (WAF) protection and routing
- **Azure Key Vault**: Centralized secrets management for API keys, credentials, and certificates
- **Private Endpoints**: Secure connectivity to Azure PaaS services

### Scalability & Availability

- **Horizontal Scaling**: App Services configured for auto-scaling based on demand
- **Shared Resources**: AI Foundry, Cosmos DB, and Key Vault shared across environments for cost optimization
- **Multi-Environment**: Development, Test, and Production environments with environment-specific configurations

### Network Architecture

- **Azure Virtual Networks**: Isolated network segments for different environments
- **Azure Private Endpoints**: Secure connectivity for storage and database services, Frontdoor -> Chat Service as the scured entry point. 
- **Azure Front Door**: Global load balancing and DDoS protection
- **WAF Policies**: Protection against OWASP Top 10 vulnerabilities

## 3.5 Application Architecture

SkyAssist follows a modular, microservices-based application architecture:

### Architecture Pattern

**Agentic AI Architecture**: Multiple conversable agents orchestrated centrally to resolve complex customer service scenarios with limited direct human supervision.

### Core Components

1. **Azure Bot**: Multi-channel adapter supporting Direct Line, Microsoft Teams, and future channels
2. **Chat Service**: Entry point managing Direct Line tokens and conversation routing
3. **Digital Agent Orchestrator**: Central coordination agent implementing agent handoff patterns
4. **Specialized Agents**:
   - Travel Gear Finder Agent: Product recommendations using Azure AI Foundry Agent Services
   - Order Agent: Order inquiries and management, developed with Copilot Studio and integrated via Agent Framework
   - Future agents: Extensible architecture for new capabilities

### Technology Stack

- **Programming Language**: Python 3.x
- **Web Framework**: FastAPI for RESTful APIs
- **AI Orchestration**: Microsoft Agent Framework
- **Azure AI Services**: Azure AI Foundry for LLM management and agent services
- **Bot Framework**: Azure Bot SDK for multi-channel support
- **Observability**: OpenTelemetry for distributed tracing

### Design Principles

- **Single Responsibility**: Each agent handles a specific domain (orders, products, etc.)
- **Loose Coupling**: Agents communicate through well-defined APIs
- **Stateful Conversations**: Conversation history managed per agent with shared context
- **Extensibility**: Plugin-based architecture for adding new agents and capabilities

## 3.6 Security Architecture

Security is implemented at multiple layers to protect customer data and ensure compliance:

### Authentication & Authorization

- **Azure Active Directory**: Identity provider for user authentication
- **OAuth 2.0**: Token-based authentication for API access
- **Azure Key Vault**: Secure storage of API keys, connection strings, and certificates
- **Direct Line Token Management**: Secure token generation and rotation for bot channels

### Data Protection

- **Encryption at Rest**: Azure Cosmos DB and Storage encryption enabled
- **Encryption in Transit**: TLS 1.2+ for all HTTPS communications
- **Private Endpoints**: Network isolation for Azure PaaS services
- **Content Filtering**: Azure AI Foundry content safety filters and custom blocklists

### Application Security

- **Web Application Firewall (WAF)**: Azure Front Door protection against web vulnerabilities
- **Content Safety**: Shared content filters and blocklists across all AI services
- **Input Validation**: Request validation at API layer
- **Secrets Management**: No hardcoded credentials; all secrets retrieved from Key Vault

### Monitoring & Compliance

- **Azure Monitor & Application Insights**: Security event logging and monitoring
- **Audit Logging**: Comprehensive logging of all API calls and data access
- **GDPR Compliance**: Customer data handling aligned with data protection regulations
- **Data Residency**: All data stored in Azure UK-South region
