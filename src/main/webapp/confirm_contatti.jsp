<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
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


<%
  String email = request.getParameter("email");

  if (email!=null ) {
%>
<p>Grazie per esserti registrato su Tum4World</p>
<%
  } else {
    response.sendRedirect("contatti.jsp");
  }
%>

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