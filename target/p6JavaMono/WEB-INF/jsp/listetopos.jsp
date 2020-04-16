<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/detailspot?id=${spot.id}">Revenir au detail du spot</a>
			<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
			<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
		<p>Voici la liste des topos existant pour le spot : ${spot.nom } </p>
	
		<c:forEach items="${topo}" var="topo">    
          	<p>Nom du topo : ${topo.nom} </p>
          	<p>Auteur du topo : ${topo.userEntity.identifiant}
        </c:forEach>
	</body>
</html>