<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>	
	
			
			<p>Voici le d�tail du spot :  ${detail}</p>
			<table>
				<tr>
					<th>Secteur</th>
					<th>Description</th>
				</tr>
					<c:forEach items="${nomSecteur}" var="secteur">
							<c:if test="${secteur.spotEntity.nom eq detail }">
								<tr>
									<td><c:out value="${secteur.nom}"/></td>
									<td><c:out value="${secteur.description}"/></td>
								</tr>
							</c:if>		
					</c:forEach>
			</table>
<footer>
	<a href="/p6JavaMono/spot">Revenir � la liste des spots</a>
</footer>	
</body>
</html>