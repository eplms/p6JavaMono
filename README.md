# p6JavaMono
Projet 6 Parcours Développeur Java (Mono-module)

DESCRIPTION
Site communautaire autour de l'escalade

ENVIRONNEMENT
JavaEE 8 - Maven - Spring Data Jpa - Spring MVC - Spring IoC

CLONAGE DU PROJET
Pour cloner le projet : https://github.com/eplms/p6JavaMono.git

DEPLOIEMENT
1- Télécharger TOMCAT
2- Dezipper TOMCAT
3- Lancer TOMCAT
4- Pour installer avec Maven, saisir la commande suivante dans le dossier dans lequel vous avez chargé le code source: mvn clean puis mvn install
5- Intégration du War obtenu dans Tomcat
  a- Créer un "rôle" manager-gui (user: tomcat / password:tomcat) dans le fichier tomcat-usus.xml du dossier conf.
  b- Utiliser l'interface MANAGER de tomcat
  c- positionner le fichier war dans le dossier webapps
6- url de la page d'accueil :http://localhost:8080/p6JavaMono/


VERSION
1.0

AUTEUR
Emmanuel PLUMAS - Juin 2020


