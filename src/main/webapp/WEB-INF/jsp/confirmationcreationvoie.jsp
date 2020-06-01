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
					<h1>Création de la voie réussie !</h1>
				</div>				
			</div>
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h3>Voie créé : ${voie.nom}</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item"> hauteur : ${voie.hauteur}</li>
							<li class="list-group-item">cotation : ${voie.cotation}</li>
							<li class="list-group-item">nombre de points : ${voie.nbrePoints}</li>
						</ul>
						<button class="btn btn-outline-info btn-small"><a href="/p6JavaMono/detailsecteur?id=${voie.secteurEntity.id}">Revenir au secteur</a></button>
						<button class="btn btn-outline-info btn-small"><a href="/p6JavaMono/detailspot?id=${voie.secteurEntity.spotEntity.id}">Revenir au spot</a></button>
					</div>
				</div>
			</div>		
			<!-- footer -->	
			<%@include file="footer.jsp" %>	
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>