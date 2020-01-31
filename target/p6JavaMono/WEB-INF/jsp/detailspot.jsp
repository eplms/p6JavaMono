<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	
			
			<p>Voici le détail du spot :  ${spot.nom}</p>
			<p>${spot.dateCreation}</p>
			<table>
				<tr>
					<th>Secteur(s)</th>
					<th>Description</th>
				</tr>
					<c:forEach items="${spot.secteurEntities}" var="secteur">
						<tr>
							<td><c:out value="${secteur.nom}"/></td>
							<td><c:out value="${secteur.description}"/></td>
						</tr>
					</c:forEach>
			</table>
<footer>
	<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
</footer>	
</body>
</html>