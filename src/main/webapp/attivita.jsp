<%--
  Created by IntelliJ IDEA.
  User: dalbo
  Date: 22/05/2023
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/attivita.css">
  <title>Tum4World | Attività</title>
</head>

<%@ include file="Components/header.jsp" %>
<body>
<div id="body">
  <div class="container-shadow">
    <h1>ATTIVITA’</h1>
    <p>
      Tum4World propone 3 attività, ognuna destinata ad un target diverso di età e con obiettivi differenti.<br><br>
    </p>
    <ul class="elenco-disc">
      <li><strong>    Tum4World for Little Coders </strong>
        <p>
          Questo corso ha l’obiettivo di formare bambini e ragazzi dai 7 ai 16 anni attraverso percorsi innovativi ed avvicinarli al mondo digitale in maniera attiva e costruttiva e non come fruitori passivi. <br>
          Il corso è previsto per gruppi dalle 10 alle 25 persone, per permettere maggiore interazione tra i partecipanti e per imparare e mettere subito in pratica in maniera creativa le nozioni di coding, pensiero computazionale, robotica, prototipazione e logica. <br>
          Per noi è fondamentale stimolare i ragazzi affinché acquisiscano creatività e capacità di problem solving, da applicare poi a qualsiasi realtà lavorativa e formativa. <br>
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
          Tutte le attività da noi presentate sono tenute in maniera lucida e appassionata da coach competenti e preparati che dedicano gran parte del loro tempo alla ricerca e allo sviluppo.  <br><br>
        </p>
      <li> <strong>Tum4World for professionals </strong>
        <p>
          Diventa un esperto informatico con questo corso di informatica!<br>
          Offriamo una formazione all’avanguardia attraverso le nostre attività on-demand per aiutarvi ad ottenere le migliori conoscenze e competenze possibili per ambire al lavoro dei sogni.<br>
          Il nostro centro di formazione offre un’ampia gamma di attività per programmatori organizzati in modo professionale, con metodi innovativi e non liberali. <br>
          I nostri corsi sono preferibilmente di gruppo ma anche individuali e si basano su competenze e casistiche reali.<br>
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

      <li><strong>Tum4World for Seniors</strong>
        <p>
          Al giorno d’oggi quasi due anziani su tre utilizzano Internet.<br>
          Dall’ultimo report Istat “Cittadini e ICT” 2019 emerge una situazione di generale stagnazione, legata a fattori non ancora affrontati in profondità, con qualche segnale positivo legato all’incremento dell’accesso internet degli adulti over 65….<br>
          L’obiettivo di questo corso è quello di dare conoscenze e competenze di base alle persone più anziane (over 65) in modo da renderli indipendenti e consapevoli al 100% dello strumento e dei tool più utilizzati nel web e nel loro personal Computer. <br>
          Spesso gli anziani si sentono dire che non riusciranno a capire l’argomento, che il web è una rete che può essere utilizzata solo dai giovani. Una cosa è certa: non è mai troppo tardi per imparare l’informatica e per affidarsi a questo corso base.<br>
          Ogni insegnante avrà una preparazione tale da spiegare in modo semplice, efficace tutti i contenuti della formazione di base, adattandola ad ogni individuo.  <br>
          Argomenti base affrontati nel corso: <br>
        </p>
        <ul class="elenco-circle">
          <li>Inizializzazione computer, conoscenza delle interfacce principali, del desktop, delle cartelle, dei documenti, delle principali applicazioni, ….
          <li>Migliore conoscenza del sistema informatico e quindi la conoscenza del processore, delle periferiche, dello sviluppo di applicazioni
          <li>Focus sul pacchetto Office e sul web
          <li>Risoluzione di problemi di base presenti nel quotidiano
          <li>Utilizzo di dispositivi mobile come smartphone e tablet
        </ul>
    </ul>
  </div>
</div>
</body>
<%@ include file="Components/footer.jsp" %>
</html>
