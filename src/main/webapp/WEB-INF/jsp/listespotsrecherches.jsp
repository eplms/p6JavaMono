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
				<h1>Liste de spots</h1>
			</div>
			<div class="row">
				<div class="col">
					<h2>Résultats de votre recherche</h2>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<c:if test="${!empty spots}">
						<p>Voici les spots répertoriés :</p>
						<table class="table table-hover table-sm table-bordered">
							<thead class="thead-light">
								<tr>
									<th >Nom</th>
									<th>Ville</th>
									<th>Tag Officiel</th>
								</tr>
							</thead>
							<c:forEach items="${spots}" var="spot">
								<tbody>
									<tr>
										<td><a href= "/p6JavaMono/detailspot?id=${spot.id}"><c:out value="${spot.nom}"/></a></td>
										<td><c:out value="${spot.lieuEntity.ville}"/></td>
										<c:choose>
											<c:when test="${spot.tagOfficiel }">
												<td>Officiel</td>
											</c:when>
											<c:when test="${!spot.tagOfficiel }">
												<td>Non Officiel</td>
											</c:when>
										</c:choose>		
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:if>	
					<c:if test="${empty spots}">
						<p>Aucun spot existant ne répond à vos critères de recherche</p>
					</c:if>	
				</div>
			</div>
			<div class="row">
				<div class="col">
					<h2>Vous voulez créer un nouveau spot?</h2>
					<c:choose>	
					<c:when test="${!empty userConnection.identifiant}">
						<p><a href="/p6JavaMono/creation">Creer un nouveau spot</a></p>
					</c:when>
					<c:when test="${empty userConnection.identifiant}">
						<p>Il vous faut être inscrit et connecté pour créer un spot</p>
					</c:when>
				</c:choose>
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