---
title: GetAntidote
layout: default
permalink: /
---

{% for section in site.sections %}
<div class="Page" id="{{ section.title }}">
  <h1>{{ section.title }}</h1>
  <p>{{ section.content | markdownify }}</p>
</div>
{% endfor %}
