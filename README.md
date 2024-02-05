# Craft Simulator
![](https://github.com/Sylvaindelaforet/logi-game/blob/main/pictures-readme/example1.png)

Ce jeu est réalisé par Sylvain Crouzet (l'auteur de ce texte et programmeur), et par Marilou Botta, qui a réalisé les magnifiques illustrations.

## Les craft et les objets

![](https://github.com/Sylvaindelaforet/logi-game/blob/main/pictures-readme/example2.png)

En faisant fi du bon sens, j'ai décidé de ne pas exprimer les craft (Transformation, voir script/transformations/transformation.gd) par des fonctions mais par des objets.

### Avantages

Créer un objet pour les craft permet de définir facilement et rapidement une multitude de transformations. 

### Inconvénients

Pour définir une transformation, des règles ont été créées pour définir les réactifs et les produits, mais si on veut ajouter des possibilités, il faudra soit 
les modifier et donc vérifier que tout ce qui a été déjà fait fonctionne, soit créer un nouveau type de transformation.

### Exemple
Ainsi l'action de manger prend en paramètre un objet, et augmente la satiété de l'acteur, en fonction des propriétés nutritives de l'objet. 

Pour bien organiser ces transformations, un système de tag serait intéressant à ajouter.

## City builder sans city building ?

L'objectif était de créer une sorte de rpg où on serait jouerait ce qui est d'habitude un pnj dans les city-builders.

### Élément rpg
Pour étudier des éléments de gameplay utile pour les rpg, 

Cette expérimentation sur les craft n'est pas l'unique idée derrière ce jeu, il s'inspire également de jeux comme the guild ou encore les city builder.

Pour cela, un système de task est utilisé, ce qui est très classique pour les jeux de gestion, et qui marche très bien. Voir Oxygen not included ou Timberborn, par exemple,
où le joueur ordonne des travaux, des constructions... et ce sont des pnj qui se déplacent pour les réaliser.

### Élément city-builder
Pour l'instant seulement des tasks très simple ont été essayées comme celle de manger depuis son inventaire ou de se diriger à un lieu.

Cette partie doit cependant être retravaillée maintenant que le système de transformation et d'inventaire est plus abouti.

## Est-ce un jeu ?

Beaucoup de travail est possible pour simplifier l'expérience du joueur, mais ce genre de jeu de gestion de précision demande une certaine forme d'automatisation.
En effet, on parle d'un jeu et pas d'un travail, donc toute la gestion laborieuse doit être gérée par l'ordi (en général les pnj). 

Je cherchais un jeu à mi-chemin en rpg et jeu de gestion.
Même si toute cette gestion pourrait être gérée par des pnj avec leur système de tâche,
le système n'est pas encore assez abouti.

