workspace "SkyCart" "SkyCart E-commerce Marketplace Digital Agent" {

    !impliedRelationships true
    
    model {
        properties {
            structurizr.groups true
            structurizr.groupSeparator "|"
            
        }
        
        # Include shared definitions
        !include ../common/skycart-people.dsl
        !include ../common/external-systems.dsl

        skyCartGroup = group "SkyCart" {

            existingSkyCartGroup = group "Existing SkyCart" {
                !include ../common/skycart-existing-systems.dsl
            }

            skyAssistSoftware = softwaresystem "SkyAssist" "A powerful AI companion that can handle a range of interactions and tasks, from resolving issues requiring complex conversations to autonomously determining the best action to take based on its instructions and context. " "Iteration1" {

                keyVaultContainer = container "Key Vault" "Security layer for the agents" "Azure, Key Vault" "Iteration1"
                
                webSearchContainer = container "Web Search" "Web search LLM grounding service shared across environments" "Azure, Bing Search" "Iteration1"
                
                aiAgentServiceContainer = container "Azure Bot" "Agent channels adapter" "Azure Bot" "Iteration1"
                
                teamsAppContainer = container "Microsoft Teams App" "Teams application channel for internal SkyCart users" "Microsoft Teams App"
                
                sharedAIFoundryContainer = container "AI Foundry" "Shared AI Foundry resource with content safety" "Azure AI Foundry" "Iteration1"
                
                agentHelpersContainer = container "Agent Helpers" "Helper agents for search, validation, and data processing" "Azure AI Foundry" "Iteration1" {
                    tracingComponent = component "Tracing" "Execution flow tracing" "AI Foundry"
                    aiFoundryAgentServiceComponent = component "AI Foundry Agent Service" "Service that executes and runs AI Foundry agents" "AI Foundry"
                    aiFoundrySearchRequestBuilderAgentComponent = component "Search Request Builder Agent" "Search Request builder Agent" "Python, Agent Framework"
                    aiFoundrySearchAgentComponent = component "Search Agent" "Search Agent" "Python, Agent Framework"
                    aiFoundryMatchValidationAgentComponent = component "Match Validation Agent" "Match Validation Agent" "Python, Agent Framework"
                }
                
                chatServiceContainer = container "Chat Service" "Entry point managing routing and conversation" "Azure, Container Apps, Python" "Iteration1"

                skyAssistWidgetContainer = container "SkyAssist Widget" "SkyAssist Widget and its canvas" "Azure Bot, React.js" "Web Browser,Future"
                monitoringContainer = container "Monitoring" "Application Insights and Log Analytics" "Azure" "Iteration1"

                reverseProxyContainer = container "Reverse Proxy" "Azure Front Door with WAF protection" "Azure, Frontdoor" "Iteration1"
                staticContentContainer = container "Static Content" "Widget files and conversation memory" "Azure, Storage account" "Iteration1"

                agentsGroup = group "Agents" {
                    productRecommendationContainer = container "Travel Gear Finder Agent" "API bridge that connects and orchestrates the AI Foundry Product Recommendation Agent service" "Azure, Container Apps, Semantic Kernel, Python" "Iteration1" {
                        productConversationMemoryComponent = component "Conversation Memory" "Manages conversation history and context for product recommendation sessions" "Python, Semantic Kernel"
                        planBuilderComponent = component "Plan Builder" "Execution plan builder - executor" "Python, Agent Framework"
                        searchRequestBuilderAgentRefComponent = component "Search Request Builder Agent" "Search Request builder Agent reference" "Python, Agent Framework"
                        searchAgentRefComponent = component "Search Agent" "Search Agent reference" "Python, Agent Framework"
                        matchValidationAgentRefComponent = component "Match Validation Agent" "Match Validation Agent reference" "Python, Agent Framework"
                        skyCartValidationExecutorComponent = component "SkyCart Validation" "SkyCart inventory and availability validation executor" "Python, Agent Framework"
                        resultBuilderExecutorComponent = component "Result Builder" "Result Builder executor" "Python, Agent Framework"
                        completionCheckExecutorComponent = component "Completion Check" "Result Builder check executor" "Python, Agent Framework"
                    }
                    orderAgentContainer = container "Order Agent" "Order tracking and management via Copilot Studio" "Azure, Container Apps, Copilot Studio, Agent Framework" "Iteration1"

                    skyAssistAgentContainer = container "Sky Assist Agent" "Routes requests to specialized agents" "Azure, Container Apps, Semantic Kernel, Python" "Iteration1"
                }
                cosmosDbContainer = container "Cosmos DB" "Cosmos DB for SkyAssist" "Azure Cosmos DB" "Iteration1"
            }
        }

        // === RELATIONSHIPS ===
        
        // === External User Interactions ===
        customerPerson -> skyAssistSoftware "Inquiries" "HTTPS"
        customerPerson -> websiteSoftware "Visits skycart.com" "HTTPS"
        customerPerson -> skyAssistWidgetContainer "Sends inquiries" "HTTPS"
        customerPerson -> applicationsSoftware "Interacts with" "HTTPS"
        csRepPerson -> zendeskSoftware "Manages customer support" "HTTPS"
        skyCartStaffPerson -> microsoftTeamsSoftware "Interacts with AI agent" "Microsoft Teams"
        microsoftTeamsSoftware -> teamsAppContainer "Hosts Teams App" "Teams Channel"

        
        // === Channel Entry Points ===
        skyAssistWidgetContainer -> reverseProxyContainer "Sends messages" "HTTPS"
        applicationsSoftware -> reverseProxyContainer "Sends messages" "HTTPS"
        teamsAppContainer -> reverseProxyContainer "Sends messages" "HTTPS"
        websiteSoftware -> staticContentContainer "Delivers widget" "HTTPS"

        // === Reverse Proxy & Routing ===
        reverseProxyContainer -> aiAgentServiceContainer "Routes to Azure Bot" "HTTPS"
        reverseProxyContainer -> staticContentContainer "Serves static content" "HTTPS/Private Endpoint" "Microsoft Azure - Private Endpoints"
        
        // === Azure Bot to Chat Service ===
        aiAgentServiceContainer -> chatServiceContainer "Forwards to Chat Service" "HTTPS"

        
        // === Chat Service to Orchestration ===
        chatServiceContainer -> skyAssistAgentContainer "Routes requests to orchestrator" "HTTPS"

        // === Agent Orchestration ===
        skyAssistAgentContainer -> orderAgentContainer "Calls Order Agent" "HTTPS"
        skyAssistAgentContainer -> productRecommendationContainer "Calls Travel Gear Finder" "HTTPS"
        skyAssistAgentContainer -> keyVaultContainer "Retrieves secrets" "HTTPS/Private Endpoint" "Microsoft Azure - Private Endpoints"


        // === AI Services Integration ===
        productRecommendationContainer -> agentHelpersContainer "Uses AI Foundry Agent Service" "HTTPS"
        skyAssistAgentContainer -> agentHelpersContainer "Uses AI services" "HTTPS"

        // === AI Foundry Internal Flow ===
        agentHelpersContainer -> sharedAIFoundryContainer "Uses shared services"
        aiFoundrySearchAgentComponent -> webSearchContainer "Uses grounding"
        orderAgentContainer -> webSearchContainer "Uses grounding" "HTTPS"
        
        // === Travel Gear Finder Agent References to AI Foundry Agents ===
        searchRequestBuilderAgentRefComponent -> aiFoundrySearchRequestBuilderAgentComponent "Uses AI Foundry agent"
        searchAgentRefComponent -> aiFoundrySearchAgentComponent "Uses AI Foundry agent"
        matchValidationAgentRefComponent -> aiFoundryMatchValidationAgentComponent "Uses AI Foundry agent"
        
        // === AI Foundry Agent Service manages agents ===
        aiFoundryAgentServiceComponent -> aiFoundrySearchRequestBuilderAgentComponent "Executes"
        aiFoundryAgentServiceComponent -> aiFoundrySearchAgentComponent "Executes"
        aiFoundryAgentServiceComponent -> aiFoundryMatchValidationAgentComponent "Executes"

        // === Travel Gear Finder Internal Workflow ===
        planBuilderComponent -> searchRequestBuilderAgentRefComponent "Uses to build search requests"
        searchRequestBuilderAgentRefComponent -> searchAgentRefComponent "Initiates search (multiple instances)"
        searchAgentRefComponent -> matchValidationAgentRefComponent "Validates matches"
        matchValidationAgentRefComponent -> skyCartValidationExecutorComponent "Validates against SkyCart inventory"
        skyCartValidationExecutorComponent -> resultBuilderExecutorComponent "Merges results"
        resultBuilderExecutorComponent -> completionCheckExecutorComponent "Evaluates completeness"
        completionCheckExecutorComponent -> planBuilderComponent "Returns if plan incomplete"

        // === Data Persistence (Conversation Memory) ===
        chatServiceContainer -> cosmosDbContainer "Stores conversation history" "HTTPS"
        productConversationMemoryComponent -> cosmosDbContainer "Stores conversation history" "HTTPS"
        orderAgentContainer -> cosmosDbContainer "Stores conversation history" "HTTPS"
        skyAssistAgentContainer -> cosmosDbContainer "Stores conversation history" "HTTPS"

        // === External Systems Integration ===
        orderAgentContainer -> orderServiceSoftware "Retrieves order data" "HTTPS"
        productRecommendationContainer -> catalogServiceSoftware "Retrieves product data" "HTTPS"
        skyAssistAgentContainer -> sunshineZendeskSoftware "Escalates tickets" "HTTPS"
        sunshineZendeskSoftware -> zendeskSoftware "Integrates with" "HTTPS"

        // === Monitoring & Telemetry ===
        chatServiceContainer -> monitoringContainer "Sends telemetry" "HTTPS"
        skyAssistAgentContainer -> monitoringContainer "Sends telemetry" "HTTPS"
        tracingComponent -> monitoringContainer "Sends telemetry" "HTTPS"


        // === Escalation Flow (Tagged for Dynamic Views) ===
        skyAssistAgentContainer -> sunshineZendeskSoftware "Creates ticket/session" "HTTPS" {
            tags "EscalationFlow"
        }
        zendeskSoftware -> reverseProxyContainer "Sends webhook reply" "HTTPS" {
            tags "EscalationFlow"
        }
        reverseProxyContainer -> chatServiceContainer "Routes webhook" "HTTPS" {
            tags "EscalationFlow"
        }
        chatServiceContainer -> aiAgentServiceContainer "Returns response" "HTTPS" {
            tags "EscalationFlow"
        }

        deploymentEnvironment "Development" {

            devDeployment = deploymentGroup "Development"

            deploymentNode "Customer's web browser" "" "Web Browser" {
                softwareSystemInstance websiteSoftware devDeployment
                containerInstance skyAssistWidgetContainer devDeployment
            }
            deploymentNode "SkyCart Employee's MS Teams" "" "Microsoft Teams" {
                softwareSystemInstance microsoftTeamsSoftware devDeployment
                containerInstance teamsAppContainer devDeployment
            }

            deploymentNode "Azure UA-Central" "Azure UA Central" "Microsoft Azure" "Microsoft Azure - Azure A" {
                deploymentNode "rg-skyassist-dev" "Development Resource Group" "Resource group" "Microsoft Azure - Resource Groups" {
                    containerInstance aiAgentServiceContainer devDeployment "Microsoft Azure - Bot Services"
                    containerInstance monitoringContainer devDeployment "Microsoft Azure - Application Insights"
                    containerInstance reverseProxyContainer devDeployment "Microsoft Azure - Front Door and CDN Profiles"
                    containerInstance keyVaultContainer devDeployment "Microsoft Azure - Key Vaults"
                    containerInstance staticContentContainer devDeployment "Microsoft Azure - Storage Accounts"
                    containerInstance webSearchContainer devDeployment "Microsoft Azure - Bing Search"
                    deploymentNode "cosmos-skyassist-dev" "Development Cosmos DB Account" "Azure Cosmos DB Account" "Microsoft Azure - Azure Cosmos DB" {
                        containerInstance cosmosDbContainer devDeployment "Microsoft Azure - Azure Cosmos DB"
                    }
                    deploymentNode "aif-skyassist-dev" "Development AI Foundry" "Azure AI Foundry" "Microsoft Azure - AI Studio" {
                        containerInstance sharedAIFoundryContainer devDeployment "Microsoft Azure - AI Studio"
                        deploymentNode "gpt-5.1" "LLM Model" "gpt-5.1" "Microsoft Azure - Azure OpenAI" {
                            properties {
                                model "gpt-5.1"
                                purpose "Text generation for development environment"
                            }
                        }
                        deploymentNode "text-embedding-ada-002" "Embedding Model" "text-embedding-ada-002" "Microsoft Azure - Azure OpenAI" {
                            properties {
                                model "text-embedding-ada-002"
                                purpose "Semantic search for development environment"
                            }
                        }
                        deploymentNode "SkyAssistDEV" "SkyAssist DEV Project" "Azure AI Foundry Project" "Microsoft Azure - AI Studio" {
                            containerInstance agentHelpersContainer devDeployment "Microsoft Azure - AI Studio"
                        }
                    }
                    deploymentNode "cae-skyassist-dev" "Container Apps Environment" "Azure Container Apps Environment" "Microsoft Azure - Container Apps Environments" {
                        containerInstance skyAssistAgentContainer devDeployment "Microsoft Azure - Container Apps"
                        containerInstance orderAgentContainer devDeployment "Microsoft Azure - Container Apps"
                        containerInstance chatServiceContainer devDeployment "Microsoft Azure - Container Apps"
                        containerInstance productRecommendationContainer devDeployment "Microsoft Azure - Container Apps"
                    }
                }
            }
        }

        deploymentEnvironment "Test" {

            testDeployment = deploymentGroup "Test"

            deploymentNode "Customer's web browser" "" "Web Browser" {
                softwareSystemInstance websiteSoftware testDeployment
                containerInstance skyAssistWidgetContainer testDeployment
            }
            deploymentNode "SkyCart Employee's MS Teams" "" "Microsoft Teams" {
                softwareSystemInstance microsoftTeamsSoftware testDeployment
                containerInstance teamsAppContainer testDeployment
            }

            deploymentNode "Azure UA-Central" "Azure UA Central" "Microsoft Azure" "Microsoft Azure - Azure A" {
                deploymentNode "rg-skyassist-test" "Test Resource Group" "Resource group" "Microsoft Azure - Resource Groups" {
                    containerInstance aiAgentServiceContainer testDeployment "Microsoft Azure - Bot Services"
                    containerInstance monitoringContainer testDeployment "Microsoft Azure - Application Insights"
                    containerInstance reverseProxyContainer testDeployment "Microsoft Azure - Front Door and CDN Profiles"
                    containerInstance keyVaultContainer testDeployment "Microsoft Azure - Key Vaults"
                    containerInstance staticContentContainer testDeployment "Microsoft Azure - Storage Accounts"
                    containerInstance webSearchContainer testDeployment "Microsoft Azure - Bing Search"
                    deploymentNode "cosmos-skyassist-test" "Test Cosmos DB Account" "Azure Cosmos DB Account" "Microsoft Azure - Azure Cosmos DB" {
                        containerInstance cosmosDbContainer testDeployment "Microsoft Azure - Azure Cosmos DB"
                    }
                    deploymentNode "aif-skyassist-test" "Test AI Foundry" "Azure AI Foundry" "Microsoft Azure - AI Studio" {
                        containerInstance sharedAIFoundryContainer testDeployment "Microsoft Azure - AI Studio"
                        deploymentNode "gpt-5.1" "LLM Model" "gpt-5.1" "Microsoft Azure - Azure OpenAI" {
                            properties {
                                model "gpt-5.1"
                                purpose "Text generation for test environment"
                            }
                        }
                        deploymentNode "text-embedding-ada-002" "Embedding Model" "text-embedding-ada-002" "Microsoft Azure - Azure OpenAI" {
                            properties {
                                model "text-embedding-ada-002"
                                purpose "Semantic search for test environment"
                            }
                        }
                        deploymentNode "SkyAssistTEST" "SkyAssist TEST Project" "Azure AI Foundry Project" "Microsoft Azure - AI Studio" {
                            containerInstance agentHelpersContainer testDeployment "Microsoft Azure - AI Studio"
                        }
                    }
                    deploymentNode "cae-skyassist-test" "Container Apps Environment" "Azure Container Apps Environment" "Microsoft Azure - Container Apps Environments" {
                        containerInstance skyAssistAgentContainer testDeployment "Microsoft Azure - Container Apps"
                        containerInstance orderAgentContainer testDeployment "Microsoft Azure - Container Apps"
                        containerInstance chatServiceContainer testDeployment "Microsoft Azure - Container Apps"
                        containerInstance productRecommendationContainer testDeployment "Microsoft Azure - Container Apps"
                    }
                }
            }
        }

        deploymentEnvironment "Production" {

            prodDeployment = deploymentGroup "Production"

            deploymentNode "Customer's web browser" "" "Web Browser" {
                softwareSystemInstance websiteSoftware prodDeployment
                containerInstance skyAssistWidgetContainer prodDeployment
            }
            deploymentNode "SkyCart Employee's MS Teams" "" "Microsoft Teams" {
                softwareSystemInstance microsoftTeamsSoftware prodDeployment
                containerInstance teamsAppContainer prodDeployment
            }

            deploymentNode "Azure UA-Central" "Azure UA Central" "Microsoft Azure" "Microsoft Azure - Azure A" {
                deploymentNode "rg-skyassist-prod" "Production Resource Group" "Resource group" "Microsoft Azure - Resource Groups" {
                    containerInstance aiAgentServiceContainer prodDeployment "Microsoft Azure - Bot Services"
                    containerInstance monitoringContainer prodDeployment "Microsoft Azure - Application Insights"
                    containerInstance reverseProxyContainer prodDeployment "Microsoft Azure - Front Door and CDN Profiles"
                    containerInstance keyVaultContainer prodDeployment "Microsoft Azure - Key Vaults"
                    containerInstance staticContentContainer prodDeployment "Microsoft Azure - Storage Accounts"
                    containerInstance webSearchContainer prodDeployment "Microsoft Azure - Bing Search"
                    deploymentNode "cosmos-skyassist-prod" "Production Cosmos DB Account" "Azure Cosmos DB Account" "Microsoft Azure - Azure Cosmos DB" {
                        containerInstance cosmosDbContainer prodDeployment "Microsoft Azure - Azure Cosmos DB"
                    }
                    deploymentNode "aif-skyassist-prod" "Production AI Foundry" "Azure AI Foundry" "Microsoft Azure - AI Studio" {
                        containerInstance sharedAIFoundryContainer prodDeployment "Microsoft Azure - AI Studio"
                        deploymentNode "gpt-5.1" "LLM Model" "gpt-5.1" "Microsoft Azure - Azure OpenAI" {
                            properties {
                                model "gpt-5.1"
                                purpose "Text generation for production environment"
                            }
                        }
                        deploymentNode "text-embedding-ada-002" "Embedding Model" "text-embedding-ada-002" "Microsoft Azure - Azure OpenAI" {
                            properties {
                                model "text-embedding-ada-002"
                                purpose "Semantic search for production environment"
                            }
                        }
                        deploymentNode "SkyAssist" "SkyAssist PROD Project" "Azure AI Foundry Project" "Microsoft Azure - AI Studio" {
                            containerInstance agentHelpersContainer prodDeployment "Microsoft Azure - AI Studio"
                        }
                    }
                    deploymentNode "cae-skyassist-prod" "Container Apps Environment" "Azure Container Apps Environment" "Microsoft Azure - Container Apps Environments" {
                        containerInstance skyAssistAgentContainer prodDeployment "Microsoft Azure - Container Apps"
                        containerInstance orderAgentContainer prodDeployment "Microsoft Azure - Container Apps"
                        containerInstance chatServiceContainer prodDeployment "Microsoft Azure - Container Apps"
                        containerInstance productRecommendationContainer prodDeployment "Microsoft Azure - Container Apps"
                    }
                }
            }
        }

    }

    views {
        
        themes "https://static.structurizr.com/themes/microsoft-azure-2024.07.15/icons.json"

        systemlandscape "SystemLandscape" {
            include customerPerson csRepPerson skyCartStaffPerson
            include skyAssistSoftware websiteSoftware applicationsSoftware microsoftTeamsSoftware
            include zendeskSoftware sunshineZendeskSoftware
            include catalogServiceSoftware orderServiceSoftware
            autoLayout tb
        }
        systemcontext skyAssistSoftware "SystemContext" {
            include customerPerson csRepPerson skyCartStaffPerson 
            include skyAssistSoftware 
            include websiteSoftware applicationsSoftware microsoftTeamsSoftware
            include zendeskSoftware sunshineZendeskSoftware 
            include catalogServiceSoftware orderServiceSoftware
            autoLayout
            description "The system context diagram for SkyAssist."
            properties {
                structurizr.groups false
            }
        }
        container skyAssistSoftware "Containers" {
            include *
            include skyCartStaffPerson microsoftTeamsSoftware
            exclude existingSkyCartGroup
            exclude "relationship.tag==EscalationFlow"
            autoLayout tb
            description "The container diagram for SkyAssist."
            
        }

        component chatServiceContainer "ChatService" "Chat Service" {
            include *
            exclude existingSkyCartGroup 
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "The component diagram for the Chat Service."
        }

        component skyAssistAgentContainer "Orchestrator" "Orchestrator Agent" {
            include *
            exclude existingSkyCartGroup 
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "The component diagram for the Orchestrator Agent."
        }

        component orderAgentContainer "OrderAgent" "Order Agent" {
            include *
            exclude existingSkyCartGroup 
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "The component diagram for the Order Agent."
        }

        component productRecommendationContainer "ProductRecommendationAgent" "Product Recommendation Agent" {
            include *
            exclude existingSkyCartGroup 
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "The component diagram for the Product Recommendation Agent."
        }


        dynamic skyAssistSoftware "UniformDispatching" "Uniform Dispatching" {
            skyAssistWidgetContainer -> reverseProxyContainer "Sends messages to reverse proxy"
            reverseProxyContainer -> aiAgentServiceContainer "Routes to AI Agent Service"
            aiAgentServiceContainer -> chatServiceContainer "Forwards to chat service"
            chatServiceContainer -> skyAssistAgentContainer "Passes the request to the orchestration agent"
            skyAssistAgentContainer -> orderAgentContainer "Hands off order-related requests"
            orderAgentContainer -> skyAssistAgentContainer "Returns the response of the order agent"
            skyAssistAgentContainer -> productRecommendationContainer "Hands off product recommendation requests"
            productRecommendationContainer -> skyAssistAgentContainer "Returns the response of the product recommendation agent"
            skyAssistAgentContainer -> chatServiceContainer "Returns the response via the chain of execution"
            chatServiceContainer -> aiAgentServiceContainer "Returns response to Azure Bot"
            aiAgentServiceContainer -> reverseProxyContainer "Returns response to reverse proxy"
            reverseProxyContainer -> skyAssistWidgetContainer "Returns the channel specific response to the SkyAssist Widget"
            autoLayout lr
            description "Uniform Dispatching"
        }

        dynamic skyAssistSoftware "EscalationProcess" "Escalation Process Messages delivery" {
            customerPerson -> skyAssistWidgetContainer "Sends the inqueries" "HTTPS"
            skyAssistWidgetContainer -> reverseProxyContainer "Sends messages to reverse proxy"
            reverseProxyContainer -> aiAgentServiceContainer "Routes to AI Agent Service"
            aiAgentServiceContainer -> chatServiceContainer "Forwards to chat service"
            chatServiceContainer -> skyAssistAgentContainer "Passes the request to the orchestration agent"
            skyAssistAgentContainer -> sunshineZendeskSoftware "Escalates directly to Sunshine Zendesk"
            sunshineZendeskSoftware -> zendeskSoftware "Connects to Zendesk"
            zendeskSoftware -> csRepPerson "Message dispatched to the customer service representative"
            csRepPerson -> zendeskSoftware "Customer service representative replies to the customer"
            zendeskSoftware -> reverseProxyContainer "Calls webhook to send the reply to the Customer"
            reverseProxyContainer -> chatServiceContainer "Returns message via Webhook to chat service"
            chatServiceContainer -> aiAgentServiceContainer "Forwards response to Azure Bot"
            aiAgentServiceContainer -> reverseProxyContainer "Returns response to reverse proxy"
            reverseProxyContainer -> skyAssistWidgetContainer "Returns message to the widget"
            skyAssistWidgetContainer -> customerPerson "Returns message to the customer"
            
            autoLayout lr
            description "Escalation Process Messages delivery"
        }

        dynamic skyAssistSoftware "DataPersistenceFlow" "Conversation Data Persistence Flow" {
            chatServiceContainer -> cosmosDbContainer "Stores chat service conversation"
            skyAssistAgentContainer -> cosmosDbContainer "Stores orchestrator conversation"
            orderAgentContainer -> cosmosDbContainer "Stores order agent conversation"
            productRecommendationContainer -> cosmosDbContainer "Stores product recommendation conversation"
            cosmosDbContainer -> chatServiceContainer "Retrieves conversation history"
            cosmosDbContainer -> skyAssistAgentContainer "Retrieves conversation history"
            cosmosDbContainer -> orderAgentContainer "Retrieves conversation history"
            cosmosDbContainer -> productRecommendationContainer "Retrieves conversation history"
            
            autoLayout lr
            description "How conversation data is persisted across all agents and services"
        }

        dynamic productRecommendationContainer "ProductRecommendationWorkflow" "Product Recommendation Agent Internal Workflow" {
            planBuilderComponent -> searchRequestBuilderAgentRefComponent "1. Builds search execution plan"
            searchRequestBuilderAgentRefComponent -> searchAgentRefComponent "2. Initiates search agent (Classic)"
            searchRequestBuilderAgentRefComponent -> searchAgentRefComponent "3. Initiates search agent (Wildcard)"
            searchRequestBuilderAgentRefComponent -> searchAgentRefComponent "4. Initiates search agent (New)"
            searchAgentRefComponent -> matchValidationAgentRefComponent "5. Validates matches for quality"
            matchValidationAgentRefComponent -> skyCartValidationExecutorComponent "6. Validates against SkyCart inventory"
            skyCartValidationExecutorComponent -> resultBuilderExecutorComponent "7. Merges all validated results"
            resultBuilderExecutorComponent -> completionCheckExecutorComponent "8. Evaluates result completeness"
            completionCheckExecutorComponent -> planBuilderComponent "9. Returns to plan if incomplete (loop)"
            
            autoLayout lr
            description "Internal workflow showing how Travel Gear Finder Agent processes search requests through multiple validation stages"
        }

        component sharedAIFoundryContainer "SharedAIFoundry" "Shared AI Foundry " {
            include *
            autoLayout
            description "The component diagram for Shared AI Foundry  showing shared services"
        }

        deployment skyAssistSoftware "Development" {
            include *
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "Deployment scenario for the SkyAssist Development environment."
        }

        deployment skyAssistSoftware "Test" {
            include *
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "Deployment scenario for the SkyAssist Test environment."
        }

        deployment skyAssistSoftware "Production" {
            include *
            exclude "relationship.tag==EscalationFlow"
            autoLayout
            description "Deployment scenario for the SkyAssist Production environment."
        }

        container skyAssistSoftware "DataPersistenceView" "Data Persistence Architecture" {
            include cosmosDbContainer staticContentContainer chatServiceContainer skyAssistAgentContainer orderAgentContainer productRecommendationContainer
            autoLayout tb
            description "Data persistence architecture showing Cosmos DB, Storage, and services that persist data"
        }

        container skyAssistSoftware "MonitoringView" "Monitoring & Observability" {
            include monitoringContainer chatServiceContainer skyAssistAgentContainer sharedAIFoundryContainer agentHelpersContainer
            autoLayout tb
            description "Monitoring and observability architecture showing telemetry flow"
        }

        styles {
            
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
            element "SkyCart Staff" {
                background #2d5aa0
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            relationship "Microsoft Azure - Private Endpoints" {
                color #0F9125
                dashed true 
                position 50
            }
        }
    }
}