-- Squadra (_Nazione_, _Anno_, Allenatore, PosizioneInClassifica)
-- Organizzazione (_Anno_, Nazione)
-- Giocatore (_ID_, Nome)
-- Partecipazione (_IDGioc_, _Anno_, Nazione, Ruolo, GoalFatti)

-- Scrivere il comando SQL per creare la tabella PARTECIPAZIONE
create table Partecipazione(
  IDGiocatore integer references Giocatore(ID)
    on delete no action
    on update cascade,
  Anno integer > 1990,
  Nazione varchar(32),
  GoalFatti integer >= 0,

  primary key (IDGiocatore, Anno),
  foreign key (Anno, Nazione) references Squadra(Anno, Nazione)
    on delete no action
    on update cascade
);

-- estrarre il nome delle nazioni che hanno vinto i mondiali da loro organizzati
select S.Nazioni
from Squadra S join Organizzazione O on S.Nazione = O.Nazione
where S.Anno = O.Anno
and PosizioneInClassifica = 1;

-- estrarre il nome delle nazioni che non hanno mai vinto un mondiale da loro
-- organizzato
select Nazione
from Organizzazione
  except
select S.Nazione
from Squadra S join Organizzazione O on S.Nazione = O.Nazione
where S.Anno = O.Anno
and PosizioneInClassifica = 1;

-- estrarre il nome delle nazioni che non hanno mai vinto il mondiale da loro
-- organizzato
select S.Nazione
from Squadra S join Organizzazione O on (S.Nazione, S.Ano) = (O.Nazione, O.Anno)
group by S.Nazione
having min(Posizione) > 1;

-- determinare, per ogni campionato mondiale, la Nazionale che ha convocato il
-- numero più elevato di attaccanti
select Anno, Nazione, count(*) as Attaccanti
from Partecipazione P
where Ruolo = "Attaccante"
group by Anno, Nazione
having count(*) >= all (select count(*)
                          from Partecipazione
                          where Ruolo = "Attaccante"
                          and Anno = P.Anno
                          group by Nazione);

-- estrarre i nomi dei giocatori che hanno partecipato a 3 editzioni diverse del
-- mondiale oppure che hanno partecipato con più di una nazione
select G.Nome
from Partecipazione P join Giocatore G on P.IDGiocatore = G.ID
group by IDGiocatore
having count(*) = 3
or count(distinct Nazione) > 1;

-- -----------------------------------------------------------------------------
-- Car (_PlateNo_, Year, Model, Manufacturer, NumSeats)
-- Employee (_BadgeNo_, Name, Surname, BirthDate, Level, Email, Phone)
-- Usage (_PlateNo_, BadgeNo, _Date_, _StartTime_, EndTime)
-- Ticker (_PlateNo_, _Date_, _Time_, Amount, Description)

-- estrarre nome e cognome dell'impiegato che nel 2018 ha ricevuto multe con
-- l'ammontare massimo di tutta l'azienda
create view AmountTicket2018(BadgeNo, Sum) as
  (select BadgeNo, sum(Amount)
    from Usage U join Ticket T on (U.PlateNo, U.Date) = (T.PlateNo, T.Date)
    where T.Time between U.StartTIme and E.EndTime
    and year(U.Date) = 2018
    group by BadgeNo);

select Name, Surname
from Employee
where BadgeNo in (select BadgeNo
                    from AmountTicket2018
                    where Sum = (select max(Somma) from AmountTicket2018);
