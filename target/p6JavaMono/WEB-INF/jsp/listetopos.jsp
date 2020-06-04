<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/listespot">Revenir � la liste des spots</a>
			<a href="/p6JavaMono/">Revenir � la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 		 	
		<c:if test="${!empty topos}">  	
		  	<table>
		  		<tr>
          			<th>Nom du topo</th>
          			<th>Description</th>
          			<th>R�dacteur du topo</th>
          			<th>Disponibilit� du topo</th>
          			<th>Modification du statut du topo</th>
          			<th>R�servation du topo</th>
          			<th>Spot(s) apparaissant sur le topo</th>
          		</tr>
				<c:forEach var="topo" items="${topos}" >    
		       		<tr>
						<td><a href="/p6JavaMono/detailtopo?idTopo=${topo.id}"><c:out value="${topo.nom}"/></a></td>
			          	<td><c:out value="${topo.description}"/></td>
			          	<td><c:out value="${topo.userEntity.identifiant}"/></td>
		          		<c:choose>
		          			<c:when test="${topo.disponible}">
		          				<td>Disponible</td>
		          			</c:when>
		          			<c:when test="${!topo.disponible}">
		          				<td>Indisponible</td>
		          			</c:when>
		          		</c:choose>
			          	<c:if test="${(topo.userEntity.identifiant eq userConnection.identifiant) && (topo.userEntity.password eq userConnection.password) }">
			          		<td><a href="/p6JavaMono/detailtopo?idTopo=${topo.id}">Modifier le statut du topo</a></td>
			          	</c:if>
			          	<c:if test="${(topo.userEntity.identifiant ne userConnection.identifiant) || (topo.userEntity.password ne userConnection.password) }">
			          		<td></td>
			          	</c:if>
			          	<c:if test="${(topo.disponible) && (userConnection.identifiant ne topo.userEntity.identifiant)}">
			          		<td><a href="/p6JavaMono/demandereservationtopo?idTopo=${topo.id}&identifiantUtilisateur=${userConnection.identifiant}">R�server le topo</a>
			          	</c:if>
			          	<c:if test="${(!topo.disponible)||(userConnection.identifiant eq topo.userEntity.identifiant)}">
			          		<td></td>
			          	</c:if>
			          	<c:forEach var="spot" items="${topo.spotEntities}">
			          		<td><c:out value="${spot.nom}"/></td>
			          	</c:forEach>
			        </tr>
		        </c:forEach>
	        </table>   
        </c:if>
        <c:if test="${empty topos }">
        	<p>Il n'y a pas de topo relatif � ce spot ! N'h�sitez pas � en cr�er un !</p>
        </c:if>
	</body>
</html>