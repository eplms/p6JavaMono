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
					<h1>Deconnection réussie !</h1>
				</div>				
			</div>
		
			<div class="row">
				<div class="col">
					<h4>Vous êtes maintenant déconnecté(e) !</h4>
				</div>	
			</div>
			
			<div class="row">
				<div class="col">
					<h4>A bientôt !</h4>
				</div>	
			</div>
			<!-- footer -->	
			<%@include file="footer.jsp" %>
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>