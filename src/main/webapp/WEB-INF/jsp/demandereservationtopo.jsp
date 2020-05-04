<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/spot">Revenir � la liste des spots</a>
			<a href="/p6JavaMono/listeTopos">Revenir � la Liste des topos</a>
			<a href="/p6JavaMono/">Revenir � la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
	 	<h2>Vous venez de r�server le topo suivant:</h2>
		
		<p> Nom : ${topo.nom}</p>
		<p> Description : ${topo.description}</p>
		
		<p>Le propri�taire du topo a re�u une notification pour votre demande de r�servation.<p>
				
		<h2>Les informations pour contacter le propri�taire du topo</h2>
		<p>Propri�taire du topo : ${topo.userEntity.identifiant }</p>
		<p>Mail de contact: ${topo.userEntity.adresseMail }</p>
		
		
	</body>
</html>