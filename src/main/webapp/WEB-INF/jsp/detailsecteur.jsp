<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<header>
		<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
	</header>
	<h2>Secteur ${secteur.nom}</h2>
  
		<p>${secteur.description}</p>
		<table>
			<tr>
				<th>Voie</th>
				<th></th>
				<th>Hauteur</th>
				<th>Cotation</th>
				<th>Nombre de Points</th>
			</tr>	
			<c:forEach items="${secteur.voieEntities}" var="voie">
				<tr>				
					<td>${voie.nom }</td>
					<c:if test="${empty voie.longueurEntities}">
						<td></td>
						<td>${voie.hauteur }</td>
						<td>${voie.cotation }</td>
						<td>${voie.nbrePoints}</td>
					</c:if>
				</tr>
				<c:forEach items="${voie.longueurEntities}" var="longueur">
					<tr>				
						<td></td>
						<td>longueur : ${longueur.nom }</td>
						<td>${longueur.hauteur }</td>
						<td>${longueur.cotation }</td>
						<td>${longueur.nbrePoints}</td>
					</tr>	
				</c:forEach>	
			</c:forEach>
		</table>
</body>
</html>