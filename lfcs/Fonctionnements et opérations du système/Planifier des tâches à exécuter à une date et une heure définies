#Fonctionnement et opérations du système
##Planifier des tâches à exécuter à une date et une heure définies
En tant qu'administrateur système Linux, vous vous retrouverez souvent à exécuter la même commande, le même script ou le même rapport encore et encore.
Nous allons examiner `cron` et voir comment cela peut aider à automatiser ces tâches répétitives et à les obtenir sur un calendrier régulier.
Vous serez en mesure d'afficher une crontab et de comprendre comment planifier vos tâches lorsque vous en avez besoin.

```bash
# [Crontab schedule]
#
# +------------------------- minute (0 - 59)
# |   +--------------------- heure (0 - 23)
# |   |   +----------------- jour du mois (1 - 31)
# |   |   |   +------------- mois (1 - 12)
# |   |   |   |   +--------- jour de la semaine (0 - 6) (Dimanche=0)
# |   |   |   |   |
# *   *   *   *   * commande à exécuter
# 
```

#Commande crontab
- Lister le crontab
```bash
crontab -l
```

- Editer le crontab
```bash
crontab -e
```

#Utilisation du crontab
- Création d'une planification qui va s'exécuter tous les lundi à 20h
```bash
0 20 * * 1 echo "Checking" >> /home/user/log/check.log
```

- Création d'une planification qui va exécute une commande toutes les minutes est que va inscrire dans fichier log sa sortie
```bash
*/1 * * * * echo "Checking" >> /home/user/log/check.log
```

- Création d'une planification qui va s'exécuter uniquement les jours de semaine à 21h
```bash
0 21 * * 1-5 echo "Checking" >> /home/user/log/check.log
```

- Création d'une planification qui va s'exécuter le 1er et le 15 du mois à 00h
```bash
0 0 1,15 * * echo "Checking" >> /home/user/log/check.log
```

# Vérifier l'achèvement des travaux planifiés
Maintenant que vous avez crongéré vos travaux planifiés, comment pouvez-vous confirmer que les travaux s'exécutent comme prévu?
Nous pouvons trouver des informations sur les `cronjob` et passerons en revue quelques conseils qui faciliteront le suivi de leur statut.
Vous serez en mesure de voir si vos `cronjob` sont en cours d'exécution ou s'ils sont réussi.

#Debian/Ubuntu
Il utile de créer un repertoire depuis sont home directory pour stocker les logs de ses `cronjob`.
Dans cet exemple nous avons créé un dossier logs/

- Si le cronjob exécute une simple ligne de commande employé la redirection direct un fichier log
```bash
0 0 1,15 * * echo "Checking" >> /home/user/log/check.log
```

-Si votre cronjob est un script, alors il est préférable d'intégrer directement à votre script la redirection vers votre fichier log
```bash
0 20 * * 1 /home/user/scripts/homedir.sh
```

Par défaut les logs de cron sont dans le dossier syslog/

- Consulter le syslog de l'exécution de commande par cron
```bash
sudo less /var/log/syslog | grep -i cron
```

- Consulter la log d'un script depuis le syslog
```bash
sudo less /var/log/syslog | grep -i homedir.sh
```

#Centos/Redhat
Pour ses deux systèmes, il va de soit de pratiquer la même best-practice ;)

#Exemple
L'utilisation de cronjobs nous permet d'exécuter des processus selon un planning récurrent.
Nous pouvons les configurer pour qu'ils s'exécutent à des heures fixes à intervalles réguliers, pour effectuer des fonctions telles que des sauvegardes, envoyer des e-mails ou presque tout ce que nous souhaitons faire, ce qui peut être très utile pour un administrateur système.

- Vérifiez que le service crond est activé et en cours d'exécution
Assurez-vous qu'il `crond.service` est actif et activé:
```bash
systemctl status crond.service
# Si nous voyons un état actif (en cours d'exécution) , alors tout est prêt.
```

- Vérifiez que /usr/local/bin/loadavg.sh est exécutable pour tous et produit une sortie correcte
Vérifiez les autorisations sur /usr/local/bin/loadavg.sh:
```bash
ls -l /usr/local/bin/loadavg.sh
```

Rendez-le exécutable:
```bash
chmod a+x /usr/local/bin/loadavg.sh
```

Exécutez le script:
```bash
/usr/local/bin/loadavg.sh
```

Vérifiez si le script a envoyé des données à /var/log/loadavg.log:
```bash
cat /var/log/loadavg.log
```

Nous devrions y voir un horodatage et les trois moyennes de charge.

- Vérifiez que Cronjob est en cours d'exécution et produit une sortie correcte
Encore une fois, nous pourrions vérifier qu'il crond.servicefonctionne en utilisant systemctl.
Si nous voulons savoir si notre travail est en cours d'exécution ou non, nous pouvons l'exécuter tail /var/log/cron après quelques minutes, et nous devrions y voir des entrées pour notre loadavg.sh script.
Nous devrions également jeter un œil au journal dans lequel le script écrit, avec:
```bash
systemctl status crond.service
tail /var/log/cron
cat /var/log/loadavg.log
```
Si le travail est en cours d'exécution, nous verrons le contenu comme nous l'avons fait lorsque nous avons exécuté le script manuellement, une fois par minute.
