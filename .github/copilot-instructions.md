
## Documentation Conventions
- Use Jekyll's site.github.repository_url variable which will work correctly in GitHub Pages.

### Terminology Standards
- Use "Azure Bot" not "Azure Bot Service"

### Diagram Integration
- Place diagram embeds where it's most contextually relevant
- Reference images using `/images/{folder}/{filename}` format (e.g., `/images/skyassist/Containers.svg`)
- Always add `{: .svg-container}` on the line immediately after each diagram image for zoom functionality
- Example:
  ```markdown
  ![Diagram Name](/images/folder/diagram.svg)
  {: .svg-container}
  ```

### Architecture Documentation
- Use [Readme.md](./../docs/README.md) as a template for Software systems documentation. 
- Follow C4 model conventions
- Use Structurizr DSL models where possible 
- Include cross-references to related sections
- Follow docs/readme.md file as a standard for docs folder for document pages and sections. You must never change the structure unless explicitelly asked. 