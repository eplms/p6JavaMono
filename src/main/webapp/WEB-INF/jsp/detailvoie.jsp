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
					<h1>Detail de le voie : ${voie.nom}</h1>
				</div>
			</div>	
			
			<div class="row">
				<div class="col">
					<h2>Detail des longueurs</h2>
				</div>
			</div>	
		
			<div class="row">
				<div class="col">	
					<table class="table table-hover table-sm table-bordered">
						<c:if test="${!empty voie.longueurEntities }">
							<thead>
								<tr>
									<th>Longueur</th>
									<th>Hauteur</th>
									<th>Cotation</th>
									<th>Nombre de Points</th>	
								</tr>
							</thead>
							<tbody>	
								<c:forEach items="${voie.longueurEntities}" var="longueur">
									<tr>
										<td>${longueur.nom}</td>
										<td>${longueur.hauteur}</td>
										<td>${longueur.cotation}</td>
										<td>${longueur.nbrePoints}</td>	
									</tr>
								</c:forEach>
							</tbody>	
						</c:if>
						<c:if test="${empty voie.longueurEntities}">
							<h4>Cette voie n'inclut pas de longueurs</h4>
						</c:if>
					</table>
				</div>	
			</div>
			
			<!-- Affichage conditionnel du lien de création d'une  -->	
			<c:choose>
				<c:when test="${userConnection.identifiant ne voie.secteurEntity.spotEntity.userEntity.identifiant}">
					<p>Vous devez être connecté en tant créateur du spot pour pouvoir ajouter une longueur</p>
				</c:when>
				<c:when test="${userConnection.identifiant eq voie.secteurEntity.spotEntity.userEntity.identifiant}">
					<div class="row">
						<div class="col">
							<button type="button" class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/creationlongueur?idvoie=${voie.id}&idsecteur=${voie.secteurEntity.id}&idspot=${voie.secteurEntity.spotEntity.id}">Créer une longueur</a></button>
						</div>
					</div>
				</c:when>
			</c:choose>
			
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/detailspot?id=${voie.secteurEntity.spotEntity.id}">Revenir au spot</a></button>
				</div>
				<div class="col">
					<button type="button" class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/detailsecteur?id=${voie.secteurEntity.id}">Revenir au secteur</a></button>
				</div>
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>	
		</div>	
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>