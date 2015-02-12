
{% for post in site.posts %}
  {% if post.cat contains include.cat }%
    - [[{{ post.date | date_to_string }}] {{ post.title }}]({{ site.baseurl }}/{{ post.permalink }})
  {% endif %}
{% endfor %}
