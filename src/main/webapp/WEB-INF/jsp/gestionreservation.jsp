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
			<!-- footer -->	
			<%@include file="footer.jsp" %>			
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>	
</html>