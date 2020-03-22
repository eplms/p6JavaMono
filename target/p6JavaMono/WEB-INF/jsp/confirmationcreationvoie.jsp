<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<p>Vous venez de créer la voie suivante :</p>
		<p> Nom : ${voie.nom}</p>
		<p> hauteur : ${voie.hauteur}</p>
		<p> cotation : ${voie.cotation}</p>
		<p> nombre de points : ${voie.nbrePoints} </p>
	</body>
	
	<p><a href="/p6JavaMono/detailsecteur?id=${voie.secteurEntity.id}">Revenir au secteur</a></p>
	<p><a href="/p6JavaMono/detailspot?id=${voie.secteurEntity.spotEntity.id}">Revenir au spot</a></p>
	<p><a href="/p6JavaMono/">Revenir à la page d'accueil</a></p>
</html>