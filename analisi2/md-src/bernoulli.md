# Equazioni differenziali di Bernoulli

Per risolvere questo tipo di equazioni differenziali è necessario oltre a saper
derivare e integrare conoscere la formula risolutiva per le equazioni
differenziali lineari del primo ordine perché, come vedremo fra poco, le
equazioni differenziali di Bernoulli si riconducono, con un semplicissimo
artificio, ad esse.

Un'equazione di Bernoulli si presenta nella forma

$$
  y'(t) = a(t)y(t) + b(t)t^{\alpha}(t)
$$

Con $\alpha \in \mathbb{R} - \{0,1\}$. Infatti se:

- Se $\alpha = 0$ riotteniamo un'equazione differenziale lineare del primo
  ordine non omogenea della forma $y'(t) = a(t)y(t) + b(t)$
- Se $\alpha = 1$ otteniamo anche qui un'equazione differenziale lineare del
  primo ordine di forma $y'(t) = [a(t) + b(t)]y(t)$

## Come risolvere un'equazione differenziale di Bernoulli

Per risolvere le equazioni differenziali di Bernoulli eseguiamo i seguenti
passaggi:

1. Dividiamo entrami i membri per $y^{\alpha}$:

   $$
     \begin{aligned}
       \frac{y'(t)}{y^{\alpha}(t)} &= a(t)\frac{y(t)}{y^{\alpha}} + b(t) \\
         &= a(t)y^{1-\alpha}(t) + b(t)
     \end{aligned}
   $$

2. Poniamo $y^{1-\alpha}(t) = z(t)$
3. Deriviamo entrambi i membri dell'eguaglianza in (2):

   $$
     \begin{aligned}
       z'(t) &= (1-\alpha)\frac{y'(t)}{y^{\alpha}} \\
       \frac{y'(t)}{y^{\alpha}(t)} &= \frac{z'(t)}{1-\alpha}
     \end{aligned}
   $$

4. Sostituire i risultati ottenuti in (3) e (4) in (1) ottenendo:

   $$
     \underbrace{\frac{z'(t)}{1-\alpha}}_{\frac{y'(t)}{y^{\alpha}(t)} =
         \frac{z'(t)}{1-\alpha}}
     = \overbrace{a(t)z(t) + b(t)}^{y^{1-\alpha}(t) = z(t)}
   $$

   Ottenendo così un'equazione differenziale lineare non omogenea del primo
   ordine che sappiamo risolvere.

5. Una volta risolta l'equazione in $z(t)$ possiamo ritornare alla variabile
   $y(t)$ ricordandoci della sostituzione effettuata in (2).
