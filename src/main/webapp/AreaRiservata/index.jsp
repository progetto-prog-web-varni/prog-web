<%@ page contentType="text/html;charset=UTF-8" %>

<%-- Check if login, se no redirect --%>
<%-- Check che tipo di utente è --%>
<%-- Intanto utilizzo un http params (?value=1/2/3), poi si dovranno controllare le role --%>

<!DOCTYPE html>
<html>
<!-- HOME PAGE -->

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="../Components/favicon_setting.jsp" %>

  <style>
    <%@ include file="../resources/css/base.css" %>
    <%@ include file="../resources/css/footer.css" %>
    <%@ include file="../resources/css/header.css" %>
  </style>

  <title>Tum4World | Area Riservata</title>
</head>


<body>
<%@ include file="../Components/header.jsp" %>

<div>
  <h1 class="generic-text-center">Redirect</h1>
  <h1>Go to <a href="${pageContext.request.contextPath}/login.jsp">DashBoard</a></h1>
</div>

<%@ include file="../Components/footer.jsp" %>
</body>


<script>
  document.addEventListener("DOMContentLoaded", function() {
    var acceptBtn = document.getElementById("accept-btn");
    var rejectBtn = document.getElementById("reject-btn");
    var cookieBanner = document.getElementById("cookie-banner");

    acceptBtn.addEventListener("click", function() {
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "../../CookieServlet", true);
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