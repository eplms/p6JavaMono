
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2>Formulaire de création de secteur</h2>
 	<p>Spot auquel appartient le secteur : ${spot.nom}</p>
	<form:form method="post" action="creationsecteur" modelAttribute="secteurCreation">
		<table>
			<tr>
				<td><form:label path="nom"/>Nom du secteur</td>
				<td><form:input path="nom"/></td>
			</tr>
			<tr>
				<td><form:label path="description"/>Description du secteur</td>
				<td><form:input path="description"/></td>
			</tr>
			<tr>
				<td><form:hidden path="spotEntity.id" value="${spot.id}"/></td>
			</tr>
			<tr>
				<td><button type="submit">Créer le secteur</button></td>
			</tr>
		</table>
	</form:form>
	<a href="/p6JavaMono/detailspot?id=${spot.id}">Revenir au spot</a>
	<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
	
</body>
</html>