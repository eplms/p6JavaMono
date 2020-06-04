<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
<body>
	<header>
		<a href="/p6JavaMono/detailspot?id=${commentaire.spotEntity.id}">Revenir � la description du spot</a>
		<a href="/p6JavaMono/">Revenir � la page d'accueil</a>
	</header>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
		<p>spot :  ${commentaire.spotEntity.nom}</p>
	<h2>Modification de commentaire</h2>
	<p>Commentaire post� par : ${commentaire.userEntity.identifiant }</p>
	<p>le ${commentaire.dateCommentaire }</p>
	<p>� ${commentaire.heureCommentaire }</p>
	
	<form:form method="post" action="updateComment" modelAttribute="creationCommentaire">
		<table>	
			<tr>
				<td><form:label path="contenu"/>Commentaire modifi�</td>
				<td><form:textarea path="contenu" rows="5" cols="30"></form:textarea></td>
			</tr>
			<tr>
				<td><button type="submit">Modifier le commentaire</button></td>
			</tr>
		</table>	
	</form:form>
</body>
</html>