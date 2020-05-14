<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
<body>
	<header>
		<a href="/p6JavaMono/listespot">Revenir à la liste des spots</a>
		<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
	</header>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
		
		<p>Voici le détail du spot :  ${spot.nom}</p>
		<fmt:formatDate value="${spot.dateCreation}" var="dateFormatee" 
	                type="date" pattern="dd-MM-yyyy" />
		
		<c:if test="${spot.tagOfficiel == true}">
			<p> Le spot est officiellement reconnu par la communauté WeClimb !<p>
		</c:if>
		<c:if test="${spot.tagOfficiel==false }">
			<p>Le spot n'est pas encore officiellement reconnu par la communauté WeClimb !</p>
		</c:if>
		
		<!-- Tester si utilisateur connecté est administrateur -->
		<!-- Si utilisateur a les droits administrateurs créer une checkbox pour rendre le spot officiel -->
		
		<c:if test="${userConnection.droitAdministrateur == true}">
			<p> Cocher la case puis valider pour changer le statut du spot<p> 
			<form:form method="post" action="detailspot" modelAttribute="spotCreation">
		 		<table>
		 			<tr>
		 				<td><form:radiobutton path="tagOfficiel" value="true"/>Officiel</td>
		 				<td><form:radiobutton path="tagOfficiel" value="false"/>Non officiel</td>
	 				</tr>
	 				<tr>
						<td><form:hidden path="id" value="${spot.id}"/></td>
					</tr>
					<tr>
						<td><button type="submit">Valider le changement de statut du spot</button></td>
					</tr>
		 		</table>
			</form:form>
		</c:if>
		
		<p>Date de création du spot : ${dateFormatee}</p>
		
		<p>Créateur du spot : ${spot.userEntity.identifiant}</p>
		
		<!-- Gestion des conditions de connection pour la créations de secteur -->
		<c:choose>
			<c:when test="${empty userConnection}">
				<p>Vous n'êtes pas connecté</p>
				<p><a href="/p6JavaMono/connectionutilisateur">Me connecter</a></p>
				<p><a href="/p6JavaMono/listespot">Revenir à la liste des spots</a></p>
			</c:when>
			<c:when test="${userConnection.identifiant eq spot.userEntity.identifiant}">
				<p> Vous êtes connecté en tant que : ${userConnection.identifiant}</p>
				<p><a href="/p6JavaMono/creationsecteur?idspot=${spot.id}">Créer un nouveau secteur sur ce spot</a></p>
			</c:when>
			<c:when test="${userConnection.identifiant ne spot.userEntity.identifiant}">
				<p>Vous devez être connecté en tant créateur du spot pour pouvoir ajouter un secteur</p>
				<p><a href="/p6JavaMono/connectionutilisateur">Me connecter avec un autre compte</a></p>
				<p><a href="/p6JavaMono/listespot">Revenir à la liste des spots</a></p>
			</c:when>			
		</c:choose>
		
		<p><a href="/p6JavaMono/listeToposBis?idSpot=${spot.id}">Consulter la liste des topos pour ce spot</a></p>
		
		<!-- Affichage des secteurs, des voies et des longueurs -->
		<c:forEach items="${spot.secteurEntities}" var="secteur">
			<h2><a href="/p6JavaMono/detailsecteur?id=${secteur.id}">Secteur : ${secteur.nom }</a></h2>    
			<p>${secteur.description}</p>
			<table>
				<tr>
					<th>Voie</th>
					<th></th>
					<th>Hauteur</th>
					<th>Cotation</th>
					<th>Nombre de Points</th>
				</tr>	
				<c:forEach items="${secteur.voieEntities}" var="voie">
					<tr>				
						<td>${voie.nom }</td>
						<c:if test="${empty voie.longueurEntities}">
							<td></td>
							<td>${voie.hauteur }</td>
							<td>${voie.cotation }</td>
							<td>${voie.nbrePoints}</td>
						</c:if>
					</tr>
					<c:forEach items="${voie.longueurEntities}" var="longueur">
						<tr>				
							<td></td>
							<td>longueur : ${longueur.nom }</td>
							<td>${longueur.hauteur }</td>
							<td>${longueur.cotation }</td>
							<td>${longueur.nbrePoints}</td>
						</tr>	
					</c:forEach>	
				</c:forEach>
			</table>
		</c:forEach>
		
		<!-- Affichage des commentaires -->	
		<h2>Commentaires</h2>
		<!-- Affichage de la zone de saisie de commentaire i utilisateur connecté -->
		<c:if test="${!empty userConnection }">
			<h3> Saisie d'un nouveau commentaire</h3>
			<form:form method="post" action="ajouterCommentaire" modelAttribute="creationCommentaire">
				<table>
					<tr>
						<td><form:label path="contenu"/>Votre commentaire</td>
						<td><form:textarea path="contenu" rows="5" cols="30"></form:textarea></td>
					</tr>
					<tr>
						<td><form:hidden path="userEntity.identifiant" value="${userConnection.identifiant}"/></td>
						<td><form:hidden path="userEntity.password" value="${userConnection.password}"/></td>
					</tr>
					<tr>
						<td><form:hidden path="spotEntity.id" value="${spot.id}"/></td>
					</tr>
					<tr>
						<td><button type="submit">Ajouter le commentaire</button></td>
					</tr>
				</table>
			</form:form>
		</c:if>
		
		<!-- Affichage de la liste des commentaires -->
		<c:if test="${!empty spot.commentaireEntities}">
			<h3>Commentaires précédents</h3>
			<c:forEach items="${spot.commentaireEntities}" var="commentaire">
					<p>commentaire laissé par :${commentaire.userEntity.identifiant }</p>
					<p>le :${commentaire.dateCommentaire} </p>
					<p>à :${commentaire.heureCommentaire }</p>
					<p>${commentaire.contenu}</p>
					<c:if test="${userConnection.droitAdministrateur == true}">
						<a href="/p6JavaMono/deleteComment?idComment=${commentaire.id}&idSpot=${commentaire.spotEntity.id}">Supprimer le commentaire</a>
						<a href="/p6JavaMono/updateComment?idComment=${commentaire.id}">Modifier le commentaire</a>
					</c:if>
			</c:forEach>
		</c:if>	
		<!-- S'il n'y a pas de message Afficher le message : il n'y a pas de commentaires -->
		<c:if test="${empty spot.commentaireEntities}">
			<p>Il n'y a aucun commentaire pour ce spot</p>
		</c:if>
		
		
		
	</body>
</html>