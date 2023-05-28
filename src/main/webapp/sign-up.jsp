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

    <%@ include file="resources/css/sign-up.css" %>
  </style>

  <title>Tum4World | Signup</title>
</head>

<body>
  <%@ include file="Components/header.jsp" %>
    <form class="centra">
      <h2>Aderisci come <i>Simpatizzante</i> o <i>Aderente</i></h2>
      <div class="sign-up-grid">
        <div class="sign-up-grid-item">
          <label for="fname" class="margin-bottom-5">Nome</label>
          <input class="sign-up-form-input" type="text" id="fname" name="fname" placeholder="Mario">
          <label for="lname" class="margin-bottom-5">Cognome</label>
          <input class="sign-up-form-input" type="text" id="lname" name="lname" placeholder="Rossi">
          <label for="birthday" class="margin-bottom-5">Data di Nascita</label>
          <input class="sign-up-form-input" type="date" id="birthday" name="birthday" placeholder="01/01/2000"
            pattern="[1-31]{2}/[1-12]{2}/[1900-2023]{4}">
          <small>Format: GG-MM-YYYY</small>
          <label for="email" class="margin-bottom-5">Indirizzo Email</label>
          <input class="sign-up-form-input" type="text" id="email" name="email" placeholder="mario.rossi@gmail.com">
          <label for="phone" class="margin-bottom-5">Numero di telefono</label><br>
          <input class="sign-up-form-input" type="tel" id="phone" name="phone" placeholder="123-456-7890"
            pattern="[0-999]{3}-[0-999]{3}-[0-9999]{4}"><br>
          <small>Format: 123-456-7890</small><br><br>

          <h3>Preferenza iscrizione</h3>
          <!-- TODO: questa width è fissata, non credo sia una cosa bella, ma intanto funziona -->
          <fieldset class="border-0 sign-up-form-selection">
            <select name="membershipType">
              <option value="Simpatizzante">Simpatizzante</option>
              <option value="Aderente">Aderente</option>
              <option value="Nessuno" selected="selected">Nessuno</option>
            </select>
          </fieldset>

          <label for="username" class="margin-bottom-5">Username</label>
          <input class="sign-up-form-input" type="username" id="username" name="username"
            placeholder="Inserisci username">
          <label for="password" class="margin-bottom-5">Password</label>
          <input class="sign-up-form-input" type="password" id="password" name="password"
            placeholder="Inserisci password"><br>
          <label for="password" class="margin-bottom-5">Conferma Password</label>
          <input class="sign-up-form-input" type="password" id="confirm_password" name="password"
            placeholder="Conferma password">
          <small>Formato: 8 caratteri</small>

          <div class="buttons">
            <input type="submit" value="Submit" class="button">
            <input type="reset" value="Reset" class="button">
          </div>

        </div>
      </div>
    </form>
    <%@ include file="Components/footer.jsp" %>
</body>

</html>