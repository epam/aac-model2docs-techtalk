# Solution Architecture Document Structure

The Solution Architecture Document outlines the high-level structure and components of a software solution. It focuses on the overall architecture, technology choices, system interactions, and key design principles.
The Solution Architecture Document provides a blueprint for the overall structure and direction of the software solution. It helps stakeholders understand the big picture and guides the subsequent detailed design and development activities.

## Template Description

**Purpose:**

This template is a CONSTRUCTOR/FRAMEWORK to create Solution Architecture description.
Its main goals are:

- Guide Solution Architect through efficient process of Solution Architecture creation.
- Help to create versatile non-controversial Solution Architecture description.

**Audience:** Solution Architects, System Architects, Data Solution Architects, Technology Consultants

**How to use:**

- Template structure shows you end-to-end best practice of how to describe solution or system architecture. Follow template parts one by one starting from part "2. Introduction" ("1. Executive summary" should be filled when SAD is ready).
- You are not supposed to fill in all parts of template. You can fill in only parts that are relevant for your purpose and scope; also, feel free to create and remove any parts according to your purpose.
- This template can be split into separate documents/artifacts if you or your Team deem it appropriate.
- **Format/tool:** You can use Word template, reproduce this template structure in Knowledge base/Wiki or in any other tool according to your purpose or customer needs (i.e. Word format is not a limitation).

## 1. Executive Summary

[Description: This is a mostly non-technical summary of the entire Solution Architecture Document Document (SAD) for customer top management. We recommend creating it based on the sections below.
Section Type: Mandatory]

## 2. Introduction

[Description: This section provides the context for Solution Architect work. Section Type: Mandatory]

### 2.1 Definitions, Acronyms, Abbreviations

[Description: This section must clearly clarify all the definitions, acronyms and abbreviations used in the document. Section Type: Recommended]

### 2.2 Solution Architecture Document Scope

[Description: This section defines the scope of the Solution Architecture Document (i.e. what Solution Architecture area will be covered, what scope on customer landscape will be addressed, etc).
It is critical to describe the scope and get it approved by customer in order to have all stakeholders on the same page.
Section Type: Mandatory]

### 2.3 Solution Architecture Stakeholders

[Description: You need to collect list of all stakeholders of the architectural work (names, roles/titles, contact data) and their reasons for requesting this architectural work in the table below.
It is critical to collect all stakeholders of the solution in order to understand/document their concerns about target Solution Architecture and communicate architectural decisions with all of them in order to keep them on the same page. Section Type: Mandatory]

| Stakeholder Side | Stakeholder Role | Stakeholder Name | Contacts | Architectural Work Request Reasons |
|------------------|------------------|------------------|----------|-----------------------------------|
|                  |                  |                  |          |                                   |

## 3. Context

[Description: Target solution architecture should be designed having all context details in mind.
Such context includes:
Organization Technology Strategy.
Organization Enterprise Architecture.
So, it is critical to investigate mentioned areas and follow their requirements, recommendations, and governance policies during Solution Architecture design.
Section Type: Mandatory]

### 3.1 Technology Strategy

[Description:
Organization Technology Strategy is document (or set of documents) that describes digital transformation plans of organization for next few years on good level of details. It is critical to align your Solution Architecture with these plans and use technologies/tools/etc., that are planned to be used in the future.

Please contact customer representatives and ask them to share Organization Technology Strategy with you. Explain your needs to customer. If such artifacts are not available:

Involve EPAM Technology Consultant who will create Technology Strategy for customer organization (by sending e-mail to "Org Technology Consultants OrgTechnologyConsultants@epam.com" delivery list.
Try to reconstruct organization needs for next few years yourself and base your solution architecture design on these needs.
This part should contain:

Explicit references/links to Organization Technology Strategy artifacts.
Explicit references to key points from those artifacts that you need to take into account during Solution Architecture design:
Technology Roadmap.
Technology vendors, tools/products and technology stacks to be used in next few years.
Specific Technology Organization points that you need to take into account (like processes in Technology Organization, specific roles, etc) during Solution Architecture design.
Any significant business plans/goals that will make influence on your solution architecture.
It is important to document point above in order to motivate your target architecture for development team and your other colleagues.
Section Type: Mandatory]

### 3.2 Business Architecture

[Description: This part can be used to put key organization Business Architecture aspects that will drive your architectural decisions for Target Solution Architecture; they will also be useful for further reference of the Team.

This part should contain:

Explicit references/links to organization Business Architecture artifacts.
Explicit references to key points from those artifacts that you need to take into account.
Section Type: Recommended]

### 3.3 Data Architecture

[Description: This part can be used to put key organization Data Architecture aspects that will drive your architectural decisions for Target Solution Architecture; they will also be useful for further reference of the Team.

This part should contain:

Explicit references/links to organization Data Architecture artifacts.
Explicit references to key points from those artifacts that you need to take into account.
Section Type: Recommended]

### 3.4 Infrastructure Architecture

[Description: This part can be used to put key organization Infrastructure Architecture aspects that will drive your architectural decisions for Target Solution Architecture; they will also be useful for further reference of the Team.

This part should contain:

Explicit references/links to organization Infrastructure Architecture artifacts.
Explicit references to key points from those artifacts that you need to take into account.
Section Type: Recommended]

### 3.5 Application Architecture

[Description: This part can be used to put key organization Application Architecture aspects that will drive your architectural decisions for Target Solution Architecture; they will also be useful for further reference of the Team.

This part should contain:

Explicit references/links to organization Application Architecture artifacts.
Explicit references to key points from those artifacts that you need to take into account.
Section Type: Recommended]

### 3.6 Security Architecture

[Description: This part can be used to put key organization Security Architecture aspects that will drive your architectural decisions for Target Solution Architecture; they will also be useful for further reference of the Team.

This part should contain:

Explicit references/links to organization Security Architecture artifacts.
Explicit references to key points from those artifacts that you need to take into account.
Section Type: Recommended]

## 4. Requirements

[Description: It is critical to understand requirements before Solution Architecture design activity. The following areas should be learned and documented on good level of details:

Business goals, associated with solution.
Functional requirements.
Non-functional requirements
Any constraints.
Architect assumptions.
This section should contain:

Either references/links to artifacts with mentioned items (preferred option; artifacts to be created by Business Analyst(s)).
Or it can contain such items description as a part of SAD in sub-sections below (less preferred option; can be used for presales and other fast activities when Business Analyst involvement is not always possible).
Section Type: Mandatory]

### 4.1 Business Goals, associated with solution

[Description: Describe list of detected business goals that are associated with solution according to solution stakeholders. List can be collected during workshop with customer representatives.

This section should contain:

Either references/links to artifacts with listed business goals (preferred option; to be created by Business Analyst(s)).
Or it can contain such items description as a part of this section (less preferred option; can be used for presales and other fast activities when Business Analyst involvement is not always possible).
Section Type: Mandatory]

### 4.2 Functional requirements

[Description: This section describes key high-level functional requirements (product roles, use-cases or scenarios from the use-case model, etc).

This section should contain:

Either references/links to artifacts with listed requirements (preferred option; to be created by Business Analyst(s)).
Or it can contain such items description as a part of this section (less preferred option; can be used for presales and other fast activities when Business Analyst involvement is not always possible).
Note: If you need to explicitly list functional requirements that will make an influence on target architecture – please do it explicitly in this part.

Section Type: Mandatory (if section is not covered with available documentation)]

### 4.3 Non-functional requirements

[Description: This section describes key non-functional requirements.

This section should contain:

Either references/links to artifacts with non-functional requirements (preferred option; to be created by Business Analyst(s)).
Or it can contain such items description as a part of this section (less preferred option; can be used for presales and other fast activities when Business Analyst involvement is not always possible).
Section Type: Mandatory (if section is not covered with available documentation)]

#### 4.3.1 Quality Attribute Non-Functional Requirements

#### 4.3.2 Other Non-Functional Requirements

## 5. Quality attributes

### 5.1 Key Quality Attributes

[Description: It is critical to understand key stakeholders' quality criteria for the solution. That is why mandatory step is to select 5-7 the most important quality attributes for the target solution architecture being based on the requirements.

Prioritize detected Quality Attributes according to their alignment to Client Organization Business Goals, Business Drivers and Business Capabilities. Keep only those that has medium or high alignment.

The outcome of QAW should be a table (see example below) with list key quality attributes for the target architecture and set of measurable metrics for each selected quality attribute. These metrics will show whether a particular quality attribute is achieved or not. The components where the metric is measured should also be noted. Fill in the table below.

Section Type: Mandatory]

## 6. Baseline Architecture

[Description: This section describes baseline solution architecture, this is critical if target architecture is designed in "brown field", i.e. there is legacy solution to be re-platformed.

Recommended best practices for documenting architecture in this part are (select one that fit for your purpose):

View and Beyond by SEI.
4+1 architectural view model.
C4 architecture model (by Simon Brown).
Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 6.1 Conceptual View

[Description: This section should contain description of general solution concept; this view is single and simple picture for all involved stakeholders.

Synonym view name: marchitecture view.

Section purpose: View should explain what solution general purpose is, how it will be used by key roles and how it will be integrated with existing infrastructure and 3rd party solutions/systems.

Section target audience: Customer business and engineers, EPAM development Team, etc.

Section content: business-oriented conceptual diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 6.2 Logical View

[Description: This section should contain description of solution structure. This is not 4+1 architectural view model view, though you can use 4+1 notation in this part if it fits for your purpose.

Synonym view name: solution structure view.

Section purpose: View should explain what components the solution consists of (including technical details about each component like technology stack, etc).

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: logical diagram(s) and text description that describes:

Solution structure.
Set of solution components.
High-level architectural styles to be used in the solution architecture and motivation for them.
Include the following items:

High-level solution structure diagram (highly recommended).
List of architecturally significant components and descriptions of their technology stack and integration with each other.
High-level description of the solution's behavior (in terms of sequences, state-machine, data flow and execution diagrams) – if this makes sense.
Recommendations about architectural styles/patterns to be used.
Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 6.3 Integration View

[Description: This section should contain description of aspects of solution integration with other products/solutions/systems.

Section purpose: View should explain how exactly solution will be integrated using what interfaces, tools, technologies, etc).

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 6.4 Data View

[Description: This section should contain description of aspects of solution data architecture.

Section purpose: View should describe data model and explain how exactly solution data will be collected/streamed, processed, stored, etc.

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 6.5 Infrastructure / Deployment View

[Description: This section should contain description of solution deployment and infrastructure (for all key environments, like development, staging, production, etc.).

Synonym view name: physical view.

Section purpose: View should explain how exactly particular components the solution will be deployed (including technical details about network, network security, performance and availability aspects, technology stack that will be used for deployment, etc).

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: deployment diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 6.6 [Any other views to be placed here]

[Description: Feel free to add any other views that you need to describe baseline solution architecture from any other points of views.

Section Type: Optional]

## 7. Target Architecture

Description: This section describes target solution architecture.

Recommended best practices for documenting architecture in this part are (select one that fit for your purpose):

View and Beyond by SEI.
4+1 architectural view model.
C4 architecture model (by Simon Brown).
Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 7.1 Conceptual View

[Description: This section should contain description of general solution concept; this view is single and simple picture for all involved stakeholders.

Synonym view name: marchitecture view.

Section purpose: View should explain what solution general purpose is, how it will be used by key roles and how it will be integrated with existing infrastructure and 3rd party solutions/systems.

Section target audience: Customer business and engineers, EPAM development Team, etc.

Section content: business-oriented conceptual diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 7.2 Logical View

[Description: This section should contain description of solution structure. This is not 4+1 architectural view model view, though you can use 4+1 notation in this part if it fits for your purpose.

Synonym view name: solution structure view.

Section purpose: View should explain what components the solution consists of (including technical details about each component like technology stack, etc).

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: logical diagram(s) and text description that describes:

Solution structure.
Set of solution components.
High-level architectural styles to be used in the solution architecture and motivation for them.
Include the following items:

High-level solution structure diagram (highly recommended).
List of architecturally significant components and descriptions of their technology stack and integration with each other.
High-level description of the solution's behavior (in terms of sequences, state-machine, data flow and execution diagrams) – if this makes sense.
Recommendations about architectural styles/patterns to be used.
Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 7.3 Integration View

[Description: This section should contain description of aspects of solution integration with other products/solutions/systems.

Section purpose: View should explain how exactly solution will be integrated using what interfaces, tools, technologies, etc).

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 7.4 Data View

[Description: This section should contain description of aspects of solution data architecture.

Section purpose: View should describe data model and explain how exactly solution data will be collected/streamed, processed, stored, etc.

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 7.5 Infrastructure / Deployment View

[Description: This section should contain description of solution deployment and infrastructure (for all key environments, like development, staging, production, etc.).

Synonym view name: physical view.

Section purpose: View should explain how exactly particular components the solution will be deployed (including technical details about network, network security, performance and availability aspects, technology stack that will be used for deployment, etc).

Section target audience: Customer engineers, EPAM development Team, etc.

Section content: deployment diagram(s), text description.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 7.6 [Any other views to be placed here]

[Description: Feel free to add any other views that you need to describe target solution architecture from any other points of views.

Section Type: Optional]

### 7.7 Addressing Key Quality Attributes

[Description: This section describes architectural best practices to be followed in order to address key quality attributes of target solution architecture.

It also can contain set of recipes for common/typical tasks/challenges (still categorized by key quality attributes, since we implement these recipes for the purpose and that purpose addresses issues with key quality attributes in any case).

Section Type: Mandatory (because SAD should explicitly explain how key quality attributes will be achieved by proposed architecture design)]

### 7.8 Architecture Constraints and Limitations

[Description: This section describes all the constraints and limitations that the proposed solution architecture has.

The Customer must be made aware of them, so it is important to communicate them explicitly and clearly.

Section Type: Optional]

### 7.9 Risks and Mitigations

[Description: This section lists potential risks related to the target solution architecture or solution migration to target solution architecture as well as mitigations for them.

The Customer must be made aware of them, so it is important to communicate them explicitly and clearly.

Section Type: Highly recommended]

### 7.10 Solution Costs and Cost Management

[Description: This section describes all costs, associated with architectural decisions as well as recommended cost management approach.

The Customer must be made aware of them, so it is important to communicate them explicitly and clearly.

Section Type: Mandatory]

## 8. Transition / Migration

[Description: Migration should bridge the gap between baselines and target architectures, so, migration process is very important part of solution re-platforming when development is done in "brown field".

In some cases, it makes sense to see migration as a transition process where target architecture is achieved through a chain of transition architectures one by one.

This section should contain:

Migration approach description on reasonable level of details.
Migration phases and migration roadmap.
Any other additional parts that are required to describe migration process details.
Note: Migration strategy template can optionally be used for creation of document that describes all details of migration.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 8.1 Migration approach

[Description: This section should describe, explain, and motivate migration approach, considering any customer specifics, milestones, etc.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

### 8.2 Migration Roadmap

[Description: Migration roadmap should describe how exactly solution components will be migrated on timeline considering any customer specifics, milestones, etc.

Section Type: Mandatory if legacy solution should be re-designed and re-implemented]

## 9. Solution Architecture Governance

[Description: This section should contain solution architecture governance recommendations, scoped to the solution lifecycle. Recommendations below are aligned with phases of Software Development Lifecycle (SDLC) model.

Target audience: Solution Architects, Developers, DevOps engineers, Security Engineers, Quality Assurance Engineers, Systems Engineers, Maintenance Engineers.

Section Type: Optional]

### 9.1 Solution Architecture Design

[Description: This section contains Solution Architect recommendations for Solution Architects for "Design" phase of Software Development Lifecycle:

Key processes to be followed.
Tools to be used.
Best practices to be applied during architecture work.
Reference architectures/styles to be used during architecture design in in the future.
Section Type: Optional]

### 9.2 Development

[Description: This section contains Solution Architect recommendations for development team for "Implement" phase of Software Development Lifecycle:

Key processes to be followed.
Tools to be used.
Coding best practices to be applied for implementation of key quality attributes.
Section Type: Optional]

### 9.3 DevOps

[Description: This section contains Solution Architect recommendations for DevOps team for "Implement" and "Testing & Integration" phases of Software Development Lifecycle:

Key processes to be followed.
Tools to be used.
Coding best practices to be applied for implementation of key quality attributes.
Recommended quality gates
Section Type: Optional]

### 9.4 Quality Assurance

[Description: This section contains Solution Architect recommendations for Quality Assurance team for "Testing & Integration" phase of Software Development Lifecycle:

Key processes to be followed.
Tools to be used.
Coding best practices to be applied for implementation of key quality attributes.
Recommended quality gates
Section Type: Optional]

### 9.5 Maintenance

[Description: This section contains Solution Architect recommendations for Maintenance and Support team for "Maintenance" phase of Software Development Lifecycle:

Key processes to be followed.
Tools to be used.
Coding best practices to be applied for implementation of key quality attributes.
Section Type: Optional]
