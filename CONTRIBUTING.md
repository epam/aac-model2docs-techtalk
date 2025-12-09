# Contributing to SkyCart Architecture as Code Demo

Thank you for your interest in this Architecture as Code demonstration project! This guide will help you understand how to work with and extend this example.

## About This Project

This is an educational demonstration project created for the tech talk **"Architecture as Code: From Models to Docs with GenAI"**. It showcases how to use Structurizr DSL, the C4 model, and AI-powered tools to document software architecture in a maintainable, version-controlled way.

**Note**: SkyCart is a fictional e-commerce company created to demonstrate real-world architecture patterns.

## Getting Started

### Prerequisites

- **Git** - Version control
- **Structurizr CLI** - For exporting DSL models to diagrams
- **PlantUML** - For rendering diagrams to PNG/SVG
- **Java** - Required by PlantUML (JRE 11 or higher)
- **Text Editor** - VSCode, IntelliJ, or any editor with DSL syntax support

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/epam/aac-model2docs-techtalk.git
   cd aac-model2docs-techtalk
   ```

2. **Install Structurizr CLI**
   ```bash
   # Download from https://github.com/structurizr/cli/releases
   # Or use package managers
   brew install structurizr-cli  # macOS
   ```

3. **Install PlantUML**
   ```bash
   brew install plantuml  # macOS
   # Or download from https://plantuml.com/download
   ```

## Project Structure

```
.
├── models/                          # Structurizr DSL models
│   ├── skyassist/                     # SkyAssist architecture
│   │   └── skyassist-model.dsl
│   └── common/                      # Shared definitions
│       ├── skycart-people.dsl
│       ├── skycart-existing-systems.dsl
│       └── external-systems.dsl
├── docs/                            # GitHub Pages documentation
│   ├── skyassist/                  # Architecture documentation
│   ├── tdl/                        # Technical Decision Logs
│   └── images/                     # Generated diagrams
├── export-diagrams.sh              # Script to generate diagrams
└── CONTRIBUTING.md                 # This file
```

## Working with Structurizr DSL

### Understanding the DSL Structure

The Structurizr DSL follows this hierarchy:

```dsl
workspace {
    model {
        // Define people, systems, containers, components
    }
    views {
        // Define what diagrams to generate
    }
}
```

### Modifying the Architecture

1. **Edit DSL files** in the `models/` directory
2. **Validate your changes** by exporting diagrams
3. **Review generated diagrams** in the export output
4. **Update documentation** in `docs/` to reflect changes

### Example: Adding a New System

```dsl
// In models/common/skycart-existing-systems.dsl
recommendationEngine = softwareSystem "Recommendation Engine" {
    description "Provides personalized product recommendations"
    tags "SkyCart System"
}
```

### Example: Adding a Relationship

```dsl
// In your model file
digitalAgent -> recommendationEngine "Fetches product suggestions from" "HTTPS/REST"
```

## Generating Diagrams

### Using the Export Script

The `export-diagrams.sh` script automates the entire diagram generation workflow:

```bash
# Export all default models
./export-diagrams.sh

# Export to specific directory
./export-diagrams.sh ./output

# Export specific file
./export-diagrams.sh models/skyassist/skyassist-model.dsl

# Export multiple files
./export-diagrams.sh models/skyassist/*.dsl ./output
```

The script automatically:
1. Exports DSL models to PlantUML format using Structurizr CLI
2. Generates PNG and SVG diagrams in parallel using PlantUML
3. Organizes output into `plantuml/`, `png/`, and `svg/` subdirectories
4. Removes key diagrams (legend files) automatically

**Output structure:**
```
exports/
└── skyassist-model/
    ├── plantuml/    # .puml intermediate files
    ├── png/         # Raster images for documentation
    └── svg/         # Vector graphics for web display
```

## Documentation Guidelines

### Architecture Documentation

Follow the structure in `docs/README.md` (based on Solution Architecture Document template):

1. **Executive Summary** - High-level overview
2. **Introduction** - Context and scope
3. **Context** - Enterprise architecture alignment
4. **Requirements** - Business goals and constraints
5. **Quality Attributes** - Key architectural drivers
6. **Baseline Architecture** - Current state (if applicable)
7. **Target Architecture** - Proposed design
8. **Transition/Migration** - Implementation roadmap
9. **Governance** - Ongoing architectural practices

### Technical Decision Logs (TDL)

Document significant technical decisions in `docs/tdl/`:

```markdown
# TDL-XXX: Decision Title

**Date**: YYYY-MM-DD
**Status**: Proposed | Accepted | Deprecated | Superseded

## Context
What is the issue we're trying to solve?

## Decision
What decision did we make?

## Consequences
What are the implications (positive and negative)?

## Alternatives Considered
What other options did we evaluate?
```

### Diagram Integration

Place diagrams in documentation using:

```markdown
![Diagram Name](/images/skyassist/diagram-name.svg)
{: .svg-container}
```

The `{: .svg-container}` class enables zoom functionality.

## Code Style and Standards

### DSL Conventions

- Use **camelCase** for element IDs
- Use **"Quoted Names"** for display names
- Add **descriptions** to all major elements
- Apply **tags** for styling and filtering
- Group related elements logically

### File Organization

- **One system per DSL file** for complex architectures
- **Shared definitions** in `common/` directory
- **Use `!include`** to reference common files
- **Consistent naming**: `{system-name}-model.dsl`

### Documentation Standards

- Follow **Markdown** best practices
- Use **Jekyll variables** for GitHub Pages compatibility
- Include **cross-references** between related sections
- Keep **diagrams up-to-date** with models

## Submitting Changes

### For Tech Talk Attendees

1. **Fork** the repository
2. **Create a feature branch**: `git checkout -b feature/your-feature-name`
3. **Make your changes** to DSL models or documentation
4. **Generate diagrams**: `./export-diagrams.sh`
5. **Commit your changes**: `git commit -am "Add your message"`
6. **Push to your fork**: `git push origin feature/your-feature-name`
7. **Submit a Pull Request**

### Pull Request Guidelines

- Provide clear description of changes
- Include before/after diagrams if modifying architecture
- Update relevant documentation
- Ensure diagrams generate successfully
- Reference any related issues or TDLs

## Best Practices

### Architecture Modeling

✅ **Do:**
- Start with System Context, then drill down
- Use consistent terminology across models and docs
- Document key architectural decisions
- Keep models synchronized with implementation
- Use meaningful tags for diagram styling

❌ **Don't:**
- Model every implementation detail
- Create diagrams without clear purpose
- Use ambiguous relationship descriptions
- Forget to update diagrams when architecture changes

### Documentation

✅ **Do:**
- Write for your audience (technical and non-technical)
- Use diagrams to supplement text, not replace it
- Keep documentation close to the code/models
- Version control everything
- Regular reviews and updates

❌ **Don't:**
- Create documentation that duplicates the code
- Use outdated screenshots or diagrams
- Write long paragraphs without structure
- Assume readers have full context

## Learning Resources

### Structurizr & C4 Model

- [Structurizr DSL Language Reference](https://github.com/structurizr/dsl/tree/master/docs)
- [C4 Model Official Site](https://c4model.com/)
- [Structurizr DSL Cookbook](https://github.com/structurizr/dsl/tree/master/docs/cookbook)

### Architecture as Code

- [Architecture as Code Book](https://www.architectureascode.com/)
- [ThoughtWorks Technology Radar - AaC](https://www.thoughtworks.com/radar/techniques/architecture-as-code)

### PlantUML

- [PlantUML Official Site](https://plantuml.com/)
- [PlantUML C4 Extension](https://github.com/plantuml-stdlib/C4-PlantUML)

## Questions and Support

This is a demonstration project created for the **"Architecture as Code: From Models to Docs with GenAI"** tech talk. For questions about:

- **Structurizr DSL**: Check [Structurizr documentation](https://structurizr.com/)
- **C4 Model**: Visit [c4model.com](https://c4model.com/)
- **GenAI for Documentation**: Explore GitHub Copilot, ChatGPT, and Claude for architecture tasks

## License

This demonstration project is provided as-is for educational purposes. Feel free to use it as a template for your own Architecture as Code initiatives.

---

**Happy Architecting! 🏗️**

Experiment with text-based models, automate your work, and empower your team to keep architecture current and actionable. 
Let’s build smarter, together!