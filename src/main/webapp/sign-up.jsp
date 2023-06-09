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
    <%@ include file="resources/css/cookies.css" %>

    <%@ include file="resources/css/sign-up.css" %>
  </style>

  <title>Tum4World | Signup</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.png">
</head>

<body>
  <%@ include file="Components/header.jsp" %>

    <!-- do not add action here, resolved in the js -->
    <form class="centra" onreset="return resetFunc()" onsubmit="return submitFunc()" action="SignupServlet" method="POST">

      <div id="popup-danger" class="alert">
        <span class="close" onclick="return nascondiPopup()">&times;</span>
        <span id="error-text"><strong>Danger!</strong> Enter a valid mail!</span>
      </div>

      <h2>Aderisci come <i>Simpatizzante</i> o <i>Aderente</i></h2>

      <div id="error-div" class="signup-error" hidden="hidden">
        <h1>Errore</h1>
      </div>

      <div class="sign-up-grid">
        <div class="sign-up-grid-item">

          <!-- NAME -->
          <label for="fname" class="margin-bottom-5">Nome</label>
          <input class="sign-up-form-input" type="text" id="fname" name="fname" placeholder="Mario" >

          <!-- SURNAME -->
          <label for="lname" class="margin-bottom-5">Cognome</label>
          <input class="sign-up-form-input" type="text" id="lname" name="lname" placeholder="Rossi" >

          <!-- BIRTHDAY -->
          <label for="birthday" class="margin-bottom-5">Data di Nascita</label>
          <input class="sign-up-form-input" type="date" id="birthday" name="birthday" placeholder="01/01/2000"
            pattern="[1-31]{2}/[1-12]{2}/[1900-2023]{4}">
          <small>Format: GG-MM-YYYY</small>

          <!-- EMAIL -->
          <label for="email" class="margin-bottom-5">Indirizzo Email</label>
          <input class="sign-up-form-input" type="email" id="email" name="email" placeholder="mario.rossi@gmail.com">

          <!-- PHONE -->
          <label for="phone" class="margin-bottom-5">Numero di telefono</label>
          <input class="sign-up-form-input" type="tel" id="phone" name="phone" placeholder="123-456-7890"
            pattern="[0-999]{3}-[0-999]{3}-[0-9999]{4}">
          <small>Format: 123-456-7890</small>

          <!-- SELECTION -->
          <h3>Preferenza iscrizione</h3>
          <!-- TODO: questa width è fissata, non credo sia una cosa bella, ma intanto funziona -->
          <fieldset class="border-0 sign-up-form-selection" >
            <select name="membershipType" id="selection-input">
              <option value="Simpatizzante">Simpatizzante</option>
              <option value="Aderente">Aderente</option>
              <option value="Nessuno" selected="selected">Nessuno</option>
            </select>
          </fieldset>

          <!-- USERNAME -->
          <label for="username" class="margin-bottom-5">Username</label>
          <input class="sign-up-form-input" type="text" id="username" name="username"
            placeholder="Inserisci username">
          <!-- PASSWORD -->
          <label for="password" class="margin-bottom-5">Password</label>
          <input class="sign-up-form-input" type="password" id="password" name="password"
            placeholder="Inserisci password">

          <!-- PASSWORD 2nd -->
          <label for="password" class="margin-bottom-5">Conferma Password</label>
          <input class="sign-up-form-input" type="password" id="confirm_password" name="password"
            placeholder="Conferma password">
          <small>Formato: 8 caratteri</small>

          <!-- (la password deve essere
lunga 8 caratteri, deve contenere la prima lettera dei nomi propri di ciascuno di voi, almeno
un carattere numerico, un carattere maiuscolo e un carattere tra $, ! e ?), -->

          <div class="buttons">
            <input type="submit" value="Submit" class="button" id="reset-button">
            <input type="reset" value="Reset" class="button" id="submit-button">
          </div>

        </div>
      </div>
    </form>
    <%@ include file="Components/footer.jsp" %>
</body>

<script>

  // reset-button for event listener
  const resetbtn = document.getElementById("reset-button");
  const submitbtn = document.getElementById("submit-button");

  // Form components
  const fname = document.getElementById("fname");
  const lname = document.getElementById("lname");
  const birthday = document.getElementById("birthday");
  const email = document.getElementById("email");
  const phone = document.getElementById("phone");
  const selection = document.getElementById("selection-input");
  const username = document.getElementById("username");
  const password = document.getElementById("password");
  const confirm_password = document.getElementById("confirm_password");

  const resetFunc = () => {
    fname.value = "";
    lname.value = "";
    birthday.value = "";
    email.value = "";
    phone.value = "";
    selection.selectIndex = 0;
    username.value = "";
    password.value = "";
    confirm_password.value = "";
  };

  resetbtn.addEventListener("click", resetFunc);

  const submitFunc = () => {
    if(confirm_password.value !== password.value) return validateNotSuccess("Le password non corrispondono.");

    if(fname.value === "") return validateNotSuccess("Necessario inserire il proprio nome.");
    if(lname.value === "") return validateNotSuccess("Necessario inserire il proprio cognome.");
    if(birthday.value === "") return validateNotSuccess("Necessario inserire la propria data di nascita.");
    if(email.value === "") return validateNotSuccess("Necessario inserire la propria mail.");
    if(phone.value === "") return validateNotSuccess("Necessario inserire il proprio numero di telefono.");
    if(selection.selectIndex === 0) return validateNotSuccess("Necessario selezionare il tipo di utente.");
    if(username.value === "") return validateNotSuccess("Necessario selezionare l'utente.");
    if(password.value === "") return validateNotSuccess("Necessario selezionare una password.");
    if(confirm_password.value === "") return validateNotSuccess("Necessario confermare la passsword.");

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email.value))
      return validateNotSuccess("L'email inserita non e' valida.");

    return true;
  };

  const validateSuccess = () => {
    return true;
  }

  const validateNotSuccess = (errText) => {
    document.getElementById("error-text").innerText = errText;
    emitDanger();
    return false;
  }

  const emitDanger = () => document.getElementById("popup-danger").style.display = "block";

  const nascondiPopup = () => document.getElementById("popup-danger").style.display = "none";

  submitbtn.addEventListener("click", submitFunc)

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