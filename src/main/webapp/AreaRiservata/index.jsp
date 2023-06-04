<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</div>

<%@ include file="../Components/footer.jsp" %>
</body>

</html>