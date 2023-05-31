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
      <form class="sign-in-grid" action="/login-serv" method="post">
        <div class="inner-grid-signin">
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
          <input type="submit" value="Login" class="button margin-top-10">
        </div>
      </form>
      <%@ include file="Components/footer.jsp" %>
  </body>

  <script>
    // check:
    // - ci deve essere la password
  </script>

  </html>