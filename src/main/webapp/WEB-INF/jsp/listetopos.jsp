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
			<c:if test="${!empty topos}">  
				<div class="row">	
					<div class="col">
					  	<table class="table table-hover table-sm table-bordered">
					  		<thead>
						  		<tr class="thead-light">
				          			<th>Nom du topo</th>
				          			<th>Description</th>
				          			<th>R�dacteur du topo</th>
				          			<th>Disponibilit� du topo</th>
				          			<th>Modification du statut du topo</th>
				          			<th>R�servation du topo</th>
				          			<!-- 
				          				<th>Spot(s) apparaissant sur le topo</th>
				          			 -->
				          		</tr>
			          		</thead>
							<c:forEach var="topo" items="${topos}" >    
					       		<tbody>
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
							          	<!-- 
							          	<c:forEach var="spot" items="${topo.spotEntities}">
							          		<td><c:out value="${spot.nom}"/></td>
							          	</c:forEach>
							          	 -->
							        </tr>
						        </tbody>
					        </c:forEach>
				        </table>
			        </div>
		        </div>   
	        </c:if>
	        <c:if test="${empty topos }">
	        	<p>Il n'y a pas de topo � ce jour ! N'h�sitez pas � en cr�er un !</p>
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