<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<p>Vous venez de cr�er la longueur suivante :</p>
		<p> Nom : ${longueur.nom}</p>
		<p> hauteur : ${longueur.hauteur}</p>
		<p> cotation : ${longueur.cotation}</p>
		<p> nombre de points : ${longueur.nbrePoints} </p>
	
		<p><a href="/p6JavaMono/detailvoie?id=${longueur.voieEntity.id}">Revenir � la voie</a></p>
		<p><a href="/p6JavaMono/detailsecteur?id=${longueur.voieEntity.secteurEntity.id}">Revenir au secteur</a></p>
		<p><a href="/p6JavaMono/detailspot?id=${longueur.voieEntity.secteurEntity.spotEntity.id}">Revenir au spot</a></p>
		<p><a href="/p6JavaMono/">Revenir � la page d'accueil</a></p>
	
	</body>
</html>