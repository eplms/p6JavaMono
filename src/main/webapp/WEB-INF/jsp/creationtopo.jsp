<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<%@include file="menunavigation.jsp" %>
		<div class="container-extand-md">
			<div class="row jumbotron">
				<div class="col">
					<h1>Création de topo</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-6 text-center">
					<a href="/p6JavaMono/listeTopos" class="btn btn-outline-info">Revenir à la liste des topos</a>
				</div>
			</div>	
			
			<div class="row">
				<div class="col-6">
					<div class="card-header">
						<h3>Formulaire de création de topo</h3>
						<h5>Informations à saisir</h5>
					</div>
					<form:form method="post" action="creationTopo" modelAttribute="formulaireTopoCreation">
						<div class="form-group">
							<p><form:label path="nom"/>Nom du topo</p>
							<p><form:input path="nom" class="form-control" placeholder="Nom du topo"/></p>
						</div>	
						<div class="form-group">
							<p><form:label path="description"/>Description du topo</p>
							<p><form:input path="description" class="form-control" placeholder="Description du topo en quelques mots"/></p>
						</div>
						<c:forEach items="${spots}" var="spot">
							<div class="form-check">	
								<p><form:checkbox path="id" value="${spot.id}"/>
								<form:label path="id">${spot.nom}</form:label></p>
							</div>
						</c:forEach> 
						<button type="submit" class="btn btn-info form-control">Créer le topo</button>
					</form:form>
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