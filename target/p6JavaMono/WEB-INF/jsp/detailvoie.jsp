<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<header>
		<p><a href="/p6JavaMono/">Revenir à l'accueil</a></p>
		<p><a href="/p6JavaMono/listespot">Revenir à la liste des spots</a></p>
		<p><a href="/p6JavaMono/detailspot?id=${voie.secteurEntity.spotEntity.id}">Revenir au spot</a></p>
		<p><a href="/p6JavaMono/detailsecteur?id=${voie.secteurEntity.id}">Revenir au secteur</a></p>
	</header>

	<!-- Affichage conditionnel du lien de création d'une longueur -->	
	<c:choose>
		<c:when test="${empty userConnection }">
			<p>Vous n'êtes pas connecté</p>
			<p><a href="/p6JavaMono/connectionutilisateur">Me connecter</a></p>
		</c:when>
		<c:when test="${userConnection.identifiant ne voie.secteurEntity.spotEntity.userEntity.identifiant}">
			<p>Vous devez être connecté en tant créateur du spot pour pouvoir ajouter un secteur</p>
			<p><a href="/p6JavaMono/connectionutilisateur">Me connecter avec un autre compte</a></p>
			<p><a href="/p6JavaMono/detailsecteur?id=${voie.secteurEntity.id}">Revenir au secteur</a></p>
			<p><a href="/p6JavaMono/detailspot?id=${voie.secteurEntity.spotEntity.id }">Revenir au spot</a></p>
			<p><a href="/p6JavaMono/spot">Revenir à la liste des spots</a></p>			
		</c:when>
		<c:when test="${userConnection.identifiant eq voie.secteurEntity.spotEntity.userEntity.identifiant}">
			<p>Vous êtes connecté en tant que</p>
			<a href="/p6JavaMono/creationlongueur?idvoie=${voie.id}&idsecteur=${voie.secteurEntity.id}&idspot=${voie.secteurEntity.spotEntity.id}">Créer une longueur</a>
		</c:when>
	</c:choose>



	<h2>Voie ${voie.nom}</h2>
	<table>
		
		<c:if test="${!empty voie.longueurEntities }">
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
		</c:if>
		<c:if test="${empty voie.longueurEntities}">
				<p>Cette voie n'inclus pas de longueurs</p>
				<tr>
					<th>Voie</th>
					<th></th>
					<th>Hauteur</th>
					<th>Cotation</th>
					<th>Nombre de Points</th>
				</tr>
				<tr>
					<td>${voie.nom}</td>
					<td></td>
					<td>${voie.hauteur}</td>
					<td>${voie.cotation}</td>
					<td>${voie.nbrePoints}</td>	
				</tr>
		</c:if>
	</table>

	</body>
</html>