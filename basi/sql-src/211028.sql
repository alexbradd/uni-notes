-- Utente (_Codice_, Nome, Cognome, Indirizzo, Telefono)
-- Prestito (_Collocazione_, _CodUtente_, _DataPrestito_, Data Resa)
-- Copia (_Collocazione_, ISBN, DataAcquisizione)
-- DatiLibro (_ISBN_, Titolo, AnnoPub, CasaEd, PrimoAut, Genere)

-- TUtti i libri acuastati nel 2010
from Copia as C, DatiLibro as D
where C.ISBN = D.ISBN
and DataAcquisizione between 1/1/2010 and 31/12/2010;

-- Quanti prestiti sono stati eseguiti nel 2018
select count(*)
from Prestito
where DataPrestito between 1/1/2018 abd 31/12/2018;

-- Quanti prestiti di libri gialli
select count(*)
from Prestito join Copia C on P.Collocazione = C.Collocazione
    join DatiLibro D on C.ISBN = D.ISBN
where Genere = "Giallo";

-- Quanti prestiti ha fatto ogni utente
select CodUtente, Nome, count(*)
from prestito P join Utente U on P.CodUtente = u.Codice
group by CodUtente, Nome;

-- Quanti diversi libri ha preso ogni utente
select CodUtente, Nome, count(distinct ISBN)
from Prestito P join Utente U on P.CodUtente = U.Codice
    join Copia C on C.Collocazione = P.Collocazione
group by CodUtente, Nome;

-- Quale è stato il primo libro acquisito dalla biblioteca
select Titolo, Collocazione, DataAcquisizione
from Copia C join DatiLibro D on C.ISBN = D.ISBN
where DataAcquisizione = (select min(DataAcquisizione) from Copia);

-- Quando è stato pubblicato il libro giallo più vecchio di ciscuna casa
-- editrice che abbia pubblicato almeno 100 gialli diversi. Usare solo i dati
-- editoriali
select CasaEd, min(AnnoPub)
from DatiLibro
Where Genere = "Giallo"
group by CasaEditrice
having count(*) >= 100;

-- Di ogni libro quanti prestiti?
select Copia.Collocazione, count(Prestito.CodUtente)
from Prestito P join Copia C on P.Collocazione = V.Collocazione
group by Copia.Collocazione;

-- Utenti che hanno preso in prestito libri di tutti i generi
Select Codice, Nome, Cognome
from Utente U join Prestito P on U.Codice = P.CodUtente
    natural join Copia natural join DatiLibro
group by Codice
having count(distinct Genere) = (select count(distinct Genere) from DatiLibro);

-- Durata media dei prestiti
select avg(DataResa - DataPrestito)
from Prestito
Where DataResa is not null;

