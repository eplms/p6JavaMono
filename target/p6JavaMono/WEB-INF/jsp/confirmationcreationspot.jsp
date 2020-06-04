<!DOCTYPE html>
<html>
	<head>	
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		
		<div class="container-extand-md">	
			<%@ include file="menunavigation.jsp" %>	
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
			<!-- footer -->	
			<%@include file="footer.jsp" %>	
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>