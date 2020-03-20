<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<p> Vous venez de créer le secteur suivant :</p>
		<p> Nom du secteur : ${secteur.nom}</p>
		<p>	Description : ${secteur.description}</p>
		<p> Ce secteur est sur le spot : ${secteur.spotEntity.id}</p>
		
		
		<p><a href="/p6JavaMono/detailspot?id=${secteur.spotEntity.id}">Revenir au spot</a></p>
		<p><a href="/p6JavaMono/">Revenir à la page d'accueil</a></p>
		
	</body>
</html>