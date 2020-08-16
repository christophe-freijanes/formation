#Configuration de service
##Gérer et configurer les conteneurs
Les conteneurs peuvent rendre les solutions de test et la gestion des applications beaucoup plus faciles car ils permettent à un administrateur système Linux de collecter une application, des dépendances et des données dans une seule image qui peut être facilement transférée et gérée de manière identique sur différents systèmes.
Nous utiliserons Docker pour lancer un serveur Web, gérer le conteneur et le supprimer complètement lorsque nous aurons terminé.
Vous devez vous familiariser avec certaines commandes de base de Docker et être prêt à commencer à gérer vos propres conteneurs.

- Installation de Docker
```bash
sudo apt install docker.io
```

- Lister les conteneurs
```bash
sudo docker ps
```

- Vérifier la page web créer par Docker
```bash
cd html
cat index.html
```

- Création d'un conteneur
```bash
sudo docker run -dit --name test-web -p 80:80 -v /home/user/html/:/usr/local/apache2/htdocs httpd
```

- Vérifier les conteneurs actifs ou non actifs
```bash
sudo docker ps
```

- Tester notre conteneur depuis lynx
```bash
lynx localhost
```

- Création d'une nouvelle page
```bash
cd ~/html
echo "Ceci est ma deuxième page" > test.html
```

- Tester notre site depuis lynx
```bash
lynx http://localhost/test.html
```

- Arrêter un conteneur Docker
```bash
sudo docker stop test-web
sudo docker ps
lynx localhost
```

- Démarrer un conteneur Docker
```bash
sudo docker start test-web
sudo docker ps
lynx localhost
```

- Supprimer un conteneur Docker
```bash
sudo docker stop test-web
sudo docker rm test-web
sudo docker image list
# Il existe toujours notre image httpd
```

- Supprimer une image Docker
```bash
sudo docker image rm httpd
```




