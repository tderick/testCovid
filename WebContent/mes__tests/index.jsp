<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Transmission des doonees</h1>
	
	<b>Affichae du nom rrecu: premiere methode <br></b>
	<%
		String data = (String) request.getAttribute("name");
		String age_str = (String) request.getAttribute("age");
/* 		int age = Integer.parseInt(age_str);
 */	// on affihce le nom recuperer
	out.println("Bonjour "+data+"Tu as " + age_str);
	%>
	
	<!-- Test de expression langages -->
	
	Mon age est ${age }
	${ empty name ? 'IL ya une donne' : 'Le nom est vide'}
	
	<h1>Affichage des info d'un auteur en utilisant les java bean</h1>
	
	<p>Nom ${ empty auteur.prenom ?  ' Ce champ est vite' : auteur.prenom }</p>
	
	<p>Prenom ${ auteur.nom  ?  ' Ce champ est vite' : auteur.nom }</p>
	<p>Actif ${ auteur.actif ? 'Vous etes tres actif' : 'Vous n ` estes pas tres actif'}</p>
	
	
	<h1>Mise en evidence de al jstl</h1>

	<!-- avantage de la jstl:
	1- echaper le code html (donc une securite minimal contre les attques XXS) 
		 2- ici on utilise aussis Expression langage -->
	<j:out value="Bonjour jstl"/>
	<br/>
	
	<!-- utilisation de Expression langage dans la jstl -->
	<!-- ici on test directement si le champ existe avant d essayer l affichage -->
	<!-- pour desactiver la protection contre la falille XXS, il faut rajouter : escapeXml="true"  dans les tags jstl -->
	<!-- dans le cas ou le champ est vide, on peut mettre une valeur par defaut grace a : default="toto" dans les tags -->
	<j:out value="Bonjour ${auteur.nom }">toto</j:out>
	
	
	<!-- -----------  DECLARER DES VARIABLES AVEC LA JSTL --------------------- -->
	<!-- pour declarer des variables, on utilise set au lieu de out pour l affichage -->
	
	
	<!--  ----------- PORTEE DUNE VARIABLE AVEC LA JSTL---------------------- -->
	
	<!-- l  attribut scope donne la portee d une variable qui peut etre  -->
	<!-- scope="page"  diponible dans toute la page -->
	<!-- scope="request"  diponible pendant toute la requete -->
	<!-- scope="session"  diponible pendant toute la session de l utilisateur -->
	<!-- scope="application"  diponible pour toute l application: tout les utilisateurs de lappli. -->
	
	<j:set var="pseudo" value="Maestros" scope="page" ></j:set>
	<j:out value=" affichage de a variable pseudo=${pseudo }"></j:out>
	
	
	<!-- --------------- MODIFICATION DES OJECT JAVA (BEANS) DEPUIS LA JSTL ---------------- -->
	
	<!-- La jstl nous offre la possibilite de modifier les objets java: methode -->
	<!-- grace a target, on specifie le bean a nodifier  -->
	<j:set target="${auteur}" property="nom" value="Le Maestros"/>
	<j:out value="${auteur.nom }" />
	
	<!-- Supprimer une varible de la memoire -->
	<j:remove var="pseudo" scope="page"/>
	<j:out value=" apres suppression ,  pseudo=${empty pseudo ? 'variable detruite' : pseudo }" />
	
	<!-- ----------------  LES CONDITIONS AVEC LA JSTL ----------------- -->
	<!-- Exemplde d un test -->
	<br>
	<j:if test="${5>4 }" var="resultat_test" scope="page"> C'est vrai <j:out value="${resultat_test}" /> </j:if>
	
	<!-- les tests multiples pour palier au probleme de l abscence des else -->
	
	<j:choose>
		<j:when test="${5>40 }">ok 1</j:when>
		<j:when test="${4>5 }">ok 2</j:when>
		<j:when test="${6>50 }">ok 3</j:when>
		<j:otherwise> Aucun cas ne correspond</j:otherwise>
	</j:choose>
	
	<!-- ------------------ LES BOUCLES EN AVEC LA JSTL -------------->
	
	<j:forEach var="i" begin="0" end="10" step="2">
		<br>saluer <j:out value="${i}" />
	</j:forEach>
	
	<!-- parcours d'un tableau de nome depuis la servlets  -->
	<j:forEach items="${names }" var="item">
		<p><j:out value="${item}" /></p>
	</j:forEach>
	
	
	
	

	
	
</body>
</html>















