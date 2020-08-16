# Installer et configurer Flux avec GitHub
Voici les étapes nécessaires pour installer Flux et le configurer pour qu'il fonctionne avec un référentiel étudiant dans GitHub.
Vous aurez besoin de votre propre compte GitHub pour créer un exemple de référentiel et cet atelier créera un cluster Kubernetes pour permettre à vous-même d'installer et de configurer un Flux.


## Créez un référentiel GitHub sous votre propre compte
Pour créer un référentiel sur GitHub, vous devez vous connecter à votre propre compte, puis vous pouvez créer un référentiel avec les fichiers YAML dont vous avez besoin.
Ou vous pouvez trouver un référentiel formation/content-gitops et le bifurquer.
Une fois que vous avez créé votre propre version de ce référentiel, examinez les fichiers YAML dans les dossiers des espaces de noms et des charges de travail.

## Déployez Flux dans votre cluster
Pour vérifier si fluxctl est installé, entrez:

```bash
$ fluxctl version
```
Si fluxctl ne s'est pas installé automatiquement, vous pouvez entrer la commande suivante pour l'installer:

```bash
$ sudo snap install fluxctl --classic
```

Créez un espace de noms pour Flux:

```bash
$ kubectl create ns flux
```

Définissez la variable d'environnement GHUSER:

```bash
$ export GHUSER=[Your GitHub Handle]
```

Déployez Flux à l'aide de la fluxctlcommande:

```bash
$ fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/content-gitops \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -
```

## Vérifiez le déploiement et obtenez la clé RSA
Vérifiez le déploiement Flux:

```bash
$ kubectl -n flux rollout status deployment/flux
```

Obtenez la clé Flux RSA créée par fluxctl:

```bash
$ fluxctl identity --k8s-fwd-ns flux
```

Copiez la clé RSA à implémenter dans GitHub.

## Implémenter la clé RSA dans GitHub
Utilisez l'interface utilisateur de GitHub pour ajouter la clé RSA obtenue en tant que clé de déploiement dans GitHub.

## Utilisez la commande fluxctl sync pour synchroniser le cluster avec le référentiel
Utilisez fluxctlpour synchroniser le cluster avec le référentiel:

```bash
$ fluxctl sync --k8s-fwd-ns flux
```

Vérifiez ensuite l'existence de l' espace de noms lasample :

```bash
$ kubectl get namespaces
```

Vérifiez enfin que le déploiement Nginx est en cours d'exécution:

```bash
$ kubectl get pods --all-namespaces
```
