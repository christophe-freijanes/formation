# Utilisation des clés SSH pour un accès sécurisé

Comprendre la création et l'échange de clés SSH est un concept clé à comprendre en tant qu'administrateur système.
Nous allons générer des clés sur deux systèmes à l'aide de l'utilitaire ssh-keygen et apprendre à échanger et à vérifier les clés avec un système distant, en utilisant `ssh-copy-id` et les fichiers de clés associés sur chacun.
Nous comprendrons comment créer des clés sécurisées pour l'accès à distance, comment les échanger et où les stocker sur chaque système impliqué dans la chaîne.

## Scénario
Nous avons reçu des informations d'identification et de connectivité à deux nouvelles instances de serveur.
Le compte de service que l'équipe souhaite utiliser est mon_user celui qui nous a été fourni.
Conformément à la politique de sécurité de l'entreprise, un mot de passe complexe a été défini qui rend les connexions, les copies et les configurations de service périodiques difficiles pour l'équipe.
Ils nous ont demandé de simplifier le processus et de créer une confiance pour le compte de service entre les deux systèmes.
Nous avons déterminé que la méthode la plus simple pour établir la confiance entre les deux systèmes, tout en maintenant la sécurité, serait d'utiliser des clés SSH et de les échanger entre les systèmes.
Nous devrons créer des clés sur les deux serveurs pour le mon_user compte de service, puis échanger la clé de compte de chaque serveur avec l'autre.
Cela facilitera les connexions d'un système à l'autre et inversement, quelques soit le système initiateur.


- Générer une nouvelle paire de clés SSH pour mon_user sur `server1`
À l'aide de la commande ` ssh-keygen`, créez une nouvelle paire de clés pour l' utilisateur mon_user sur le `server1`:

```bash
ssh-keygen
```

- Copiez la clé SSH du `serveur1` au `serveur2`
À l'aide de la commande `ssh-copy-id`, transférez la clé publique sur le compte de l'utilisateur distant:

```bash
ssh-copy-id mon_user@server2
```

- Connectez-vous au `serveur2` avec SSH
Si l'étape précédente a été effectuée correctement, nous devrions pouvoir nous connecter `server2` sans utiliser de mot de passe:

```bash
ssh mon_user@server2
```

- Générer une nouvelle paire de clés SSH pour mon_user sur `server2`
À l'aide de la ssh-keygencommande, créez une nouvelle paire de clés pour l' mon_user utilisateur sur `server2`:

```bash
ssh-keygen 
```

- Copiez la clé SSH du `serveur2` vers le `serveur1` et connectez-vous au `serveur1`
À l'aide de la commande `ssh-copy-id`, transférez la clé publique sur le compte de l'utilisateur distant et connectez-vous sans mot de passe.

```bash
ssh-copy-id server1
ssh server1
```
