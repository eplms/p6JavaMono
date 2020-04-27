<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2>Formulaire de création de topo</h2>
	<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
	
	
	<form:form method="post" action="creationTopo" modelAttribute="formulaireTopoCreation">
		<table>
			<tr>
				<td><form:label path="nom"/>Nom du topo</td>
				<td><form:input path="nom"/></td>
			</tr>
			<tr>
				<td><form:label path="description"/>Description du topo</td>
				<td><form:input path="description"/></td>
			</tr>
			<c:forEach items="${spots}" var="spot">
				<tr>	
					<td><form:label path="id">${spot.nom}</form:label></td>
					<td><form:checkbox path="id" value="${spot.id}"/></td>
				</tr>
			</c:forEach>
			<tr> 
				<td><button type="submit">Créer le topo</button></td>
			</tr>
		</table>
	</form:form>

</body>
</html>