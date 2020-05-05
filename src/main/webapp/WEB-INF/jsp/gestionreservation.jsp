<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<header>
			<a href="/p6JavaMono/spot">Revenir � la liste des spots</a>
			<a href="/p6JavaMono/">Revenir � la page d'accueil</a>
		</header>
		<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	 	
		<h2>Vous �tes sur la page de gestion de vos r�servations </h2>
		
		<p>Vous �tes connect� en tant que : ${utilisateur.identifiant}</p>
			
		
		<h2>Vos topos demand�s en attente de validation</h2>
		<table>
				<tr>
					<th>Nom du topo</th>
					<th>Nom du demandeur</th>
					<th>Mail du demandeur</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach var="reservation" items="${reservationsProprietaires}" >
					<c:if test="${reservation.statutReservation eq 'en attente'}">
						<tr>
							<td><c:out value="${reservation.topoEntity.nom}"/></td>
							<td><c:out value="${reservation.userEntity.identifiant}"/></td>
							<td><c:out value="${reservation.userEntity.adresseMail}"/></td>
							<td><a href="/p6JavaMono/validationreservationtopo?idReservation=${reservation.id}">Valider</a></td>
							<td><a href="">Refuser</a></td>
						<tr>
					</c:if>
				</c:forEach>
		</table>
		
		<h2>Vos topos en cours de r�servation</h2>
		<table>
				<tr>
					<th>Nom du topo</th>
					<th>Nom du demandeur</th>
					<th>Mail du demandeur</th>
					<th>Cl�ture du pr�t</th>
					<th></th>
				</tr>
				<c:forEach var="reservation" items="${reservationsProprietaires}" >
					<c:if test="${reservation.statutReservation eq 'reserve'}">
						<tr>
							<td><c:out value="${reservation.topoEntity.nom}"/></td>
							<td><c:out value="${reservation.userEntity.identifiant}"/></td>
							<td><c:out value="${reservation.userEntity.adresseMail}"/></td>
							<td><a href="/p6JavaMono/cloturepret?idReservation=${reservation.id}">Fin du pr�t</a></td>
						<tr>
					</c:if>
				</c:forEach>
		</table>
		
				
		<h2>Les topos qui vous sont pr�t�s</h2>
		<table>
				<tr>
					<th>Nom du topo</th>
					<th>Nom du propri�taire</th>
					<th>Mail du propri�taire</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach var="reservation" items="${reservationsDemandeurs}" >
					<c:if test="${reservation.statutReservation eq 'reserve'}">
						<tr>
							<td><c:out value="${reservation.topoEntity.nom}"/></td>
							<td><c:out value="${reservation.topoEntity.userEntity.identifiant}"/></td>
							<td><c:out value="${reservation.topoEntity.userEntity.adresseMail}"/></td>
						<tr>
					</c:if>
				</c:forEach>
		</table>
		
	</body>
</html>