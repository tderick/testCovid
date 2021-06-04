<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>

<!-- on commence par tester si on a deja les champs du formulaire  ou pas  -->

<%-- ${!empty form.results ? form.results : '' } --%>
<!-- test de l'envoie du fichier -->
<j:if test="${!empty fichier }">
	<j:out value="Le fichier: ${fichier} (${description}) a ete uploade"></j:out>
</j:if>

	<h1>Formulaire</h1>
	
      <div class="form-wrapper">
      <form action="Form" method="POST" enctype="multipart/form-data">
          <div class="input-block">
	          <label for="login">Login</label>
	          <input type="text" id="login" name="username" />
          </div>
          <div class="input-block">
	          <label for="login-password">Password</label>
	          <input type="password" id="login-password" name="password" />
          </div>
          <div class="input-block">
	          <label for="description">Description</label>
	          <input type="text" id="description" name="description" />
          </div>
          <div class="input-block">
	          <label for="fichier">Selectionner un fichier : </label>
	          <input type="file" id="fichier" name="fichier" />
          </div>
          <input type="submit" class="btn-login" value="Soumettre"/>
      </form>
      </div>

</body>
</html>