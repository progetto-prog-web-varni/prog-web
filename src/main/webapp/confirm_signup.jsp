<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <style>
    <%@ include file="resources/css/base.css" %>
    <%@ include file="resources/css/footer.css" %>
    <%@ include file="resources/css/header.css" %>

    <%@ include file="resources/css/confirm.css" %>
  </style>
  <title>Registrazione confermata</title>
</head>
<body>
<%@ include file="Components/header.jsp" %>

<div class="box">
  <h1 class="title">Registrazione confermata</h1>
  <%-- chcek data --%>
  <%
    String name = request.getParameter("fname");
    String surname = request.getParameter("lname");

    //if form completed show message
    if (name != null && surname != null) {
  %>
  <p>Grazie <%= name %> <%= surname %> per esserti registrato su Tum4World</p>
  <p>Prosegui nella tua area riservata tramite la sezione <a href="login.jsp">Login</a></p>
  <%
    } else {
      //return to contatti.jsp
      response.sendRedirect("sign-up.jsp");
    }
  %>
</div>

<%@ include file="Components/footer.jsp" %>
</body>
</html>
