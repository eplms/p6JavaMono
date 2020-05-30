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
						<h1>Gestion de vos reservations</h1>
					</div>
				</div>
			
		
			<div class="row">
				<div class="col">
					<p>Vous êtes connecté en tant que : ${utilisateur.identifiant}</p>
				</div>
			</div>
	
			<div class="row">
				<div class="col">
					<h2>Vos topos demandés en attente de validation</h2>
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">
								<tr>
									<th>Nom du topo</th>
									<th>Nom du demandeur</th>
									<th>Mail du demandeur</th>
									<th>Validation</th>
									<th>Refus</th>
								</tr>
						</thead>
						<c:forEach var="reservation" items="${reservationsProprietaires}" >
							<tbody>
								<c:if test="${reservation.statutReservation eq 'en attente'}">
									<tr>
										<td><c:out value="${reservation.topoEntity.nom}"/></td>
										<td><c:out value="${reservation.userEntity.identifiant}"/></td>
										<td><c:out value="${reservation.userEntity.adresseMail}"/></td>
										<td><a href="/p6JavaMono/validationreservationtopo?idReservation=${reservation.id}">Valider</a></td>
										<td><a href="/p6JavaMono/refusreservationtopo?idReservation=${reservation.id}">Refuser</a></td>
									<tr>
								</c:if>
							</tbody>
						</c:forEach>
					</table>		
				</div>
			</div>			
			
			<div class="row">
				<div class="col">
					<h2>Vos topos en cours de réservation</h2>
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">
							<tr>
								<th>Nom du topo</th>
								<th>Nom du demandeur</th>
								<th>Mail du demandeur</th>
								<th>Clôture du prêt</th>
							</tr>
							<c:forEach var="reservation" items="${reservationsProprietaires}" >
								<tbody>
									<c:if test="${reservation.statutReservation eq 'reserve'}">
										<tr>
											<td><c:out value="${reservation.topoEntity.nom}"/></td>
											<td><c:out value="${reservation.userEntity.identifiant}"/></td>
											<td><c:out value="${reservation.userEntity.adresseMail}"/></td>
											<td><a href="/p6JavaMono/cloturepret?idReservation=${reservation.id}">Fin du prêt</a></td>
										<tr>
									</c:if>
								</tbody>	
							</c:forEach>
						</thead>
					</table>				
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<h2>Les topos qui vous sont prêtés</h2>
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">
							<tr>
								<th>Nom du topo</th>
								<th>Nom du propriétaire</th>
								<th>Mail du propriétaire</th>
							</tr>
						</thead>	
						<c:forEach var="reservation" items="${reservationsDemandeurs}" >
							<tbody>
								<c:if test="${reservation.statutReservation eq 'reserve'}">
									<tr>
										<td><c:out value="${reservation.topoEntity.nom}"/></td>
										<td><c:out value="${reservation.topoEntity.userEntity.identifiant}"/></td>
										<td><c:out value="${reservation.topoEntity.userEntity.adresseMail}"/></td>
									<tr>
								</c:if>
							</tbody>	
						</c:forEach>
					</table>
				</div>	
			</div>		
		
			<div class="row">
				<div class="col">
					<h2>Les prêts qui vous ont été refusés</h2>
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">		
							<tr>
								<th>Nom du topo</th>
								<th>Nom du propriétaire</th>
								<th>Mail du propriétaire</th>
							</tr>
						</thead>
						<c:forEach var="reservation" items="${reservationsDemandeurs}" >
							<tbody>
								<c:if test="${reservation.statutReservation eq 'refuse'}">
									<tr>
										<td><c:out value="${reservation.topoEntity.nom}"/></td>
										<td><c:out value="${reservation.topoEntity.userEntity.identifiant}"/></td>
										<td><c:out value="${reservation.topoEntity.userEntity.adresseMail}"/></td>
									<tr>
								</c:if>
							</tbody>
						</c:forEach>
					</table>
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