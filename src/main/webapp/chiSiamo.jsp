<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            <%@ include file="resources/css/base.css" %>
            <%@ include file="resources/css/footer.css" %>
            <%@ include file="resources/css/header.css" %>

            <%@ include file="resources/css/chiSiamo.css" %>
        </style>

        <script>
            function comparsa(x) { x.style.display = "block"; }
            function scomparsa(x) { x.style.display = "none"; }
        </script>

        <title>Tum4World | Chi Siamo</title>
    </head>

    <body>
        <%@ include file="Components/header.jsp" %>
        <div class="container">
            <div class="chiSiamo-title-container">
                <h1 class="chiSiamo-title">Chi Siamo</h1>
                <h3>
                    Tum4World è un'associazione nata nel 2007 da un gruppo di studenti universitari volenterosi di rendere la programmazione e il mondo dell'informatica una realtà alla portata di tutti o, come si direbbe tra gli appassionati, opensource.
                </h3>
                <br><br>
            </div>

            <div class="single-paragraph fondatori">
                <strong>
                    I fondatori
                </strong>
                <p>
                    Sono cinque i fondatori di Tum4World, tutti ex-studenti dell'Università degli Studi di Napoli Federico II.<br>
                    Hanno intrapreso l'idea di realizzare questo portale per avvicinare quante più persone al loro mondo con l'idea lungimirante di creare una rete stabile di contatti permettendo a chiunque di costruire una carriera affrontando con successo il processo di assunzione o semplicemente
                    di raggiungere obiettivi formativi personali.<br>
                </p>
                <div class="container-fondatori" >
					<span>
						<div>
							<img src="resources\img\p1.jpg" class="img-fondatore" alt="Immagine Joel">
						</div>
						<p>
							<strong>Joel</strong><br>Co-founder, CEO<br><small>Joined Oct, 2007</small>
						</p>
					</span>
                    <span>
						<div>
							<img src="resources\img\p2.jpg" class="img-fondatore" alt="Immagine Leo">
						</div>
						<p>
							<strong>Leo</strong><br>Co-founder, COO<br><small>Joined Oct, 2007</small>
						</p>
					</span>
                    <span>
						<div>
							<img src="resources\img\p3.jpg" class="img-fondatore" alt="Immagine Anna">
						</div>
						<p>
							<strong>Anna</strong><br>Co-founder, CFO<br><small>Joined Nov, 2007</small>
						</p>
					</span>
                    <span>
						<div>
							<img src="resources\img\p4.jpg" class="img-fondatore" alt="Immagine Andrea">
						</div>
						<p>
							<strong>Andrea</strong><br>Co-founder, CPA<br><small>Joined Oct, 2007</small>
						</p>
					</span>
                    <span >
						<div>
							<img src="resources\img\p5.jpg" class="img-fondatore" alt="Immagine Sara">
						</div>
						<p>
							<strong>Sara</strong><br>Co-founder, PM<br><small>Joined Dec, 2007</small>
						</p>
					</span>
                </div>
            </div>

            <div class="single-paragraph genesi">
                <h2><br> Come è sorta l'idea di creare Tum4World? </h2>
                <p>
                    Parla Andrea, co-fondatore dell'azienda: <br>
                <blockquote>
                    - Sin dal primo giorno di università, si è creato un certo feeling tra noi cinque, per le stesse idee riguardo molte tematiche del mondo dell'informatica e della vita universitaria. <br>
                    Una cosa ci legava indissolubilmente: la “filosofia opensource”. <br>
                    Per i non addetti al lavoro, con questo termine si intende un sistema di valori che celebrano lo scambio aperto, la partecipazione collettiva, la trasparenza e lo sviluppo attivo e concreto della community.  <br>
                    Era proprio questo il nostro sogno: aspiravamo a creare una realtà completamente opensource, dai più piccoli ai più anziani.  <br>
                    Con questo intento, abbiamo iniziato a creare una rete di rapporti intra-universitari che poi si è estesa a diverse aziende e startup locali, permettendoci di toccare con mano le prime soddisfazioni e le prime problematiche di un progetto immenso come il nostro. <br>
                    Dopo diverse sponsorizzazioni e aiuti da parte di collaboratori che si sono uniti, abbiamo fondato Tum4World. <br>
                    Da lì tutto è cominciato il tutto, che ci ha portato dopo 15 anni a contare più di 20 scuole aderenti, migliaia di studenti universitari partecipi attivamente al sostentamento e alla progressione della comunità, un bel gruppo di anziani super curiosi di imparare ogni giorno skills nuove e un team di collaboratori stretti che permette di mantenere sempre la linea guida del progetto Tum4World. -
                </blockquote>
                </p>
            </div>

            <div class="single-paragraph sede">
                <h2> Sede associazione </h2>
                <p> La sede principale è a Napoli in via Mazzini 34.<br>
                    Ci troviamo in un'area collinare dove è possibile ammirare la bellissima Napoli dall'alto. <br>
                    La sede è stata costruita negli anni 2005, risulta essere spaziosa e moderna, con ampli spazi per conferenze e meeting.
                </p>
                <div class = "container-sede" >
                    <span>
                        <figure>
                            <img src="resources\img\studio.jpg" class="img-sede" alt="Ufficio soppalcato">
                            <figcaption>
                                <p>Ufficio soppalcato</p>
                            </figcaption>
                        </figure>
                    </span>
                        <span>
                        <figure>
                            <img src="resources\img\studio2.jpg" class="img-sede" alt="Ufficio principale">
                            <figcaption>
                                <p>Ufficio principale</p>
                            </figcaption>
                        </figure>
                    </span>
                        <span>
                        <figure>
                            <img src="resources\img\ufficio_est.jpg" class="img-sede" alt="Sede vista da via Mazzini">
                            <figcaption>
                                <p>Sede vista da via Mazzini</p>
                            </figcaption>
                        </figure>
                    </span>
                </div>
            </div>

            <div class="single-paragraph FAQ">
                <h1> FAQ </h1>
                <p>
                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-1'))"  onmouseover="comparsa(document.getElementById('FAQ-response-1'))"> Cos'è esattamente Tum4World?</p>
                    <p class="FAQ-answer" id='FAQ-response-1'> Tum4World è una comunità di persone provenienti da tutto il mondo che stanno imparando a programmare insieme. Siamo un ente di beneficenza pubblico.</p>

                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-2'))"  onmouseover="comparsa(document.getElementById('FAQ-response-2'))">In che modo Tum4World mi aiuterà a imparare a programmare?</p>
                    <p class="FAQ-answer" id="FAQ-response-2">Imparerai a programmare costruendo dozzine di progetti, passo dopo passo, direttamente nel tuo browser, nell'editor di codice o nell'app mobile.</p>

                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-3'))"  onmouseover="comparsa(document.getElementById('FAQ-response-3'))">Tum4World è davvero gratuito?</p>
                    <p class="FAQ-answer" id='FAQ-response-3'>SÌ. Ogni aspetto di Tum4World è gratuito al 100%. I corsi, i progetti e persino le consulenze private.</p>

                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-4'))"  onmouseover="comparsa(document.getElementById('FAQ-response-4'))">Tum4World può aiutarmi a ottenere un lavoro come sviluppatore di software?</p>
                    <p class="FAQ-answer" id='FAQ-response-4'>SÌ. Ogni anno, migliaia di persone che entrano a far parte della community di Tum4World ottengono il loro primo lavoro come sviluppatori di software.</p>

                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-5'))"  onmouseover="comparsa(document.getElementById('FAQ-response-5'))">Quali abilità imparerò?</p>
                    <p class="FAQ-answer" id='FAQ-response-5'>Imparerai le competenze che la maggior parte degli sviluppatori utilizza sul lavoro: HTML, CSS, JavaScript, Python, Linux, Git e SQL e altro ancora. Imparerai anche come utilizzare potenti librerie per lo sviluppo web, lo sviluppo di app mobili, la scienza dei dati e l'intelligenza artificiale.</p>

                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-6'))"  onmouseover="comparsa(document.getElementById('FAQ-response-6'))">Quanto tempo ci vuole per imparare tutto questo?</p>
                    <p class="FAQ-answer" id='FAQ-response-6'>Tum4World è di autoapprendimento. Realisticamente, potrebbero essere necessari diversi anni di pratica della programmazione per apprendere queste abilità abbastanza bene da ottenere un lavoro come ingegnere del software. Non lasciare la scuola o il tuo lavoro quotidiano finché non ti senti pronto.</p>

                    <p class="FAQ-question" onmouseout="scomparsa(document.getElementById('FAQ-response-7'))"  onmouseover="comparsa(document.getElementById('FAQ-response-7'))">Come posso iniziare?</p>
                    <p class="FAQ-answer" id='FAQ-response-7'>Se fossi un principiante, dovresti iniziare dall'inizio del programma di base di Tum4World, altrimenti ti consigliamo comunque di iniziare dall'inizio, eventualmente saltando a qualsiasi area desideri.</p><br>
                </p>
            </div>
        </div>
        <%@ include file="Components/footer.jsp" %>
    </body>

    </html>