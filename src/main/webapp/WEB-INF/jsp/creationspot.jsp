<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">				
		<title>WeClimb</title>
	</head>
	<body>
		
		<div class="container-extand-md">
			<%@include file="menunavigation.jsp" %>
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
			<!-- footer -->	
			<%@include file="footer.jsp" %>		
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>