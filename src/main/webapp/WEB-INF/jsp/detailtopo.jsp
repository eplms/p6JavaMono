<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeClimb</title>
	</head>
	<body>
		<p>Détail du topo</p>
		<p> Nom : ${topo.nom}</p>
		<p> Description : ${topo.description}</p>
		<p>Propriétaire du topo : ${topo.userEntity.identifiant }</p>
		<p>Mail de contact: ${topo.userEntity.adresseMail }</p>
		<c:choose>
			<c:when test="${topo.disponible}">
				<p>Topo disponible</p>
			</c:when>
			<c:when test="${!topo.disponible }">
				<p>Topo indisponible</p>
			</c:when>
		</c:choose>	
		<p> Cocher la case puis valider pour changer le statut du topo<p> 
			<form:form method="post" action="detailtopo" modelAttribute="topoModification">
		 		<table>
		 			<tr>
		 				<td><form:radiobutton path="disponible" value="true"/>Disponible</td>
		 				<td><form:radiobutton path="disponible" value="false"/>Indisponible</td>
	 				</tr>
	 					<td><form:hidden path="id" value="${topo.id}"/></td>
					<tr>
						<td><button type="submit">Valider le changement de statut du topo</button></td>
					</tr>
		 		</table>
			</form:form>
		<p>Liste des spots figurant sur le topo : </p>
		<c:forEach items="${topo.spotEntities}" var="spot">
			<p><c:out value="${spot.nom}"/></p>
		</c:forEach>
		<p><a href="/p6JavaMono/">Revenir à la page d'accueil</a></p>
	
	</body>
</html>