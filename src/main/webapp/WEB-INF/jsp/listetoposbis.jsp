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
	 		
	 		<div class="row">
				<div class="col">	
	 				<h2>Voici la liste des topos existant pour le spot : ${spot.nom } </h2>
	 				<a href="/p6JavaMono/detailspot?id=${spot.id}">Revenir au detail du spot</a>
 				</div>
 			</div>
 				
			<c:if test="${!empty topos}">
			  	<div class="row">
			  		<div class="col">
					  	<table class="table table-hover table-sm table-bordered">
						  	<thead class="thead-light">	
						  		<tr>
				          			<th>Nom du topo</th>
				          			<th>Description</th>
				          			<th>R�dacteur du topo</th>
				          			<th>Disponibilit� du topo</th>
				          			<th>Modification de la disponibilit�</th>
				          			<th>R�servation du topo</th>
				          		</tr>
			          		</thead>
							<c:forEach var="topo" items="${topos}" >
								<tbody>    
						       		<tr>
										<td><a href="/p6JavaMono/detailtopo?idTopo=${topo.id}"><c:out value="${topo.nom}"/></a></td>
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
							          	<c:choose>
							          		<c:when test="${(userConnection.identifiant eq topo.userEntity.identifiant)}">
							          			<td><a href="/p6JavaMono/detailtopo?idTopo=${topo.id}">Modifier le statut du topo</a></td>
							          		</c:when>
							          		<c:when test="${(empty userConnection)|| (userConnection.identifiant ne topo.userEntity.identifiant)}">
							          			<td>Modification impossible</td>
							          		</c:when>
							          	</c:choose>
							          	<c:choose>
								          	<c:when test="${(!empty userConnection)&&(topo.disponible) && (userConnection.identifiant ne topo.userEntity.identifiant)}">
								          		<td><a href="/p6JavaMono/demandereservationtopo?idTopo=${topo.id}&identifiantUtilisateur=${userConnection.identifiant}">R�server le topo</a>
								          	</c:when>
								          	<c:when test="${(!topo.disponible) || (userConnection.identifiant eq topo.userEntity.identifiant)}">
								          		<td>R�servation impossible</td>
								          	</c:when>
								        </c:choose>  	
							        </tr>
						        </tbody>
					        </c:forEach>
				        </table>
					</div>        
		        </div>   
	        </c:if>
	        <c:if test="${empty topos }">
	        	<h2>Il n'y a pas de topo relatif � ce spot ! N'h�sitez pas � en cr�er un !</h2>
	        </c:if>
	        
	   		 <!-- footer -->
			<%@include file="footer.jsp"%>
        </div>
        <%@include file="scriptbootstrap.jsp" %>
	</body>
</html>