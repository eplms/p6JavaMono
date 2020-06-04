<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<p>Voici les localisations des sites répertoriées :</p>
	<table>
		<tr>
			<th>Code Postal</th>
			<th>Ville</th>
		</tr>
		<c:forEach items="${lieu}" var="commune">
		<tr>
			<td><c:out value="${commune.codePostal}"/></td>
			<td><c:out value="${commune.ville}"/></td>
		</tr>
		
		</c:forEach>
	</table>
		
</body>
</html>