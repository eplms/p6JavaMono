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
					<h1>Refus de r�servation !</h1>
				</div>
			</div>
		
			<div class="row">
				<div class="col">
					<h2>Vous venez de refuser la r�servation du topo suivant</h2>		
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
			<!-- footer -->
			<%@include file="footer.jsp"%>
		</div>
		<%@include file="scriptbootstrap.jsp" %>	
	</body>
</html>