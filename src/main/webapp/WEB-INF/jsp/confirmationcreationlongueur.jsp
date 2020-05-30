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
					<h1>Cr�ation de la longueur r�ussie !</h1>
				</div>				
			</div>
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h2>Longueur cr��e : ${longueur.nom}</h2>
						</div>
						<ul class="list-group">
							<li class="list-group-item">hauteur : ${longueur.hauteur}</li>
							<li class="list-group-item">cotation : ${longueur.cotation}</li>
							<li class="list-group-item">nombre de points : ${longueur.nbrePoints}</li>	
						</ul>
						<button class="btn btn-outline-info btn-small"><a href="/p6JavaMono/detailvoie?id=${longueur.voieEntity.id}">Revenir � la voie</a></button>
						<button class="btn btn-outline-info btn-small"><a href="/p6JavaMono/detailsecteur?id=${longueur.voieEntity.secteurEntity.id}">Revenir au secteur</a></button>
						<button class="btn btn-outline-info btn-small"><a href="/p6JavaMono/detailspot?id=${longueur.voieEntity.secteurEntity.spotEntity.id}">Revenir au spot</a></button>
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