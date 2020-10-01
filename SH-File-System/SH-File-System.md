# <center> SH-File-System</center>

# i1-tp-file_system : Manipulation du système de fichiers sous Linux

## 1. Répertoire personnel de l’utilisateur : 

</br>

1- Pour afficher la valeur du répertoire utilisateur, nous allons afficher la variable d'environement $HOME : 
```shell=
test@debian:~$ echo $HOME
/home/test
```

2- Pour afficher la valeur du répertoire courant, nous avons plusieurs possibilitées, soit utilisé la commande 
```shell=
test@debian:~/coucou$ pwd
/home/test/coucou
```
soit afficher la variable d'environnement $PWD : 

```shell=
test@debian:~/coucou$ echo $PWD
/home/test/coucou
```

3- Après l'ouverture d'une session, le répertoire courant sera le répertoire utilisateur de l'utilisateur ayant initialisé la session.

4- Pour nous déplacer vers la racine en une seule commande, nous allons utiliser la commade : 

```shell=
cd /
```

Nous pouvons vérifier que nous sommes bien à la racine avec la commande : 

```shell=
test@debian:/$ pwd
/
```

5- Pour afficher les fichiers sous forme de liste les fichiers du répetoire courant, nous allons utiliser l'option -l de ls : 

```shell=
test@debian:/$ ls -l
total 57
lrwxrwxrwx  1 root root     7 oct.   1 14:22 bin -> usr/bin
drwxr-xr-x  4 root root  1024 oct.   1 14:37 boot
drwxr-xr-x 18 root root  3200 oct.   1 16:34 dev
drwxr-xr-x 77 root root  4096 oct.   1 16:34 etc
drwxr-xr-x  3 root root  4096 oct.   1 14:37 home
lrwxrwxrwx  1 root root    31 oct.   1 14:24 initrd.img -> boot/initrd.img-4.19.0-11-amd64
lrwxrwxrwx  1 root root    31 oct.   1 14:24 initrd.img.old -> boot/initrd.img-4.19.0-11-amd64
lrwxrwxrwx  1 root root     7 oct.   1 14:22 lib -> usr/lib
lrwxrwxrwx  1 root root     9 oct.   1 14:22 lib32 -> usr/lib32
lrwxrwxrwx  1 root root     9 oct.   1 14:22 lib64 -> usr/lib64
lrwxrwxrwx  1 root root    10 oct.   1 14:22 libx32 -> usr/libx32
drwx------  2 root root 16384 oct.   1 14:22 lost+found
drwxr-xr-x  3 root root  4096 oct.   1 14:22 media
drwxr-xr-x  2 root root  4096 oct.   1 14:22 mnt
drwxr-xr-x  2 root root  4096 oct.   1 14:22 opt
dr-xr-xr-x 82 root root     0 oct.   1 16:34 proc
drwx------  3 root root  4096 oct.   1 16:34 root
drwxr-xr-x 17 root root   560 oct.   1 16:35 run
lrwxrwxrwx  1 root root     8 oct.   1 14:22 sbin -> usr/sbin
drwxr-xr-x  2 root root  4096 oct.   1 14:22 srv
dr-xr-xr-x 13 root root     0 oct.   1 16:49 sys
drwxrwxrwt  8 root root  4096 oct.   1 16:49 tmp
drwxr-xr-x 13 root root  4096 oct.   1 14:22 usr
drwxr-xr-x 11 root root  4096 oct.   1 14:22 var
lrwxrwxrwx  1 root root    28 oct.   1 14:24 vmlinuz -> boot/vmlinuz-4.19.0-11-amd64
lrwxrwxrwx  1 root root    28 oct.   1 14:24 vmlinuz.old -> boot/vmlinuz-4.19.0-11-amd64
```
</br>

## 2. Editeurs de textes : 

</br>

1- Pour retourner au répertoire utilsateur en une seule commande, nous allons utiliser la commande : 

```shell=
test@debian:/$ cd ~
```

Nous pouvons vérifier que nous sommes au bon endroit avec la commande pwd : 

```shell=
test@debian:~$ pwd
/home/test
```

2 - Pour rentrer un mot dans un fichier, nous allons utiliser la commande : 

```shell=
test@debian:~$ vim monfichier
```
Cette commande va créer un fichier nommé monfichier et rentré en édition à l'intérieur du fichier.

Nous tapons notre texte et nous enregistrons en tapant : 
```shell=
:wq
```

3 / 4- Dans mon fichier, j'ai tapé 7 caractères, et lorsque je regarde la taille de mon fichier, je remarque qu'il fait 8o, j'en déduit que le fichier en lui même pèse 1 octer et que chaque caractères correspond à 1 octet.

5- Pour afficher le contenu de mon fichier dans la console, je vais utilser la commande : 

```shell=
test@debian:~$ cat monfichier 
bonjour
```

</br>

## 3. Création d'une arborescence donnée : 


1 - Nous nous déplaçons dans notre répertoire utilsateur avec la commande : 
```shell=
test@debian:/$ cd ~
```

2 - Nous affichons le contenu du répertoire utilisateur : 
```shell=
test@debian:/$ ls ~
coucou  monfichier
```

3 - Pour effacer en une seule commande tous les fichiers à l'intérieur du répertoire utilisateur, nous allons utiliser la commande : 

```shell=
test@debian:~$ rm -rf ~/*
```

4 - Nous pouvons vérifier en listant le contenu du répertoire utilisateur : 

```shell=
test@debian:~$ ls
```

5 - Pour créer l'arborescence demandée, nous allons utiliser les commandes suivantes depuis le répertoire personnel de l'utilisateur root afin d'avoir les droits en écriture sur l'ensemble des dossiers : 

```shell=
root@debian:/home/test# mkdir /home/rt1/
root@debian:/home/test# mkdir /home/rt1/xyz/
root@debian:/home/test# mkdir /home/rt1/xyz/public_html/
root@debian:/home/test# mkdir /home/rt1/xyz/public_html/docs/
root@debian:/home/test# mkdir /home/rt1/xyz/public_html/images/
root@debian:/home/test# touch /home/rt1/xyz/public_html/index.html
root@debian:/home/test# mkdir /home/rt1/xyz/programmes
root@debian:/home/test# mkdir /home/rt1/xyz/programmes/langage_c
root@debian:/home/test# touch /home/rt1/xyz/programmes/langage_c/a.c
root@debian:/home/test# mkdir /home/rt1/xyz/programmes/php
root@debian:/home/test# mkdir /home/rt1/xyz/programmes/java
root@debian:/home/test# touch /home/rt1/xyz/programmes/java/TP.java
```

Nous pouvons vérifier notre arborescence avec la commande : 

```
root@debian:/home# tree
.
├── rt1
│   └── xyz
│       ├── programmes
│       │   ├── java
│       │   │   └── TP.java
│       │   ├── langage_c
│       │   │   └── a.c
│       │   └── php
│       └── public_html
│           ├── docs
│           ├── images
│           └── index.html
└── test
```

6 - Nous allons rentrer du texte dans le fichier index.html avec la commande suivante : 

```shell=
root@debian:/home/test# vim /home/rt1/xyz/public_html/index.html 
```

7 - Nous allons afficher le contenu du fichier avec la commande : 

```shell=
root@debian:/home/test# cat /home/rt1/xyz/public_html/index.html
<h1>Bonjour !!!</h1>
```

8 - Pour copier le contenu du répertoire programmes dans le dossier images, nous allons utiliser la commande suivante : 

```shell=
root@debian:/home# cp -r ./rt1/xyz/programmes/ ./rt1/xyz/public_html/images/
```

9 - Pour déplacer l'intégralité du répertoire programmes dans le dossier docs, nous allons utiliser la commande suivante : 

```shell=
root@debian:/home# mv ./rt1/xyz/programmes/ ./rt1/xyz/public_html/docs/
```

10 - Pour afficher le contenu détaillé du répertoire docs, nous allons utiliser la commande : 

```shell=
root@debian:/home# ls -R ./rt1/xyz/public_html/docs/
./rt1/xyz/public_html/docs/:
programmes

./rt1/xyz/public_html/docs/programmes:
java  langage_c  php

./rt1/xyz/public_html/docs/programmes/java:
TP.java

./rt1/xyz/public_html/docs/programmes/langage_c:
a.c

./rt1/xyz/public_html/docs/programmes/php:
```
