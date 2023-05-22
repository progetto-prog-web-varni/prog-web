<%--
  Created by IntelliJ IDEA.
  User: dalbo
  Date: 22/05/2023
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<%@ include file="Components/header.jsp" %>
<body>
<div id="body">
  <div class="container-sign-in">
    <form class="centra">
      <p>Aderisci come <i>Simpatizzante</i> o <i>Aderente</i></p>
      <label for="fname">Nome</label><br>
      <input class="myFormItem" type="text" id="fname" name="fname" placeholder="Mario"><br>
      <label for="lname">Cognome</label><br>
      <input class="myFormItem" type="text" id="lname" name="lname" placeholder="Rossi"><br>
      <label for="birthday">Data di Nascita</label><br>
      <input class="myFormItem" type="date" id="birthday" name="birthday" placeholder="01/01/2000" pattern="[1-31]{2}/[1-12]{2}/[1900-2023]{4}"><br>
      <small>Format: GG-MM-YYYY</small><br><br>
      <label for="email">Indirizzo Email</label><br>
      <input class="myFormItem" type="text" id="email" name="email" placeholder="mario.rossi@gmail.com"><br>
      <label for="phone">Numero di telefono</label><br>
      <input class="myFormItem" type="tel" id="phone" name="phone" placeholder="123-456-7890" pattern="[0-999]{3}-[0-999]{3}-[0-9999]{4}"><br>
      <small>Format: 123-456-7890</small><br><br>

      <!--<p style="margin-bottom:3px"></p-->
      <fieldset class="border-0">
        <legend>Preferenza iscrizione</legend>
        <select name="membershipType" >
          <option value="Simpatizzante">Simpatizzante</option>
          <option value="Aderente">Aderente</option>
          <option value="Nessuno" selected="selected">Nessuno</option>
        </select>
      </fieldset><br>

      <label for="username">Username</label><br>
      <input class="myFormItem" type="username" id="username" name="username" placeholder="enter username"><br>
      <label for="password">Password</label><br>
      <input class="myFormItem" type="psw" id="password" name="password" placeholder="enter password"><br>
      <label for="password">Conferma Password</label><br>
      <input class="myFormItem" type="psw" id="confirm_password" name="password" placeholder="enter password"><br>
      <small>Format: 8 caratteri</small><br><br>

      <input type="submit" value="Submit">
      <input type="reset" value="Reset">
    </form>
  </div>
</div>
</body>
<%@ include file="Components/footer.jsp" %>
</html>
