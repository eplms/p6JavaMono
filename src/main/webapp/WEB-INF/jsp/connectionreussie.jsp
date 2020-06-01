<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>WeClimb</title>
	</head>
	<body>
		<div class="container-expand-md">
			<%@include file="menunavigation.jsp" %>
			<div class="row jumbotron">
					<div class="col">
						<h1>Connection réussie !</h1>
					</div>				
			</div>
			<div class="row">
				<div class="col">
					<h2> Vous êtes maintenant connecté en tant que : ${userConnection.identifiant}</h2>
				</div>
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>
		</div>	
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>