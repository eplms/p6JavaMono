<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeClimb</title>
</head>
<body>
	<h1>Bienvenue sur WeClimb, le site de l'escalade</h1>
	<c:if test="${!empty identifiant && !empty password}">
			<p>vous êtes connecté en tant que : ${identifiant}</p>
			<p>votre mote de passe est ${password } :-)</p>
			<a href="/p6JavaMono/spot">Allez à la liste des spots</a>
	</c:if>
	<h2>Formulaire de connection :</h2>
	<form method="post" action="connection">
        <p>
            <label for="identifiant">Identifiant : </label>
            <input type="text" name="identifiant" id="identifiant" />
        </p>
        <p>
            <label for="password">Mot de passe : </label>
            <input type="password" name="password" id="password" />
        </p>
        
        <input type="submit" />
    </form>
</body>
</html>