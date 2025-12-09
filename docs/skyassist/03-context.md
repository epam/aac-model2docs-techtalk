---
title: Context
parent: SkyAssist Architecture
nav_order: 3
---

# 3. Context

The SkyAssist solution architecture is designed within the broader context of SkyCart's digital transformation strategy and enterprise architecture landscape.

## 3.1 Technology Strategy

### Strategic Direction

SkyCart's technology strategy focuses on:

1. **Cloud-First Approach**: Migrating workloads to Microsoft Azure for scalability and operational efficiency
2. **AI-Driven Innovation**: Leveraging artificial intelligence to enhance customer experience and operational automation
3. **Multi-Channel Customer Engagement**: Providing seamless experiences across web, mobile, and messaging platforms
4. **API-First Architecture**: Building modular, reusable services with well-defined interfaces
5. **DevOps and Automation**: Implementing continuous integration/deployment and infrastructure as code

### Technology Stack Alignment

The SkyAssist architecture aligns with SkyCart's strategic technology choices:

- **Cloud Platform**: Microsoft Azure as the primary cloud provider
- **Programming Languages**: Python for backend services, React.js for frontend
- **AI/ML Services**: Azure AI Foundry, Azure OpenAI Services
- **Container Orchestration**: Azure Container Apps for microservices
- **Data Persistence**: Azure Cosmos DB for NoSQL requirements
- **Monitoring**: Application Insights and Log Analytics
- **Security**: Azure Key Vault, Azure Front Door with WAF

### Key Technology Decisions

Reference Technical Decision Logs:
- [TDL-01: Conversational Bot Technical Stack](../tdl/01-skyassist-conversational-bot-technical-stack.md)
- [TDL-16: Microsoft Agent Framework Adoption](../tdl/16-decision-on-microsoft-agent-framework-preferred-solution.md)

## 3.2 Business Architecture

### Business Capabilities Supported

SkyAssist supports the following SkyCart business capabilities:

| Business Capability | SkyAssist Support |
|---------------------|-------------------|
| Customer Service | 24/7 automated inquiry handling, escalation to human agents |
| Product Discovery | AI-powered product recommendations based on natural language queries |
| Order Management | Order status tracking, returns and refunds information |
| Customer Engagement | Multi-channel conversational interface (web, mobile, Teams) |
| Operational Efficiency | Reduction in CS representative workload, faster response times |

### Business Processes

SkyAssist integrates with the following business processes:

1. **Customer Inquiry Management**: Automated first-line response to customer questions
2. **Product Recommendation**: Intelligent product matching based on customer needs
3. **Order Tracking**: Real-time order status and shipping information
4. **Escalation Management**: Seamless handoff to human agents for complex issues
5. **Internal Support**: Self-service for SkyCart staff via Microsoft Teams

## 3.3 Data Architecture

### Data Domains

SkyAssist interacts with the following data domains:

- **Conversational Data**: Chat history, user context, session state
- **Product Catalog Data**: Product information, pricing, inventory (read-only from Catalog Service)
- **Order Data**: Order details, status, tracking information (read-only from Order Service)
- **Customer Support Data**: Support tickets, escalation records (via Zendesk)

### Data Persistence Strategy

- **Cosmos DB**: Primary data store for conversation history and agent state
- **Azure Storage**: Static content delivery (widget files)
- **External Systems**: Source of truth for product and order data

### Data Governance

- **Data Residency**: All data stored in Azure UA-Central region
- **Data Retention**: Conversation history retained per compliance requirements
- **PII Protection**: Customer data encrypted at rest and in transit
- **Access Control**: Role-based access to sensitive data

## 3.4 Infrastructure Architecture

### Cloud Infrastructure Principles

SkyCart's infrastructure architecture follows these principles:

1. **Infrastructure as Code**: All infrastructure defined using Structurizr DSL and exported diagrams
2. **Environment Isolation**: Separate Development, Test, and Production environments
3. **High Availability**: Multi-instance deployments with automatic failover
4. **Scalability**: Auto-scaling based on demand patterns
5. **Security**: Defense-in-depth with network isolation, WAF, and private endpoints

### Azure Landing Zone

SkyAssist is deployed within SkyCart's Azure landing zone:

- **Region**: Azure UA-Central (primary)
- **Resource Organization**: Resource groups per environment (rg-skyassist-dev, rg-skyassist-test, rg-skyassist-prod)
- **Networking**: Virtual networks with private endpoints for secure connectivity
- **Identity**: Azure AD integration for authentication

## 3.5 Application Architecture

### Enterprise Application Landscape

SkyAssist integrates with the following existing systems:

![System Context](/images/skyassist/SystemContext.svg)
{: .svg-container}

**Existing SkyCart Systems:**

1. **SkyCart Website**: Customer-facing web application
2. **Mobile Applications**: iOS and Android customer apps
3. **Catalog Service**: Product information and inventory management
4. **Order Service**: Order processing and fulfillment
5. **Zendesk**: Customer support ticketing system (via Sunshine Conversations)
6. **Microsoft Teams**: Internal collaboration platform

### Integration Patterns

- **RESTful APIs**: HTTP/HTTPS APIs for synchronous communication
- **Event-Driven**: Future consideration for asynchronous updates
- **Webhooks**: Zendesk integration for bidirectional communication

## 3.6 Security Architecture

### Security Framework

SkyAssist adheres to SkyCart's security framework:

1. **Identity and Access Management**
   - Azure AD for authentication
   - RBAC for authorization
   - Service principals for service-to-service communication

2. **Network Security**
   - Azure Front Door with WAF protection
   - Private endpoints for backend services
   - Network security groups for traffic filtering

3. **Data Protection**
   - Encryption at rest (Azure Storage, Cosmos DB)
   - Encryption in transit (TLS 1.2+)
   - Azure Key Vault for secrets management

4. **Application Security**
   - Secure coding practices
   - Dependency scanning and vulnerability management
   - Regular security assessments

5. **Compliance**
   - GDPR compliance for customer data
   - PCI DSS for payment-related information handling
   - Industry-standard security certifications

### Threat Model Considerations

- **DDoS Protection**: Azure Front Door with DDoS protection
- **Injection Attacks**: Input validation and sanitization
- **Data Breaches**: Encryption and access controls
- **Service Disruption**: High availability and disaster recovery planning
