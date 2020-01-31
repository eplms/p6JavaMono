<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<p>Voici les spots répertoriés :</p>
	<table>
		<tr>
			<th>Nom</th>
			<th>Ville</th>
			<th>Tag Officiel</th>
		</tr>
		<c:forEach items="${nomSpot}" var="spot">
		<tr>
			<td><a href= "/p6JavaMono/detailspot?id=${spot.id}"><c:out value="${spot.nom}"/></a></td>
			<td><c:out value="${spot.lieuEntity.ville}"/></td>
			<td><c:out value="${spot.tagOfficiel}"/></td>
		</tr>
		
		</c:forEach>
	</table>
	