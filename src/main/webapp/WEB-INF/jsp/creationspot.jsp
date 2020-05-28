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
					<h1>Création de spot</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<div class="card text-center">
						<div class="card-header">
							<h3>Formulaire de création de spot</h3>
							<h5>Informations à saisir</h5>	
						</div>
								 			
						<form:form method="post" action="creation" modelAttribute="spotCreation">
							<div class="form-group">
								<p><form:input path="nom" class="form-control" placeholder="Nom du spot"/></p>
							</div>
							<div class="form-group">
								<p><form:input path="lieuEntity.ville" class="form-control" placeholder="Ville"/></p>
							</div>
							<div class="form-group">
								<p><form:input path="lieuEntity.codePostal" class="form-control" placeholder="Code Postal"/></p>
							</div>
							<button type="submit" class="btn btn-info form-control">Créer le spot</button>
						</form:form>
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