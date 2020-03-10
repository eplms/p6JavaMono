<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2>Formulaire d'inscription  :</h2>
	<c:if test="${!empty message1}">
		<p>${message1}:${message2} </p>
		<p>Si vous êtes déjà inscrit sur notre site, vous pouvez vous connecter en cliquant sur le lien suivant</p>
		<p><a href="connectionutilisateur">Aller sur la page de connection</a></p>
	</c:if>
	
	<form:form method="post" action="inscription" modelAttribute="userConnection">
		<table>
			<tr>
				<td><form:label path="identifiant"/>Identifiant</td>
				<td><form:input path="identifiant"/></td>
			</tr>
			<tr>
				<td><form:label path="password"/>Mot de passe</td>
				<td><form:password path="password"/></td>
			</tr>
			<tr>
				<td><form:label path="adresseMail"/>Adresse Mail</td>
				<td><form:input path="adresseMail"/></td>
			</tr>
			<tr>
       			 <td><button type="submit">Login</button></td>
      		</tr>
		</table>	
	</form:form>
	<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
</body>
</html>