-- Utente (_Codice_, Nome, Cognome, Indirizzo, Telefono)
-- Prestito (_Collocazione_, _CodUtente_, _DataPrestito_, Data Resa)
-- Copia (_Collocazione_, ISBN, DataAcquisizione)
-- DatiLibro (_ISBN_, Titolo, AnnoPub, CasaEd, PrimoAut, Genere)

-- Individuare per ogni genere il libro acquisito per primo
select Titolo, Collocazione, Genere, DataAcquisizione
from Copia C1 join DatiLibro D1 on C1.ISBN = D1.ISBN
where DataAcquisizione = (
  select min(DataAcquisizione)
  from Copia C2 join DatiLibro D2 on C2.ISBN = D2.ISBN
  where D2.Genere = D1.Genere);

create view PrimoDiOgniGenere(gen, data) as (
  select Genere, DataAcquisizione
  from Copia C2 join DatiLibro D2 on C2.ISBN = D2.ISBN
  group by Genere);
select Titolo, Collocazione, Genere, DataAcquisizione
from Copia natural join DatiLibro
    join PrimoDiOgniGenere on (Genere, DataAcquisizione) = (gen, data);

-- Quando è stato pubblicato il libro giallo più vecchio che sia di una casa
-- editrice di cui la biblioteca ha almeno 100 libri diversi
select min(AnnoPub)
from DatiLibro
Where Genere = "Giallo"
Where CasaEd in (
  select CasaEd
  from DatiLibro join Copia
  group by CasaEd
  having count(distinct ISBN) >= 100);

-- Il libro più prestato di ogni genere
select Collocazione, count(*)
from Prestito P
    join Copia C on P.Collocazione = C.Collocazione
    join DatiLibro D1 on D.ISBN = C.ISBN
group by Collocazione, Genere
having count(*) >= all (
  select count(*)
  from Prestito P1
      join Copia C1 on P1.Collocazione = C1.Collocazione
      join DatiLibro D1 on D1.ISBN = C1.ISBN
  group by Collocazione);

-- Utenti che ahnno preso in prestito nello stesso giorno 3 o più libri diversi,
-- ma tutti dello stesso genere
select CodUtente
from Pretito P
    join Copia C on C.Collocazione = P.Collocazione
    join DatiLibro D on D.ISBN = C.ISBN
group by CodUtente, Genere, DataPrestito
having count(distinct ISBN) >= 3;

