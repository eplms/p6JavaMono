<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/listespot">Revenir à la liste des spots</a>
			<a href="/p6JavaMono/listeTopos">Revenir à la Liste des topos</a>
			<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
	 	<h2>Vous venez de valider la réservation du topo suivant:</h2>
		<p> Nom du topo : ${reservation.topoEntity.nom }</p>
		<p> Description : ${reservation.topoEntity.description }</p>
		
		<p>Le temps du prêt, le topo n'est plus disponible au prêt</p>
				
		<h2>Les informations pour contacter l'emprunteur du topo</h2>
		<p>Emprunteur du topo : ${reservation.userEntity.identifiant }</p>
		<p>Mail de contact: ${reservation.userEntity.adresseMail }</p>
		
		
	</body>
</html>