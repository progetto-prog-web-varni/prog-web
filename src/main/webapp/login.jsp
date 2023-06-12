<%@ page import="ConfImporter.CookieConf" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  if (session.getAttribute("username") != null && session.getAttribute("role") != null) {
    String role = (String) session.getAttribute("role");
    String redirectUrl = request.getContextPath() + "/AreaRiservata/" + role;
    response.sendRedirect(redirectUrl);
    return;
  }
  String params = request.getParameter("error");

  String usernameCookie = null;
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().equals(CookieConf.DefaultCookieName)) {
        usernameCookie = cookie.getValue();
        break;
      }
    }
  }
%>
<!DOCTYPE html>
<html>
<!-- HOME PAGE -->

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
    <%@ include file="resources/css/login.css" %>
  </style>

  <title>Tum4World | Login</title>
</head>

<body>
<%@ include file="Components/header.jsp" %>
<!-- action="LoginServlet" method="POST" -->
<form class="sign-in-grid" >
  <div class="inner-grid-signin">

    <% if (params != null && !params.isEmpty()) { %>
    <div class="alert" hidden>
      <span class="close" onclick="return hidePopup()">&times;</span>
      <span><strong>Errore!</strong><% out.print(params); %> </span>
    </div>
    <% } %>
    <div id="popup-danger" class="alert" hidden>
      <span class="close" onclick="return hidePopup()">&times;</span>
      <span id="danger-text"><strong>Errore!</strong> Errore Generico </span>
    </div>
    <h3>Login Sezione Privata</h3>
    <label for="username" class="margin-bottom-5">Username</label>
    <input class="sign-up-form-input margin-bottom-5" type="username" id="username" name="username"
           placeholder="Inserisci username" value="<%= (usernameCookie != null) ? usernameCookie : "" %>">
    <label for="password" class="margin-bottom-5">Password</label>
    <input class="sign-up-form-input margin-bottom-5" type="password" id="password" name="password"
           placeholder="Inserisci password">

          <input value="Login" class="button margin-top-10" id="submit-button">
        </div>
      </form>
      <%@ include file="Components/footer.jsp" %>
  </body>

<script>
    const submitBtn = document.getElementById("submit-button");
    const username = document.getElementById("username");
    const password = document.getElementById("password");
    const errorBox = document.getElementById("popup-danger");
    const errorText = document.getElementById("danger-text");

    submitBtn.addEventListener("click", () => {

      const username = document.getElementById("username");
      const password = document.getElementById("password");

      if(!validateForm()) return;

      try {

        let xhr = new XMLHttpRequest();
        xhr.open('POST', 'LoginServlet', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = () => requestOnStateChanges(xhr);

        let pyl = "username=" + username.value + "&password=" + password.value;
        xhr.send(pyl);

      } catch (e) {
        errorBox.innerText = e;
        activeErrorBanner();
      }

    });

    const validateForm = () => {
      if(username.value === "" || password.value === ""){
        errorText.innerText = "Necessario inserire username e password";
        activeErrorBanner()
        return false;
      }
      return true;
    };

    const requestOnStateChanges = (xhr) => {
      try {
        if (xhr.readyState === XMLHttpRequest.DONE) {
          if(xhr.status === 200 || xhr.status === 302) document.location.href = xhr.responseURL;
          else {
            activeErrorBanner();
            let data = JSON.parse(xhr.responseText);
            errorText.innerText = data["message"];
          }
        }
      } catch(e) {
        console.log("Error in xhr, probably parsing JSON data.")
        console.log(e);
      }
    }

    const activeErrorBanner = () => errorBox.style.display = "block";

    const hidePopup = () => errorBox.style.display = "none";

    //
    // Cookies
    //

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