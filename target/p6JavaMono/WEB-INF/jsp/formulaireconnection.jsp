<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<div class="container-extand-md">
			<%@include file="menunavigation.jsp" %>
			<div class="row jumbotron">
				<div class="col">
					<h1>Formulaire de connection</h1>
				</div>				
			</div>
			<div class="row">
				<div class="col-6">
					<form:form method="post" action="connectionutilisateur" modelAttribute="userConnection">
					    <div class="form-group">
					        <p><form:label path="identifiant"/>Identifiant<p>
					        <p><form:input path="identifiant" class="form-control" placeholder="Saisissez votre identifiant"/></p>
				      	</div>	
				      	<div class="form-group">
				      		<p><form:label path="password"/>Mot de passe</p>
				      		<p><form:password path="password" class="form-control" placeholder="Saisissez votre mot de passe"/></p>
				      	</div>
				        <button type="submit" class="btn btn-info">Connection</button>	
			  		</form:form>
		  		</div>
		  	</div>	
		  	<div class="row">
		  		<div class="col text-center">
					<c:if test="${!empty messageincorrect1 }">
							<p>${messageincorrect1}</p>
							<p>${messageincorrect2}</p>
					</c:if>	
				</div>	
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>