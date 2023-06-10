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
    <form class="centra"
          onsubmit="return submitFunc()"
          onreset="return resetFunc()"
          method="POST"
          action="SignupServlet">

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
          <input class="sign-up-form-input" type="date" id="birthday" name="birthday" placeholder="22/07/2000"
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
          <fieldset class="border-0 sign-up-form-selection" >
            <select name="membershipType" id="selection-input">
              <option value="Nessuno">Nessuno</option>
              <option value="Simpatizzante">Simpatizzante</option>
              <option value="Aderente">Aderente</option>
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

          <div class="buttons">
            <input type="submit" value="Submit" class="button" id="reset-button" onclick="submitFunc()">
            <input type="reset" value="Reset" class="button" id="submit-button" onclick="resetFunc()">
          </div>

        </div>
      </div>
    </form>
    <%@ include file="Components/footer.jsp" %>
</body>

<script>
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

  const numberOfAttributes = 3;
  const submitFunc = () => {
    // get selection input
    const option_text = selection.options[selection.selectedIndex].value;

    // regex tests
    const test_email = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    const test_first_letter = /^(A|E|G|a|e|g)/gm;
    const test_number_presence = /[0-9]/;
    const test_major_letter_presence = /[A-Z]/;
    const test_simbols_presence = /(\?|!|\$)/;
    const test_selection_options = /(Simpatizzante|Aderente)/gm;

    // Requisiti obbligatori
    if(fname.value === "") return validateNotSuccess("Necessario inserire il proprio nome.");
    if(lname.value === "") return validateNotSuccess("Necessario inserire il proprio cognome.");
    if(birthday.value === "") return validateNotSuccess("Necessario inserire la propria data di nascita.");
    if(email.value === "") return validateNotSuccess("Necessario inserire la propria mail.");
    if(phone.value === "") return validateNotSuccess("Necessario inserire il proprio numero di telefono.");
    // check che sia SOLO 'Aderente' o solo 'Simpatizzante'
    if(!test_selection_options.test(option_text)){
      console.log("TIPO DI UTENTE", option_text);
      return validateNotSuccess("Necessario selezionare il tipo di utente tra Aderente e Simpatizzante.");
    }
    if(username.value === "") return validateNotSuccess("Necessario selezionare l'utente.");
    if(password.value === "") return validateNotSuccess("Necessario selezionare una password.");
    if(confirm_password.value === "") return validateNotSuccess("Necessario confermare la passsword.");
    if(confirm_password.value !== password.value) {
      console.log("PASSWORD: ", password, " \tCONFIRM: ", confirm_password);
      return validateNotSuccess("Le password non corrispondono");
    }

    if(!test_email.test(email.value))
      return validateNotSuccess("L'email inserita non e' valida.");

    const today = new Date();
    const minDate = new Date();
    const inputDate = new Date(birthday.value);
    // getMonth return month, but ZERO BASED (gen = 0)!!
    minDate.setFullYear(today.getFullYear()-18, today.getMonth(), today.getDate());
    // console.log(minDate.toISOString());

    // check minori =>  getToday - 18 anni
    // vuol dire che ha meno di 18 => il numero della data è maggiore
    if(inputDate > minDate) return validateNotSuccess("Necessario essere maggiorenni per iscriversi a questo sito");

    // validazione della password:
    // - lunga 8 caratteri
    if(password.value.length !== 8) return validateNotSuccess("La password deve essere lunga 8 caratteri");
    // - prima lettera (E|G|A|e|g|a)
    if(!test_first_letter.test(password.value))
      return validateNotSuccess("La password deve iniziare con 'A', 'E', 'G' oppure con 'a', 'e', 'g'");
    // - almeno un carattere numerico
    if(!test_number_presence.test(password.value)) return validateNotSuccess("La password deve contenere almeno un numero");
    // - un carattere maiuscolo
    if(!test_major_letter_presence.test(password.value))
      return validateNotSuccess("La password deve contenere almeno un carattere maiuscolo");
    // - un carattere tra $, !, ?
    if(!test_simbols_presence.test(password.value))
      return validateNotSuccess("La password deve contenere almeno uno tra '?', '!', '$'")

    console.log("OK");
    return true;
  }

  const validateNotSuccess = (errText) => {
    document.getElementById("error-text").innerText = "Err. 13000: " + errText;
    emitDanger();
    return false;
  }

  const emitDanger = () => document.getElementById("popup-danger").style.display = "block";

  const nascondiPopup = () => document.getElementById("popup-danger").style.display = "none";

  // -----
  // Cookies
  // -----

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
