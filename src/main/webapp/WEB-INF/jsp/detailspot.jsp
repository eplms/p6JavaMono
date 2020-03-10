<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<header>
	<a href="/p6JavaMono/spot">Revenir à la liste des spots</a>
</header>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	
	<p>Voici le détail du spot :  ${spot.nom}</p>
	<fmt:formatDate value="${spot.dateCreation}" var="dateFormatee" 
                type="date" pattern="dd-MM-yyyy" />
	<p>Date de création du spot : ${dateFormatee}</p>
	
	<p>Créateur du spot : ${spot.userEntity.identifiant}</p>
	
	<c:forEach items="${spot.secteurEntities}" var="secteur">
		<h2>Secteur : ${secteur.nom }</h2>    
		<p>${secteur.description}</p>
		<table>
			<tr>
				<th></th>
				<th>Nom</th>
				<th>Hauteur</th>
				<th>Cotation</th>
				<th>Nombre de Points</th>
			</tr>	
			<c:forEach items="${secteur.voieEntities}" var="voie">
				<tr>				
					<td>voie : ${voie.nom }</td>
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
					
	
</body>
</html>