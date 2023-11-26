# [AssoMIP.fr](https://assomip.fr)

Code source du site de l'association MIP − Miagistes Importés à Paname

## Architecture

### Résumé

![Architecture AssoMIP fr x Netlify](https://user-images.githubusercontent.com/3141536/81552556-0067f300-9384-11ea-90e6-9d7aa6ed2d0f.png)

### Jekyll

[Jekyll](https://jekyllrb.com) est le générateur de site le plus populaire. Son fonctionnement est simple : il prend le
contenu des différents types de fichiers (HTML, [LESS](https://fr.wikipedia.org/wiki/Less_(langage)),
[Markdown](https://fr.wikipedia.org/wiki/Markdown)) puis les assemble pour créer toutes les pages et styles du site.

### Ce projet GitHub

Ce projet GitHub contient les sources utilisées par Jekyll pour générer le site. Par conséquent, afin qu'une personne
puisse écrire des articles, elle doit posséder un compte GitHub et être ajoutée à l'équipe
[@AssoMIP/editors](https://github.com/orgs/AssoMIP/teams/editors). 

Ces sources se décomposent ainsi :

* [_posts/](_posts/), [_pages/](_pages/), [_about/](_about/) et [_category/](_category/) contiennent respectivement les 
articles, pages, enfants de la page "À propos" et les catégories du site au format
[Markdown](https://fr.wikipedia.org/wiki/Markdown). Ce format est ensuite transformé en HTML par Jekyll.

* [_includes/](_includes/) contient des bouts de page réutilisables. Ces includes sont invoqués dans un document HTML ou
Markdown avec la syntaxe suivante `{% include nom_de_l_include.html %}`.

    Il est également possible de fournir des paramètres à ces includes :
    `{% include toto.html title='Hello' content='World' %}`.
 
* [_layouts/](_layouts/) contient les différentes vues du site. Celles-ci sont référencées par l'attribut `layout`
des différents articles et pages. Ces vues sont :
    * [default](_layouts/default.html) est la vue principale : elle contient tout le HTML et appelle les includes du
    header, du menu et du footer. C'est dans cette vue que seront générées toutes les pages.
    * [categories](_layouts/categories.html), [pages](_layouts/pages.html) et [posts](_layouts/pages.html) sont les vues
     des catégories, pages et articles, respectivement.
    
* [_plugins/](_plugins/) contient les plugins spécifiques à ce site.

* [_sass/](_sass/) contient toutes les règles CSS, ainsi que les sources du framework [Bootstrap](https://getbootstrap.com/).
Toutes ces règles sont ensuites importées dans [assets/css/styles.scss](assets/css/styles.scss) afin de générer un seul
fichier CSS contenant toutes les règles du site.

* [assets/](assets/) contient toutes les ressources statiques du site. Ces dernières se retrouvent dans `/assets` une
fois le site généré.

* [admin/](admin/) contient [NetlifyCMS](https://www.netlifycms.org/) et [son fichier de configuration](admin/config.yml).

    * Le sous-dossier [js/](admin/js/) contient le Javascript des widgets créés spécifiquement pour ce site.
    Le code source de ces widgets se trouve dans le projet [netlifyCMS-widgets](https://github.com/AssoMIP/netlifyCMS-widgets).
    Les widgets sont ensuite instanciés dans [admin/index.html](admin/index.html).    

* [_config.yml](_config.yml) contient la configuration de Jekyll.

* [feed](feed), [search.json](search.json) et [sitemap.xml](sitemap.xml) sont les templates qui générerent respectivement
le flux RSS, l'index de recherche (utilisé par [Simple-JekyllSearch](https://github.com/christian-fei/Simple-Jekyll-Search))
et la sitemap.

* Enfin [index.html](index.html) est la page d'accueil du site : celle qui liste tous les articles.

### Netlify CMS

[NetlifyCMS](https://www.netlifycms.org/) est une interface qui permet d'éditer les articles et pages en
[WYSIWYG](https://fr.wikipedia.org/wiki/What_you_see_is_what_you_get), soit une manière bien plus simple de mettre en
forme les articles qu'en écrivant directement du [Markdown](https://fr.wikipedia.org/wiki/Markdown).

Son authentification repose sur GitHub, puisque seuls les utilisateurs qui ont les droits d'écriture sur ce projet
peuvent modifier et publier des articles. Pour l'authentification,
[une application OAuth](https://docs.netlify.com/visitor-access/oauth-provider-tokens/) a été crée.
Elle est détenue par l'organisation [@AssoMIP](https://github.com/AssoMIP) et est lié à notre compte Netlify.

À noter que lorsque des brouillons d'articles et pages sont créés, Netlify CMS crée une nouvelle branche et une Pull
Request. 

### Netlify

[Netlify](https://www.netlify.com/) est un service qui permet de construire une site statique depuis son code source
hébergé sur Git et d'un générateur de site pour ensuite l'héberger.

Ils proposent également un CDN, un service de [formulaires](https://www.netlify.com/products/forms/),
d'[A/B Testing](https://docs.netlify.com/site-deploys/split-testing/) et même de
[fonctions serverless](https://www.netlify.com/products/functions/) (pensez à AWS Lambda).

Nous utilisons [l'offre gratuite](https://www.netlify.com/pricing/) qui propose une bande passante de 100Go/mois
(bien en dessous des ~800Mo/mois que nous servions avec Wordpress).

## Exécuter Jekyll localement pour développer

Tu souhaites modifier le layout d'un page ou rajouter une règle CSS ?
 
Plutôt que de pusher chacune de tes modifications puis attendre qu'elles soient déployées sur Netlify pour en voir le
résultat, je te conseille d'installer et exécuter Jekyll sur ton poste :

1. [Installe les pré-requis de Jekyll](https://jekyllrb.com/docs/installation/) (Ruby, Gem, Bundler, GCC, Make)
ainsi qu'[ImageMagick 6.X](https://legacy.imagemagick.org/script/download.php) (utilisé pour le redimensionnement des images).
2. Clone ce projet
3. Ouvre un terminal dans le projet et installe Jekyll et ses dépendances avec la commande `bundle`
4. Enfin, lance Jekyll en mode serveur : `bundler exec jekyll serve`. Le site sera disponible sur `http://localhost:4000`.
Il est également possible de rafraîchir la page à chaque modification en ajoutant le paramètre `--livereload`.

## Note sur PurgeCSS

Par défaut, notre CSS contenant l'intégralité de Bootstrap, ce premier a une taille énorme : 175Ko. Or, nous n'utilisons
qu'une infime partie du framework.

Pour palier à ça, nous utilisons [PurgeCSS](https://purgecss.com/) via le plugin [jekyll-purgecss](https://github.com/mhanberg/jekyll-purgecss)
pour retirer toute règle CSS superflue : toute règle qui n'est pas utilisée dans le HTML généré est automatiquement retirée.

Afin que PurgeCSS fonctionne sur Netlify, il ne faut absolument pas supprimer les fichier [package.json](package.json)
et [package-lock.json](package-lock.json), sans quoi Netlify sera incapable d'installer le CLI `purgecss` que `jekyll-purgecss`
attend dans `./node_modules/purgecss`.

**Il faut également que la variable d'environnement `JEKYLL_ENV` soit initialisée avec la valeur `production` dans
l'interface de configuration de Netlify.** 
