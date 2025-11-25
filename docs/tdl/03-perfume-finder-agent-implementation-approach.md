---
title: Product Recommendation Agent Implementation Approach
parent: Technical Decision Log
nav_order: 17
impact: High
decision_date: Nov 19, 2025
outcome: Option 3 - Hybrid RAG with Web Search selected for Product Recommendation Agent
---

# Product Recommendation Agent Implementation Approach

| | |
|---|---|
| **Status** | **<span style="color:green">COMPLETED</span>**, **<span style="color:grey">OUTDATED</span>** |
| **Impact** | High |
| **Decision Date** | Nov 19, 2025 |
| **Driver** | Solution Architect |
| **Approver** | Head of Technology |
| **Contributors** | Team Leaders |
| **Informed** | Project Managers, Business Analysts |
| **Due date** | TBD |
| **Resources** | Product Recommendation Requirements Documentation |
| **Outcome** | Option 3 is preferable with Web Search to augment LLM knowledge. Focus on: 1) LLM selection, 2) Web search capabilities/engine, 3) Product catalog API capabilities |

## Background

Our architecture incorporates an agent-based AI solution structured as a multi-agent setup, where each agent is designed to handle specific tasks. Among these agents, the Product Recommendation Agent is dedicated to assisting users in finding products that align with their preferences and needs.

The Product Recommendation Agent operates by analyzing the user's intent and preferences, potentially factoring in contextual details such as activity type, season, or other relevant inputs. Based on this analysis, the agent searches for matching products and verifies their availability on SkyCart before returning the results to the requestor.

**Important Note:** This decision prioritizes technical solution architecture. While the agent's core purpose is to deliver accurate and relevant product recommendations, the focus is not on the UX at this stage. Additionally, this decision does not impact the functional requirements. This approach serves as the starting point for implementing and refining the product recommendation process.

## Options Considered

|                       | Option 1: GPT-4o Decision + Availability Check | Option 2: AI Search | Option 3: Hybrid + RAG |
|-----------------------|-----------------------------------------------|---------------------|------------------------|
| **Pros**              | Simplicity; OOTB model knowledge; No custom DB; Less hallucination; Different models can be tested | Precise/controllable search; Unique cases supported; Expandable DB; Less hallucination; Fewer tokens (embedding model required) | Relative simplicity; Expandable KB/web search; Recent info; Different models can be tested; Fewer tokens (embedding model required) |
| **Cons**              | No structured data search; No recent info; Special cases not covered; Hallucination risk | Data dependency; High complexity; Longer implementation; Resource intensive; DB must be updated | Data dependency (KB/web search); Some complexity; |
| **Effort**            | Low: Prompt engineering, no UI/navigation | High: Build vector DB, maintain DB, no UI/navigation | Medium: Prompt engineering + RAG implementation, no UI/navigation |
| **Cost of Ownership** | ~£100 GBP + tokens; Shared infra; Cost depends on conversation | ~£450-£950 GBP + tokens; Embedding model cost; Shared infra; DB/document storage; Cost depends on data/requests | ~£225-£600 GBP + tokens; Bing/Google search cost; Shared infra; Cost depends on data/requests |

## Key Differences Between Options

The key difference between the solutions lies in their underlying approach and dependency on data:

- **Option 1** relies on the GPT model's inherent knowledge of products and brands, using it to generate recommendations based on customer input, with SKU availability in SkyCart stores serving as the only external check.
- **Option 2** is more data-driven, requiring a pre-existing, vectorized database of product profiles generated from the SkyCart Catalog. This database enables similarity-based searches using embeddings and AI-specific search patterns. While Option 1 is simpler and less dependent on external data, Option 2 offers a more structured and precise search mechanism but comes with added complexity of maintaining and periodically updating the product database.
- **Option 3** provides a balanced approach combining model knowledge with external context augmentation through web search or limited KB, offering flexibility and recent information access without full database dependency.

## Decision

**Option 3 is preferable** with the modification that we start with **Web Search to augment the LLM knowledge**. This will reduce the cost of ownership but might reduce accuracy.

**Three points for investigation:**
1. LLM to be used
2. Web search capabilities and engine
3. Product catalog API capabilities

## Concerns to be Addressed

| Concern | Description | Mitigation Approach |
|---------|-------------|---------------------|
| Rate Limits & Costs | Both Bing Search and Google APIs have daily/monthly quotas | Monitor usage, implement caching, consider quota planning |
| Filtering & Accuracy | Web data can be noisy or inaccurate | Implement filtering logic, validation checks, source prioritization |
| Potential for Hallucination | Even with real context, LLMs may generate incorrect info or "embellish" | Implement fact-checking, confidence scoring, user feedback loops |
| Prompt Token Limits | How big a prompt can get if system includes large search snippets | Summarizations or chunking may be required |
| User Privacy & Security | If user queries are sensitive or search indices contain private data | Consider compliance needs (encryption, data masking, etc.) |

## Action Items

| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| Evaluate LLM options (GPT-4o, GPT-4 Turbo, alternatives) | TBD | TBD | Pending |
| Compare web search engines (Bing, Google) - cost and capabilities | TBD | TBD | Pending |
| Investigate Product Catalog API capabilities and limitations | TBD | TBD | Pending |
| Develop PoC with web search integration | TBD | TBD | Pending |
| Establish accuracy benchmarks and testing methodology | TBD | TBD | Pending |
| Design prompt templates for product search scenarios | TBD | TBD | Pending |
| Implement token usage monitoring and optimization | TBD | TBD | Pending |

## Follow-Up Plan

| Phase | Description | Target Date |
|-------|-------------|-------------|
| Investigation | Complete evaluation of LLM, web search, and Product Catalog API options | TBD |
| Proof of Concept | Build limited-scope PoC with web search RAG | TBD |
| Pilot | Deploy to limited user group for testing and feedback | TBD |
| Production | Full deployment with monitoring and optimization | TBD |
