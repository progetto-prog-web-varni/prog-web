<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
      
      <%@ include file="resources/css/login.css" %>
    </style>

    <title>Tum4World | Login</title>
  </head>

  <body>
    <%@ include file="Components/header.jsp" %>
    <!-- action="LoginServlet" method="POST" -->
      <form class="sign-in-grid" >
        <div class="inner-grid-signin">
          <div id="popup-danger" class="alert" hidden>
            <span class="close" onclick="return hidePopup()">&times;</span>
            <span id="danger-text"><strong>Errore!</strong> Email o password non inseriti!</span>
          </div>
          <h3>Login Sezione Privata</h3>
          <label for="username" class="margin-bottom-5">Username</label>
          <input class="sign-up-form-input margin-bottom-5" type="username" id="username" name="username"
            placeholder="Inserisci username">
          <label for="password" class="margin-bottom-5">Password</label>
          <input class="sign-up-form-input margin-bottom-5" type="password" id="password" name="password"
            placeholder="Inserisci password">

          <!-- TODO: non c'è scritto nelle specifiche
          <small>Dimenticato La password</small>
            --> 
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

      if(!validateForm()) {
        return;
      }
      try {
        let xhr = new XMLHttpRequest();
        xhr.open('POST', 'LoginServlet', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = () => {
          if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let data = JSON.parse(xhr.responseText);
            console.log(data);
            if (data["success"] === "false"){
              activeErrorBanner();
              errorText.innerText = data["message"];
            } else {
              // client side redirect
              location.href = 'AreaRiservata/index.jsp';
            }
          } else {
            activeErrorBanner();
            let data = JSON.parse(xhr.responseText);
            errorText.innerText = data["message"];
          }
        };

        let cookies = checkIfOkCookies();
        let pyl = "username=" + username.value + "&password=" + password.value + "&cookies=" + cookies;
        xhr.send(pyl);
      } catch (e) {
        errorBox.innerText = e;
        activeErrorBanner();
      }
    });

    const validateForm = () => {
      if(username.value === "" || password.value === ""){
        activeErrorBanner();
        return false;
      }
      return true;
    };

    const checkIfOkCookies = () => {
      let x = document.cookie;
      if(x.includes("ciaone")) {
        return true;
      } else {
        return false;
      }
    };

    const activeErrorBanner = () => errorBox.style.display = "block";

    const hidePopup = () => errorBox.style.display = "none";
  </script>

  </html>