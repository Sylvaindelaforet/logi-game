# Craft Simulator

Craft Simulator (nom temporaire), est un jeu réalisé par Sylvain Crouzet (l'auteur de ce texte), avec les illustrations de Marilou Botta (quand elles sont belles, quand elles ne le sont pas elles sont de moi).

Pour l'instant ce projet est plutôt un centre de test pour l'utilisation du moteur Godot ainsi que pour l'implantation de différents paradigmes pour la programmation d'un système de craft libre plus libre.



## Les craft et les objets

En faisant fi du bon sens, j'ai décidé de ne pas exprimer les craft (Transformation) par des fonctions mais par des objets. D'un point de vue logique comme de celui de la programation il est plus simple de créer l'action manger comme une fonction qui prend en paramètre des aliments et qui restaure le joueur.

Cependant, après avoir créé la fonction manger, il faudra refaire le même travail pour créer la fonction boire, à la limite on peut les factoriser en "ingérer", mais le problème restera le même pour crafter à une station de travail ou abattre un arbre.

Pour éviter de devoir créer des fonctions sur mesure pour de multiples actions, je propose plutôt de créer une transformation qui définit un craft, mais aussi l'action de manger. 

Si on veut faire le philosophe de lycée on peut rappeler la citation apocryphe de Lavoisier : "Rien ne se perd, rien ne se crée, tout se transforme.".

L'objectif était de créer une classe transformation (éventuellement plusieurs pour différentes natures de transformation, comme celle de couper du bois qu'on peut voir comme la transformation de la durabilité d'une hache en tronc d'abre).


## City builder sans city building ?

Cette expérimentation sur les craft n'est pas l'unique idée derrière ce jeu, il s'inspire également de jeux comme the guild ou encore les city builder. Nous incarnons un joueur qui vit dans une ville ou les npc agissent à l'image des habitants d'une ville

Pour cela, un système de task est utilisé, ce qui est très classique pour les jeux de gestion, et qui marche très bien.

Pour l'instant seulement des tasks très simple ont été essayées comme celle de manger depuis son inventaire ou de se diriger à un lieu.

Cette partie doit cependant être retravaillée maintenant que le système de transformation et d'inventaire est plus abouti.


