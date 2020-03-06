<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	<c:if test="${!empty userConnection.identifiant}">
			<p>vous êtes connecté en tant que : ${userConnection.identifiant}</p>
	</c:if>
	<p>Voici les spots répertoriés :</p>
	<table>
		<tr>
			<th>Nom</th>
			<th>Ville</th>
			<th>Tag Officiel</th>
		</tr>
		<c:forEach items="${listeSpot}" var="spot">
		<tr>
			<td><a href= "/p6JavaMono/detailspot?id=${spot.id}"><c:out value="${spot.nom}"/></a></td>
			<td><c:out value="${spot.lieuEntity.ville}"/></td>
			<td><c:out value="${spot.tagOfficiel}"/></td>
		</tr>
		
		</c:forEach>
		
	</table>
	<p><a href="/p6JavaMono/creation">Creer un nouveau spot</a></p>
	<p><a href="/p6JavaMono/">Revenir à la page d'accueil</a></p>
	
</body>	