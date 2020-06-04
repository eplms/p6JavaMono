
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
					<h1>Création de secteur</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<p>Le secteur en création fera partie du spot : ${spot.nom}</p>	
				</div>
			</div>
			<div class="row">
				<div class="col-6 text-center">
					<a href="/p6JavaMono/detailspot?id=${spot.id}" class="btn btn-outline-info">Revenir au spot</a>
				</div>
			</div>	
			
		 	<div class="row">
		 		<div class="col-6">
		 			<div class="card">
		 				<div class="card-header">
		 					<h3>Formulaire de création de secteur</h3>
							<h5>Informations à saisir</h5>
		 				</div>
		 				<form:form method="post" action="creationsecteur" modelAttribute="secteurCreation">
							<div class="form-group">
								<p><form:input path="nom" class="form-control" placeholder="Nom du secteur"/></p>
							</div>
							<div class="form-group">
								<p><form:input path="description" class="form-control" placeholder="Description du secteur"/></p>
							</div>
							<div class="form-group">
								<p><form:hidden path="spotEntity.id" class="form-control" value="${spot.id}"/></p>
							</div>
							<button type="submit" class="btn btn-info form-control">Créer le secteur</button>
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