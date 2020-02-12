<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2>Formulaire d'inscription  :</h2>
	<c:if test="${!empty message1}">
		<p>${message1} </p>
		<p>${message2}</p>
	</c:if>
	
	<form:form method="post" action="inscription" modelAttribute="creationUtilisateur">
		<table>
			<tr>
				<td><form:label path="identifiant"/>Identifiant</td>
				<td><form:input path="identifiant"/></td>
			</tr>
			<tr>
				<td><form:label path="password"/>Mot de passe</td>
				<td><form:input path="password"/></td>
			</tr>
			<tr>
				<td><form:label path="adresseMail"/>Adresse Mail</td>
				<td><form:input path="adresseMail"/></td>
			</tr>
		</table>	
	</form:form>
	
</body>
</html>