# Programmazione WEB - Varni

> Corso di introduzione alla Programmazione Web, Professoressa Varni.

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
  
> NOTE: il deploy su docker non funziona con derby. Sarebbe da testare con un ambiente di Windows-in-docker, ma non essendo
> lo scopo finale del progetto questa sezione di modifiche viene abbandonata.

## Organizzazione Della Repo

- Primo livello: file di configurazione e script.
- `src`: contiene tutto il codice necessario a runnare il progetto. (Organizzato in pattern: MVC)
  - `src.main.Controllers`: Contiene i controllers
  - `src.main.Model`: Contiene i modelli
  - `src.main.resources`: Default directory per le risorse statiche
  - `src.main.webapp`: Contiene le pagine web.

Tutto il compilato viene incluso nella cartella `target`, che è esclusa attraverso il `.gitignore`.

Il database, con i relativi schemi e dati in esso presenti, sono tutti inseriti nel file `default.sql`, nella root del progetto.
Tutte le dipendenze sono risolte attraverso maven, oppure descritte nel file del progetto su IntelliJ.

## Possible Improvements

There are some improvements possible:

- Security:
  - All the database passwords are in-clear. If there is the possibility, runs over hash.
  - All the env variables are in-clear. It would be better to get them from the environment context.
- Database:
  - the connection handling is not the best solutions. Opening/Closing all this time the application could result
  in a performance loss. There is a better solution, called database [connection pooling](https://www.baeldung.com/java-connection-pooling)
  - There are a lot of in-place SQL statements. There are better solutions, like a function wrapper to make low level usage
  in conjunction with externalizing to function resident in the Model package.
- `CouterFilter`: need a methods to automatically understand where is the correct endpoint,so can automatically log every
  page request.
- `error.jsp`: do not exists.
