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
					<h1>Détail du topo : ${topo.nom}</h1>
				</div>		
			</div>	
			
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-header">
							<h3>Description</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">${topo.description}</li>
						</ul>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-header">
							<h3>Propriétaire</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">nom : ${topo.userEntity.identifiant }</li>		
							<li class="list-group-item">mail : ${topo.userEntity.adresseMail }</li>
						</ul>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-header">
							<h3>Statut du topo</h3>
						</div>
						<ul class="list-group">
							<c:choose>
								<c:when test="${topo.disponible}">
									<li class="list-group-item">Topo disponible</li>
								</c:when>
								<c:when test="${!topo.disponible }">
									<li class="list-group-item">Topo indisponible</li>
								</c:when>
							</c:choose>	
						</ul>	
						<!-- Changement de statut du topo -->
						<c:if test="${topo.userEntity.identifiant eq userConnection.identifiant}">
							<form:form method="post" action="detailtopo" modelAttribute="topoModification">
								<div class="form-check-inline">
				 					<div><form:radiobutton path="disponible" class="form-check-input" value="true"/>Disponible</div>
				 					<div><form:radiobutton path="disponible" class="form-check-input" value="false"/>Indisponible</div>
			 					</div>	
					 			<div class="form-group">
					 				<div><form:hidden path="id" class="form-control" value="${topo.id}"/></div>
					 			</div>
								<button type="submit" class="btn btn-info">Valider le changement de statut du topo</button>
							</form:form>	
						</c:if>		
					</div>
				</div>
				
				<div class="col">
					<div class="card">
						<div class="card-header">
							<h3>Spots figurant sur le topo</h3>
						</div>
						<ul class="list-group">
							<c:forEach items="${topo.spotEntities}" var="spot">
								<li class="list-group-item"><c:out value="${spot.nom}"/></li>
							</c:forEach>			
						</ul>
					</div>
				</div>	
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>		
		</div>	
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>