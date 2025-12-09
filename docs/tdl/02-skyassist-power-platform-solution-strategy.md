---
title: SkyAssist - Power Platform Solution Strategy
parent: Technical Decision Log
nav_order: 2
impact: Medium
decision_date: Mar 19, 2025
outcome: Option 3 - Solution per agent (DEPRECATED)
---

# SkyAssist - Power Platform Solution Strategy

| | |
|---|---|
| **Status** | **<span style="color:grey">DEPRECATED</span>** |
| **Impact** | Medium |
| **Decision Date** | March 19, 2025 |
| **Driver** | @Sergii Gorkun |
| **Approver** | @Sergii Gorkun |
| **Contributors** | @James Wilson |
| **Informed** | @Mike Richardson (Head of Technology) |
| **Outcome** | Option 3: Solution per agent. **DEPRECATED** - Different tech stack will be used. If some agents are to be developed with Copilot Studio, the strategy should be revisited. |

## Background

If Copilot Studio is chosen as a primary tool to build the AI-powered Digital Agent, there must be a Power Platform solutions strategy that would describe how Power Platform components must be grouped together. In addition, the versioning solution should be proposed for each solution and what type of solution will be deployed within Environments (managed or unmanaged).

## Relevant Data

- [Solutions in Power Apps - Power Apps | Microsoft Learn](https://learn.microsoft.com/power-apps/maker/data-platform/solutions-overview)

## Options Considered

| Aspect | Option 1: One Solution for All | Option 2: Business Feature | Option 3: Solution per Agent | Option 4: Solution per Component Type |
|--------|--------------------------------|----------------------------|------------------------------|---------------------------------------|
| **Description** | One single solution that contains everything. | Multiple solutions that contain the components that are changed in scope of some specific business feature. | One Agent - One solution and its surrounding are packed for a separate solution. | Approach where all similar components are put together. E.g. Power Automate Flows, Agents, etc. |
| **Maintainability** | <span class="risk-easy">Easy</span> | <span class="risk-hard">Hard</span> | <span class="risk-medium">Medium</span> | <span class="risk-easy">Easy to Medium</span> |
| **Testability** | <span class="risk-hard">Hard - regression factor</span> | <span class="risk-easy">Easy - if slow-release pace</span>, <span class="risk-medium">Medium to hard - if constant deployments</span> | <span class="risk-easy">Easy - if slow-release pace</span>, <span class="risk-medium">Medium to hard - if constant deployments</span> | <span class="risk-medium">Medium - mixture of regression issue and constant changes control</span> |
| **Dataverse solution choice** | <span class="risk-easy">Easy</span> | <span class="risk-hard">Hard</span> | <span class="risk-medium">Medium</span> | <span class="risk-easy">Easy</span> |
| **Solution Components Dependencies maintenance** | <span class="risk-easy">Easy</span> | <span class="risk-hard">Hard</span> | <span class="risk-medium">Medium</span> | <span class="risk-medium">Medium</span> |
| **Source code maintenance** | <span class="risk-easy">Easy</span> | <span class="risk-hard">Hard</span> | <span class="risk-easy">Easy</span> | <span class="risk-easy">Easy</span> |
| **Deployment efforts** | <span class="risk-easy">Easy</span> | <span class="risk-medium">Medium</span> | <span class="risk-easy">Easy to Medium</span> | <span class="risk-medium">Medium</span> |
| **Deployment risks** | <span class="risk-high">Time consuming, tend to fail, complex troubleshooting - High</span> | <span class="risk-medium">Dependency management is complex - Medium</span> | <span class="risk-low">Easy</span> | <span class="risk-low">Easy</span> |
| **Pipelines setup** | <span class="risk-easy">Easy</span> | <span class="risk-hard">Hard</span> | <span class="risk-medium">Medium</span> | <span class="risk-easy">Easy</span> |
| **Team maturity** | <span class="risk-low">Low</span> | <span class="risk-high">High</span> | <span class="risk-medium">Medium</span> | <span class="risk-medium">Medium</span> |
| **Scaling** | <span class="risk-low">Low</span> | <span class="risk-high">High</span> | <span class="risk-medium">Medium-high</span> | <span class="risk-low">Low</span> |

## Outcome

Option 3: Solution per agent was selected.

**Note:** This decision is now **DEPRECATED**. A different tech stack will be used for agent development. If some agents are to be developed with Copilot Studio in the future, this strategy should be revisited.
