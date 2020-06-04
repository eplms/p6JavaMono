<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WeClimb</title>
</head>
<body>

	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2>Formulaire de création de voie</h2>

	<p>La voie fait partie du spot <em>${spot.nom}</em> et du secteur <em>${secteur.nom }</em></p>
	
	<form:form method="post" action="creationvoie" modelAttribute="voieCreation">
		<table>
			<tr>
				<td><form:label path="nom"/>Nom de la voie :</td>
				<td><form:input path="nom"/></td>
			</tr>
			<tr>
				<td><form:label path="hauteur"/>Hauteur de la voie :</td>
				<td><form:input path="hauteur"/></td>
			</tr>
			<tr>
				<td><form:label path="cotation"/>Cotation de la voie :</td>
				<td><form:input path="cotation"/></td>
			</tr>
			<tr>
				<td><form:label path="nbrePoints"/>Nombre de points présents sur la voie :</td>
				<td><form:input path="nbrePoints"/></td>
			</tr>
			<tr>
				<td><form:hidden path="secteurEntity.id" value="${secteur.id}"/></td>
			</tr>
			<tr>
				<td><button type="submit">Créer la voie</button></td>
			</tr>
		</table>
	
	</form:form>

</body>
</html>