<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2> Accueil</h2>
	
	<table>
		<tr>
			<td>Utilisateurs</td>
			<c:if test="${empty userConnection }">
				<td><a href="/p6JavaMono/inscription">Inscription</a></td>
				<td><a href="/p6JavaMono/connectionutilisateur">Connection</a></td>
			</c:if>
			<c:if test="${!empty userConnection}">
				<td><a href="/p6JavaMono/deconnection">Deconnection</a>	</td>
			</c:if>
		</tr>
		<tr>
			<td>Spots</td>
			<td><a href="/p6JavaMono/listespot">Liste des spots</a></td>	
		</tr>
		<tr>
			<td>Topos</td>
			<td><a href="/p6JavaMono/listeTopos">Liste des topos</a></td>
			<c:if test="${!empty userConnection}">
				<td><a href="/p6JavaMono/creationTopo">Ajout de topos</a></td>
			</c:if>
		</tr>
		<tr>
			<td>Réservation</td>
			<c:if test="${empty userConnection }">
				<td> La gestion des réservations est réservée aux utilisateurs inscrits et connectés.</td>
			</c:if>
			<c:if test="${!empty userConnection}">
				<td><a href="/p6JavaMono/gestionreservation">Mes réservations</a></td>
			</c:if>
		</tr>
	</table>
	
</body>
</html>