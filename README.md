# p6JavaMono
Projet 6 Parcours Développeur Java (Mono-module)

# DESCRIPTION
Site communautaire autour de l'escalade

# ENVIRONNEMENT
JavaEE 8  
Maven  
Spring Data Jpa  
Spring MVC  
Spring IoC  
Bootstrap  
Optimisé pour TOMCAT 9.0

# CLONAGE DU PROJET
Pour cloner le projet : https://github.com/eplms/p6JavaMono.git

# DEPLOIEMENT
##### BDD (postgresql)
1- Télécharger postgresql  
2- Executer les scripts sql (dossier src/main/ressources/doc)

##### Serveur (Tomcat 9.0)
1- Télécharger TOMCAT 9.0  
2- Dezipper TOMCAT  
3- Lancer TOMCAT en lançant (suivant le système d'exploitation)  
	- bin/startup.bat  
	- bin/startup.sh

( Modifier les valeurs de DB dans persistance.xml) 

4- Récupérer le fichier war : dans le repository qui accueil le clone, saisir  mvn install

5- Copier le ficher war obtenu dans le dossier webapps de Tomcat
  
6- url de la page d'accueil :http://localhost:8080/p6JavaMono/

# VERSION
1.0

# AUTEUR
Emmanuel PLUMAS - Juin 2020


