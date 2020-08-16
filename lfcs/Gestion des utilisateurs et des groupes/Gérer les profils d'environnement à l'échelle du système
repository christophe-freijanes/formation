#Gestion des utilisateurs et des groupes
##Gérer les profils d'environnement à l'échelle du système
La configuration d'application sous Linux se fait généralement avec des variables d'environnement.
Nous examinerons divers outils et fichiers sur un système Linux qui nous permettront de visualiser, créer et supprimer des variables d'environnement.

#Types de variables
- Local
    .Variables disponible pour les utilisateurs de la session courante.
- User
    .Variables définit pour un utilisateur spécifié.
- System
    .Variables disponible pour tous les utilisateurs du système.

#Afficher les variables
```bash
env # Afficher toutes les variables définit
printenv / printenv VAR # Afficher toutes les variables spécifique
echo $VAR # Afficher d'autres variable spécifique 
```

Exemple pour afficher une variable lister dans `env`
```bash
env 
printenv SHELL
/bin/bash
```

- Vérifier une variable
```bash
echo $SHELL
/bin/bash
```

- Exporter une variable
```bash
export MY_VAR="Ma variable."
echo $MY_VAR
Ma variable.
```

- Changer une variable existante
```bash
export MY_VAR="$MY_VAR A jour!"
echo $MY_VAR
Ma variable. A jour!
```

- Changement complet de notre variable
```bash
export MY_VAR="NEW VAR ?"
echo $MY_VAR
NEW VAR ?
```

- Supprimer la variable
```bash
unset MY_VAR
echo $MY_VAR
#Rien ne doit s'afficher
```

- Exporter une nouvelle variable depuis .bashrc

```bash
sudo nano .bashrc
# En fin de page, on va exporter une nouvelle variable
export NEWVAR="Nouvelle valeur !"
# Enregistrer et quitter
source .bashrc
# Vérification
echo $NEWVAR
Nouvelle valeur !
```

- Définir une variable depuis /etc/environnement
```bash
cat /etc/environnement
sudo nano /etc/environnement
# Rajouter la ligne en dessous de PATH="...
MYNEWVAR="super toto !"
# Enregistrer et quitter
echo MYNEWVAR
# Rien ne s'affiche
# Elle sera pris en compte au prochain redémarrage de la session
```

- Supprimer une variable depuis /etc/environnement
```bash
sudo nano /etc/environnement
# Supprimer la ligne en dessous de PATH="...
MYNEWVAR="super toto !"
# Enregistrer et quitter
```

- Ajouter une variable à cette emplacement et la même chose que dans /etc/environnement 
```bash
cat /etc/bash.bashrc
```

- Ajouter une variable à cette emplacement et la même chose que dans /etc/environnement 
```bash
cd /etc/profile.d
ls -alh
#On trouve à cet emplacement les scripts utilisés au démarrage du système
```

