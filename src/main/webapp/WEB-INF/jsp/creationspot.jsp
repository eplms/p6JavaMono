<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>

		<h2>Formulaire de création de spot</h2>
			<form:form method="post" action="creation" modelAttribute="spotCreation">
				<table>
					<tr>
						<td><form:label path="nom"/>Nom du spot</td>
						<td><form:input path="nom"/></td>
					</tr>
				
					<tr>
						<td><form:label path="lieuEntity.ville"/>Ville</td>
						<td><form:input path="lieuEntity.ville"/></td>
					</tr>
					 
					<tr>
						<td><form:label path="lieuEntity.codePostal"/>Code Postal</td>
						<td><form:input path="lieuEntity.codePostal"/></td>
					</tr>
					<tr>
						<td><button type="submit">Créer le spot</button></td>
					</tr>
				</table>
			</form:form>	
		<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
	</body>
</html>