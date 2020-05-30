<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">		
		<title>WeClimb</title>
	</head>
	<body>
		<%@include file="menunavigation.jsp" %>
		
		<div container-expand-md">
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
		</div>
	<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>