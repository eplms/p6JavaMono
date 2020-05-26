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
				<h1>Liste des spots répertoriés</h1>
			</div>
			
			<div class="row">
				<div class="col">
					<c:if test="${!empty userConnection.identifiant}">
						<p>vous êtes connecté en tant que : ${userConnection.identifiant}</p>
					</c:if>
					<c:if test="${empty userConnection.identifiant}">
						<p>Il vous faut être inscrit et connecté pour créer un spot</p>
					</c:if>
				</div>
			</div>
			
			<!-- Contenu -->
			<div class="row">
				<div class="col">		
					<table class="table table-hover table-sm table-bordered">
						<tr class="thead-light">
							<th>Nom</th>
							<th>Ville</th>
							<th>Tag Officiel</th>
						</tr>
						<c:forEach items="${listeSpot}" var="spot">
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
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- footer -->
			<%@include file="footer.jsp"%>		
		</div>	
			<!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
		
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	</body>	
</html>
