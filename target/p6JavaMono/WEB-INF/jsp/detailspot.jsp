<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	
			
			<p>Voici le détail du spot :  ${spot.nom}</p>
			<p>Date de création du spot : ${spot.dateCreation}</p>
			
				<c:forEach items="${spot.secteurEntities}" var="secteur">
					<p>Secteur : ${secteur.nom } </p>
					<p>${secteur.description}</p>
					<table>
						<tr>
							<th>Nom de la Voie</th>
							<th>Hauteur</th>
							<th>Nombre de Points</th>
						</tr>	
						<c:out value="${secteur.nom}"/>
							<tr>				
								<c:forEach items="${secteur.voieEntities}" var="voie">
									<td>${voie.nom }</td>
									<td>${voie.hauteur }</td>
									<td>${voie.nbrePoints}</td>
								</c:forEach>
							</tr>	
					</table>
						
				</c:forEach>

					
<footer>
	<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
</footer>	
</body>
</html>