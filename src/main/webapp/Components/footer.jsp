<!-- FOOTER OF THE PAGE-->
<footer>
	<div class="info_DX text-center">
		<h1>Chi Siamo</h1>
		<h3>Associazione Tum4World</h3>
		<h3>Sede Legale: Via Mazzini, 34 Napoli (NA), CAP 13000, Italia</h3>
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
			<img src="${pageContext.request.contextPath}/resources/img/facebook.png" alt="Facebook logo" class="footer-social">
			<img src="${pageContext.request.contextPath}/resources/img/whatsapp.png" alt="WhatsApp logo" class="footer-social">
			<img src="${pageContext.request.contextPath}/resources/img/instagram.png" alt="Instagram logo" class="footer-social">
		</div>

		<div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" class="footer-logo">
			</div>
			<div>
				<bold>Tum4World</bold>
			</div>
		</div>
		<div class="padd-5">
			<p>Copyright © 2023 Tum4World Corporation<br>
				<text class="text-firme-footer"> Joel, Leo, Anna, Andrea, Sara </text>
			</p>
		</div>
	</div>
</footer>

<script>
	let frasi = [];
	let stateOk = true;
	const element_to_inject = document.getElementById('inject_frasi');
	const author_to_inject = document.getElementById('inject_author');

	document.addEventListener("DOMContentLoaded", () => {
		try{
			let xhr = new XMLHttpRequest();
			xhr.open('GET', 'SendnewPhrasesServlet', true);
			xhr.setRequestHeader("Content-Type", "application/json");

			xhr.onreadystatechange = () => requestOnStateChanges(xhr);

			xhr.send();

		} catch (e) {
			console.log("errore a recuperare le frasi.")
		}
	});

	const requestOnStateChanges = (xhr) => {
		try {
			if (xhr.readyState === 4 && xhr.status === 200) {
				//console.log(JSON.parse(xhr.responseText));
				console.log("Frasi ok.");
				frasi = [...JSON.parse(xhr.responseText)["pWa"]];
			}else {
				console.log("ALL:", xhr);
			}
		} catch(e) {
			console.log("CATCH Error nella richiesa xhr per gestire le frasi.");
		}
		stateOk = true;
	}

	let counter = 1;
	const interval = 20*1000; // 20 * 1000 millisecondi

	window.setInterval(() => {
		if(stateOk){
			element_to_inject.innerText = frasi[counter]["quote"];
			author_to_inject.innerText = frasi[counter]["author"];
			if(counter >= frasi.length) counter = 0;
			else counter++;
		}
	}, interval);

</script>