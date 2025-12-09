---
title: SkyAssist - Conversational bot technical stack
parent: Technical Decision Log
nav_order: 1
impact: High
decision_date: May 12, 2025
outcome: Option 2 - Azure Bot Service + Semantic Kernel + Microsoft AI Foundry + OpenAI Services
---

# SkyAssist - Conversational bot technical stack

| | |
|---|---|
| **Status** | **<span style="color:green">COMPLETED</span>**, **<span style="color:grey">OUTDATED</span>** |
| **Impact** | High |
| **Decision Date** | May 12, 2025 |
| **Driver** | @Sergii Gorkun |
| **Approver** | @Mike Richardson (Head of Technology) |
| **Contributors** | @David Cooper @James Wilson |
| **Informed** | @Lisa Martinez (Project Manager) @Emily Davis (Project Manager) |
| **Due date** | Mar 12, 2025 |
| **Resources** | SkyAssist |
| **Outcome** | Option 2 is the decision. Azure Bot Service + Semantic Kernel + Microsoft AI Foundry + OpenAI Services |

## Background

This Solution Architecture Document outlines the proposed design for a conversational bot for SkyCart. The primary objective of this solution is to enhance customer interaction by providing a natural language conversational interface. This will enable SkyCart to handle a wide range of customer queries efficiently and automate repetitive tasks. By integrating this bot with existing enterprise systems, we aim to streamline operations and reduce the workload on Customer Service Representatives. This initiative is expected to improve customer satisfaction and operational efficiency.

## Relevant Data

Customer Chatbot Roadmap - Internal Documentation

## Options Considered

### OPTION 1: Copilot Studio + Power Automate

**Description:**

Copilot Studio is a graphical, low-code tool for both creating an agent—including building automation with Power Automate—and extending a copilot. With Copilot Studio, you can publish agents to engage with your customers on multiple platforms or channels, such as live websites, mobile apps, or messaging platforms like Microsoft Teams and Facebook.

| Pros | Cons |
|------|------|
| Integrated environment tailored for Low code/No Code + AI development | Limited to functionalities provided by the Studio, restricting flexibility for highly customized solutions |
| Streamlined workflow from development to deployment | Limited Retrieval Augmented Generation (RAG) control |
| Straightforward licensing and easy manageable cost of ownership | Potential for vendor lock-in, making it difficult to switch to another solution in the future |
| Pre-built adapters for different channels | Limited scalability, which may hinder growth and expansion |
| Pre-built 'escalation' connectors | Handoff between agents is very limited, potentially leading to a monolithic-like implementation |
| Strong community and support | "Escalation" to Zendesk may require custom development, adding complexity and potential costs |
| | Limited capabilities for building advanced UI data representations such as graphs and charts |

### OPTION 2: Azure Bot Service + Semantic Kernel + Microsoft AI Foundry + OpenAI Services

**Description:**

Semantic Kernel is a lightweight, open-source development kit that lets you easily build AI agents and integrate the latest AI models into your C#, Python, or Java codebase. It serves as an efficient middleware that enables rapid delivery of enterprise-grade solutions.

Azure AI Foundry is designed to enable developers to:
- Build generative AI applications on an enterprise-grade platform
- Explore, build, test, and deploy using cutting-edge AI tools and machine learning models, grounded in responsible AI practices

Azure AI Foundry offers a broad range of models, services, and capabilities, facilitating the development of AI applications that effectively meet specific goals. Once satisfaction with the experience in the Azure AI Foundry portal is achieved, the model can be deployed as a standalone web application.

| Pros | Cons |
|------|------|
| High flexibility and customization potential | More complex setup and management due to multiple components |
| Access to cutting-edge AI technologies | Potentially higher operational overhead |
| Advanced RAG capabilities using AI Search | Requires more in-depth technical expertise to integrate and maintain, including developers with Python knowledge |
| Scalability through separate web hosting solutions | Conversation management and topics enforcement might become more sophisticated |
| Pro-code development and advanced development capabilities | Azure Bot Service or custom development might be required to enable all required channels |
| | "Escalation" (handoff to Zendesk) requires custom development |
| | DevOps practices complexity |
| | Complex cost of ownership calculations |

### OPTION 3: Copilot Studio + Power Automate + Microsoft AI Foundry + OpenAI

**Description:**

The idea is to use Copilot Studio for main agent capabilities:
- Topics and Intentions management
- Conversation enforcement
- Agent hosting
- Channels connection

And then use Microsoft AI Foundry for AI/RAG capabilities.

| Pros | Cons |
|------|------|
| Integrated environment tailored for Low code/No Code + AI development | More complex setup and management due to multiple components |
| Streamlined workflow from development to deployment | Potentially higher operational overhead |
| Pre-built adapters for different channels | DevOps practices complexity |
| Pre-built 'escalation' connectors | Complex cost of ownership calculations |
| High flexibility and customization potential | Multiple in Preview components that might generate an issue |
| Access to cutting-edge AI technologies | |
| Advanced RAG capabilities using AI Search | |
| Use of AI Foundry can be delayed if this would be needed at all then OPTION 1 | |

### OPTION 4: Zendesk Native capabilities / Zendesk Ultimate

**Description:**

Zendesk Native or/and Zendesk will be used to enable channels and build AI agent.

| Pros | Cons |
|------|------|
| Native to Customer Services capabilities | Excessively linked with Zendesk |
| Zendesk Conversation bot is already purchased and is a part of Zendesk implementation | Database storage would be either Zendesk or custom development is required |
| Integrated environment tailored for Low code/No Code | AI Capabilities are included in Zendesk Ultimate that are not a part of the purchased package |
| | Basic Automation capabilities available |
| | Limited AI capabilities |

## Platform Limits and Need to Know Information

- [Quotas, limits, app registration, certificates, and configuration values - Microsoft Copilot Studio](https://learn.microsoft.com/copilot-studio)
- [Plan and manage costs for Azure AI Foundry](https://learn.microsoft.com/azure/ai-foundry)
- [AI Studio or Machine Learning Studio; Which experience should I choose?](https://learn.microsoft.com/azure/machine-learning)
- OPTION 1 AND OPTION 2
- [Navigating the AI agents (Ultimate) product – Zendesk help](https://support.zendesk.com)

## Action Items

To close open questions and concerns, check:

- Sign-in/SSO for Hybris accounts for customer (all options question)
- Zendesk integration in general and 'Escalation' in particular (all options questions)
- Development and Deployment flow (option 2 and partially option 3 if needed)
- Chat widget customization and embedment into Hybris
  - Option 1 and 3
  - Option 2
- Main development language and web tech stack for Option 2: C# + TypeScript + Python or Python + Front-end framework

## Outcome

Option 2 is the decision.
