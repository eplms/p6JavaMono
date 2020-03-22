<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
		<h2>Formulaire de création de Longueur</h2>
		<p>La longueur fait partie de </p>
		<table>
			<tr>
				<th>Spot</th>
				<th>Secteur</th>
				<th>Voie</th>
			</tr>
			<tr>
				<td>${voie.secteurEntity.spotEntity.nom}</td>
				<td>${voie.secteurEntity.nom }</td>
				<td>${voie.nom}</td>
			</tr>
		</table>
		
		<form:form method="post" action="creationlongueur" modelAttribute="longueurCreation">
			<table>
				<tr>
					<td><form:label path="nom"/>Nom de la longueur</td>
					<td><form:input path="nom"/></td>
				<tr>
				<tr>
					<td><form:label path="hauteur"/>Hauteur de la longueur</td>
					<td><form:input path="hauteur"/></td>
				<tr>
				<tr>
					<td><form:label path="cotation"/>Cotation de la longueur</td>
					<td><form:input path="cotation"/></td>
				<tr>
				<tr>
					<td><form:label path="nbrePoints"/>Nombre de points présents sur la longueur</td>
					<td><form:input path="nbrePoints"/></td>
				<tr>
				<tr>
					<td><form:hidden path="voieEntity.id" value="${voie.id}"/></td>
				</tr>
				<tr>
					<td><button type="submit">Créer la longueur</button></td>
				</tr>
			</table>
		</form:form>
		
	</body>
</html>