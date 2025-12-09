---
title: Baseline Architecture
parent: SkyAssist Architecture
nav_order: 6
---

# 6. Baseline Architecture

This section describes the baseline architecture - the existing customer service capabilities at SkyCart before implementing SkyAssist.

## 6.1 Conceptual View

### Current State Overview

Prior to SkyAssist, SkyCart relied on traditional customer service approaches:

**Customer Service Channels:**
- **Email Support**: Customers send inquiries via email, handled by CS representatives
- **Phone Support**: Call center with limited hours and capacity
- **Zendesk Ticketing**: Manual ticket creation and assignment
- **Website FAQ**: Static self-service content

**Limitations:**
- No 24/7 availability
- Long response times (hours to days)
- Limited scalability during peak seasons
- High operational costs (CS representative headcount)
- No personalized product recommendations
- Inconsistent customer experience across channels
- No self-service for order tracking

## 6.2 Logical View

### Existing System Components

The baseline architecture consists of:

1. **SkyCart Website & Mobile Apps**
   - Customer-facing storefronts
   - Product browsing and checkout
   - Basic order tracking (login required)

2. **Zendesk Customer Service Platform**
   - Manual ticket management
   - CS representative console
   - Email integration
   - Basic reporting

3. **Catalog Service**
   - Product information
   - Inventory management
   - Search functionality (keyword-based)

4. **Order Service**
   - Order processing
   - Status tracking
   - Returns and refunds management

**Integration:**
- Manual data lookup by CS representatives
- No automated customer inquiry handling
- Limited integration between systems

## 6.3 Integration View

### Current Integration Landscape

**Email to Zendesk:**
- Customers send emails to support@skycart.com
- Emails converted to Zendesk tickets
- Manual assignment to CS representatives

**CS Representatives to Backend Systems:**
- Manual login to internal tools
- Separate interfaces for order lookup, product information
- No unified customer view

**Limitations:**
- No real-time integration
- Manual context switching
- No API-based automation
- Fragmented customer data

## 6.4 Data View

### Current Data Architecture

**Customer Support Data:**
- Stored in Zendesk (ticket history, CS notes)
- No conversation persistence outside ticket system
- Limited analytics capabilities

**Product Data:**
- Catalog Service database (relational)
- Keyword-based search only
- No semantic understanding

**Order Data:**
- Order Service database
- Accessible only through internal tools
- No customer self-service API

**Pain Points:**
- Data silos across systems
- No unified customer interaction history
- Limited insights into customer behavior
- Manual data correlation

## 6.5 Infrastructure / Deployment View

### Current Infrastructure

**Hosting:**
- Mixed on-premises and cloud infrastructure
- Legacy systems on-premises
- Some services migrated to Azure

**Scalability:**
- Limited auto-scaling capabilities
- Manual capacity planning for peak seasons
- Over-provisioning for worst-case scenarios

**Availability:**
- Business hours support (8 AM - 8 PM)
- No 24/7 availability SLA
- Planned maintenance windows

## 6.6 Operational Challenges

### Key Issues with Baseline Architecture

| Challenge | Impact | Business Cost |
|-----------|--------|---------------|
| **Limited Availability** | Customers wait until business hours | Lost sales, poor satisfaction |
| **Slow Response Times** | Hours to days for email responses | Customer frustration, cart abandonment |
| **Poor Scalability** | Cannot handle seasonal traffic spikes | Hiring temporary staff, overtime costs |
| **No Self-Service** | All inquiries require CS representative | High operational costs |
| **Inconsistent Experience** | Different experience per channel | Brand perception issues |
| **Limited Product Discovery** | Keyword search misses customer intent | Missed sales opportunities |
| **High Operational Costs** | Large CS team required | Significant payroll expenses |
| **No AI Capabilities** | Manual handling of repetitive queries | Inefficient resource utilization |

### Business Drivers for Change

1. **Customer Expectations**: Modern consumers expect 24/7 instant support
2. **Competitive Pressure**: Competitors offering AI-powered assistance
3. **Cost Optimization**: Need to reduce customer service operational costs
4. **Seasonal Challenges**: Inability to efficiently handle peak season demand
5. **Data Insights**: Limited ability to analyze customer behavior and preferences
6. **Personalization Gap**: No intelligent product recommendations

This baseline analysis establishes the foundation for understanding the transformative impact of the SkyAssist target architecture described in the next section.
