# SkyCart Architecture as Code - Model to Docs Demo

This repository demonstrates Architecture as Code (AaC) using Structurizr DSL to model the SkyCart E-commerce Marketplace Digital Agent system and generate documentation automatically.

## About SkyCart

SkyCart is a mid-size e-commerce marketplace that sells outdoor and travel gear. They operate in multiple countries, support both direct sales and third-party sellers, and run seasonal promotions with heavy traffic spikes.

### Core Business Capabilities

- Product catalog and search
- Orders and payments
- Shipping & delivery tracking
- Seller onboarding and inventory sync
- Customer accounts and loyalty program
- Promotions / campaigns

### High-Level Systems

- **SkyCart Web & Mobile Apps**: Customer storefront, browsing, checkout
- **Marketplace API**: Backend for apps, handles business logic
- **Catalog Service**: Products, prices, inventory availability
- **Order Service**: Order lifecycle, returns, refunds
- **Payment Gateway Integration**: External PSP (Stripe/Adyen-like)
- **Shipping Integration Service**: Talks to multiple couriers
- **Seller Portal**: Third-party sellers manage products & stock
- **Analytics / Event Stream**: Event bus + dashboards for sales/ops
- **SkyAssist**: Intelligent customer service agent (focus of this architecture)

## Repository Structure

```
├── models/
│   ├── skyassist/
│   │   └── skyassist-model.dsl           # Main Structurizr DSL model
│   └── common/
│       ├── skycart-people.dsl          # People/personas
│       ├── skycart-existing-systems.dsl # Existing systems
│       └── external-systems.dsl         # External integrations
├── docs/
│   ├── skyassist/                      # Architecture documentation
│   ├── tdl/                            # Technical decision logs
│   └── images/                         # Architecture diagrams
└── README.md
```

## Architecture as Code Approach

This project uses:

- **Structurizr DSL** to define architecture models
- **C4 Model** for visualizing architecture at different levels
- **GitHub Pages** for documentation publishing
- **Jekyll** for static site generation

## Getting Started

1. View the architecture documentation at the GitHub Pages site
2. Explore the DSL models in the `models/` directory
3. Review architecture diagrams in `docs/images/skyassist/`

## Architecture Documentation

The architecture follows the C4 model and includes:

- **System Context**: How SkyAssist fits in the SkyCart ecosystem
- **Container Diagram**: Major components and their interactions
- **Component Diagrams**: Detailed views of key containers
- **Deployment Diagrams**: Infrastructure across Dev/Test/Prod environments
- **Dynamic Diagrams**: Interaction flows and workflows

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing to this repository.

## License

This is a demonstration project for Architecture as Code practices.
