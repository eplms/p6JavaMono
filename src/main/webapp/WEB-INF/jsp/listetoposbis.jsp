<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<%@include file="menunavigation.jsp" %>
			

		<div class="container-expand-md">	
			<div class="row jumbotron">
				<h1>Liste des topos</h1>	
	 		 </div>	
	 		<h2>Voici la liste des topos existant pour le spot : ${spot.nom } </h2>
	 		<a href="/p6JavaMono/detailspot?id=${spot.id}">Revenir au detail du spot</a>
			<c:if test="${!empty topos}">
			  	<div class="row">
			  		<div class="col">
					  	<table class="table table-hover table-sm table-bordered">
					  		<tr class="thead-light">
			          			<th>Nom du topo</th>
			          			<th>Description</th>
			          			<th>Rédacteur du topo</th>
			          			<th>Disponibilité du topo</th>
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
						          		<td><a href="/p6JavaMono/demandereservationtopo?idTopo=${topo.id}&identifiantUtilisateur=${userConnection.identifiant}">Réserver le topo</a>
						          	</c:if>
						        </tr>
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
        <!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
		
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        
	</body>
</html>