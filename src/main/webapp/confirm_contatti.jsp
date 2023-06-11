<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="Components/favicon_setting.jsp" %>
  <style>
    <%@ include file="resources/css/base.css" %>
    <%@ include file="resources/css/footer.css" %>
    <%@ include file="resources/css/header.css" %>
    <%@ include file="resources/css/cookies.css" %>

    <%@ include file="resources/css/confirm.css" %>
  </style>
  <title>Invio confermato</title>
  </head>
<body>
<%@ include file="Components/header.jsp" %>

<div class="box">
  <h1 class="title">Contatto inviato</h1>
<%
  String email = request.getParameter("email");
  String err = request.getParameter("error");

  if (email!=null && err == null) {
%>

<p>Grazie per aver inviato la tua mail, verrai ricontattato al più presto da Tum4World</p>

  <%
    }  else if (err != null ){
%>
  <div class="alert">
    <span class="close" onclick="return hidePopup()">&times;</span>
    <span><strong>Errore nel mandare la mail!</strong><% out.print(err); %> </span>
  </div>

  <%
  } else {
    response.sendRedirect("contatti.jsp");
  }
%>
</div>
<%@ include file="Components/footer.jsp" %>
</body>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var acceptBtn = document.getElementById("accept-btn");
    var rejectBtn = document.getElementById("reject-btn");
    var cookieBanner = document.getElementById("cookie-banner");

    acceptBtn.addEventListener("click", function() {
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "CookieServlet", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          cookieBanner.style.display = "none";
          sessionStorage.setItem("cookiesAccettati", "true");
        }
      };
      xhr.send();
    });

    rejectBtn.addEventListener("click", function() {
      cookieBanner.style.display = "none";
      sessionStorage.setItem("cookiesAccettati", "false");
    });

    if (sessionStorage.getItem("cookiesAccettati") === "false") {
      cookieBanner.style.display = "none";
    }
  });

</script>
</html>
