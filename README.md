# Craft Simulator

Craft Simulator (nom temporaire), est un jeu réalisé par Sylvain Crouzet (l'auteur de ce texte), avec les illustrations de Marilou Botta (quand elles sont belles, quand elles ne le sont pas elles sont de moi).

Pour l'instant ce projet est plutôt un centre de test pour l'utilisation du moteur Godot ainsi que pour l'implantation de différents paradigmes pour la programmation d'un système de craft libre plus libre.



## Les craft et les objets

En faisant fi du bon sens, j'ai décidé de ne pas exprimer les craft (Transformation, voir script/transformations/transformation.gd) par des fonctions mais par des objets. D'un point de vue logique comme de celui de la programation il est plus simple de créer l'action manger comme une fonction qui prend en paramètre des aliments et qui restaure le joueur.

Cependant, après avoir créé la fonction manger, il faudra refaire le même travail pour créer la fonction boire, à la limite on peut les factoriser en "ingérer", mais le problème restera le même pour crafter à une station de travail ou abattre un arbre.

Pour éviter de devoir créer des fonctions sur mesure pour de multiples actions, je propose plutôt de créer un objet transformation qui définit un craft, mais aussi l'action de manger.

L'objectif était de créer une classe transformation (éventuellement plusieurs si besoin ultérieurement), qui utilise des fonctions de bases comme des getters et setters sur les propriétés des objets.
Ainsi l'action de manger prend en paramètre un objet, et augmente la satiété de l'acteur qui effectue l'action en fonction des propriétés nutritives de l'objet. 

Pour bien organiser ces transformations, un système de tag serait intéressant à ajouter.

## City builder sans city building ?

Cette expérimentation sur les craft n'est pas l'unique idée derrière ce jeu, il s'inspire également de jeux comme the guild ou encore les city builder. Nous incarnons un joueur qui vit dans une ville ou les npc agissent à l'image des habitants d'une ville

Pour cela, un système de task est utilisé, ce qui est très classique pour les jeux de gestion, et qui marche très bien. Voir Oxygen not included ou Timberborn, par exemple,
où le joueur ordonne des travaux, des constructions... et ce sont des pnj qui se déplacent pour les réaliser.

Pour l'instant seulement des tasks très simple ont été essayées comme celle de manger depuis son inventaire ou de se diriger à un lieu.

Cette partie doit cependant être retravaillée maintenant que le système de transformation et d'inventaire est plus abouti.


