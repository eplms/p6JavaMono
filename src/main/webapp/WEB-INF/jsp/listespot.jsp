<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	<c:if test="${!empty userConnection.identifiant}">
			<p>vous �tes connect� en tant que : ${userConnection.identifiant}</p>
	</c:if>
	<p>Voici les spots r�pertori�s :</p>
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
			<c:choose>
				<c:when test="${spot.tagOfficiel }">
					<td>Officiel</td>
				</c:when>
				<c:when test="${!spot.tagOfficiel }">
					<td>Non Officiel</td>
				</c:when>
			</c:choose>	
				
		</tr>
		
		</c:forEach>
		
	</table>
	<c:choose>	
		<c:when test="${!empty userConnection.identifiant}">
			<p><a href="/p6JavaMono/creation">Creer un nouveau spot</a></p>
		</c:when>
		<c:when test="${empty userConnection.identifiant}">
			<p>Il vous faut �tre inscrit et connect� pour cr�er un spot</p>
			<p><a href="/p6JavaMono/connectionutilisateur">Connection</a></p>
			<p><a href="/p6JavaMono/inscription">Inscription</a></p>
		</c:when>
	</c:choose>		
	<p><a href="/p6JavaMono/">Revenir � la page d'accueil</a></p>
	
</body>	