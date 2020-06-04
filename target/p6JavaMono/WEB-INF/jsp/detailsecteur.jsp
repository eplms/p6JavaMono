<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<header>
		<p><a href="/p6JavaMono/listespot">Revenir à la liste des spots</a></p>
		<p><a href="/p6JavaMono/detailspot?id=${secteur.spotEntity.id}">Revenir au spot</a></p>
	</header>
	<h2>Secteur ${secteur.nom}</h2>
  
		<p>${secteur.description}</p>
		<c:choose>
			<c:when test=" ${empty userConnection}">
				<p>Vous n'êtes pas connecté</p>
				<p><a href="/p6JavaMono/connectionutilisateur">Me connecter</a></p>
				<p><a href="/p6JavaMono/listespot">Revenir à la liste des spots</a></p>			
			</c:when>
			<c:when test="${userConnection.identifiant ne secteur.spotEntity.userEntity.identifiant}">
				<p>Vous devez être connecté en tant créateur du spot pour pouvoir ajouter un secteur</p>
				<p><a href="/p6JavaMono/connectionutilisateur">Me connecter avec un autre compte</a></p>
				<p><a href="/p6JavaMono/detailspot?id=${secteur.spotEntity.id}">Revenir au spot</a></p>
				<p><a href="/p6JavaMono/listespot">Revenir à la liste des spots</a></p>
			</c:when>
			<c:when test="${userConnection.identifiant eq secteur.spotEntity.userEntity.identifiant}">
				<p>Vous êtes connecté en tant que ${userConnection.identifiant }</p>
				<p><a href="/p6JavaMono/creationvoie?idsecteur=${secteur.id}&idspot=${secteur.spotEntity.id}">Creer une voie sur ce secteur</a></p>
			</c:when>
		</c:choose>
		
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
					<td><a href="/p6JavaMono/detailvoie?id=${voie.id}">${voie.nom }</a></td>
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