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
				<h1>Liste des topos</h1>	
	 		 </div>
	 		 <div class="row">
				<div class="col text-center">
					<c:if test="${!empty userConnection}">
						<a href="/p6JavaMono/creationTopo" class="btn btn-outline-info">Créer un topo</a>
					</c:if>
				</div>
			</div>	
	 		 
			<c:if test="${!empty topos}">  
				<div class="row">	
					<div class="col">
					  	<table class="table table-hover table-sm table-bordered">
					  		<thead>
						  		<tr class="thead-light">
				          			<th>Nom du topo</th>
				          			<th>Description</th>
				          			<th>Rédacteur du topo</th>
				          			<th>Disponibilité du topo</th>
				          			<th>Modification du statut du topo</th>
				          			<th>Réservation du topo</th>
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
							          	<c:choose>	
							          		<c:when test="${(userConnection.identifiant eq topo.userEntity.identifiant)}">
							          			<td><a href="/p6JavaMono/detailtopo?idTopo=${topo.id}">Modifier le statut du topo</a></td>
							          		</c:when>
							          		<c:when test="${(userConnection.identifiant ne topo.userEntity.identifiant)}">
							          			<td>Modification impossible</td>
							          		</c:when>
							          	</c:choose>	
							          	<c:choose>
								          	<c:when test="${(topo.disponible) && (!empty userConnection) && (userConnection.identifiant ne topo.userEntity.identifiant)}">
								          		<td><a href="/p6JavaMono/demandereservationtopo?idTopo=${topo.id}&identifiantUtilisateur=${userConnection.identifiant}">Réserver le topo</a></td>
								          	</c:when>
								          	<c:when test="${(empty userConnection)||(!topo.disponible)||(userConnection.identifiant eq topo.userEntity.identifiant)}">
								          		<td>Réservation impossible</td>
								          	</c:when>
							          	</c:choose>
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
	        	<p>Il n'y a pas de topo à ce jour ! N'hésitez pas à en créer un !</p>
	        </c:if>
        
        	<!-- footer -->
			<%@include file="footer.jsp"%>
        </div>
   		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>