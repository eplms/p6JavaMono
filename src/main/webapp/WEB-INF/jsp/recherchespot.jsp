<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
		
		<c:if test="${!empty userConnection.identifiant}">
			<p>vous êtes connecté en tant que : ${userConnection.identifiant}</p>
		</c:if>
		
		<h2>Recherche de spot</h2>
		
		<form:form method="post" action="recherchespot" modelAttribute="spotRecherche">
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
		 	       <td><button type="submit">Chercher</button></td>
		      	</tr>
	      	</table>
		</form:form>
		
	</body>
</html>