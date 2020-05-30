<!DOCTYPE html>
<html>
	<head>	
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<%@ include file="menunavigation.jsp" %>
		<div class="container-extand-md">		
			<div class="row jumbotron">
				<div class="col">
					<h1>Création de spot réussie !</h1>
				</div>				
			</div>
			
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h3>Spot créé : ${spotentity.nom}</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">Ville : ${spotentity.lieuEntity.ville}</li>
							<li class="list-group-item">Code Postal : ${spotentity.lieuEntity.codePostal}</li>
							<c:choose>	
								<c:when test="${spotentity.tagOfficiel eq false}">
									<li class="list-group-item"> Statut du spot : Spot non officiel</li>
								</c:when>	
								<c:when test="${spotentity.tagOfficiel eq true}">
									<li class="list-group-item"> Statut du spot : Spot officiel !</li>
								</c:when>
							</c:choose>
							<fmt:formatDate value="${spotentity.dateCreation}" var="dateFormatee" type="date" pattern="dd-MM-yyyy" />
							<li class="list-group-item"> Date de création : ${dateFormatee}</li>
							<li class="list-group-item"> Créateur du spot : ${spotentity.userEntity.identifiant}</li>				
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