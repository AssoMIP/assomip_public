# _includes
Description des différents `includes` de assomip.fr et leurs paramètres.

## [header.html](header.html) et [footer.html](footer.html)

Les plus simples : ils sont complètement statiques et comme leurs noms l'insinuent, ils contiennent l'en-tête et le 
pied de page du site.

## [navigation.html](navigation.html)

C'est la barre de navigation : [celle de Bootstrap](https://getbootstrap.com/docs/4.3/components/navbar/) pour être exact.
Chacune des pages situées dans [/_pages](/_pages) créer une entrée dans la barre de navigation.

## [article.html](article.html)

Cet include a été créé afin de réutiliser le même code pour mettre en forme les articles, pages et listes d'articles.

Ses paramètres sont :

* `title` : titre de l'article / la page
* `content` : contenu de l'article / la page
* `url` (facultatif) : URL de l'article
* `date` (facultatif) : date de publication de l'article
* `eventdate` et `eventcard` (facultatif) : date et heure et détails de l'événement

## [event-details.html](event-details.html)

Cet include contient la carte du récapitulatif d'un événement (date et heure, lieu, adresse et transports en commun).
Il est appelé dans l'inclure [article.html](article.html) avec les informations contenues dans les champs `eventdate`
et `eventcard` de l'article.

## [responsive-image.html](responsive-image.html)

Include utilisé par le plugin [jekyll-responsive-image](https://github.com/wildlyinaccurate/jekyll-responsive-image)
pour afficher des [images adaptives](https://developer.mozilla.org/fr/docs/Apprendre/HTML/Comment/Ajouter_des_images_adaptatives_%C3%A0_une_page_web).

**TL;DR** : on utilise la propriété `srcset` de `<img>` pour afficher une image de la largeur qui correspond à celle de
l'écran. L'attribut `sizes` précise la largeur de l'image, puisqu'elle ne prend pas toujours toute la largeur de l'écran.
Ces tailles correspondent ici à [celles du container de Bootstrap](https://getbootstrap.com/docs/4.4/layout/overview/#containers) - 72px de marge.

## [contact-form.html](contact-form.html)

Include utilisé pour envoyer des messages via [Netlify Forms](https://www.netlify.com/products/forms/). À utiliser ainsi :
```markdown
{% include contact-form.html name='some-name' %}
```
Une fois validé, redirige vers [/contact-success](../contact-success.html).

## [accordion.html](accordion.html)

Fragment contenant le titre d'un accordion Bootstrap. 

## [search.html](search.html)

Champs de recherche avec résultats appelé dans [header.html](header.html). 
