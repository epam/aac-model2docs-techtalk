---
title: Decision on Microsoft Agent Framework as Preferred Solution for AI Agent Development
parent: Technical Decision Log
nav_order: 16
impact: High
decision_date: Oct 28, 2025
outcome: Agent Framework selected as preferred for AI agent orchestration
---

# Decision on Microsoft Agent Framework as Preferred Solution for AI Agent Development

| | |
|---|---|
| **Status** | **<span style="color:green">Completed</span>** |
| **Impact** | High |
| **Decision Date** | Oct 28, 2025 |
| **Driver** | @Sergii Gorkun |
| **Approver** | @Mike Richardson (Head of Technology) |
| **Contributors** | @Alex Martinez (Team Leader) |
| **Informed** | @Sarah Thompson (CTO) |
| **Due date** | Oct 28, 2025 |
| **Resources** | Microsoft Agent Framework |
| **Outcome** | Agent Framework is the major framework for building and orchestrating of AI agents. |

## Background

Microsoft Agent Framework is adopted to provide a unified, reliable and controllable foundation for AI agent orchestration and execution. The decision follows stakeholder and Microsoft representative discussions identifying the need for enterprise-grade coordination, governance, and lifecycle support beyond current fragmented approaches.

## Problem Statement

Existing pro-code and hybrid solutions introduce higher integration overhead, inconsistent state management, and limited enterprise observability. A preferred framework is required to standardize agent orchestration, persistence, monitoring, and alignment with existing Microsoft ecosystem services.

## Options Considered

### Microsoft Agent Framework vs LangGraph

| Aspect | Microsoft Agent Framework (Public Preview Beta, Announced Oct 1) | LangGraph (v1.0 alpha Sep 2 2025, stable tag 0.6.10 Oct) |
|--------|----------------------------------------------|--------------------------------------------------------------|
| Origin & Positioning | Unified runtime/SDK merging Semantic Kernel + AutoGen for production-grade agents | Graph-based orchestration by LangChain for stateful multi-agent workflows |
| Core Model / Flow Style | Deterministic workflows + dynamic agent coordination (preview) | Graph nodes/edges for tasks, branching, loops, state transitions |
| State, Memory & Persistence | Built-in memory abstractions, connectors, persistence, Azure/Foundry integration | Persistent state, checkpoints, long-term memory, graph checkpointing |
| SDK / Languages | Python + .NET (C# etc) | Python & JavaScript / TypeScript |
| Deployment & Hosting | Azure-integrated hosting, instrumentation, compliance, observability | LangGraph Platform managed or self-host; flexible infra scaling |
| Observability & Debugging | Enterprise telemetry & monitoring baked in | Visual graph debugging, state inspection, replay/rewind tooling |
| Ecosystem & Interop | Close coupling with Azure services (Foundry Agents, models, connectors) | Built on LangChain: vector stores, tool connectors, memory stores |
| Best Fit / Use Cases | Enterprises on Azure needing governance + seamless cloud ops | Flexible graph orchestration, multi-actor logic vendor-neutral |
| Tradeoffs / Weaknesses | Vendor lock-in risk, heavier runtime, less agility for experimentation | More plumbing for enterprise governance; fewer deep native integrations |

### Other Considered (Not Selected)

| Option | Summary | Key Limitation |
|--------|---------|----------------|
| Existing Stack (Azure Bot Service + Semantic Kernel) | Current pro-code implementation | Higher integration overhead for orchestration and persistence |
| Copilot Studio Hybrid | Low-code with extensibility | Limited deep customization and state control |
| Third-Party Orchestrators | External orchestration platforms | Vendor lock-in + uncertain enterprise alignment |

## Evaluation Criteria

| Criterion | Description | Metric / Evidence |
|-----------|-------------|-------------------|
| Alignment | Strategic fit with SkyCart technology direction | References to tech strategy docs |
| Extensibility | Ability to add custom logic / integrations | Plugin / API surface |
| Maintainability | Operational overhead and lifecycle management | Estimated effort (person-days) |
| Time-to-Value | Speed from prototype to production | Weeks to MVP |
| Cost | Licensing + operational costs | Estimated annual cost |
| Risk | Implementation and adoption risks | Risk register entries |

## Pros & Cons (Microsoft Agent Framework)

| Pros | Cons |
|------|------|
| Native integration with Microsoft ecosystem | Preview maturity level evolving |
| Streamlined orchestration reduces custom glue code | Requires evaluation of GA transition timeline |
| Leverages existing identity and security model | Team upskilling required |
| Enterprise observability and compliance built-in | Potential vendor lock-in |

## Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Framework feature gaps at scale | Delay in rollout | Medium | Pilot + phased adoption |
| Preview API changes | Rework effort | Medium | Track roadmap, lock version |
| Skill gaps in team | Slower delivery | High | Training plan, PoC pairing |

## Open Questions

- What GA timeline does Microsoft publish for key components?
- Are there cost implications different from existing Azure services?
- Does it reduce or replace need for Semantic Kernel usage?
- Support boundary: what is covered by Microsoft vs custom code?

## Action Items

| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| Gather official roadmap / lifecycle info | [To be filled] | [To be filled] | Pending |
| Conduct PoC comparing orchestration complexity | [To be filled] | [To be filled] | Pending |
| Cost model comparison (current vs proposed) | [To be filled] | [To be filled] | Pending |
| Skills gap assessment & training plan | [To be filled] | [To be filled] | Pending |
| Security & compliance alignment review | [To be filled] | [To be filled] | Pending |

## Decision

After discussions between stakeholders and Microsoft representatives, Microsoft Agent Framework is selected as the preferred solution due to enterprise alignment, integrated observability, lifecycle governance, and reduced orchestration complexity.

## Follow-Up Plan

| Phase | Description | Target Date |
|-------|-------------|-------------|
| Pilot | Limited-scope implementation to validate feasibility | [To be filled] |
| Expansion | Extend to additional AI agent use cases | [To be filled] |
| Consolidation | Decommission overlapping components if approved | [To be filled] |

