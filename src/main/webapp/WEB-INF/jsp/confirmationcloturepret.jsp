<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/listespot">Revenir � la liste des spots</a>
			<a href="/p6JavaMono/listeTopos">Revenir � la Liste des topos</a>
			<a href="/p6JavaMono/">Revenir � la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
	 	<h2>Vous venez de mettre fin � la r�servation du topo suivant:</h2>
		<p> Nom du topo : ${reservation.topoEntity.nom }</p>
		<p> Description : ${reservation.topoEntity.description }</p>
		
		<p>Le topo est � nouveau disponible au pr�t</p>

	</body>
</html>