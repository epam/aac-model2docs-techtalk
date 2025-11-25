---
title: Quality attributes
parent: SkyAssist
nav_order: 5
---

# 5. Quality attributes

## 5.1 Key Quality Attributes

The following quality attributes have been identified and prioritized based on their alignment to SkyCart business goals, business drivers, and business capabilities. These attributes are critical for the success of the SkyAssist solution.

| Priority | Quality Attribute | Metrics | Components Measured |
|----------|-------------------|---------|---------------------|
| **High** | **Interoperability** | **System Integration**: Successfully integrate with all required enterprise systems:<br/>• Hybris (e-commerce platform)<br/>• Zendesk (customer support)<br/>• CDC (Customer Data Center)<br/>• Scurri (delivery tracking)<br/>• OneStock (order management)<br/>• WINS (commerce data via DB)<br/>• CDP (customer data platform)<br/>• GCDB (gift card database)<br/><br/>**Multi-Channel Support**: Compatibility with multiple communication platforms:<br/>• Web widget<br/>• WhatsApp<br/>• Microsoft Teams<br/>• Mobile applications<br/><br/>**Delivery Provider Integration**: Successful integration with multiple delivery providers for tracking information<br/><br/>**Success Metric**: 100% of required integrations functional with <3s response time | Digital Agent Orchestrator<br/>Order Agent<br/>Travel Gear Finder Agent<br/>Chat Service<br/>Integration APIs |
| **High** | **Performance** | **Throughput**: Support ~11,000 sessions per month with capability to scale<br/><br/>**Response Time**:<br/>• Conversational response: <10 seconds (AI processing)<br/>• Order status retrieval: <5 seconds (including external system calls)<br/>• Product search: <8 seconds (AI + search grounding)<br/><br/>**Concurrent Users**: Support peak concurrent sessions (estimated 50-100 simultaneous conversations)<br/><br/>**Availability**: 99.5% uptime during business hours | All containers<br/>Azure Front Door<br/>App Services<br/>Cosmos DB<br/>AI Foundry services |
| **High** | **Security** | **PII Protection**:<br/>• Strict access controls ensuring only authorized personnel access PII<br/>• Irreversible masking/redaction preventing data reconstruction<br/>• Zero PII exposure incidents<br/><br/>**Authentication & Authorization**:<br/>• All users authenticated via Azure AD<br/>• Role-based access control (RBAC) implemented<br/>• OAuth 2.0 token-based authentication<br/><br/>**Injection Prevention**:<br/>• SQL injection: 100% blocked via parameterized queries<br/>• XSRF/CSRF: 100% prevention via anti-forgery tokens<br/>• Prompt injection: Content filtering and input validation<br/><br/>**Encryption**:<br/>• Data at rest: AES-256 encryption<br/>• Data in transit: TLS 1.2+<br/><br/>**Content Safety**: Azure AI Foundry content filters and custom blocklists active | Key Vault<br/>Azure AD<br/>WAF<br/>AI Foundry Content Filters<br/>All API endpoints<br/>Cosmos DB<br/>Storage Accounts |
| **High** | **Observability** | **Logging**:<br/>• 100% of API calls logged<br/>• All conversations tracked with session IDs<br/>• Error rates <1% of total requests<br/><br/>**Monitoring Dashboards**:<br/>• Real-time system health visibility<br/>• Performance metrics dashboards<br/>• Alert response time <5 minutes<br/><br/>**Distributed Tracing**:<br/>• End-to-end request tracing across all agents<br/>• OpenTelemetry implementation<br/>• 100% of requests traceable<br/><br/>**Analytics**:<br/>• Conversation success rate tracking<br/>• Agent handoff metrics<br/>• Customer satisfaction indicators | Application Insights<br/>Log Analytics<br/>Monitoring Container<br/>OpenTelemetry integration<br/>All agent services |
| **Medium** | **Maintainability** <span style="color: orange;">(Deprioritized)</span> | **Team Alignment**:<br/>• Technology stack aligns with SkyCart internal IT team expertise<br/>• Documentation completeness: >90%<br/>• Knowledge transfer completion: 100%<br/><br/>**Modular Architecture**:<br/>• Independent agent deployment capability<br/>• Agent update without system downtime<br/>• Clear separation of concerns<br/><br/>**Code Quality**:<br/>• Code review coverage: 100%<br/>• Automated testing coverage: >80%<br/>• Technical debt tracked and managed<br/><br/>**Operational Support**:<br/>• Mean Time to Repair (MTTR): <2 hours<br/>• Issue resolution SLA adherence: >95% | All containers<br/>Development practices<br/>CI/CD pipelines<br/>Documentation |
| **Medium** | **Data Quality & Integrity** | **Data Governance**:<br/>• Data collection limited to clear, specified purposes<br/>• Data usage documented and auditable<br/>• Privacy policy compliance: 100%<br/><br/>**Data Availability**:<br/>• Data readily available to authorized users<br/>• Organized in retrievable manner<br/>• Retention policies enforced (30-minute active sessions)<br/>• Business need-based retention<br/><br/>**Data Quality**:<br/>• Data quality standards documented<br/>• Quality issues tracked and remediated<br/>• Continuous improvement metrics<br/><br/>**Data Integrity**:<br/>• Data reliable and fit for purpose<br/>• Free of errors, mistakes, omissions<br/>• Data validation on input: 100%<br/>• Consistency checks across systems | Cosmos DB<br/>Storage Accounts<br/>Data integration pipelines<br/>Conversation Memory<br/>Analytics systems |

### Quality Attribute Assessment Notes

**Responsible AI Principles**:

The solution incorporates responsible AI principles to ensure ethical and compliant AI implementation:

- **Data Accountability**: All data collection tied to specific business purposes with clear documentation
- **Secure Data Access**: Data governance ensures authorized access while maintaining security
- **Quality Standards**: Continuous monitoring and improvement of data quality standards
- **Data Reliability**: Validation and verification processes ensure data integrity and fitness for purpose

### Quality Attribute Prioritization Rationale

**High Priority Attributes** are critical for solution success and directly impact customer experience and business operations:
- Interoperability enables the solution to function within SkyCart's complex enterprise ecosystem
- Performance ensures customer satisfaction with responsive interactions
- Security protects customer data and maintains regulatory compliance
- Observability enables proactive issue detection and resolution

**Medium Priority Attributes** are important but have been partially deprioritized based on current organizational constraints:
- Maintainability considerations account for internal team capabilities but implementation approach has been simplified
- Data Quality & Integrity follows data governance and responsible AI principles ensuring compliant implementation
