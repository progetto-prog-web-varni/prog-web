<!-- FOOTER OF THE PAGE-->
<footer>
	<div class="info_DX text-center">
		<h1>Chi Siamo</h1>
		<h3>Associazione Tum4World</h3>
		<h3>Sede Legale: Via Mazzini, 34 Napoli (NA), CAP 13000, Italia</h3>
	</div>
	</div>
	<div class="text-center">
		<h1>Frasi motivazionali</h1>
		<h3 id="inject_frasi">
			Tutto quello che la mente di un uomo puo' immaginare, lo puo' ottenere.
		</h3>
		<h4 id="inject_author">
			Napoleon Hill
		</h4>
	</div>

	<div class="footer-copyright">
		<div>
			<h2 class="footer-text-center">SEGUICI</h2>
			<a href="#!">
				<img src="${pageContext.request.contextPath}/resources/img/facebook.png" alt="Facebook logo" class="footer-logo">
			</a>
			<a href="#!">
				<img src="${pageContext.request.contextPath}/resources/img/whatsapp.png" alt="WhatsApp logo" class="footer-logo">
			</a>
			<a href="#!">
				<img src="${pageContext.request.contextPath}/resources/img/instagram.png" alt="Instagram logo" class="footer-logo">
			</a>
		</div>

		<div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/cancelletto.jpg" class="logo-footer">
			</div>
			<div>
				<bold>Tum4World</bold>
			</div>
		</div>
		<div class="padd-5">
			<p>Copyright © 2023 Tum4World Corporation<br>
				<text class="text-firme-footer"> Eventuali firme qui </text>
			</p>
		</div>
	</div>
</footer>

<script>
	const frasi = [
		{
			"quote": "La vita non e' basata sul prendere e avere, e' dare e essere",
			"author": "Joel"
		},
		{
			"quote": "Sforzarsi non deve essere un successo, ma piuttosto un valore",
			"author": "Joel"
		},
		{
			"quote": "Due strade che divergono in un bosco, e io prendo quella meno trafficata, e questo e' quello che ha fatto la differenza",
			"author": "Leo"
		},
		{
			"quote": "Devo attribuire il mio successo a questo: non mi sono mai nascosto dietro scuse",
			"author": "Leo"
		},
		{
			"quote": "Hai il 100% di possibilita' di mancare il bersaglio, se neanche spari",
			"author": "Anna"
		},
		{
			"quote": "La decisione piu' difficile è di agire, il resto e' semplice tenacia.",
			"author": "Anna"
		},
		{
			"quote": "Ogni strike mi porta sempre piu' vicino al prossimo 'home run'",
			"author": "Andrea"
		},
		{
			"quote": "La definizione di uno scopo è il punto di partenza per un risultato",
			"author": "Andrea"
		},
		{
			"quote": "La vita e' quella cosa che accade mentre sei troppo impegnato a fare dei piani.",
			"author": "Sara"
		},
		{
			"quote":  "Diventiamo quello che pensiamo.",
			"author": "Sara"
		},
		{
			"quote":  "Fra vent'anni, sarai molto piu' deluso dalle cose che non hai fatto, piuttosto che da quelle che hai fatto, quindi apri le vele, viaggia lontano dai porti sicuri, prendi il buon vento. Esplora, Sogna e Scopri.",
			"author": "Joel"
		},
		{
			"quote": "La vita e' al 10% quello che mi succede e il 90% come reagisco.",
			"author": "Leo"
		},
		{
			"quote": "La cosa piu' comune per il quale le persone persono potere e' pensare di non averne.",
			"author": "Anna"
		},
		{
			"quote": "La mentalita' e' tutto. Quello a cui pensi, lo diventi.",
			"author": "Andrea"
		},
	];
	const element_to_inject = document.getElementById('inject_frasi');
	const author_to_inject = document.getElementById('inject_author');


	let counter = 1;
	const interval = 20*1000; // 20 * 1000 millisecondi

	window.setInterval(() => {
		element_to_inject.innerText = frasi[counter]["quote"];
		author_to_inject.innerText = frasi[counter]["author"];
		counter++;
	}, interval);

</script>