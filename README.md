# Architectural Diagrams Repository

[![Export Diagrams](https://github.com/ASW-TPS/architectural-diagrams/actions/workflows/export-diagrams.yml/badge.svg)](https://github.com/ASW-TPS/architectural-diagrams/actions/workflows/export-diagrams.yml)

This repository serves as a centralized hub for creating, managing, and sharing architectural diagrams that visually represent software systems and their components. These diagrams are essential for understanding, designing, and communicating software architectures effectively. The repository leverages modern tools like PlantUML and Structurizr DSL to ensure diagrams are maintainable, version-controlled, and reusable.

## Purpose

The primary goal of this repository is to provide a structured and collaborative environment for documenting software architectures. By using text-based diagramming tools, such as PlantUML and Structurizr DSL, the repository ensures that diagrams are easy to update, integrate with CI/CD pipelines, and maintain consistency across projects.

**Key Features:**
- 🏗️ **Architecture as Code**: All diagrams are defined in text format and version-controlled
- 🚀 **Automated Export**: GitHub Actions automatically generates PNG, SVG, and PlantUML files when changes are made
- 📦 **Ready-to-Use**: Pre-configured dev container with all necessary tools
- 📊 **Multiple Formats**: Export to PNG (documentation), SVG (web), and PlantUML (source)

## Tools and Technologies

### Dev Container Environment
This repository is designed to be used within a **dev container** running on **Ubuntu 24.04.3 LTS**. The dev container includes pre-installed tools to streamline the development process:
- **Git**: Built from source and available on the `PATH`.
- **Java 17**: Required runtime for PlantUML and Structurizr CLI.
- **PlantUML**: For rendering PlantUML diagrams to various image formats.
- **Structurizr CLI**: For exporting Structurizr DSL diagrams to multiple formats.
- **Command-line utilities**: Includes `apt`, `dpkg`, `curl`, `wget`, `ssh`, `scp`, `rsync`, `gpg`, and more.
- **Compression tools**: Includes `zip`, `unzip`, `tar`, `gzip`, `bzip2`, and `xz`.
- **System monitoring tools**: Includes `ps`, `lsof`, `netstat`, `top`, and `tree`.

### PlantUML
PlantUML is a powerful tool for creating diagrams using plain text descriptions. It supports a wide range of diagram types, including UML, sequence, and C4 model diagrams. PlantUML is particularly useful for teams working in version-controlled environments, as diagrams are stored as code.

### Structurizr DSL
Structurizr DSL is a domain-specific language designed for defining software architecture models as code. It is ideal for creating C4 model diagrams, which focus on the context, containers, components, and code of a system. Structurizr DSL diagrams are highly maintainable and can be exported to formats like PlantUML for rendering.

### MS Visio
While the repository prioritizes text-based tools, MS Visio is used for diagrams that require advanced graphical features or cannot be easily represented in PlantUML or Structurizr DSL.

## Repository Structure

The repository is organized to ensure clarity and ease of navigation:

- **/models/**: Contains Structurizr DSL models for each initiative.
  - **digital-agent/**: Architecture models for the digital agent initiative.
    - **aidigitalagent-model.dsl**: Structurizr DSL file for architecture models.
  - **workspace-agent/**: Architecture models for the workspace agent initiative.
    - **aiworkspaceagent-model.dsl**: Structurizr DSL file for architecture models.
- **/docs/**: Comprehensive architecture documentation organized by system.
  - **digital-agent/**: Documentation for the digital agent system.
  - **workspace-agent/**: Documentation for the workspace agent system.
- **/exports/**: Generated diagram files in various formats (PlantUML, PNG, SVG).
  - **aidigitalagent-model/**: Exported diagrams for digital agent.
  - **aiworkspaceagent-model/**: Exported diagrams for workspace agent.
- **/archive/**: Archived diagrams and legacy files.
  - **arch-people-policy-expert.vsdx**: MS Visio file for architecture diagrams.
  - **copilot-studio/**: Archived PlantUML component and deployment diagrams.
- **/misc/**: Additional resources, such as images used in documentation.

## Diagramming Standards

### Priority Order
1. **Structurizr DSL Diagrams**: Preferred for their structured and reusable nature.
2. **PlantUML Diagrams**: Used when Structurizr DSL is not applicable.
3. **MS Visio Diagrams**: For advanced graphical needs.
4. **Other Formats**: Only as a last resort.

### C4-PlantUML
The repository uses the [C4-PlantUML library](https://github.com/plantuml-stdlib/C4-PlantUML) as the primary stencil for creating C4 model diagrams. This ensures consistency and adherence to best practices.

## Getting Started

### 🚀 Quick Start (Automated)
The easiest way to get diagrams is through our automated export system:

1. **Make changes** to any `.dsl` files in the `models/` directory
2. **Push to main branch** - GitHub Actions will automatically export diagrams
3. **Download results** from the [Releases page](../../releases) or check the commit comments for direct links

### 🛠️ Local Development Setup

### Step 1: Using the Dev Container
The easiest way to work locally is by using the provided dev container, which includes all necessary tools pre-installed:
1. Open the repository in Visual Studio Code
2. When prompted, click "Reopen in Container" or use the Command Palette (Ctrl+Shift+P) and select "Dev Containers: Reopen in Container"
3. Wait for the container to build and start

### Step 2: Export Diagrams Locally
Once in the dev container, you can export diagrams using the provided script:

```bash
# Export all diagrams from a Structurizr DSL file
./export-diagrams.sh models/workspace-agent/aiworkspaceagent-model.dsl ./exports

# Or export all default models
./export-diagrams.sh
```

This generates:
- **PlantUML files** (.puml) - Editable source files
- **PNG images** (.png) - For documentation and presentations  
- **SVG images** (.svg) - For web use and responsive designs

For detailed export instructions, see [EXPORT_GUIDE.md](EXPORT_GUIDE.md).

### Step 3: Manual Tool Installation (if not using dev container)
If you prefer to work outside the dev container, follow these steps:
1. **Java 17**: Required for running PlantUML and Structurizr CLI. Download from [OpenJDK](https://openjdk.org/).
2. **PlantUML**: Install the PlantUML extension in Visual Studio Code.
3. **Structurizr CLI**: Download from [Structurizr CLI releases](https://github.com/structurizr/cli/releases).
4. **Graphviz**: Required for rendering diagrams. Download from [Graphviz's website](https://graphviz.gitlab.io/download/).

### Step 4: Configure PlantUML (if working outside dev container)
1. Open VS Code Settings (Ctrl+, on Windows or Cmd+, on Mac).
2. Navigate to PlantUML configurations and set the Render option to `PlantUMLServer`.
3. Add the official PlantUML server address in the server option.

### Step 5: Create Diagrams
1. Create a new file with extensions `.wsd`, `.pu`, `.puml`, `.plantuml`, or `.iuml`.
2. Use PlantUML syntax or Structurizr DSL to define your diagrams.

## Contribution Guidelines

1. Follow the priority order for diagram formats.
2. Use Structurizr DSL for new architecture models whenever possible.
3. Ensure diagrams are version-controlled and adhere to repository standards.
4. Use the C4-PlantUML library for C4 model diagrams.

## Additional Resources

- [PlantUML Documentation](https://plantuml.com/)
- [Structurizr DSL Documentation](https://structurizr.com/help/dsl)
- [C4-PlantUML GitHub Repository](https://github.com/plantuml-stdlib/C4-PlantUML)

By maintaining a consistent and structured approach to diagramming, this repository aims to be a valuable resource for software architects and development teams.# aac-model2docs-techtalk
