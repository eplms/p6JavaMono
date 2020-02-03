<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<header>
	<a href="/p6JavaMono/spot">Revenir � la liste des spots</a>
</header>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	
	<p>Voici le d�tail du spot :  ${spot.nom}</p>
	<p>Date de cr�ation du spot : ${spot.dateCreation}</p>
	
	<c:forEach items="${spot.secteurEntities}" var="secteur">
		<h2>Secteur : ${secteur.nom }</h2>    
		<p>${secteur.description}</p>
		<table>
			<tr>
				<th>Nom</th>
				<th>Hauteur</th>
				<th>Cotation</th>
				<th>Nombre de Points</th>
			</tr>	
			<c:forEach items="${secteur.voieEntities}" var="voie">
				<tr>				
					<td>voie : ${voie.nom }</td>
					<td>${voie.hauteur }</td>
					<td>${voie.cotation }</td>
					<td>${voie.nbrePoints}</td>
				</tr>
				<c:forEach items="${voie.longueurEntities}" var="longueur">
				<tr>				
					<td>longueur : ${longueur.nom }</td>
					<td>${longueur.hauteur }</td>
					<td>${longueur.cotation }</td>
					<td>${longueur.nbrePoints}</td>
				</tr>	
			</c:forEach>	
			</c:forEach>
		</table>
	</c:forEach>
					
	
</body>
</html>