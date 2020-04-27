<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<p>Vous venez de créer le topo suivant :</p>
		<p> Nom : ${topo.nom}</p>
		<p> Description : ${topo.description}</p>
		<p>Propriétaire du topo : ${topo.userEntity.identifiant }</p>
		<p>Mail de contact: ${topo.userEntity.adresseMail }</p>
		<p>Disponibilité du topo : ${topo.disponible }</p>	
		<p>Liste des spots figurant sur le topo : </p>
		<c:forEach items="${topo.spotEntities}" var="spot">
			<p><c:out value="${spot.nom}"/></p>
		</c:forEach>
		<p><a href="/p6JavaMono/">Revenir à la page d'accueil</a></p>
	
	</body>
</html>