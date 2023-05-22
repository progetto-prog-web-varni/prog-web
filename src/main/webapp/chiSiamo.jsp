<%--
  Created by IntelliJ IDEA.
  User: dalbo
  Date: 22/05/2023
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chiSiamo.css">
    <title>Tum4World | Chi Siamo</title>
</head>

<%@ include file="Components/header.jsp" %>
<body>
    <header class="container">
                <span>
                    <img src="C:\Users\dalbo\OneDrive\Desktop\WEB_SITE\Tum4World\img\cancelletto.jpg" class="logo">
                </span>
        <span>
                    <div>
                        <h1 class="titolo_header"> Tum4World </h1>
                    </div>
                    <div class="container-NavBar">
                        <span class="stile-button-NavBar"> <a href="index.html">HOME PAGE</a></span>
                        <span class="stile-button-NavBar"> <a href="ChiSiamo.html">CHI SIAMO</a></span>
                        <span class="stile-button-NavBar"> <a href="attivita.html">ATTIVITA'</a></span>
                        <span class="stile-button-NavBar"> <a href="contatti.html">CONTATTI</a></span>
                        <span class="stile-button-NavBar"> <a href="sign_in.html">SIGN-IN</a></span>
                        <span class="stile-button-NavBar"> <a href="login.html">LOGIN</a></span>
                    </div>
                </span>
    </header>
</body>
<%@ include file="Components/footer.jsp" %>
</html>
