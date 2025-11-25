---
title: Technical Decision Log
nav_order: 100
has_children: true
has_toc: false
---

# Technical Decision Log

| Title | Impact | Decision Date | Outcome |
|-------|--------|--------------|---------|
{% for page in site.pages -%}
{% if page.parent == "Technical Decision Log" -%}
| [{{ page.title }}]({{ page.url }}) | {{ page.impact | default: "N/A" }} | {{ page.decision_date | default: "N/A" }} | {{ page.outcome | default: "N/A" }} |
{% endif -%}
{% endfor -%}