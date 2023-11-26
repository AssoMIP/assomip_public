# _plugins

Plugins spécifiques au site.

## [frdates.rb](frdates.rb)

Plugin qui remplace la fonction `strftime` de Jekyll par la notre avec le formattage des dates en Français.

Source : http://evaneos.github.io/mettre-les-dates-en-francais-dans-un-blog-jekyll-2014-04-04/

## [markdown-img-picture-replacement.rb](markdown-img-picture-replacement.rb)

Ce plugin remplace toutes les [balises image de Markdown](https://www.markdownguide.org/basic-syntax/#images-1)
présentes dans les articles et post pour les remplacer par
les [images adaptives](https://developer.mozilla.org/fr/docs/Apprendre/HTML/Comment/Ajouter_des_images_adaptatives_%C3%A0_une_page_web)
de [jekyll-responsive-image](https://github.com/wildlyinaccurate/jekyll-responsive-image).

Par exemple :

```markdown
![Philadelphia's Magic Gardens. This place was so cool!](/assets/images/philly-magic-gardens.jpg "Philadelphia's Magic Gardens")
```

sera remplacé par

```markdown
{% responsive_image path: assets/images/philly-magic-gardens.jpg alt: "Philadelphia's Magic Gardens. This place was so cool!" title: "Philadelphia's Magic Gardens" %}
```

qui sera ensuite remplacé par une image adaptative par le plugin `jekyll-responsive-image`.


## [front-matter-parse-event-yaml.rb](front-matter-parse-event-yaml.rb)

Ce plugin parse le YAML contenu dans le front-matter `eventcard` des articles pour qu'il soit accessible comme objet
dans le template.

## [tabs-replacement.rb](tabs-replacement.rb)

Ce plugin remplace les balises `[tabs]` et `[tab]` par des accordion Bootstrap.
