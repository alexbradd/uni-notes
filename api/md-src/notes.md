# Appunti di algoritmi e principi dell'informatica

## I modelli

I modelli sono fondamentali nell'ingegneria. I modelli sono talvolta fisici e
spesso sono modelli formali, ossia oggetti matematici che fungono da
rappresentazioni astratte di entità reali complesse. Un modello è adeguato se i
risultati ottenuti riflettono le proprietà che ci interessano del sistema
fisico entro i limiti della nostra approssimazione.

Le fasi dell'ingegneria del software ricalcano quelli della modellizzazione di
un problema:

- Analisi dei requisiti - specifica
- Progetto - architettura del software
- Implementazione - scrittura del codice.

I modelli dell'informatica si basano principalmente sulla
matematica discreta.

I sistemi informatici hanno 2 requisiti fondamentali:

1. Generalità: adatti ad un contesto ampio di utilizzi
2. Flessibilità: possibilità di adattare un modello esistente a nuove esigenze

Dividiamo i modelli in due tipi:

- Modelli operazionali: basati sul concetto di stato e di meccanismi per la sua
  evoluzione. Esempio: "Calcola il minimo e mettilo al primo posto"
- Modelli descrittivi: tesi a formulare le proprietà desiderato o temute del
  sistema piuttosto che del suo funzionamento.  Esempio: "Individua una
  permutazione della sequenza data che $\forall i a[i] \leq a[i+1]$"

Le differenze tra questi due tipi di modellizzazione non sono spesso molto ben
definite.

## I linguaggi

Il meta-modello fondamentale che useremo sarà il linguaggio. Il termine
linguaggio è un termine che conosciamo già ed è utilizzabile a diversi ambiti
diversi come la linguistica, l'informatica, la grafica e la musica.

### Gli elementi di un linguaggio

Il primo elemento formale di un linguaggio è l'alfabeto o vocabolario. In
matematica essi sono sinonimi anche se in italiano naturale non lo sono.

#### Definizione - Alfabeto

Si dice alfabeto un insieme finito $A$ di simboli base.

Una volta definito il concetto di alfabeto possiamo definire la stringa.

#### Definizione - Stringa

Si dice stringa una sequenza ordinata e finita di elementi dell'alfabeto $A$.

Naturalmente possiamo definire la lunghezza della stringa $|a|$ come il numero
di caratteri all'interno. Indichiamo come stringa nulla
$\epsilon : |\epsilon| = 0$. Con la notazione $A*$ intendiamo l'insieme di tutte
le stringhe scrivibili con un certo alfabeto.

Sulle stringhe definiamo l'operazione di concatenazione $.$. La concatenazione e
associativa e non commutativa. Definita questa operazione, possiamo allora
definire il monoide libero $<A*, .>$ con elemento neutro $\epsilon$.

Possiamo finalmente definire il linguaggio.

#### Definizione - Linguaggio

Chiamiamo un linguaggio un insieme $L$ tale che: $L \subseteq A*$.

Notiamo che $L$ può essere anche infinito. Poiché $L$ è un insieme, allora tutte
le operazioni insiemistiche sono ben definite. Inoltre è anche definibile la
concatenazione tra due linguaggi diversi:
$L_1 . L_2 = \{ x.y | x \in L_1, y \in L_2 \}$.

