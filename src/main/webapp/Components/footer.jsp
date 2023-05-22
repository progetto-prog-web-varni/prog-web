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
				<img src="resources/img/facebook.png" alt="Facebook logo" class="footer-logo">
			</a>
			<a href="#!">
				<img src="resources/img/whatsapp.png" alt="WhatsApp logo" class="footer-logo">
			</a>
			<a href="#!">
				<img src="resources/img/instagram.png" alt="Instagram logo" class="footer-logo">
			</a>
		</div>

		<div>
			<div>
				<img src="resources/img/cancelletto.jpg" class="logo-footer">
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
			"quote": "La vita non è basata sul prendere e avere, è dare e essere",
			"author": "Kevin Kruse"
		},
		{
			"quote": "Sforzarsi non deve essere un successo, ma piuttosto un valore",
			"author": "Albert Einstein"
		},
		{
			"quote": "Due strade che divergono in un bosco, e io prendo quella meno trafficata, e questo è quello che ha fatto la differenza",
			"author": "Robert Frost"
		},
		{
			"quote": "Devo attribuire il mio successo a questo: non mi sono mai nascosto dietro scuse",
			"author": "Florence Nightingale"
		},
		{
			"quote": "Hai il 100% di possibilità di mancare il bersaglio, se neanche spari",
			"author": "Wayne Gretzky"
		},
		{
			"quote": "La decisione piu' difficile è di agire, il resto è semplice tenacia.",
			"author": "Amelia Earhart"
		},
		{
			"quote": "Ogni strike mi porta sempre piu' vicino al prossimo 'home run'",
			"author": "Babe Ruth"
		},
		{
			"quote": "La definizione di uno scopo è il punto di partenza per un risultato",
			"author": "W. Clement Stone"
		},
		{
			"quote": "We must balance conspicuous consumption with conscious capitalism.",
			"author": "Kevin Kruse"
		},
		{
			"quote": "Life is what happens to you while you're busy making other plans.",
			"author": "John Lennon"
		},
		{
			"quote": "We become what we think about.",
			"author": "Earl Nightingale"
		},
		{
			"quote": "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails.  Explore, Dream, Discover.",
			"author": "Mark Twain"
		},
		{
			"quote": "Life is 10% what happens to me and 90% of how I react to it.",
			"author": "Charles Swindoll"
		},
		{
			"quote": "The most common way people give up their power is by thinking they don't have any.",
			"author": "Alice Walker"
		},
		{
			"quote": "The mind is everything. What you think you become.",
			"author": "Buddha"
		},
	];
	const element_to_inject = document.getElementById('inject_frasi');
	const author_to_inject = document.getElementById('inject_author');

	let counter = 1;

	var intervalId = window.setInterval(function () {
		element_to_inject.innerText = frasi[counter]["quote"];
		author_to_inject.innerText = frasi[counter]["author"];
		counter++;
	}, 5000);

</script>