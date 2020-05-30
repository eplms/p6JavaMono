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
				
			<!-- Header et titre de la page -->
			<div class="row jumbotron">
				<div class="col"> 
					<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
				</div>
			</div>
			<!-- Contenu de la page -->
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Utilisateurs</h5>
							<ul class="list-group">
								<c:if test="${empty userConnection }">
									<li class="list-group-item"><a href="/p6JavaMono/connectionutilisateur">Connection</a></li>
									<li class="list-group-item"><a href="/p6JavaMono/inscription">Inscription</a></li>
								</c:if>
								<c:if test="${!empty userConnection}">
									<li class="list-group-item"><a href="/p6JavaMono/deconnection">Deconnection</a></li>	
								</c:if>
							</ul>	
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Spots</h5>
							<ul class="list-group">
								<li class="list-group-item"><a href="/p6JavaMono/listespot">Liste des spots</a></li>
								<li class="list-group-item"><a href="/p6JavaMono/recherchespot">Rechercher un spot</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Topos</h5>
							<ul class="list-group">
								<li class="list-group-item"><a href="/p6JavaMono/listeTopos">Liste des topos</a></li>
								<c:if test="${!empty userConnection}">		
									<li class="list-group-item"><a href="/p6JavaMono/creationTopo">Ajout de topos</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Reservations</h5>
							<c:if test="${empty userConnection }">
								La gestion des réservations est réservée aux utilisateurs inscrits et connectés.
							</c:if>
							<c:if test="${!empty userConnection}">
								<ul class="list-group">
									<li class="list-group-item"><a href="/p6JavaMono/gestionreservation">Mes réservations</a></li>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer -->	
		<%@include file="footer.jsp" %>
		<!-- Optional JavaScript -->
    	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
	</body>
</html>