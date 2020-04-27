<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
			<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
		<c:if test="${!empty topos}">
		  	<table>
		  		<tr>
          			<th>Nom du topo</th>
          			<th>Description</th>
          			<th>Rédacteur du topo</th>
          			<th>Spot apparaissant sur le topo</th>
          		</tr>
				<c:forEach var="topo" items="${topos}" >    
		       		<tr>
						<td><c:out value="${topo.nom}"/></td>
			          	<td><c:out value="${topo.description}"/></td>
			          	<td><c:out value="${topo.userEntity.identifiant}"/></td>
			          	<c:forEach var="spot" items="${topo.spotEntities}">
			          		<td><c:out value="${spot.nom}"/></td>
			          	</c:forEach>
			        </tr>
		        </c:forEach>
	        </table>   
        </c:if>
        <c:if test="${empty topos }">
        	<p>Il n'y a pas de topo relatif à ce spot ! N'hésitez pas à en créer un !</p>
        </c:if>
	</body>
</html>