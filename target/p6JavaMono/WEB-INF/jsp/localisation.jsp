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
					<h1>Localisation recensées</h1>	
				</div>
			</div>
			<div class="row">
				<div class="col">
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">
							<tr>
								<th>Code Postal</th>
								<th>Ville</th>
							</tr>
						</thead>
					<c:forEach items="${lieu}" var="commune">
						<tbody>
							<tr>
								<td><c:out value="${commune.codePostal}"/></td>
								<td><c:out value="${commune.ville}"/></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				</div>
			</div>
			 <!-- footer -->
			<%@include file="footer.jsp"%>
		</div>
		<%@include file="scriptbootstrap.jsp" %>
	</body>
</html>