<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!-- FOOTER OF THE PAGE-->
	<footer>
		<!--footer del footer-->
		<div class="container container-footer">
			<div class="footer-span">
				<h1>Informazioni associazione</h1>
				<p>
					Tum4World<br>Via Mazzini, 34 <br>Napoli (NA), CAP 13000 <br>Italia
				</p>
			</div>
			<div class="footer-span footer-text-center">
				<h1>Frasi motivazionali</h1>
				<p id="inject_frasi">
					Tutto quello che la mente di un uomo può immaginare, lo può ottenere.
				</p>
				<p id="inject_author">
					Napoleon Hill
				</p>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="firme-footer">
				<span>
					<div>
						<span>
							<img src="/resources/img/cancelletto.jpg" class="logo-footer">
						</span>
						<span>
							<p> <br>Tum4World </p>
						</span>
					</div>
					<div class="padd-5">
						<p>Copyright © 2023 Tum4World Corporation<br>
							<text class="text-firme-footer"> Eventuali firme qui </text>
						</p>
					</div>
				</span>
				<span>
					<div class="centra">
						<p> SEGUICI </p>
					</div>
					<div class="container-logi-social">
						<span>
							<img src="/resources/img/facebook.png" alt="Facebook logo" class="logo">
						</span>
						<span>
							<img src="/resources/img/whatsapp.png" alt="WhatsApp logo" class="logo">
						</span>
						<span>
							<img src="/resources/img/instagram.png" alt="Instagram logo" class="logo">
						</span>
					</div>
				</span>
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
				"quote": "The most difficult thing is the decision to act, the rest is merely tenacity.",
				"author": "Amelia Earhart"
			},
			{
				"quote": "Every strike brings me closer to the next home run.",
				"author": "Babe Ruth"
			},
			{
				"quote": "Definiteness of purpose is the starting point of all achievement.",
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