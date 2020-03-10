<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<p> Vous venez de cr�er le spot suivant :</p>
	<p> Nom du spot : ${spotentity.nom}</p>
	<p>	Ville : ${spotentity.lieuEntity.ville}</p>
	<p> Code Postal : ${spotentity.lieuEntity.codePostal}</p>
	
	<!-- Affichage conditionnel en fonction de la valeur du tag officiel -->
	<c:choose>	
		<c:when test="${spotentity.tagOfficiel eq false}">
			<p> Statut du spot : Spot non officiel</p>
		</c:when>
		<c:when test="${spotentity.tagOfficiel eq true}">
			<p> Statut du spot : Spot officiel !</p>
		</c:when>
	</c:choose>
	<!--  Transfomation du format de la date r�cup�r�e -->
	<fmt:formatDate value="${spotentity.dateCreation}" var="dateFormatee" 
                type="date" pattern="dd-MM-yyyy" />
	<p> Date de cr�ation : ${dateFormatee}</p>
	<p> Cr�ateur du spot : ${spotentity.userEntity.identifiant}</p>
	
	<p><a href="/p6JavaMono/spot">Revenir � la liste des spots</a></p>
	<p><a href="/p6JavaMono/">Revenir � la page d'accueil</a></p>
	
</body>
</html>