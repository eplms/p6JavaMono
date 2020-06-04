<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<%@ include file="menunavigation.jsp" %>	
		<div class="container-expand-md">
			<div class="row jumbotron">
				<div class="col">
					<h1>Fin de réservation !</h1>
				</div>
			</div>
		
			<div class="row">
				<div class="col">
					<h2>Vous venez de mettre fin à la réservation du topo suivant</h2>		
				</div>
			</div>		
		
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h2>${reservation.topoEntity.nom }</h2>					
						</div>
						<ul class="list-group">
							<li class="list-group-item"> Description : ${reservation.topoEntity.description }</li>
							<li class="list-group-item"> Emrpunteur du topo : ${reservation.userEntity.identifiant }</li>
							<li class="list-group-item"> Mail de contact: ${reservation.userEntity.adresseMail }</li>
						</ul>	
					</div>
				</div>
			</div>		
		
			<div class="row">
				<div class="col">
					<h4>Le topo est à nouveau disponible au prêt.</h4>
				</div>
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>
		</div>
		
		
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>