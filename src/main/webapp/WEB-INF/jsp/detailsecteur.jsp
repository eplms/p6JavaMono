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
				<h1>Détail du secteur : ${secteur.nom}</h1>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h2>Description du secteur</h2>
				<p>${secteur.description}</p>
			</div>
		</div>		
				
		<div class="row">
			<div class="col">
				<h2>Detail des voies</h2>
			</div>
		</div>			
		<div class="row">
			<div class="col">		
				<table class="table table-hover table-sm table-bordered">
					<thead>	
						<tr>
							<th>Voie</th>
							<th></th>
							<th>Hauteur</th>
							<th>Cotation</th>
							<th>Nombre de Points</th>
						</tr>
					<thead>	
					<c:forEach items="${secteur.voieEntities}" var="voie">
						<tr>				
							<td><a href="/p6JavaMono/detailvoie?id=${voie.id}">${voie.nom }</a></td>
							<c:if test="${empty voie.longueurEntities}">
								<td></td>
								<td>${voie.hauteur }</td>
								<td>${voie.cotation }</td>
								<td>${voie.nbrePoints}</td>
							</c:if>
						</tr>
						<c:forEach items="${voie.longueurEntities}" var="longueur">
							<tr>				
								<td></td>
								<td>longueur : ${longueur.nom }</td>
								<td>${longueur.hauteur }</td>
								<td>${longueur.cotation }</td>
								<td>${longueur.nbrePoints}</td>
							</tr>	
						</c:forEach>	
					</c:forEach>
				</table>
			</div>	
		</div>
		<c:choose>
			<c:when test="${userConnection.identifiant ne secteur.spotEntity.userEntity.identifiant}">
				<p>Vous devez être connecté en tant créateur du spot pour pouvoir ajouter un secteur</p>
			</c:when>
			<c:when test="${userConnection.identifiant eq secteur.spotEntity.userEntity.identifiant}">
				<p>Vous êtes connecté en tant que ${userConnection.identifiant }</p>
				<p><a href="/p6JavaMono/creationvoie?idsecteur=${secteur.id}&idspot=${secteur.spotEntity.id}">Creer une voie sur ce secteur</a></p>
			</c:when>
		</c:choose>
		
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/detailspot?id=${secteur.spotEntity.id}">Revenir au spot ${secteur.spotEntity.nom }</a></button>
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