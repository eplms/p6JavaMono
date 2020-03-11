<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>

<h2>Voie ${voie.nom}</h2>
<table>
	<tr>
		<th>Longueur</th>
		<th></th>
		<th>Hauteur</th>
		<th>Cotation</th>
		<th>Nombre de Points</th>	
	</tr>
	<c:forEach items="${voie.longueurEntities}" var="longueur">
		<tr>
			<td>${longueur.nom}</td>
			<td></td>
			<td>${longueur.hauteur}</td>
			<td>${longueur.cotation}</td>
			<td>${longueur.nbrePoints}</td>	
		</tr>
	</c:forEach>
</table>

</body>
</html>