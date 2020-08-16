# Gestion des conteneurs Docker
Dans l'environnement moderne, maîtriser la gestion des conteneurs est une compétence essentielle.
Vous utiliserez les compétences de gestion de conteneurs Docker pour démarrer et arrêter des conteneurs basés sur des images, ajouter et supprimer des images et des conteneurs et surveiller et mettre à jour des conteneurs.
L'achèvement du laboratoire démontrera les compétences de base en gestion de conteneurs Docker

Votre équipe informatique prévoit de déployer des conteneurs Docker pour un projet à venir. 
On nous a demandé de terminer cet exercice pour améliorer nos compétences Docker.
Cet exercice implique l'utilisation de plus d'une douzaine de dockercommandes.
Nous commencerons par la pratique des compétences de base, l' exécution du hello-worldet des busyboximages, et la gestion de leurs conteneurs et des images.
Ensuite, nous allons créer un conteneur nommé en apache2 fonction de l' httpd:2.4 image et mapper le port 8080 sur localhostle port 80 sur le conteneur.
Après avoir testé et surveillé le apache2conteneur, nous apporterons une modification au serveur Web qu'il exécute.
Nous remplacerons le texte par défaut index.html par les mots conteneur apache2 , puis validerons les modifications dans le conteneur.
Enfin, nous vérifierons que le apache2conteneur diffuse le contenu approprié.
Nous allons pratiquer les dockersous-commandes suivantes dans ce laboratoire pratique:

commit      Create a new image from a container's changes
exec        Run a command in a running container
images      List images
logs        Fetch the logs of a container
ps          List running containers
ps -a       List all containers
pull        Pull an image or a repository from a registry
rm          Remove one or more containers
rmi         Remove one or more images
run         Run a command in a new container
search      Search the Docker Hub for images
start       Start one or more stopped containers
stats       Display a live stream of container(s) resource usage statistics
stop        Stop one or more running containers

- Pratiquez Docker en exécutant les images hello-world et busybox
Si docker est installé et que docker.service est activé, un excellent moyen de tester la capacité à exécuter un conteneur consiste à utiliser la sous-commande docker runavec une image simple comme hello-world.
L'image busybox est une autre image simple que nous allons extraire et runune commande.
La sous-commande ps - est utile pour visualiser en cours d'exécution ou tous les conteneurs, et les images listeront les images dans le référentiel local.
En utilisant la sous-commande rm -, nous pouvons supprimer des conteneurs et des rmiimages.

```bash
sudo -i
docker run hello-world
docker run --name hi hello-world
docker search busybox
docker pull docker.io/busybox
docker run --name busy -it busybox /bin/sh
exit
docker ps -a # shows a <name> for hello-world
docker rm <name>
docker rm hi
docker ps -a
docker images
docker rmi hello-world
docker images
```

- Créer un conteneur apache2 basé sur l'image httpd: 2.4 
Mappage de l'hôte local: 8080 au port de conteneur 80
Utilisez docker run pour créer un conteneur nommé apache2, basé sur l' httpd:2.4 image, et mapper le port HTTP avec -p 8080:80.

```bash
docker run --name apache2 -p 8080:80 httpd:2.4 
#Use CTRL+C to exit output from running container
docker ps
docker ps -a
docker start apache2
docker logs apache2
docker stats apache2
CTRL+C
lynx -dump http://localhost:8080
```

- Dans le conteneur apache2, mettez à jour le fichier index.html par défaut, puis vérifiez et validez les modifications

```bash
docker exec -it apache2 bash
ls
cd htdocs
echo 'apache2 container' > index.html
exit
lynx -dump http://localhost:8080
docker commit -m 'Updated index.html' apache2
```

- Redémarrez le conteneur apache2 et vérifiez que les modifications sont en vigueur

```bash
docker ps
docker stop apache2
docker ps -a
docker start apache2
lynx -dump http://localhost:8080
```
