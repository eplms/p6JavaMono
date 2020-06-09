# p6JavaMono
Projet 6 Parcours Développeur Java (Mono-module)

# DESCRIPTION
Site communautaire autour de l'escalade

# ENVIRONNEMENT
* JavaEE 8  
* PostgreSQL  
* Maven
* Spring IoC
* Spring Data Jpa
* Spring MVC  
* Bootstrap  

Optimisé pour TOMCAT 9.0

# CLONAGE DU PROJET
Pour cloner le projet : https://github.com/eplms/p6JavaMono.git

# DEPLOIEMENT
##### BDD (postgresql)
1- Télécharger PostgreSQL  
2- Executer les scripts sql (dossier p6JavaMono/src/main/ressources/doc)  

##### Serveur (Tomcat 9.0)
1- Télécharger TOMCAT 9.0  
2- Dezipper TOMCAT  
3- Lancer TOMCAT en lançant (suivant le système d'exploitation)  
  * bin/startup.bat  
  * bin/startup.sh

##### paramètres de connection à la Base de Données
Le user et le mot de passe de connection à la base de données par défaut sont renseignés dans le fichier persistence.xml  
Pour les modifier, le chemin d'accès au fichier dans le projet est :  
		p6JavaMono/src/main/resources/META-INF/persistence.xml

##### Lancement	
1- Récupérer le fichier war : dans le repository qui accueille le clone, saisir  la commande mvn install  
2- Copier le ficher war obtenu dans le dossier webapps de Tomcat  
3- url de la page d'accueil :http://localhost:8080/p6JavaMono/

# VERSION
1.0

# AUTEUR
Emmanuel PLUMAS - Juin 2020


