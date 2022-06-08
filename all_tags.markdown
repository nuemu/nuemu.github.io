---
layout: page
title: Tag一覧
permalink: /tags/
---

{%- for tag in site.tags -%}
  {% assign url = "/tag/" | append: tag.first %}
  <div>
    <a href="{{ url | relatvie_url }}">{{tag.first}}</a>
  </div>
{%- endfor -%}