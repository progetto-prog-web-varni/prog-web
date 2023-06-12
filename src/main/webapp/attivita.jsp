<%@ page contentType="text/html;charset=UTF-8" %>
  <!DOCTYPE html>
  <html>

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

      <%@ include file="resources/css/attivita.css" %>
    </style>

    <title>Tum4World | Attività</title>
  <body>
    <%@ include file="Components/header.jsp" %>
      <div class="container">
        <div class="attivita-title-container">
          <h1 class="attivita-title">Attivita'</h1>
          <h3>
            Tum4World propone 3 attività, ognuna destinata a un target diverso di età e con obiettivi
            differenti.<br><br>
          </h3>
        </div>

        <div class="single-activity first-activity">
          <h3>Tum4World for Little Coders</h3>
          <p>
            Questo corso ha l'obiettivo di formare bambini e ragazzi dai 7 ai 16 anni attraverso percorsi innovativi
            ed avvicinarli al mondo digitale in maniera attiva e costruttiva e non come fruitori passivi. <br>
            Il corso è previsto per gruppi dalle 10 alle 25 persone, per permettere maggiore interazione tra i
            partecipanti e per imparare e mettere subito in pratica in maniera creativa le nozioni di coding, pensiero
            computazionale, robotica, prototipazione e logica. <br>
            Per noi è fondamentale stimolare i ragazzi affinché acquisiscano creatività e capacità di problem solving,
            da applicare poi a qualsiasi realtà lavorativa e formativa. <br>
            Questo corso prevede diversi possibili laboratori:<br>
          </p>
          <ul class="elenco-circle">
            <li>Corso di conoscenza hardware e software del computer e di dispositivi mobile.
            <li>Corso di modellazione e stampa 3d per ragazzi
            <li>Corso di robotica per ragazzi
            <li>Corso di robotica e domotica per ragazzi
            <li>Corso di coding e creazione app per ragazzi
          </ul>
          <p>
            Tutte le attività da noi presentate sono tenute in maniera lucida e appassionata da coach competenti e
            preparati che dedicano gran parte del loro tempo alla ricerca e allo sviluppo. <br><br>
          </p>
          <br><br>
          <figure>
            <img class="foto_activity" onclick="window.open('foto-attivita-little-coders.jsp')" src="${pageContext.request.contextPath}/resources/img/foto_attivita/bambini1.jpg" alt="foto robot con bambino">
            <figcaption>
              <p>Clicca sull'immagine per scoprire di pù sul corso di robotica ora disponibile! </p>
            </figcaption>
          </figure>

        </div>

        <br><br><br>

        <div class="single-activity second-activity">
          <h3>Tum4World for professionals </h3>
          <p>
            Diventa un esperto informatico con questo corso d'informatica!<br>
            Offriamo una formazione all'avanguardia attraverso le nostre attività on-demand per aiutarvi a ottenere
            le migliori conoscenze e competenze possibili per ambire al lavoro dei sogni.<br>
            Il nostro centro di formazione offre un'ampia gamma di attività per programmatori organizzati in modo
            professionale, con metodi innovativi e non liberali. <br>
            I nostri corsi sono preferibilmente di gruppo ma anche individuali e si basano su competenze e casistiche
            reali.<br>
            Questa è la nostra offerta di attività:<br>
          </p>
          <ul class="elenco-circle">
            <li>Programmazione in C/C++
            <li>Programmazione in Java
            <li>Programmazione in HTML/CSS
            <li>Programmazione in Python
            <li>Cybersecurity ed ethical hacking
            <li>Sviluppatore di app mobili
            <li>Intelligenza artificiale
            <li>Web developer
            <li>Cloud, DevOps, Sicurezza e Blockchain
          </ul>
          <p>
            Dai uno slancio al tuo curriculum, apprendi nuovi linguaggi di programmazione con i nostri corsi!<br><br>
          </p>
          <br><br>
          <figure>
            <img class="foto_activity" onclick="window.open('foto-attivita-professionals.jsp')" src="${pageContext.request.contextPath}/resources/img/foto_attivita/professional5.jpeg"  alt="foto programmatore">
            <figcaption>
              <p>
                Clicca sull'immagine per scoprire di più sull'attività di Web Developer, ora disponibile!
              </p>
            </figcaption>
          </figure>
        </div>

        <br><br><br>

        <div class="single-activity third-activity">

          <h3>Tum4World for Seniors</h3>
          <p>
            Al giorno d'oggi quasi due anziani su tre utilizzano Internet.<br>
            Dall'ultimo report Istat “Cittadini e ICT” 2019 emerge una situazione di generale stagnazione, legata a
            fattori non ancora affrontati in profondità, con qualche segnale positivo legato all'incremento
            dell'accesso internet degli adulti over 65….<br>
            L'obiettivo di questo corso è quello di dare conoscenze e competenze di base alle persone più anziane
            (over 65) in modo da renderli indipendenti e consapevoli al 100% dello strumento e dei tool più utilizzati
            nel web e nel loro personal Computer. <br>
            Spesso gli anziani si sentono dire che non riusciranno a capire l'argomento, che il web è una rete che può
            essere utilizzata solo dai giovani. Una cosa è certa: non è mai troppo tardi per imparare l'informatica e
            per affidarsi a questo corso base.<br>
            Ogni insegnante avrà una preparazione tale da spiegare in modo semplice, efficace tutti i contenuti della
            formazione di base, adattandola a ogni individuo. <br>
            Argomenti base affrontati nel corso: <br>
          </p>
          <ul class="elenco-circle">
            <li>Inizializzazione computer, conoscenza delle interfacce principali, del desktop, delle cartelle, dei
              documenti, delle principali applicazioni, ….
            <li>Migliore conoscenza del sistema informatico e quindi la conoscenza del processore, delle periferiche,
              dello sviluppo di applicazioni
            <li>Focus sul pacchetto Office e sul web
            <li>Risoluzione di problemi di base presenti nel quotidiano
            <li>Utilizzo di dispositivi mobile come smartphone e tablet
          </ul>
          </ul>
          <br><br>
          <figure>
            <img class="foto_activity" onclick="window.open('foto-attivita-seniors.jsp')" src="${pageContext.request.contextPath}/resources/img/foto_attivita/anziani1.jpg" alt="foto anziani">
            <figcaption>
              <p> Clicca sull'immagine per scoprire di più! </p>
            </figcaption>
          </figure>
        </div>

        <br><br><br>
      </div>
      <%@ include file="Components/footer.jsp" %>
  </body>

  <script>
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