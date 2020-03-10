<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	
	<h2>Formulaire de connection :</h2>
	<form:form method="post" action="connectionutilisateur" modelAttribute="userConnection">
    <table>
      <tr>
        <td><form:label path="identifiant" />Identifiant</td>
        <td><form:input path="identifiant" /></td>
      </tr>
      <tr>
        <td><form:label path="password" />Password</td>
        <td><form:password path="password" /></td>
      </tr>
      <tr>
        <td><button type="submit">Login</button></td>
      </tr>
    </table>
  </form:form>
	<c:if test="${!empty message1 }">
			<p>${message1}</p>
			<p>${message2}</p>
	</c:if>	
	<a href="/p6JavaMono/">Revenir à la page d'accueil</a>
	
</body>
</html>