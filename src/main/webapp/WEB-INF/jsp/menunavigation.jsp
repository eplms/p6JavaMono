<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-expand-md bg-info">	
	<!--  en-tête -->
	<div class="row">
		<div class="col">
			<nav class="navbar navbar-expand-md navbar-dark">
				<a class="navbar-brand" href="/p6JavaMono/">WeClimb</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent">
								<span class="navbar-toggler-icon"></span>
				</button>
				<div id="navbarContent" class="collapse navbar-collapse">
				
					<ul class="navbar-nav">
						<li class="nav-item.active">
							<a class="nav-link" href="/p6JavaMono/">Accueil</a>	
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/p6JavaMono/listeTopos">Liste des topos</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/p6JavaMono/listespot">Liste des spots</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/p6JavaMono/recherchespot">Rechercher un spot</a>
						</li>
						<c:choose>	
							<c:when test="${!empty userConnection.identifiant}">
								<li class="nav-item">
									<a class="nav-link" href="/p6JavaMono/creation">Creer un nouveau spot</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/p6JavaMono/deconnection">Deconnection</a>	
								</li>
							</c:when>
							<c:when test="${empty userConnection.identifiant}">
								<li class="nav-item">
									<a class="nav-link" href="/p6JavaMono/connectionutilisateur">Connection</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/p6JavaMono/inscription">Inscription</a>
								</li>
							</c:when>
						</c:choose>		
					</ul>
				</div>
			</nav>	
		</div>
	</div>		
</div>