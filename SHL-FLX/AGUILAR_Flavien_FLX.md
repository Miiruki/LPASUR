# AGUILAR_Flavien_FLX
# SHL - Flux

## i1-tp-flux : Flux 
### 1 - Redirection de flux en sortie : 
</br>

1 - Pour rediriger le flux de la commande ls vers un fichier, nous allons utiliser la commande : 

```shell=
test@debian:~$ ls /var/ > file
```

2 - Pour rajouter les dossiers contenus dans /var/spool/, nous allons utiliser la commande : 

```shell=
test@debian:~$ ls /var/spool/ >> file
```
</br>

### 2 - Redirection du flux d'erreur et du flux de sortie : 
</br>

1 - Lorsque nous tapons la commande : 

```shell=
test@debian:~$ find /var -name syslog
/var/log/installer/syslog
/var/log/syslog
find: '/var/log/private': Permission non accordée
find: '/var/tmp/systemd-private-94224a60103946e09c322943ba297ca6-systemd-timesyncd.service-yUBsUL': Permission non accordée
find: '/var/cache/apt/archives/partial': Permission non accordée
find: '/var/cache/apparmor/ea9ed67a.0': Permission non accordée
find: '/var/cache/ldconfig': Permission non accordée
find: '/var/cache/private': Permission non accordée
find: '/var/lib/apt/lists/partial': Permission non accordée
find: '/var/lib/private': Permission non accordée
find: '/var/spool/cron/crontabs': Permission non accordée
find: '/var/spool/rsyslog': Permission non accordée
```
Nous voyons que nous n'avons pas les droits nécessaires pour lire à l'intérieur de certains dossiers.

2 - Pour afficher les erreurs dans un fichier ~/erreur , nous allons rediriger le flux stderr vers le fichier à l'aide de la commande : 

```shell=
test@debian:~$ find /var -name syslog 2> ~/erreur
/var/log/installer/syslog
/var/log/syslog

test@debian:~$ cat ~/erreur 
find: '/var/log/private': Permission non accordée
find: '/var/tmp/systemd-private-94224a60103946e09c322943ba297ca6-systemd-timesyncd.service-yUBsUL': Permission non accordée
find: '/var/cache/apt/archives/partial': Permission non accordée
find: '/var/cache/apparmor/ea9ed67a.0': Permission non accordée
find: '/var/cache/ldconfig': Permission non accordée
find: '/var/cache/private': Permission non accordée
find: '/var/lib/apt/lists/partial': Permission non accordée
find: '/var/lib/private': Permission non accordée
find: '/var/spool/cron/crontabs': Permission non accordée
find: '/var/spool/rsyslog': Permission non accordée
```

3 - Pour avoir les résultats dans un fichier ~/resultat et les erreurs dans un fichier ~/erreur, nous allons utiliser la commande : 

```shell=
test@debian:~$ find /var -name syslog 1> ~/resultat 2> ~/erreur

test@debian:~$ cat ~/resultat 
/var/log/installer/syslog
/var/log/syslog

test@debian:~$ cat ~/erreur 
find: '/var/log/private': Permission non accordée
find: '/var/tmp/systemd-private-94224a60103946e09c322943ba297ca6-systemd-timesyncd.service-yUBsUL': Permission non accordée
find: '/var/cache/apt/archives/partial': Permission non accordée
find: '/var/cache/apparmor/ea9ed67a.0': Permission non accordée
find: '/var/cache/ldconfig': Permission non accordée
find: '/var/cache/private': Permission non accordée
find: '/var/lib/apt/lists/partial': Permission non accordée
find: '/var/lib/private': Permission non accordée
find: '/var/spool/cron/crontabs': Permission non accordée
find: '/var/spool/rsyslog': Permission non accordée
```

4 - Pour avoir l'ensemble des résultats dans un fichier tout, nous allons utiliser la commande : 

```shell=
test@debian:~$ find /var -name syslog 1> ~/tout 2>> ~/tout

test@debian:~$ cat tout 
/var/log/installer/syslog
/var/log/syslog
find: '/var/log/private': Permission non accordée
find: '/var/tmp/systemd-private-94224a60103946e09c322943ba297ca6-systemd-timesyncd.service-yUBsUL': Permission non accordée
find: '/var/cache/apt/archives/partial': Permission non accordée
find: '/var/cache/apparmor/ea9ed67a.0': Permission non accordée
find: '/var/cache/ldconfig': Permission non accordée
find: '/var/cache/private': Permission non accordée
find: '/var/lib/apt/lists/partial': Permission non accordée
find: '/var/lib/private': Permission non accordée
find: '/var/spool/cron/crontabs': Permission non accordée
find: '/var/spool/rsyslog': Permission non accordée
```
</br>

### 3 - Extraction de champs : 

</br>

1 - La liste des séparateurs est définie par la variable d'environnement : 

```shell=
COMP_WORDBREAKS=$' \t\n"\'><=;|&(:'
```

2 - Les options de cut nous permettant de récupérer seulement les logins sont : 

```shell=
test@debian:~$ cut -d: -f1 passwd 
```

3 - Les options de cut nous permettant de récupérer l'ensemble du fichier en supprimant seulement les mots de passes sont : 
```shell=
test@debian:~$ cut -d: -f1,3-6 passwd 
```

4 - Pour afficher les UID puis les logins, nous allons utiliser les options suivantes de cut : 

```shell=
test@debian:~$ cut -d: -f3,1 passwd 
```
</br>

### 4 - Extraction de lignes : 

</br>

1 - Pour récupérer les utilisateurs qui ont comme shell par défaut le bash, nous allons utiliser la commande : 

```shell=
test@debian:~$ grep -E ^\([^:]*:\){6}\/bin\/bash$ passwd
```

2 - Pour récupérer les utilisateurs dont le répertoire personnel est : 

```shell=
test@debian:~$ grep -E ^\([^:]*:\){5}\/var\/* passwd
```

3 - Pour récupérer les utilisateurs dont le répertoire personnel est dans /bin : 
```shell=
test@debian:~$ grep -E ^\([^:]*:\){5}\/bin\/* passwd
```

4 - Pour récupérer les logins dont les caractères sont des minuscules, nous allons utiliser la commande : 

```shell=
test@debian:~$ egrep ^[a-z]*: passwd
```

5 - Pour récupérer les logins dont le nombre de caractères est au moins de 5, nous allons utiliser la commande : 

```shell=
test@debian:~$ egrep "^([^:]){5}" passwd
```

### 5 - Tri de données : 

</br>

1 - Pour extraire les noms de logins par ordre alphabétique, nous allons utiliser la commande : 

```shell=
test@debian:~$ sort -n passwd 
```

2 - Pour extraire les utilisateurs par ordre croissant d'UID, nous allons utiliser la commande : 

```shell=
test@debian:~$ sort -n -t: -k3 passwd
```

3 - Pour extraire les utilisateurs par ordre décroissants de GUID , nous allons utiliser la commande : 

```shell=
test@debian:~$ sort -nr -t: -k4 passwd
```

</br>

### 6 - Redirections multiples : 

</br>

1 - Pour afficher la liste des GID par orde croissant en éliminant les doublons, nous allons utiliser la commande : 
```shell=
test@debian:~$ cat passwd | sort -nu -t: -k4
```

2 - Pour afficher la colonne des logins uniquement par ordre croissant, nous allons utiliser la commande : 

```shell=
test@debian:~$ cat passwd | cut -d: -f1 | sort -n
```

3 - Pour afficher les logins entièrement numériques, nous allons utiliser la commande : 

```shell=
test@debian:~$ cat passwd | cut -d: -f1 | egrep "^[0-9]"
```

</br>

### 7 - Exemples à décoder : 

</br>

1 - La commande : 
```shell=
ls -l -d ~ | cut -c 5-7
```
Cette commande va afficher uniquement les droits du groupe "autres" sur le répertoire personnel de l'utilisateur. Pour ce faire, elle va afficher les droits et le nom du répertoire personnel (-l pour les droits -d pour le nom). Elle va ensuite trier le flux de sortie pour afficher seulement les caractères 5 à 7

2 - La commande : 

```shell=
ls -l -d ~ | cut -d " " -f 4 
```

Cette commande va relever seulement le 4ème champ avec comme délimiteur entre les champs le caractère " "
