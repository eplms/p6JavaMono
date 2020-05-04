<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
			<a href="/p6JavaMono/listeTopos">Revenir à la Liste des topos</a>
			<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
	 	<h2>Vous venez de réserver le topo suivant:</h2>
		
		<p> Nom : ${topo.nom}</p>
		<p> Description : ${topo.description}</p>
		
		<p>Le propriétaire du topo a reçu une notification pour votre demande de réservation.<p>
				
		<h2>Les informations pour contacter le propriétaire du topo</h2>
		<p>Propriétaire du topo : ${topo.userEntity.identifiant }</p>
		<p>Mail de contact: ${topo.userEntity.adresseMail }</p>
		
		
	</body>
</html>