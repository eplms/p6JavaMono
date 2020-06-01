<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		
			

		<div class="container-expand-md">
			<%@include file="menunavigation.jsp" %>	
			<div class="row jumbotron">
				<div class="col">
					<h1>Liste des topos</h1>
				</div>	
	 		</div>
	 			
	 		<h2>Voici la liste des topos existant pour le spot : ${spot.nom } </h2>
	 		<a href="/p6JavaMono/detailspot?id=${spot.id}">Revenir au detail du spot</a>
			<c:if test="${!empty topos}">
			  	<div class="row">
			  		<div class="col">
					  	<table class="table table-hover table-sm table-bordered">
						  	<thead class="thead-light">	
						  		<tr>
				          			<th>Nom du topo</th>
				          			<th>Description</th>
				          			<th>Rédacteur du topo</th>
				          			<th>Disponibilité du topo</th>
				          			<th></th>
				          		</tr>
			          		</thead>
							<c:forEach var="topo" items="${topos}" >
								<tbody>    
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
							          		<td><a href="/p6JavaMono/demandereservationtopo?idTopo=${topo.id}&identifiantUtilisateur=${userConnection.identifiant}">Réserver le topo</a>
							          	</c:if>
							        </tr>
						        </tbody>
					        </c:forEach>
				        </table>
					</div>        
		        </div>   
	        </c:if>
	        <c:if test="${empty topos }">
	        	<h2>Il n'y a pas de topo relatif à ce spot ! N'hésitez pas à en créer un !</h2>
	        </c:if>
	        
	   		 <!-- footer -->
			<%@include file="footer.jsp"%>
        </div>
        <%@include file="scriptbootstrap.jsp" %>
	</body>
</html>