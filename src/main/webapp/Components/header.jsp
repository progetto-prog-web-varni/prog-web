<%@ page import="Utils.HitsCounter" %>
<%
  HitsCounter.countsHits(page);
%>
<!-- HEADER OF THE PAGE-->
<div class="header">
  <div class="titolo">
    <h1>Tum4World</h1>
  </div>
  <div class="navbar-image">
    <span>
      <img src="${pageContext.request.contextPath}/resources/img/cancelletto.jpg" width="100" height="80">
    </span>
  </div>

  <div class="inline-links">
    <div class="navbar-flex-item">
      <!-- <span style="padding:4px; width:150px; text-align:center"> -->
      <a href="${pageContext.request.contextPath}/index.jsp">HOME</a>
      <!-- </span> -->
    </div>
    <div class="navbar-flex-item">
      <!-- <span style="padding:4px; width:150px; text-align:center"> -->
      <a href="${pageContext.request.contextPath}/chiSiamo.jsp">CHI SIAMO</a>
      <!-- </span> -->
    </div>
    <div class="navbar-flex-item">
      <!-- <span style="padding:4px; width:150px; text-align:center"> -->
      <a href="${pageContext.request.contextPath}/attivita.jsp">ATTIVITA'</a>
      <!-- </span> -->
    </div>
    <div class="navbar-flex-item">
      <!-- <span style="padding:4px; width:150px; text-align:center"> -->
      <a href="${pageContext.request.contextPath}/contatti.jsp">CONTATTI</a>
      <!-- </span> -->
    </div>
    <div class="navbar-flex-item">
      <!-- <span style="padding:4px; width:150px; text-align:center"> -->
      <a href="${pageContext.request.contextPath}/sign-up.jsp">SIGNUP</a>
      <!-- </span> -->
    </div>
    <!-- to previus visualizzation
            <span class="w3-panel w3-border w3-round-xlarge item" style="background-color:silver; border:2px solid black; padding:4px; width:150px; text-align:center"> <a href="login.html">LOGIN</a></span>
        -->
    <div class="navbar-flex-item">
      <!-- <span style=" padding:4px; width:150px; text-align:center"> -->
      <a href="${pageContext.request.contextPath}/login.jsp">LOGIN</a>
      <!-- </span> -->
    </div>
  </div>
  <br>
</div>