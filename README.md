# uni-notes
Appunti delle lezioni. Sono presi in markdown. Il riassunto finale è scritto
in latex ed è contenuto nella cartella `[corso]/latex`. Ogni corso ha la
sua cartella.

## Programmi necessari:
- `gcc`: Fondamenti di Informatica
- `clean`: make dependency
- `pdflatex`: make dependency
- `make`: Compilazione latex

## Nomenclatura
Gli appunti di ogni giorno hanno nome `ddmmaa.md` dove: `dd` è il giorno della
lezione, `mm` è il mese in cifre (1 based) e `aa` sono le ultime due cifre 
dell'anno.

Ogni settimana gli appunti vengono raccolti in un unico file chiamato
`dd_d'd'_mmaa.md` dove `dd` è il giorno di inizio della raccolta, `d'd'` è il
giorno di fine della raccolta, `mm` è il mese in cifre (1 based) e `aa` sono le
ultime due cifre dell'anno.

Le note raccolte sono eliminate dalla repo, ma mantenute in locale nella cartella
`old-notes` di ciascun corso, ignorata dal `.gitignore`.

## Best Practices
Inizia il file con

    # giorno per esteso

In modo da rendere facile la lettura delle raccolte. Riserva `#` solo per il
giorno, usa headings da `##` in su.
