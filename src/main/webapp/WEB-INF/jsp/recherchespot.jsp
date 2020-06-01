<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">		
		<title>WeClimb</title>
	</head>
	<body>
		<div class=container-extand-md">
			<%@include file="menunavigation.jsp" %>
			
			<div class="row jumbotron">
				<div class="col">
					<h1>Recherche de spot</h1>
				</div>
			</div>	
			
			<div class="row">
				<div class="col">
					<p> Les spots affichés seront ceux correspondant au moins à l'un des deux critères !</p>
				</div>
			</div>	
			
			<div class="row">
				<div class="col-6">
					<form:form method="post" action="recherchespot" modelAttribute="spotRecherche">
						<div class="form-group">
							<p><form:label path="nom"/>Nom du spot</p>
							<p><form:input path="nom" class="form-control" placeholder="Spot recherché"/></p>
						</div>
						<div class="form-group">
							<p><form:label path="lieuEntity.ville"/>Ville</p>
							<p><form:input path="lieuEntity.ville" class="form-control" placeholder="ville recherchée"/></p>
						</div>
				 	    <td><button type="submit" class="btn btn-info">Chercher</button></td>
					</form:form>					
				</div>
			</div>	
			<!-- footer -->
			<%@include file="footer.jsp"%>		
		</div>
		<%@include file="scriptbootstrap.jsp" %>	
	</body>
</html>