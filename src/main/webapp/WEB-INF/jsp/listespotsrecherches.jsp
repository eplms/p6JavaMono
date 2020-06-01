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
			<!-- footer -->
			<%@include file="footer.jsp"%>		
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>	