<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Check if login, se no redirect --%>
<%-- Check che tipo di utente è --%>

<!DOCTYPE html>
<html>
<!-- HOME PAGE -->

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    <%@ include file="resources/css/base.css" %>
    <%@ include file="resources/css/footer.css" %>
    <%@ include file="resources/css/header.css" %>
    
    <%@ include file="resources/css/area_riservata.css" %>

    <%-- c:if --%>
    <%@ include file="resources/css/simpatizzante.css" %>
    <%@ include file="resources/css/amministratore.css" %>
    <%@ include file="resources/css/aderente.css" %>
  </style>

  <title>Tum4World | Area Riservata</title>
</head>


<body>
  <%@ include file="Components/header.jsp" %>

    <!-- BODY of web page -->
    <div class="body-container">
      <!-- Check the correct file -->
      <%-- c:if --%>
      <%@ include file="AreaRiservata/Aderente.jsp" %>
    </div>

    <%@ include file="Components/footer.jsp" %>
</body>

</html>