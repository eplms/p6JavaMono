<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<p> Vous venez de cr�er le secteur suivant :</p>
		<p> Nom du secteur : ${secteur.nom}</p>
		<p>	Description : ${secteur.description}</p>
		<p> Ce secteur est sur le spot : ${secteur.spotEntity.id}</p>
		
		
		<p><a href="/p6JavaMono/detailspot?id=${secteur.spotEntity.id}">Revenir au spot</a></p>
		<p><a href="/p6JavaMono/">Revenir � la page d'accueil</a></p>
		
	</body>
</html>