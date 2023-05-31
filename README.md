# Programmazione WEB - Varni

Autori:
@giovannifoletto
@EddieVeronese
@AlbertoDB20

## Funzionamento con Makefile e Docker

Per installare docker: `make docker-install`.
Se si dispone sistema Windows, probabilmente darà problemi, richiederà WSL 
e un installazione manuale sarà richiesta. In questo caso si consiglia di avere
l'ultima versione di `docker compose`, oppure aggiungere `old` ogni volta. 
**Fare riferimento al Makefile in quel caso**.

Altri comandi utili:
- `make docker-run`: runnare il container docker, con preimpostato in progetto.
  - Perché questa funzionalità funzioni, si deve compilare il progetto attraverso IntelliJ IDEA.
  - Ogni volta che si esegue una modifica, semplicemente rifare il `Build Artifacts`.
- `make docker-run-no-detach`: permette di eseguire quanto sopra, ma passano tutti i log a terminale.
- `make docker-update`: permette di aggiornare l'immagine docker e rilanciare tutti i servizi.
- `make docker-old-run`: permette di eseguire `make docker-run` sopra con una vecchia versione di `compose`.
- `make docker-install`: comando che scarica il commodity-script per docker e lo esegue. Non credo funzioni su Windows, 
  ma non è testato.

## Organizzazione Della Repo

- Primo livello: file di configurazione e script.
- `src`: contiene tutto il codice necessario a runnare il progetto. (Organizzato in pattern: MVC)
  - `src.main.Controllers`: Contiene i controllers
  - `src.main.Model`: Contiene i modelli
  - `src.main.resources`: Default directory per le risorse statiche
  - `src.main.webapp`: Contiene le pagine web.

Tutto il compilato viene incluso nella cartella `target`, che è esclusa attraverso il `.gitignore`.

## TESTING METHODOLOGY

- codice bene
- ogni tanto un sacco di codice che non faceva nulla, rimosso
- ogni tanto nomi dati a cose non proprimente comprensibile "MyCustomForm (?)"
- non c'è molta divisione dei componenti, nel senso che tutto è all'interno dello stesso div/span (usare span non mi piace troppo, quindi ho rimosso, nonostante ci siano due scuole di pensiero)
- le informazioni più importanti vanno nelle scritte più grandi
- lo stile ogni tanto non è consistente (il bottone blu perché non lo hai usato ovunque ?)
- quando bisogna centrare tante cose, meglio usare grid

TODO: 

- [ ] pagina delle singole attività, pagina delle attività tutte da rifare, troppo poco leggibile.
  - [ ] si aggiunga un bottone alla fine di ogni piccola presentazione dove poter acceder la primaria
  - [ ] creare pagine "figlie" con ogni attività nello specifico

- [ ] Capire Perché non funziona lo shadow del **signup**, oppure renderlo coerente con il contatto, quindi con il contorno blu

# Derby

Docs: [HERE](https://db.apache.org/derby/papers/DerbyTut/ij_intro.html).

Interactive SQL shell.
```bash
java org.apache.derby.tools.ij
```

## Eddie

Models nella parte di Servlet forse?
