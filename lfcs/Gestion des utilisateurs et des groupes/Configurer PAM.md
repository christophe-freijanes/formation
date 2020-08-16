# Configurer PAM
Les modules d'authentification enfichables (PAM) sous Linux vous permettent de configurer et de reconfigurer la façon dont l'authentification se déroule dans les applications prenant en charge PAM, sans avoir besoin de réécrire l'application.
Nous passerons en revue PAM et comment un administrateur système Linux peut l'utiliser pour configurer des applications compatibles PAM.

## PAM contrôler l'authentification des utilisateurs
Pluggable Authentification modules

- Lire le fichier de configuration de PAM

```bash
cat /etc/pam.conf
```

- Visualiser les modules PAM

```bash
cd /etc/pam.d
ls -alh
cat other | less
# Il y a 3 modules pam_unix.so pam_deny.so pam_permit.so
cat common-account
```

- Lire la configuration du login d'une session

```bash
cat login | more
```

## PAM Modules
- Référencer les modules PAM de votre système

```bash
cd /lib/x86_64-linux-gnu/security
ls
```

## PAM Conf
- module-type
    . Authentification, compte, password, session
- control-flag 
    . Required, requisite, optional, sufficient
- pam-module
    . Any module, reference by name
