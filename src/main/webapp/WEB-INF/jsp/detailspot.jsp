<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	
	<h2>Voici le détail du spot :  ${spot.nom}</h2>
	<p>Date de création du spot : ${spot.dateCreation}</p>
	
	<c:forEach items="${spot.secteurEntities}" var="secteur">
		<h2>Secteur : ${secteur.nom }</h2>    
		<p>${secteur.description}</p>
		<table>
			<tr>
				<th> Voie</th>
				<th>Hauteur</th>
				<th>Nombre de Points</th>
			</tr>	
			<c:forEach items="${secteur.voieEntities}" var="voie">
				<tr>				
					<td>${voie.nom }</td>
					<td>${voie.hauteur }</td>
					<td>${voie.nbrePoints}</td>
				</tr>	
			</c:forEach>
		</table>
	</c:forEach>
					
<footer>
	<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
</footer>	
</body>
</html>