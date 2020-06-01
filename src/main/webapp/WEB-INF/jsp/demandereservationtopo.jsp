<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<div class="container-expand-md">
			<%@ include file="menunavigation.jsp" %>
			<div class="row jumbotron">
				<div class="col">
					<h1>Demande de réservation de topo faite</h1>
				</div>
			</div>
		
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h2> Topo demandé : ${topo.nom}</h2>					
						</div>
						<ul class="list-group">
							<li class="list-group-item"> Description : ${topo.description}</li>
							<li class="list-group-item"> Propriétaire du topo : ${topo.userEntity.identifiant }</li>
							<li class="list-group-item"> Mail de contact: ${topo.userEntity.adresseMail }</li>
						</ul>	
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<h4>Le propriétaire du topo sera notifié de votre demande de réservation.</h4>
				</div>
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>				
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>