<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        <%@ include file="resources/css/base.css" %>
        <%@ include file="resources/css/footer.css" %>
        <%@ include file="resources/css/header.css" %>
    </style>
    <title>Invio confermato</title>
</head>
<body>
    <%@ include file="Components/header.jsp" %>


    <%
        String email = request.getParameter("email");

        if (email!=null ) {
    %>
    <p> Grazie per aver inviato la richiesta di contatto, le faremo avere il prima possibile una risposta. </p>
    <%
        } else {
            response.sendRedirect("contatti.jsp");
        }
    %>

    <%@ include file="Components/footer.jsp" %>
</body>

</html>
