<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.*"%>

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
<!--twitter-->
<meta name="twitter:card" content="summary">
<!--summary, photo or player-->
<meta name="twitter:url" content="http://">
<meta name="twitter:title" content="title">
<meta name="twitter:description" content="desc">
<meta name="twitter:image" content="http://">
<!--should be a square image no smaller than 60×60 pixels.-->
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
				<a class="navbar-brand" href="HomePage.jsp" style="color: white;">SocialStartup</a>
			</div>
			<div>
				<ul class="nav navbar-nav navbar-right">
					<%
						if (session.getAttribute("CurrentUser") instanceof Membro)
																			out.print("<li><a style=\"color: white;\" href=\"ListaMembriPage.jsp\"> <span class=\"glyphicon glyphicon-globe\"></span> Lista Utenti</a></li>");
					%>
					<li><a style="color: white;"
						href="ProfilePageController?emailProfile=${CurrentUser.email}">
							<img src="${CurrentUser.avatar}"
							style="width: 30px; height: 30px;" /> ${CurrentUser.nome}
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-dm-6 col-dm-offset-1">
				<%
					List<Startup> Startups = ((Comunita) application.getAttribute("Comunita")).getStartups();
					Utente CurrentUser = (Utente)(session.getAttribute("CurrentUser"));
					int count=0;
					for(Startup follow : Startups)
					{
						if(follow != CurrentUser && !CurrentUser.getStartupsFollowing().contains(follow))
						{ 
							count++;
							out.print("	<div><Table><tr><td rowspan=\"2\"><img src=\""+follow.getAvatar()+"\"	style=\"width: 100px; height: 100px;\" /></td><td><h2 style=\"margin-left: 10px;\">"+
								follow.getNome()+"</h2></td><td><a href=\"FollowStartupController?startupDaSeguire="+
								follow.getEmail()+"\"><span class=\"glyphicon glyphicon-heart-empty\" style=\"color: rgb(0, 102, 153)\"></span>"+
								"</a></td></tr><tr><td colspan=\"2\"><p style=\"margin-left: 10px;\">"+
								follow.getDescrizioneBreve()+"</p></td></tr></Table></div>");
						}
					}
					if(count==0)
						out.print("Non ci sono nuove startup da seguire :)");
				%>
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