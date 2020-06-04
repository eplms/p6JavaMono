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
					<h1>Modification de commentaires</h1>
				</div>
			
			</div>
			<div class="row text-center">
				<div class="col">
					<a href="/p6JavaMono/detailspot?id=${commentaire.spotEntity.id}" class="btn btn-outline-info">Revenir à la description du spot</a>
				</div>
			</div>
			
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h3>Détails du commentaires</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">Spot : ${commentaire.spotEntity.nom}</li>						
							<li class="list-group-item">Auteur : ${commentaire.userEntity.identifiant }</li>
							<li class="list-group-item">Date : ${commentaire.dateCommentaire }</li>
							<li class="list-group-item">Heure : ${commentaire.heureCommentaire }</li>
						</ul>
					</div>
				</div>
				<div class="col-6">		
					<div class="card">
						<div class="card-header">
							<h3>Saisie de la modification</h3>
						</div>
						<form:form method="post" action="updateComment" modelAttribute="creationCommentaire">
							<div class="form-group">	
								<p><form:textarea path="contenu" class="form-control" rows="4"></form:textarea></p>
							</div>
							<button type="submit" class="btn btn-info form-control">Modifier le commentaire</button>	
						</form:form>
					</div>	
				</div>
			</div>
			<!-- footer -->
			<%@include file="footer.jsp"%>	
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>