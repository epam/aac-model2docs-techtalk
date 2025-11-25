---
title: Requirements
parent: SkyAssist
nav_order: 4
---

# 4. Requirements

## 4.1 Business Goals, associated with solution

The SkyAssist solution is designed to achieve the following business goals for SkyCart:

1. **Enhanced Customer Experience**: Provide 24/7 automated customer support with instant responses to common inquiries
2. **Operational Efficiency**: Reduce the workload on customer service representatives by automating routine inquiries
3. **Scalability**: Enable support across multiple channels (web, mobile apps, Microsoft Teams) without proportional increase in support staff
4. **Customer Self-Service**: Empower customers to find products, track orders, and resolve issues independently
5. **Improved Customer Satisfaction**: Reduce response times and provide consistent, accurate information across all touchpoints
6. **Data-Driven Insights**: Gather customer interaction data to identify trends, common issues, and opportunities for improvement
7. **Competitive Advantage**: Differentiate SkyCart through innovative AI-powered customer service capabilities

## 4.2 Functional requirements

The following functional requirements have been identified for the SkyAssist solution:

### Primary Interface

**Conversational User Interface**: The conversational user interface should be the primary interaction method, enabling natural language conversations between customers and the AI agent.

### Core Capabilities

1. **Product Discovery & Recommendations**
   - Provide personalized travel gear recommendations based on customer preferences
   - Leverage product characteristics and customer data for intelligent suggestions
   - Support web search grounding for up-to-date product information

2. **Order Management**
   - Check order status and tracking information
   - Retrieve order details from OneStock system
   - Provide delivery updates and estimated arrival times
   - Handle basic order-related inquiries

3. **Customer Support**
   - Answer frequently asked questions
   - Provide information about store policies, returns, and exchanges
   - Access customer history and previous interactions
   - Escalate complex issues to human customer service representatives

4. **Multi-Channel Support**
   - Web widget integration with Hybris e-commerce platform
   - Mobile application support
   - Microsoft Teams channel for internal SkyCart staff
   - Future support for Facebook and WhatsApp channels

5. **Escalation & Handoff**
   - Seamless escalation to Zendesk for human agent intervention
   - Context preservation during handoff to ensure continuity
   - Support for bidirectional communication between bot and human agents

### Reference Documentation

Detailed functional requirements and flows are documented in:
- [Customer Chatbot Roadmap.pptx](https://aswatsonuk.sharepoint.com/:p:/r/sites/TPSAutomationTeam/_layouts/15/Doc.aspx?sourcedoc=%7BE35E695B-9F4C-4584-8501-1D1221119F6C%7D&file=Customer%20Chatbot%20Roadmap.pptx)
- [Order Agent Flow - O + O Technology - Confluence](https://confluence.example.com/order-agent-flow)
- Internal Team - Customer Chatbot Documentation

## 4.3 Non-functional requirements

**Agent Granularity**: The solution must support fine-grained agent modularity, allowing individual agents (Travel Gear Finder, Order Agent, etc.) to be developed, deployed, and managed independently.

**Feature Control**: Administrators must have the ability to enable or disable specific conversational flows and agent capabilities without requiring code deployments, supporting:
- Gradual feature rollout
- Emergency capability disablement
- Environment-specific configurations

**Power Platform Adoption** <span style="color: red;">(DEPRIORITIZED)</span>: The architecture should consider and accommodate future integration with Microsoft Power Platform components:
- Potential migration paths to Copilot Studio
- Power Automate integration for workflow automation
- Power Apps integration for administrative interfaces
- Alignment with Microsoft technology stack strategy

**Data Retention**: Conversation history retained for 30 minutes to support active session continuity, with configurable retention policies for analytics and compliance purposes.

**Extensibility**: The architecture must support easy addition of new agents and capabilities without disrupting existing functionality.

**Multi-Tenancy**: Support for different configurations across development, test, and production environments while sharing common infrastructure resources.

