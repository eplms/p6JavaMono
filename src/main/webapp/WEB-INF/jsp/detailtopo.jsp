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
						<c:if test="${topo.userEntity.identifiant eq userConnection.identifiant}">
							<p>Changer le statut du topo</p>
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
		</div>	
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>		
	</body>
</html>