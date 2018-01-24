<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>SocialStartup - Login</title>
<meta name="author" content="">
<meta name="description" content="155 characters">
<meta name="keywords" content="web,design,html,css,html5,development">
<link rel="publisher"
	href="https://plus.google.com/[YOUR BUSINESS G+ PROFILE HERE]" />
<link rel="icon" href="/favicon.ico">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-default"
		style="border-radius: 0px; background: rgb(0, 102, 153); border: 0px">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="LoginPage.jsp" style="color: white;">SocialStartup</a>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
				<form action="StartupSignupController" method="get">
					<h2>Startup</h2>
					<p class="text-danger">${StartupSignupError}</p>
					<table>
						<tr>
							<td>Nome Startup*:</td>
							<td><input type="text" name="nome"
								placeholder="enter your startup name" required></input></td>
						</tr>
						<tr>
							<td>Email*:</td>
							<td><input type="email" name="email"
								placeholder="enter your email" required></input></td>
						</tr>
						<tr>
							<td>Password*:</td>
							<td><input type="password" name="password"
								placeholder="create a password" required></input></td>
						</tr>
						<tr>
							<td>Descrizione breve:</td>
							<td colspan="3"><input row="2" type="text" name="descBreve"></input></td>
						</tr>
						<tr>
							<td>Descrizione:</td>
							<td colspan="3"><input row="5" type="text" name="desc"></input></td>
						</tr>
						<tr>
							<td>Anno Fondazione:</td>
							<td><input type="number" name="annoFondazione"></input></td>
						</tr>
						<tr>
							<td>Url Avatar:</td>
							<td><input type="url" name="urlImg"></input></td>
						</tr>
						<tr>
							<td>Motto:</td>
							<td><input type="text" name="motto"></input></td>
						</tr>
						<tr>
							<td>Sito Web:</td>
							<td><input type="text" name="sito"></input></td>
						</tr>
						<tr>
							<td>Facebook:</td>
							<td><input type="text" name="facebook"></input></td>
						</tr>
						<tr>
							<td>Twitter:</td>
							<td><input type="text" name="twitter"></input></td>
						</tr>
						<tr>
							<td>Linkedin:</td>
							<td><input type="text" name="linkedin"></input></td>
						</tr>
					</table>
					<br> <input type="submit" name="sumbit" value="crea Startup" />
				</form>
			</div>
			<div class="col-sm-4 col-sm-offset-2">
				<form action="MembroSignupController" method="get">
					<h2>Membro</h2>
					<p class="text-danger">${loginError}</p>
					<table>
						<tr>
							<td>Nome*:</td>
							<td><input type="text" name="nome"
								placeholder="enter your name" required></input></td>
						</tr>
						<tr>
							<td>Cognome*:</td>
							<td><input type="text" name="surname"
								placeholder="enter your surname"></input></td>
						</tr>
						<tr>
							<td>Email*:</td>
							<td><input type="email" name="email"
								placeholder="enter your email" required></input></td>
						</tr>
						<tr>
							<td>Password*:</td>
							<td><input type="password" name="password"
								placeholder="create a password" required></input></td>
						</tr>
						<tr>
							<td>Url Avatar:</td>
							<td><input type="text" name="urlImg"></input></td>
						</tr>
						<tr>
							<td>Anno di nascita:</td>
							<td colspan="3"><input type="number" name="annoNascita"></input></td>
						</tr>
						<tr>
							<td>Url CV:</td>
							<td colspan="3"><input type="text" name="desc"></input></td>
						</tr>
						<tr>
							<td>Sito Web:</td>
							<td><input type="text" name="sito"></input></td>
						</tr>
						<tr>
							<td>Facebook:</td>
							<td><input type="text" name="facebook"></input></td>
						</tr>
						<tr>
							<td>Twitter:</td>
							<td><input type="text" name="twitter"></input></td>
						</tr>
						<tr>
							<td>Linkedin:</td>
							<td><input type="text" name="linkedin"></input></td>
						</tr>
					</table>
					<br> <input type="submit" name="sumbit" value="crea Membro" />
				</form>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<!--[if lt IE 10]>
      <script src="js/ie10-viewport-bug-workaround.js"></script>
    <![endif]-->
</body>
</html>