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
			<div class="col">
				<h1>Détail du Spot : ${spot.nom}</h1>
			</div>
		</div> 
	
		<div class="row">
			<div class="col-6">
				<h2>Informations Générales</h2>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">
						<h2>Origine du spot</h2>
					</div>
					<fmt:formatDate value="${spot.dateCreation}" var="dateFormatee" type="date" pattern="dd-MM-yyyy" />
					<ul>
						<li>Date de création du spot : ${dateFormatee}</li>
						<li>Créateur du spot : ${spot.userEntity.identifiant}</li>
					</ul>
				</div>
			</div>
			
			<div class="col">
				<div class="card">
					<div class="card-header">
						<h2> Officiel ?</h2>
					</div>
					<c:if test="${spot.tagOfficiel == true}">
						<p> Le spot est officiellement reconnu par la communauté WeClimb !</p>
					</c:if>
					<c:if test="${spot.tagOfficiel==false }">
						<p>Le spot n'est pas encore officiellement reconnu par la communauté WeClimb !</p>
					</c:if>
					
					<c:if test="${userConnection.droitAdministrateur == true}">
						<p> Changer le statut du spot<p> 
						<form:form method="post" action="detailspot" modelAttribute="spotCreation">
							<div class="form-check-inline">
					 				<div><form:radiobutton path="tagOfficiel" class="form-check-input" value="true"/>Officiel</div>
					 				<div><form:radiobutton path="tagOfficiel" class="form-check-input" value="false"/>Non officiel</div>
				 			</div>
			 				<div class="form-group">
								<p><form:hidden path="id" class="form-control" value="${spot.id}"/></p>
							</div>
							<button type="submit" class="form-control btn btn-info">Valider le changement de statut du spot</button>
						</form:form>
					</c:if>
				</div>	
			</div>
			<div class="col">
				<div class="card">
					<div class="card-header">
						<h2>Topo</h2>
					</div>
					<a href="/p6JavaMono/listeToposBis?idSpot=${spot.id}">Consulter la liste des topos pour ce spot</a>
				</div>	
			</div>
		</div>	
		
		<!-- Affichage des secteurs, des voies et des longueurs -->
		<div class="row">
			<div class="col-6">
				<h2>Secteurs</h2>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<c:if test="${empty spot.secteurEntities }">
					<h4>Ce spot n'inclut pas de secteur</h4>
				</c:if>
			</div>
		</div>	
		
		<!-- Gestion des conditions de connection pour la créations de secteur -->
		<div class="row">
			<div class="col">
				<c:if test="${userConnection.identifiant ne spot.userEntity.identifiant}">
					<p>Vous devez être connecté en tant créateur du spot pour pouvoir ajouter un secteur</p>
				</c:if>
				<c:if test="${userConnection.identifiant eq spot.userEntity.identifiant}">
					<button class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/creationsecteur?idspot=${spot.id }">Ajouter un secteur</a></button>
				</c:if>			
			</div>
		</div>
		
		
		
		
		<div class="row">
			<c:forEach items="${spot.secteurEntities}" var="secteur">	
				<div class="col">
					<h3><a href="/p6JavaMono/detailsecteur?id=${secteur.id}">Secteur : ${secteur.nom }</a></h3>    
					<p>${secteur.description}</p>
					<table class="table table-hover table-sm ">
						<thead>	
							<tr>
								<th>Voie</th>
								<th></th>
								<th></th>
								<th>Hauteur</th>
								<th>Cotation</th>
								<th>Nombre de Points</th>
							</tr>
						</thead>	
						<c:forEach items="${secteur.voieEntities}" var="voie">
							<tbody>
								<tr>				
									<td>${voie.nom }</td>
									<c:if test="${empty voie.longueurEntities}">
										<td></td>
										<td></td>
										<td>${voie.hauteur }</td>
										<td>${voie.cotation }</td>
										<td>${voie.nbrePoints}</td>
									</c:if>
								</tr>
								<c:forEach items="${voie.longueurEntities}" var="longueur">
									<tr>				
										<td></td>
										<td></td>
										<td>${longueur.nom }</td>
										<td>${longueur.hauteur }</td>
										<td>${longueur.cotation }</td>
										<td>${longueur.nbrePoints}</td>
									</tr>	
								</c:forEach>
							</tbody>	
						</c:forEach>
					</table>
				</div>
			</c:forEach>
		</div>
			
			
			
			
			
		<div class="row">
			<div class="col-6">
				<h2>Commentaires</h2>
			</div>
		</div>
		<!-- Affichage de la zone de saisie de commentaire i utilisateur connecté -->
		<c:if test="${!empty userConnection }">
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h4> Votre commentaire</h4>
						</div>
						<form:form method="post" action="ajouterCommentaire" modelAttribute="creationCommentaire">
							<div class="form-group">
								<p><form:textarea path="contenu" class="form-control" row="4"></form:textarea></p>
							</div>
							<div class="form-group">
								<p><form:hidden path="userEntity.identifiant" class="form-control" value="${userConnection.identifiant}"/></p>
							</div>
							<div class="form-group">
								<p><form:hidden path="userEntity.password" class="form-control" value="${userConnection.password}"/></p>
							</div>
							<div class="form-group">
								<p><form:hidden path="spotEntity.id" class="form-control" value="${spot.id}"/></p>
							</div>
							<button type="submit" class="form-control btn btn-info">Ajouter le commentaire</button>
							
						</form:form>
					</div>
				</div>
			</div>
		</c:if>	
		<!-- Affichage de la liste des commentaires -->
		<c:if test="${!empty spot.commentaireEntities}">
			<h4>Liste des commentaires</h4>
				<div class= "row">
						<c:forEach items="${spot.commentaireEntities}" var="commentaire">
							<div class="col">
								<div class="card">
									<div class="card-header">
										<fmt:formatDate value="${commentaire.dateCommentaire}" var="dateCommentaireFormatee" type="date" pattern="dd-MM-yyyy" />
										<p>${commentaire.userEntity.identifiant }, le ${dateCommentaireFormatee} à ${commentaire.heureCommentaire }</p>
									</div>
									<p>${commentaire.contenu}</p>
									<c:if test="${userConnection.droitAdministrateur == true}">
										<button type="button" class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/deleteComment?idComment=${commentaire.id}&idSpot=${commentaire.spotEntity.id}">Supprimer le commentaire</a></button>
										<button type="button" class="btn btn-outline-info btn-sm"><a href="/p6JavaMono/updateComment?idComment=${commentaire.id}">Modifier le commentaire</a></button>
									</c:if>
								</div>	
							</div>
						</c:forEach>
				</div>
		</c:if>	
		
		<!-- S'il n'y a pas de message Afficher le message : il n'y a pas de commentaires -->
		<c:if test="${empty spot.commentaireEntities}">
			<h4>Il n'y a aucun commentaire pour ce spot</h4>
		</c:if>	
			
			
			
			
			
			
		
	</div>	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>		
	</body>
</html>