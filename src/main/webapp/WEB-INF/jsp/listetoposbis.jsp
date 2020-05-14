<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/detailspot?id=${spot.id}">Revenir au detail du spot</a>
			<a href="/p6JavaMono/listespot">Revenir � la liste des spots</a>
			<a href="/p6JavaMono/">Revenir � la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
		<p>Voici la liste des topos existant pour le spot : ${spot.nom } </p>
		<c:if test="${!empty topos}">
		  	<table>
		  		<tr>
          			<th>Nom du topo</th>
          			<th>Description</th>
          			<th>R�dacteur du topo</th>
          			<th>Disponibilit� du topo</th>
          			<th></th>
          		</tr>
				<c:forEach var="topo" items="${topos}" >    
		       		<tr>
						<td><c:out value="${topo.nom}"/></td>
			          	<td><c:out value="${topo.description}"/></td>
			          	<td><c:out value="${topo.userEntity.identifiant}"/></td>
			          	<c:choose>
			          		<c:when test="${topo.disponible }">
			          			<td>Disponible</td>
			          		</c:when>
			          		<c:when test="${!topo.disponible }">
			          			<td>Indisponible</td>
			          		</c:when>
			          	</c:choose>
			          	<c:if test="${(userConnection.identifiant eq topo.userEntity.identifiant)&&(userConnection.password eq topo.userEntity.password)}">
			          		<td><a href="/p6JavaMono/detailtopo?idTopo=${topo.id}">Modifier le statut du topo</a></td>
			          	</c:if>
			          	<c:if test="${(topo.disponible) && (userConnection.identifiant ne topo.userEntity.identifiant)}">
			          		<td><a href="/p6JavaMono/demandereservationtopo?idTopo=${topo.id}&identifiantUtilisateur=${userConnection.identifiant}">R�server le topo</a>
			          	</c:if>
			        </tr>
		        </c:forEach>
	        </table>   
        </c:if>
        <c:if test="${empty topos }">
        	<p>Il n'y a pas de topo relatif � ce spot ! N'h�sitez pas � en cr�er un !</p>
        </c:if>
	</body>
</html>