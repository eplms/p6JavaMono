<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">		
		<title>WeClimb</title>
	</head>
	<body>
		<div container-expand-md">
			<%@include file="menunavigation.jsp" %>
			<div class="row jumbotron">
				<div class="col">
					<h1>Création de topo réussie !</h1>
				</div>
			</div>
		
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h3>Topo créé : ${topo.nom}</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">Description : ${topo.description}</li>
							<li class="list-group-item">Propriétaire du topo : ${topo.userEntity.identifiant }</li>
							<li class="list-group-item">Mail de contact: ${topo.userEntity.adresseMail }</li>
							<li class="list-group-item">Disponibilité du topo : ${topo.disponible }</li>
						</ul>
						
					</div>
				</div>	
				<div class="col-6">
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">
							<tr>
								<th>Spot(s) présent(s) sur le topo</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${topo.spotEntities}" var="spot">
								<tr>
									<td><c:out value="${spot.nom}"/></td>
								</tr>
							</c:forEach>			
						</tbody>
					</table>	
				</div>
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>	
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>