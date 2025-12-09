# Dev Container Dockerfile
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set environment variables
ENV PLANTUML_VERSION=1.2024.6
ENV PLANTUML_JAR=/usr/local/plantuml/plantuml.jar
ENV STRUCTURIZR_CLI_VERSION=2025.05.28
ENV STRUCTURIZR_CLI_JAR=/usr/local/structurizr/structurizr-cli.jar
ENV JAVA_OPTS="-Xmx1024m"
ENV JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# Install dependencies in a single layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    graphviz \
    openjdk-17-jre-headless \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libfreetype6 \
    fontconfig \
    procps \
    unzip \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

# Set up PlantUML with version pinning and verification
RUN mkdir -p /usr/local/plantuml \
    && curl -fsSL "https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar" \
       -o "${PLANTUML_JAR}" \
    && echo '#!/bin/bash\nexec java $JAVA_OPTS -jar "$PLANTUML_JAR" "$@"' > /usr/local/bin/plantuml \
    && chmod +x /usr/local/bin/plantuml \
    && plantuml -version

# Set up Structurizr CLI with version pinning and verification
RUN mkdir -p /usr/local/structurizr \
    && curl -fsSL "https://github.com/structurizr/cli/releases/download/v${STRUCTURIZR_CLI_VERSION}/structurizr-cli.zip" \
       -o /tmp/structurizr-cli.zip \
    && unzip /tmp/structurizr-cli.zip -d /tmp/structurizr-cli \
    && cp -r /tmp/structurizr-cli/lib /usr/local/structurizr/ \
    && echo '#!/bin/bash\nexec java $JAVA_OPTS -cp "/usr/local/structurizr:/usr/local/structurizr/lib/*" com.structurizr.cli.StructurizrCliApplication "$@"' > /usr/local/bin/structurizr-cli \
    && chmod +x /usr/local/bin/structurizr-cli \
    && rm -rf /tmp/structurizr-cli /tmp/structurizr-cli.zip \
    && structurizr-cli help

# Create non-root user for better security (if not already exists)
RUN if ! id -u vscode > /dev/null 2>&1; then \
        groupadd --gid 1000 vscode \
        && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode; \
    fi

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER vscode

# Default command
CMD ["sleep", "infinity"]
