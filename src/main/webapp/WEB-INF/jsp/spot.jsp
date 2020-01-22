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
			<th>Tag Officiel</th>
			<th>Créateur</th>
		</tr>
		<c:forEach items="${nomSpot}" var="spot">
		<tr>
			<td><c:out value="${spot.nom}"/></td>
			<td><c:out value="${spot.tagOfficiel}"/></td>
			<td><c:out value="${spot.userEntity.identifiant}"/></td>
		</tr>
		
		</c:forEach>
	</table>