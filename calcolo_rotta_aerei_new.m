%% CALCOLO ROTTA TRA AEROPORTI

clear all; close all; clc;

% ========== DATABASE AEROPORTI ==========
% Struttura: nome, codice IATA, latitudine, longitudine, città, nazione
aeroporti = struct();

% Italia
aeroporti(1).nome = 'Leonardo da Vinci';
aeroporti(1).iata = 'FCO';
aeroporti(1).lat = 41.8002;
aeroporti(1).lon = 12.2539;
aeroporti(1).citta = 'Roma';
aeroporti(1).nazione = 'Italia';

aeroporti(2).nome = 'Malpensa';
aeroporti(2).iata = 'MXP';
aeroporti(2).lat = 45.6306;
aeroporti(2).lon = 8.7281;
aeroporti(2).citta = 'Milano';
aeroporti(2).nazione = 'Italia';

aeroporti(3).nome = 'Marco Polo';
aeroporti(3).iata = 'VCE';
aeroporti(3).lat = 45.5053;
aeroporti(3).lon = 12.3519;
aeroporti(3).citta = 'Venezia';
aeroporti(3).nazione = 'Italia';

aeroporti(4).nome = 'Capodichino';
aeroporti(4).iata = 'NAP';
aeroporti(4).lat = 40.8861;
aeroporti(4).lon = 14.2906;
aeroporti(4).citta = 'Napoli';
aeroporti(4).nazione = 'Italia';

aeroporti(5).nome = 'Fontanarossa';
aeroporti(5).iata = 'CTA';
aeroporti(5).lat = 37.4667;
aeroporti(5).lon = 15.0667;
aeroporti(5).citta = 'Catania';
aeroporti(5).nazione = 'Italia';

% Europa
aeroporti(6).nome = 'Charles de Gaulle';
aeroporti(6).iata = 'CDG';
aeroporti(6).lat = 49.0097;
aeroporti(6).lon = 2.5479;
aeroporti(6).citta = 'Parigi';
aeroporti(6).nazione = 'Francia';

aeroporti(7).nome = 'Barcellona-El Prat';
aeroporti(7).iata = 'BCN';
aeroporti(7).lat = 41.2974;
aeroporti(7).lon = 2.0833;
aeroporti(7).citta = 'Barcellona';
aeroporti(7).nazione = 'Spagna';

aeroporti(8).nome = 'Heathrow';
aeroporti(8).iata = 'LHR';
aeroporti(8).lat = 51.4700;
aeroporti(8).lon = -0.4543;
aeroporti(8).citta = 'Londra';
aeroporti(8).nazione = 'Regno Unito';

aeroporti(9).nome = 'Schiphol';
aeroporti(9).iata = 'AMS';
aeroporti(9).lat = 52.3086;
aeroporti(9).lon = 4.7639;
aeroporti(9).citta = 'Amsterdam';
aeroporti(9).nazione = 'Olanda';

aeroporti(10).nome = 'Francoforte';
aeroporti(10).iata = 'FRA';
aeroporti(10).lat = 50.0379;
aeroporti(10).lon = 8.5622;
aeroporti(10).citta = 'Francoforte';
aeroporti(10).nazione = 'Germania';

aeroporti(11).nome = 'Madrid-Barajas';
aeroporti(11).iata = 'MAD';
aeroporti(11).lat = 40.4719;
aeroporti(11).lon = -3.5626;
aeroporti(11).citta = 'Madrid';
aeroporti(11).nazione = 'Spagna';

aeroporti(12).nome = 'Vienna International';
aeroporti(12).iata = 'VIE';
aeroporti(12).lat = 48.1103;
aeroporti(12).lon = 16.5697;
aeroporti(12).citta = 'Vienna';
aeroporti(12).nazione = 'Austria';

aeroporti(13).nome = 'Zurigo';
aeroporti(13).iata = 'ZRH';
aeroporti(13).lat = 47.4647;
aeroporti(13).lon = 8.5492;
aeroporti(13).citta = 'Zurigo';
aeroporti(13).nazione = 'Svizzera';

aeroporti(14).nome = 'Monaco';
aeroporti(14).iata = 'MUC';
aeroporti(14).lat = 48.3538;
aeroporti(14).lon = 11.7861;
aeroporti(14).citta = 'Monaco';
aeroporti(14).nazione = 'Germania';

aeroporti(15).nome = 'Bruxelles-Zaventem';
aeroporti(15).iata = 'BRU';
aeroporti(15).lat = 50.9010;
aeroporti(15).lon = 4.4844;
aeroporti(15).citta = 'Bruxelles';
aeroporti(15).nazione = 'Belgio';

% Medio Oriente e Africa
aeroporti(16).nome = 'Dubai International';
aeroporti(16).iata = 'DXB';
aeroporti(16).lat = 25.2528;
aeroporti(16).lon = 55.3645;
aeroporti(16).citta = 'Dubai';
aeroporti(16).nazione = 'Emirati Arabi Uniti';

aeroporti(17).nome = 'Sheremetyevo';
aeroporti(17).iata = 'SVO';
aeroporti(17).lat = 55.9728;
aeroporti(17).lon = 37.4146;
aeroporti(17).citta = 'Mosca';
aeroporti(17).nazione = 'Russia';

aeroporti(18).nome = 'Atene-Eleftherios Venizelos';
aeroporti(18).iata = 'ATH';
aeroporti(18).lat = 37.9364;
aeroporti(18).lon = 23.9445;
aeroporti(18).citta = 'Atene';
aeroporti(18).nazione = 'Grecia';

% Asia
aeroporti(19).nome = 'Narita';
aeroporti(19).iata = 'NRT';
aeroporti(19).lat = 35.7653;
aeroporti(19).lon = 140.3926;
aeroporti(19).citta = 'Tokyo';
aeroporti(19).nazione = 'Giappone';

aeroporti(20).nome = 'Hong Kong';
aeroporti(20).iata = 'HKG';
aeroporti(20).lat = 22.3193;
aeroporti(20).lon = 113.9150;
aeroporti(20).citta = 'Hong Kong';
aeroporti(20).nazione = 'Hong Kong';

aeroporti(21).nome = 'Changi';
aeroporti(21).iata = 'SIN';
aeroporti(21).lat = 1.3521;
aeroporti(21).lon = 103.8198;
aeroporti(21).citta = 'Singapore';
aeroporti(21).nazione = 'Singapore';

aeroporti(22).nome = 'Suvarnabhumi';
aeroporti(22).iata = 'BKK';
aeroporti(22).lat = 13.6900;
aeroporti(22).lon = 100.7501;
aeroporti(22).citta = 'Bangkok';
aeroporti(22).nazione = 'Tailandia';

aeroporti(23).nome = 'Indira Gandhi International';
aeroporti(23).iata = 'DEL';
aeroporti(23).lat = 28.5562;
aeroporti(23).lon = 77.1000;
aeroporti(23).citta = 'Delhi';
aeroporti(23).nazione = 'India';

aeroporti(24).nome = 'Incheon';
aeroporti(24).iata = 'ICN';
aeroporti(24).lat = 37.4602;
aeroporti(24).lon = 126.4407;
aeroporti(24).citta = 'Seoul';
aeroporti(24).nazione = 'Corea del Sud';

aeroporti(25).nome = 'Capital International';
aeroporti(25).iata = 'PEK';
aeroporti(25).lat = 40.0801;
aeroporti(25).lon = 116.5847;
aeroporti(25).citta = 'Pechino';
aeroporti(25).nazione = 'Cina';

aeroporti(26).nome = 'Pudong';
aeroporti(26).iata = 'SHA';
aeroporti(26).lat = 31.1434;
aeroporti(26).lon = 121.8050;
aeroporti(26).citta = 'Shanghai';
aeroporti(26).nazione = 'Cina';

% America
aeroporti(27).nome = 'John F. Kennedy';
aeroporti(27).iata = 'JFK';
aeroporti(27).lat = 40.6413;
aeroporti(27).lon = -73.7781;
aeroporti(27).citta = 'New York';
aeroporti(27).nazione = 'USA';

aeroporti(28).nome = 'Los Angeles';
aeroporti(28).iata = 'LAX';
aeroporti(28).lat = 33.9425;
aeroporti(28).lon = -118.4081;
aeroporti(28).citta = 'Los Angeles';
aeroporti(28).nazione = 'USA';

aeroporti(29).nome = 'São Paulo Guarulhos';
aeroporti(29).iata = 'GRU';
aeroporti(29).lat = -23.4356;
aeroporti(29).lon = -46.4731;
aeroporti(29).citta = 'São Paulo';
aeroporti(29).nazione = 'Brasile';

aeroporti(30).nome = 'O''Hare International';
aeroporti(30).iata = 'ORD';
aeroporti(30).lat = 41.9742;
aeroporti(30).lon = -87.9073;
aeroporti(30).citta = 'Chicago';
aeroporti(30).nazione = 'USA';

aeroporti(31).nome = 'Hartsfield-Jackson Atlanta';
aeroporti(31).iata = 'ATL';
aeroporti(31).lat = 33.6407;
aeroporti(31).lon = -84.4277;
aeroporti(31).citta = 'Atlanta';
aeroporti(31).nazione = 'USA';

aeroporti(32).nome = 'Dallas/Fort Worth';
aeroporti(32).iata = 'DFW';
aeroporti(32).lat = 32.8975;
aeroporti(32).lon = -97.0382;
aeroporti(32).citta = 'Dallas';
aeroporti(32).nazione = 'USA';

aeroporti(33).nome = 'Miami International';
aeroporti(33).iata = 'MIA';
aeroporti(33).lat = 25.7959;
aeroporti(33).lon = -80.2870;
aeroporti(33).citta = 'Miami';
aeroporti(33).nazione = 'USA';

aeroporti(34).nome = 'San Francisco Bay Area';
aeroporti(34).iata = 'SFO';
aeroporti(34).lat = 37.6213;
aeroporti(34).lon = -122.3790;
aeroporti(34).citta = 'San Francisco';
aeroporti(34).nazione = 'USA';

aeroporti(35).nome = 'Boston Logan';
aeroporti(35).iata = 'BOS';
aeroporti(35).lat = 42.3656;
aeroporti(35).lon = -71.0096;
aeroporti(35).citta = 'Boston';
aeroporti(35).nazione = 'USA';

aeroporti(36).nome = 'Toronto Pearson';
aeroporti(36).iata = 'YYZ';
aeroporti(36).lat = 43.6772;
aeroporti(36).lon = -79.6306;
aeroporti(36).citta = 'Toronto';
aeroporti(36).nazione = 'Canada';

aeroporti(37).nome = 'Vancouver';
aeroporti(37).iata = 'YVR';
aeroporti(37).lat = 49.1900;
aeroporti(37).lon = -123.1794;
aeroporti(37).citta = 'Vancouver';
aeroporti(37).nazione = 'Canada';

% Regioni Polari e Artiche
aeroporti(38).nome = 'Ted Stevens Anchorage';
aeroporti(38).iata = 'ANC';
aeroporti(38).lat = 61.2219;
aeroporti(38).lon = -149.9003;
aeroporti(38).citta = 'Anchorage';
aeroporti(38).nazione = 'USA (Alaska)';

aeroporti(39).nome = 'Keflavík International';
aeroporti(39).iata = 'KEF';
aeroporti(39).lat = 63.9850;
aeroporti(39).lon = -22.6056;
aeroporti(39).citta = 'Reykjavík';
aeroporti(39).nazione = 'Islanda';

aeroporti(40).nome = 'Tromsø Airport';
aeroporti(40).iata = 'TOS';
aeroporti(40).lat = 69.6422;
aeroporti(40).lon = 19.0187;
aeroporti(40).citta = 'Tromsø';
aeroporti(40).nazione = 'Norvegia';

aeroporti(41).nome = 'Murmansk Aeroflot';
aeroporti(41).iata = 'MRV';
aeroporti(41).lat = 68.7883;
aeroporti(41).lon = 32.7503;
aeroporti(41).citta = 'Murmansk';
aeroporti(41).nazione = 'Russia';

aeroporti(42).nome = 'Naryan-Mar';
aeroporti(42).iata = 'NRL';
aeroporti(42).lat = 67.6395;
aeroporti(42).lon = 53.0067;
aeroporti(42).citta = 'Naryan-Mar';
aeroporti(42).nazione = 'Russia';

aeroporti(43).nome = 'Nuuk Airport';
aeroporti(43).iata = 'GOH';
aeroporti(43).lat = 64.1717;
aeroporti(43).lon = -51.6839;
aeroporti(43).citta = 'Nuuk';
aeroporti(43).nazione = 'Groenlandia';

aeroporti(44).nome = 'Sondre Strømfjord';
aeroporti(44).iata = 'SFJ';
aeroporti(44).lat = 67.0122;
aeroporti(44).lon = -50.7114;
aeroporti(44).citta = 'Sondre Strømfjord';
aeroporti(44).nazione = 'Groenlandia';

aeroporti(45).nome = 'Inuvik Mike Zubko';
aeroporti(45).iata = 'INK';
aeroporti(45).lat = 68.3045;
aeroporti(45).lon = -133.4729;
aeroporti(45).citta = 'Inuvik';
aeroporti(45).nazione = 'Canada';

aeroporti(46).nome = 'Yellowknife';
aeroporti(46).iata = 'YZF';
aeroporti(46).lat = 62.4622;
aeroporti(46).lon = -114.4400;
aeroporti(46).citta = 'Yellowknife';
aeroporti(46).nazione = 'Canada';

aeroporti(47).nome = 'Barrow Wiley Post-Will Rogers';
aeroporti(47).iata = 'BRW';
aeroporti(47).lat = 71.2854;
aeroporti(47).lon = -156.7660;
aeroporti(47).citta = 'Barrow';
aeroporti(47).nazione = 'USA (Alaska)';

aeroporti(48).nome = 'Hammerfest';
aeroporti(48).iata = 'HFT';
aeroporti(48).lat = 70.2764;
aeroporti(48).lon = 23.6397;
aeroporti(48).citta = 'Hammerfest';
aeroporti(48).nazione = 'Norvegia';

aeroporti(49).nome = 'Longyearbyen';
aeroporti(49).iata = 'LYR';
aeroporti(49).lat = 78.2232;
aeroporti(49).lon = 15.4650;
aeroporti(49).citta = 'Longyearbyen';
aeroporti(49).nazione = 'Norvegia (Svalbard)';

aeroporti(50).nome = 'Arkhangelsk';
aeroporti(50).iata = 'ARH';
aeroporti(50).lat = 64.5707;
aeroporti(50).lon = 40.6950;
aeroporti(50).citta = 'Arkhangelsk';
aeroporti(50).nazione = 'Russia';

% Medio Oriente - aeroporti aggiuntivi
aeroporti(51).nome = 'Hamad International';
aeroporti(51).iata = 'DOH';
aeroporti(51).lat = 25.2732;
aeroporti(51).lon = 51.6082;
aeroporti(51).citta = 'Doha';
aeroporti(51).nazione = 'Qatar';

aeroporti(52).nome = 'Abu Dhabi International';
aeroporti(52).iata = 'AUH';
aeroporti(52).lat = 24.4330;
aeroporti(52).lon = 54.6511;
aeroporti(52).citta = 'Abu Dhabi';
aeroporti(52).nazione = 'Emirati Arabi Uniti';

aeroporti(53).nome = 'Istanbul Airport';
aeroporti(53).iata = 'IST';
aeroporti(53).lat = 41.2753;
aeroporti(53).lon = 28.7519;
aeroporti(53).citta = 'Istanbul';
aeroporti(53).nazione = 'Turchia';

aeroporti(54).nome = 'Ben Gurion';
aeroporti(54).iata = 'TLV';
aeroporti(54).lat = 32.0114;
aeroporti(54).lon = 34.8867;
aeroporti(54).citta = 'Tel Aviv';
aeroporti(54).nazione = 'Israele';

aeroporti(55).nome = 'King Khalid International';
aeroporti(55).iata = 'RUH';
aeroporti(55).lat = 24.9577;
aeroporti(55).lon = 46.6988;
aeroporti(55).citta = 'Riyadh';
aeroporti(55).nazione = 'Arabia Saudita';

% Russia - aeroporti aggiuntivi
aeroporti(56).nome = 'Pulkovo';
aeroporti(56).iata = 'LED';
aeroporti(56).lat = 59.8003;
aeroporti(56).lon = 30.2625;
aeroporti(56).citta = 'San Pietroburgo';
aeroporti(56).nazione = 'Russia';

aeroporti(57).nome = 'Tolmachevo';
aeroporti(57).iata = 'OVB';
aeroporti(57).lat = 55.0126;
aeroporti(57).lon = 82.6507;
aeroporti(57).citta = 'Novosibirsk';
aeroporti(57).nazione = 'Russia';

aeroporti(58).nome = 'Koltsovo';
aeroporti(58).iata = 'SVX';
aeroporti(58).lat = 56.7431;
aeroporti(58).lon = 60.8027;
aeroporti(58).citta = 'Ekaterinburg';
aeroporti(58).nazione = 'Russia';

aeroporti(59).nome = 'Vladivostok International';
aeroporti(59).iata = 'VVO';
aeroporti(59).lat = 43.3989;
aeroporti(59).lon = 132.1483;
aeroporti(59).citta = 'Vladivostok';
aeroporti(59).nazione = 'Russia';

% Sud America - aeroporti aggiuntivi
aeroporti(60).nome = 'Galeão International';
aeroporti(60).iata = 'GIG';
aeroporti(60).lat = -22.8100;
aeroporti(60).lon = -43.2505;
aeroporti(60).citta = 'Rio de Janeiro';
aeroporti(60).nazione = 'Brasile';

aeroporti(61).nome = 'Ezeiza International';
aeroporti(61).iata = 'EZE';
aeroporti(61).lat = -34.8222;
aeroporti(61).lon = -58.5358;
aeroporti(61).citta = 'Buenos Aires';
aeroporti(61).nazione = 'Argentina';

aeroporti(62).nome = 'Jorge Chávez International';
aeroporti(62).iata = 'LIM';
aeroporti(62).lat = -12.0219;
aeroporti(62).lon = -77.1143;
aeroporti(62).citta = 'Lima';
aeroporti(62).nazione = 'Perù';

aeroporti(63).nome = 'Arturo Merino Benítez';
aeroporti(63).iata = 'SCL';
aeroporti(63).lat = -33.3930;
aeroporti(63).lon = -70.7858;
aeroporti(63).citta = 'Santiago';
aeroporti(63).nazione = 'Cile';

aeroporti(64).nome = 'El Dorado International';
aeroporti(64).iata = 'BOG';
aeroporti(64).lat = 4.7016;
aeroporti(64).lon = -74.1469;
aeroporti(64).citta = 'Bogotá';
aeroporti(64).nazione = 'Colombia';

aeroporti(65).nome = 'Simón Bolívar International';
aeroporti(65).iata = 'CCS';
aeroporti(65).lat = 10.6013;
aeroporti(65).lon = -66.9911;
aeroporti(65).citta = 'Caracas';
aeroporti(65).nazione = 'Venezuela';

n_aeroporti = length(aeroporti);

% Assegnazione regioni geografiche per ogni aeroporto
% Italia (1-5)
aeroporti(1).regione = 'Italia';
aeroporti(2).regione = 'Italia';
aeroporti(3).regione = 'Italia';
aeroporti(4).regione = 'Italia';
aeroporti(5).regione = 'Italia';

% Europa (6-15, 18)
aeroporti(6).regione = 'Europa';   % Parigi
aeroporti(7).regione = 'Europa';   % Barcellona
aeroporti(8).regione = 'Europa';   % Londra
aeroporti(9).regione = 'Europa';   % Amsterdam
aeroporti(10).regione = 'Europa';  % Francoforte
aeroporti(11).regione = 'Europa';  % Madrid
aeroporti(12).regione = 'Europa';  % Vienna
aeroporti(13).regione = 'Europa';  % Zurigo
aeroporti(14).regione = 'Europa';  % Monaco
aeroporti(15).regione = 'Europa';  % Bruxelles
aeroporti(18).regione = 'Europa';  % Atene

% Medio Oriente (16)
aeroporti(16).regione = 'Medio Oriente';  % Dubai

% Russia (17)
aeroporti(17).regione = 'Russia';  % Mosca

% Asia (19-26)
aeroporti(19).regione = 'Asia';  % Tokyo
aeroporti(20).regione = 'Asia';  % Hong Kong
aeroporti(21).regione = 'Asia';  % Singapore
aeroporti(22).regione = 'Asia';  % Bangkok
aeroporti(23).regione = 'Asia';  % Delhi
aeroporti(24).regione = 'Asia';  % Seoul
aeroporti(25).regione = 'Asia';  % Pechino
aeroporti(26).regione = 'Asia';  % Shanghai

% Nord America (27-28, 30-37)
aeroporti(27).regione = 'Nord America';  % New York
aeroporti(28).regione = 'Nord America';  % Los Angeles
aeroporti(30).regione = 'Nord America';  % Chicago
aeroporti(31).regione = 'Nord America';  % Atlanta
aeroporti(32).regione = 'Nord America';  % Dallas
aeroporti(33).regione = 'Nord America';  % Miami
aeroporti(34).regione = 'Nord America';  % San Francisco
aeroporti(35).regione = 'Nord America';  % Boston
aeroporti(36).regione = 'Nord America';  % Toronto
aeroporti(37).regione = 'Nord America';  % Vancouver

% Sud America (29)
aeroporti(29).regione = 'Sud America';  % São Paulo

% Regioni Polari e Artiche (38-50)
aeroporti(38).regione = 'Regioni Polari';  % Anchorage
aeroporti(39).regione = 'Regioni Polari';  % Reykjavík
aeroporti(40).regione = 'Regioni Polari';  % Tromsø
aeroporti(41).regione = 'Regioni Polari';  % Murmansk
aeroporti(42).regione = 'Regioni Polari';  % Naryan-Mar
aeroporti(43).regione = 'Regioni Polari';  % Nuuk
aeroporti(44).regione = 'Regioni Polari';  % Sondre Strømfjord
aeroporti(45).regione = 'Regioni Polari';  % Inuvik
aeroporti(46).regione = 'Regioni Polari';  % Yellowknife
aeroporti(47).regione = 'Regioni Polari';  % Barrow
aeroporti(48).regione = 'Regioni Polari';  % Hammerfest
aeroporti(49).regione = 'Regioni Polari';  % Longyearbyen
aeroporti(50).regione = 'Regioni Polari';  % Arkhangelsk

% Medio Oriente (51-55)
aeroporti(51).regione = 'Medio Oriente';  % Doha
aeroporti(52).regione = 'Medio Oriente';  % Abu Dhabi
aeroporti(53).regione = 'Medio Oriente';  % Istanbul
aeroporti(54).regione = 'Medio Oriente';  % Tel Aviv
aeroporti(55).regione = 'Medio Oriente';  % Riyadh

% Russia (56-59)
aeroporti(56).regione = 'Russia';  % San Pietroburgo
aeroporti(57).regione = 'Russia';  % Novosibirsk
aeroporti(58).regione = 'Russia';  % Ekaterinburg
aeroporti(59).regione = 'Russia';  % Vladivostok

% Sud America (60-65)
aeroporti(60).regione = 'Sud America';  % Rio de Janeiro
aeroporti(61).regione = 'Sud America';  % Buenos Aires
aeroporti(62).regione = 'Sud America';  % Lima
aeroporti(63).regione = 'Sud America';  % Santiago
aeroporti(64).regione = 'Sud America';  % Bogotá
aeroporti(65).regione = 'Sud America';  % Caracas

% ========== INTERFACCIA UTENTE ==========
fprintf('\n');
fprintf('╔════════════════════════════════════════════════════════════╗\n');
fprintf('║     CALCOLO ROTTA TRA AEROPORTI - GRANDE CERCHIO          ║\n');
fprintf('╚════════════════════════════════════════════════════════════╝\n');
fprintf('\n');

% Crea tabella aeroporti
fprintf('AEROPORTI DISPONIBILI:\n\n');
fprintf('╔════╦═════════════════════════════════╦══════╦══════════════════╦═════════════════════════════╗\n');
fprintf('║ ID ║ NOME AEROPORTO                  ║ IATA ║ CITTÀ            ║ NAZIONE                     ║\n');
fprintf('╠════╬═════════════════════════════════╬══════╬══════════════════╬═════════════════════════════╣\n');
for i = 1:n_aeroporti
    fprintf('║ %2d ║ %-31s ║ %-4s ║ %-16s ║ %-27s ║\n', ...
        i, aeroporti(i).nome, aeroporti(i).iata, aeroporti(i).citta, aeroporti(i).nazione);
end
fprintf('╚════╩═════════════════════════════════╩══════╩══════════════════╩═════════════════════════════╝\n');

% ========== SCELTA MODALITÀ DATI (Real-time / Storico) ==========
fprintf('\n');
fprintf('╔════════════════════════════════════════════════════════════╗\n');
fprintf('║          MODALITÀ DATI SPACE WEATHER                       ║\n');
fprintf('╚════════════════════════════════════════════════════════════╝\n');
fprintf('\n');

modalita_dati = { ...
    'Dati in tempo reale (NOAA SWPC)', ...
    'Evento SEP storico - Gennaio 2005 (forte)', ...
    'Evento SEP storico - Ottobre 2003 Halloween Storm (estremo)', ...
    'Evento SEP storico - Settembre 2017 (severo)'};

[id_modalita, ok_mod] = listdlg('ListString', modalita_dati, ...
    'SelectionMode', 'single', ...
    'Name', 'Modalità dati radiazione', ...
    'PromptString', 'Seleziona la fonte dati:', ...
    'ListSize', [450, 120]);

if ~ok_mod
    fprintf('Selezione annullata.\n');
    return;
end

usa_dati_storici = (id_modalita > 1);
modalita_scelta = modalita_dati{id_modalita};

% Database eventi SEP storici
eventi_sep_storici = struct();

% Evento 1: Gennaio 2005 (20 Gennaio) - forte evento
eventi_sep_storici(1).nome = 'Gennaio 2005 (forte)';
eventi_sep_storici(1).data = '20-Jan-2005';
eventi_sep_storici(1).proton_flux_10mev = 5040;  % pfu (>=10 MeV)
eventi_sep_storici(1).proton_flux_100mev = 84;   % pfu (>=100 MeV)
eventi_sep_storici(1).kp_index = 8.0;
eventi_sep_storici(1).descrizione = 'Forte tempesta solare con significativo aumento del flusso protonico';

% Evento 2: Ottobre 2003 (28-29 Ottobre) - Halloween Storm, evento estremo
eventi_sep_storici(2).nome = 'Ottobre 2003 Halloween Storm (estremo)';
eventi_sep_storici(2).data = '28-Oct-2003';
eventi_sep_storici(2).proton_flux_10mev = 29500; % pfu (>=10 MeV) - uno dei più forti registrati
eventi_sep_storici(2).proton_flux_100mev = 466;  % pfu (>=100 MeV)
eventi_sep_storici(2).kp_index = 9.0;
eventi_sep_storici(2).descrizione = 'Halloween Storm - uno degli eventi SEP più intensi mai registrati';

% Evento 3: Settembre 2017 (10 Settembre) - evento severo
eventi_sep_storici(3).nome = 'Settembre 2017 (severo)';
eventi_sep_storici(3).data = '10-Sep-2017';
eventi_sep_storici(3).proton_flux_10mev = 6530;  % pfu (>=10 MeV)
eventi_sep_storici(3).proton_flux_100mev = 132;  % pfu (>=100 MeV)
eventi_sep_storici(3).kp_index = 8.3;
eventi_sep_storici(3).descrizione = 'Forte tempesta solare seguita da CME multipli';

if usa_dati_storici
    evento_selezionato = eventi_sep_storici(id_modalita - 1);
    fprintf('\nEvento SEP storico selezionato:\n');
    fprintf('  Nome: %s\n', evento_selezionato.nome);
    fprintf('  Data: %s\n', evento_selezionato.data);
    fprintf('  Descrizione: %s\n', evento_selezionato.descrizione);
    fprintf('  Proton flux >=10 MeV: %.0f pfu\n', evento_selezionato.proton_flux_10mev);
    fprintf('  Proton flux >=100 MeV: %.0f pfu\n', evento_selezionato.proton_flux_100mev);
    fprintf('  Kp index: %.1f\n', evento_selezionato.kp_index);
    fprintf('\n');
else
    % Inizializza evento_selezionato vuoto per modalità tempo reale
    evento_selezionato = struct('nome', '', 'data', '', 'descrizione', '', ...
        'proton_flux_10mev', 0, 'proton_flux_100mev', 0, 'kp_index', 0);
    fprintf('\nUtilizzando dati in tempo reale da NOAA SWPC...\n\n');
end

% Scelta categoria utente prima della selezione aeroporti
categorie_utenti = { ...
    'Pilota', ...
    'Cabin Crew', ...
    'Passeggero adulto', ...
    'Bambino', ...
    'Donna in gravidanza', ...
    'Ricercatori scientifici (frequentanti rotte polari)'};

[id_categoria, ok_cat] = listdlg('ListString', categorie_utenti, ...
    'SelectionMode', 'single', ...
    'Name', 'Categoria utente', ...
    'PromptString', 'Seleziona la tua categoria:', ...
    'ListSize', [400, 170]);

if ~ok_cat
    fprintf('Selezione annullata.\n');
    return;
end

categoria_scelta = categorie_utenti{id_categoria};

% Inizializza variabili per tracciamento cumulativo
dose_cumulativa = 0;  % Dose totale accumulata attraverso tutti i voli
num_voli = 0;  % Numero di voli effettuati
ultimo_aeroporto_arrivo = 0;  % ID dell'ultimo aeroporto di arrivo
tutte_le_rotte = {};  % Cella per immagazzinare tutte le rotte calcolate

% Definisci fattore dose e limite annuo per categoria
switch id_categoria
    case 1  % Pilota
        fattore_dose_categoria = 1.0;
        limite_annuo_msv = 20;
        note_categoria = 'esposizione leggermente maggiore (cockpit)';
    case 2  % Cabin Crew
        fattore_dose_categoria = 0.90;
        limite_annuo_msv = 20;
        note_categoria = 'schermatura migliore in cabina';
    case 3  % Passeggero adulto
        fattore_dose_categoria = 0.85;
        limite_annuo_msv = NaN;  % non normato
        note_categoria = 'esposizione trascurabile';
    case 4  % Bambino
        fattore_dose_categoria = 1.20;
        limite_annuo_msv = NaN;  % non normato
        note_categoria = 'maggiore radiosensibilità';
    case 5  % Donna in gravidanza
        fattore_dose_categoria = 1.0;
        limite_annuo_msv = 1;
        note_categoria = 'soggetto sensibile';
    case 6  % Ricercatori
        fattore_dose_categoria = 1.20;
        limite_annuo_msv = 20;
        note_categoria = 'frequentanti rotte polari';
    otherwise
        fattore_dose_categoria = 1.0;
        limite_annuo_msv = 20;
        note_categoria = '';
end

% Loop per calcolare rotte multiple
continua_volo = true;

while continua_volo
    num_voli = num_voli + 1;
    
    % Scelta interattiva aeroporto di partenza
    fprintf('\n');
    if num_voli == 1
        fprintf('=== VOLO #%d ===\n', num_voli);
    else
        fprintf('=== VOLO #%d (partenza da %s) ===\n', num_voli, aeroporti(ultimo_aeroporto_arrivo).iata);
    end
    
    % Crea liste di aeroporti suddivise per regione
    regioni = {'Italia', 'Europa', 'Medio Oriente', 'Russia', 'Asia', 'Nord America', 'Sud America', 'Regioni Polari'};
    aeroporti_per_regione = cell(length(regioni), 1);
    
    for r = 1:length(regioni)
        elenco_temp = {};
        for i = 1:n_aeroporti
            if isfield(aeroporti(i), 'regione') && strcmp(aeroporti(i).regione, regioni{r})
                elenco_temp{end+1, 1} = sprintf('%s (%s) - %s', aeroporti(i).nome, aeroporti(i).iata, aeroporti(i).citta);
                elenco_temp{end, 2} = i;
            end
        end
        aeroporti_per_regione{r} = elenco_temp;
    end

    % Se non è il primo volo, usa l'aeroporto di arrivo precedente come partenza
    if num_voli > 1
        id_partenza = ultimo_aeroporto_arrivo;
    else
        % Loop per selezione aeroporto di partenza con possibilità di tornare indietro
        selezione_partenza_completata = false;
        
        while ~selezione_partenza_completata
            % Menu di selezione della regione per la partenza
            regioni_con_indietro = [regioni, '← Annulla'];
            [id_regione_partenza, ok_reg] = listdlg('ListString', regioni_con_indietro, ...
                'SelectionMode', 'single', ...
                'Name', 'Selezione Regione - Partenza', ...
                'PromptString', 'Seleziona la regione dell''aeroporto di PARTENZA:', ...
                'ListSize', [450, 220]);
            
            if ~ok_reg
                fprintf('Selezione annullata.\n');
                return;
            end
            
            % Se ha selezionato "Annulla"
            if id_regione_partenza == length(regioni_con_indietro)
                fprintf('Selezione annullata.\n');
                return;
            end
            
            % Menu di selezione dell'aeroporto nella regione scelta
            aeroporti_regione = aeroporti_per_regione{id_regione_partenza};
            
            if isempty(aeroporti_regione)
                errordlg(sprintf('Nessun aeroporto trovato in %s!', regioni{id_regione_partenza}), 'Errore');
                continue;
            end
            
            nomi_aeroporti_regione = aeroporti_regione(:, 1);
            % Aggiungi opzione per tornare indietro
            nomi_con_indietro = [nomi_aeroporti_regione; '← Torna indietro (cambia regione)'];
            
            [id_aero_regione, ok] = listdlg('ListString', nomi_con_indietro, ...
                'SelectionMode', 'single', ...
                'Name', 'Aeroporto di Partenza', ...
                'PromptString', sprintf('Seleziona l''aeroporto di PARTENZA in %s:', regioni{id_regione_partenza}), ...
                'ListSize', [500, 370]);

            if ~ok
                fprintf('Selezione annullata.\n');
                return;
            end
            
            % Se ha selezionato "Torna indietro", ricomincia il loop
            if id_aero_regione == length(nomi_con_indietro)
                continue;
            end
            
            id_partenza = aeroporti_regione{id_aero_regione, 2};
            selezione_partenza_completata = true;
        end
    end

    % Loop per selezione aeroporto di arrivo con possibilità di tornare indietro
    selezione_arrivo_completata = false;
    
    while ~selezione_arrivo_completata
        % Menu di selezione della regione per l'arrivo
        regioni_con_indietro = [regioni, '← Torna indietro (cambia partenza)'];
        [id_regione_arrivo, ok_reg] = listdlg('ListString', regioni_con_indietro, ...
            'SelectionMode', 'single', ...
            'Name', 'Selezione Regione - Arrivo', ...
            'PromptString', 'Seleziona la regione dell''aeroporto di ARRIVO:', ...
            'ListSize', [450, 220]);
        
        if ~ok_reg
            fprintf('Selezione annullata.\n');
            break;
        end
        
        % Se ha selezionato "Torna indietro" dalla regione di arrivo
        if id_regione_arrivo == length(regioni_con_indietro)
            % Torna alla selezione dell'aeroporto di partenza solo se è il primo volo
            if num_voli == 1
                num_voli = num_voli - 1;
                break;
            else
                fprintf('Non puoi tornare indietro: la partenza è fissata dall''arrivo precedente.\n');
                continue;
            end
        end
        
        % Menu di selezione dell'aeroporto nella regione scelta
        aeroporti_regione = aeroporti_per_regione{id_regione_arrivo};
        
        if isempty(aeroporti_regione)
            errordlg(sprintf('Nessun aeroporto trovato in %s!', regioni{id_regione_arrivo}), 'Errore');
            continue;
        end
        
        nomi_aeroporti_regione = aeroporti_regione(:, 1);
        % Aggiungi opzione per tornare indietro
        nomi_con_indietro = [nomi_aeroporti_regione; '← Torna indietro (cambia regione)'];
        
        [id_aero_regione, ok] = listdlg('ListString', nomi_con_indietro, ...
            'SelectionMode', 'single', ...
            'Name', 'Aeroporto di Arrivo', ...
            'PromptString', sprintf('Seleziona l''aeroporto di ARRIVO in %s:', regioni{id_regione_arrivo}), ...
            'ListSize', [500, 370]);

        if ~ok
            fprintf('Selezione annullata.\n');
            break;
        end
        
        % Se ha selezionato "Torna indietro", ricomincia il loop
        if id_aero_regione == length(nomi_con_indietro)
            continue;
        end
        
        id_arrivo = aeroporti_regione{id_aero_regione, 2};
        
        % Verifica che gli aeroporti siano diversi
        if id_arrivo == id_partenza
            errordlg('Devi scegliere due aeroporti diversi!', 'Errore di Selezione');
            continue;
        end
        
        selezione_arrivo_completata = true;
    end
    
    % Se la selezione dell'arrivo non è stata completata, ricomincia il volo
    if ~selezione_arrivo_completata
        continue;
    end

% ========== CALCOLI ==========
aero1 = aeroporti(id_partenza);
aero2 = aeroporti(id_arrivo);

% Converte le coordinate in radianti
lat1 = deg2rad(aero1.lat);
lon1 = deg2rad(aero1.lon);
lat2 = deg2rad(aero2.lat);
lon2 = deg2rad(aero2.lon);

% Formula della grande cerchio (Haversine)
dlat = lat2 - lat1;
dlon = lon2 - lon1;

a = sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
c = 2 * asin(sqrt(a));

R_terra = 6371;  % Raggio della Terra in km
distanza_km = R_terra * c;
distanza_nm = distanza_km * 0.539957;  % Conversione a miglia nautiche

% Calcola il rotta (bearing) dal punto 1 al punto 2
y = sin(dlon) * cos(lat2);
x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dlon);
rotta_rad = atan2(y, x);
rotta_deg = rad2deg(rotta_rad);
if rotta_deg < 0
    rotta_deg = rotta_deg + 360;
end

% Calcola tempo di volo stimato (velocità crociera media: 900 km/h)
velocita_crociera = 900;  % km/h
tempo_volo_ore = distanza_km / velocita_crociera;
ore = floor(tempo_volo_ore);
minuti = round((tempo_volo_ore - ore) * 60);

% ========== CALCOLO ROTTA ==========
% Determina il tipo di rotta: ortodromia (>300 NM) o lossodromia (<=300 NM)
soglia_nm = 300;
n_punti = 100;
frazione = linspace(0, 1, n_punti);
lat_rotta = zeros(1, n_punti);
lon_rotta = zeros(1, n_punti);

if distanza_nm > soglia_nm
    % ORTODROMIA (Great Circle) - per lunghe distanze
    tipo_rotta = 'Ortodromia';
    
    for i = 1:n_punti
        f = frazione(i);
        sin_lat1 = sin(lat1);
        cos_lat1 = cos(lat1);
        sin_lat2 = sin(lat2);
        cos_lat2 = cos(lat2);
        
        A = sin((1-f)*c) / sin(c);
        B = sin(f*c) / sin(c);
        
        x = A * cos_lat1 * cos(lon1) + B * cos_lat2 * cos(lon2);
        y = A * cos_lat1 * sin(lon1) + B * cos_lat2 * sin(lon2);
        z = A * sin_lat1 + B * sin_lat2;
        
        lat_rotta(i) = atan2(z, sqrt(x^2 + y^2));
        lon_rotta(i) = atan2(y, x);
    end
else
    % LOSSODROMIA (Rhumb Line) - per brevi distanze
    tipo_rotta = 'Lossodromia';
    
    % Gestisci il caso del meridiano (lon1 == lon2)
    if abs(dlon) < 1e-10
        lat_rotta = linspace(lat1, lat2, n_punti);
        lon_rotta = ones(1, n_punti) * lon1;
    else
        % Calcola la differenza di latitudine mercatoriana
        delta_psi = log(tan(lat2/2 + pi/4) / tan(lat1/2 + pi/4));
        
        if abs(delta_psi) < 1e-10
            delta_psi = 1e-10;
        end
        
        q = dlon / delta_psi;
        
        for i = 1:n_punti
            f = frazione(i);
            lat_rotta(i) = lat1 + f * dlat;
            
            if abs(cos(lat_rotta(i))) > 1e-10
                psi = log(tan(lat_rotta(i)/2 + pi/4));
                psi1 = log(tan(lat1/2 + pi/4));
                lon_rotta(i) = lon1 + q * (psi - psi1);
            else
                lon_rotta(i) = lon1 + f * dlon;
            end
        end
    end
end

% Converti i radianti in gradi
lat_rotta_deg = rad2deg(lat_rotta);
lon_rotta_deg = rad2deg(lon_rotta);

% ========== SIMULAZIONE PROFILO DI VOLO ==========
% Determina il tipo di volo (nazionale o internazionale)
if strcmp(aero1.nazione, aero2.nazione)
    tipo_volo = 'Nazionale';
    % Voli nazionali: FL220-FL270 (22,000-27,000 ft)
    if distanza_nm < 400
        quota_crociera_ft = 22000;  % FL220
    else
        quota_crociera_ft = 27000;  % FL270
    end
else
    tipo_volo = 'Internazionale';
    % Voli internazionali: FL350-FL390 (35,000-39,000 ft)
    if distanza_nm < 3000
        quota_crociera_ft = 35000;  % FL350
    else
        quota_crociera_ft = 39000;  % FL390
    end
end

% Converti piedi in metri
quota_crociera_m = quota_crociera_ft * 0.3048;

% Crea profilo altitudine lungo la rotta
distanza_percorsa_nm = linspace(0, distanza_nm, n_punti);
altitudine_profilo = zeros(1, n_punti);

% Parametri di salita e discesa (in miglia nautiche)
distanza_salita = min(150, distanza_nm * 0.25);  % 150 NM o 25% della distanza
distanza_discesa = min(150, distanza_nm * 0.25); % 150 NM o 25% della distanza

for i = 1:n_punti
    dist = distanza_percorsa_nm(i);
    
    if dist <= distanza_salita
        % Fase di salita (profilo parabolico per realismo)
        frazione_salita = dist / distanza_salita;
        altitudine_profilo(i) = quota_crociera_m * (1 - (1 - frazione_salita)^2);
    elseif dist >= (distanza_nm - distanza_discesa)
        % Fase di discesa (profilo parabolico)
        frazione_discesa = (distanza_nm - dist) / distanza_discesa;
        altitudine_profilo(i) = quota_crociera_m * (1 - (1 - frazione_discesa)^2);
    else
        % Fase di crociera
        altitudine_profilo(i) = quota_crociera_m;
    end
end

% ========== CREA GRIGLIA PER RADIAZIONI COSMICHE ==========
% Crea griglia di coordinate
lon_grid = linspace(-180, 180, 180);
lat_grid = linspace(-90, 90, 90);
[LON, LAT] = meshgrid(lon_grid, lat_grid);

% Calcola radiazione cosmica (approssimazione)
radiazione = zeros(size(LAT));

for i = 1:size(LAT, 1)
    for j = 1:size(LAT, 2)
        lat = LAT(i, j);
        % Radiazione cosmica in mSv/anno
        % Minima all'equatore (~0.3 mSv/anno), massima ai poli (~1.0 mSv/anno)
        radiazione(i, j) = 0.3 + 0.7 * (sin(deg2rad(abs(lat))))^2;
    end
end

% Calcola radiazione media sulla rotta considerando il profilo altimetrico
radiazione_totale_volo = 0;
dose_accumulata = zeros(1, n_punti);
gmlat_track = zeros(1, n_punti); % traccia delle latitudini geomagnetiche
solar_cycle_factor = 1.0; % fattore ciclo solare (placeholder, 1 = medio ciclo)

for k = 1:length(lat_rotta_deg)
    % Latitudine geomagnetica corrente (maggior rilevanza per GCR)
    gmlat_track(k) = abs(geomag_latitude(lat_rotta_deg(k), lon_rotta_deg(k)));
    
    % Altitudine in km
    altitudine_km = altitudine_profilo(k) / 1000;
    
    % ========== MODELLO EMPIRICO REALISTICO PER RADIAZIONE COSMICA ==========
    % Basato su misurazioni reali durante voli commerciali
    % Valori tipici misurati:
    % - Livello del mare: ~0.03 μSv/h
    % - FL350 (10.7 km): ~5 μSv/h all'equatore, ~6.5 μSv/h a 45°
    % - FL390 (11.9 km): ~5.5 μSv/h all'equatore, ~7 μSv/h a 45°
    %
    % Formula empirica: rad(μSv/h) = baseline + (alt_km * coeff) * (1 + lat_factor * sin²(lat))
    
    baseline = 0.03; % μSv/h al livello del mare
    coeff_alt = 0.45; % coefficiente altitudine (μSv/h per km)
    coeff_lat = 0.3;  % coefficiente latitudine
    
    % Fattore latitudinale (geomagnetica): radiazione maggiore ai poli
    fattore_latitudine = 1 + coeff_lat * (sin(deg2rad(gmlat_track(k))))^2;
    
    % Se l'aereo è in aria (altitudine > 100m), applica la formula di quota
    if altitudine_km > 0.1
        rad_oraria_microSv = baseline + (coeff_alt * altitudine_km) * fattore_latitudine * solar_cycle_factor;
    else
        % A terra, radiazione trascurabile
        rad_oraria_microSv = 0.03;
    end
    
    % Converti da μSv/h a mSv/h
    rad_oraria = rad_oraria_microSv / 1000;
    
    radiazione_totale_volo = radiazione_totale_volo + rad_oraria;
    
    % Dose accumulata fino a questo punto
    if k > 1
        dose_accumulata(k) = dose_accumulata(k-1) + rad_oraria * (tempo_volo_ore / n_punti);
    else
        dose_accumulata(k) = rad_oraria * (tempo_volo_ore / n_punti);
    end
end

% Radiazione media oraria durante il volo
radiazione_media_oraria = radiazione_totale_volo / n_punti;

% Calcola dose totale di radiazione durante il volo (in mSv)
dose_volo = dose_accumulata(end);

% ========== DATI IN TEMPO REALE - TEMPESTE SOLARI ==========
% Tenta di recuperare l'indice Kp attuale da NOAA
indice_kp = 4;  % valore di default (attività geomagnetica moderata)
descrizione_tempesta = 'Dati non disponibili (usando valore di default)';
fattore_tempesta = 1.0;
kp_time_str = '';  % inizializza sempre

if usa_dati_storici
    % Modalità storica: usa i valori dell'evento selezionato
    indice_kp = evento_selezionato.kp_index;
    kp_ok = true;
    kp_time_str = evento_selezionato.data;  % usa la data dell'evento
    descrizione_tempesta = sprintf('EVENTO STORICO - %s (%s): Kp = %.1f', ...
        evento_selezionato.nome, evento_selezionato.data, indice_kp);
else
    % Modalità tempo reale: recupera dati da NOAA
    try
        url_kp_primary = 'https://services.swpc.noaa.gov/json/planetary_k_index_1m.json';
        url_kp_fallback = 'https://services.swpc.noaa.gov/json/planetary_k_index.json';
        options = weboptions('Timeout', 10, 'ContentType', 'json');

        kp_ok = false;

        % Parser Kp definito come funzione locale a fine file

    % Lettura primaria (1m)
    try
        dati_json = webread(url_kp_primary, options);
        if ~isempty(dati_json)
            if isstruct(dati_json)
                rec = dati_json(end);
                candidateFields = {'kp_index','kp','Kp','estimated_kp'};
                val = NaN;
                for ff = 1:numel(candidateFields)
                    f = candidateFields{ff};
                    if isfield(rec, f)
                        val = parseKpValue(rec.(f));
                        if ~isnan(val), break; end
                    end
                end
                if ~isnan(val)
                    indice_kp = val;
                    if isfield(rec, 'time_tag')
                        kp_time_str = char(string(rec.time_tag));
                    elseif isfield(rec, 'time')
                        kp_time_str = char(string(rec.time));
                    end
                    kp_ok = true;
                end
            elseif iscell(dati_json) && ~isempty(dati_json)
                % Alcuni endpoint restituiscono una tabella [header; rows]
                row = dati_json{end};
                if numel(row) >= 2
                    val = parseKpValue(row{2});
                    if ~isnan(val)
                        indice_kp = val;
                        kp_time_str = string(row{1});
                        kp_ok = true;
                    end
                end
            end
        end
    catch
        % Ignora: proveremo fallback
    end

    % Fallback (3h o storico recente)
    if ~kp_ok
        try
            dati_json = webread(url_kp_fallback, options);
            if ~isempty(dati_json)
                if isstruct(dati_json)
                    rec = dati_json(end);
                    candidateFields = {'kp_index','kp','Kp','estimated_kp'};
                    val = NaN;
                    for ff = 1:numel(candidateFields)
                        f = candidateFields{ff};
                        if isfield(rec, f)
                            val = parseKpValue(rec.(f));
                            if ~isnan(val), break; end
                        end
                    end
                    if ~isnan(val)
                        indice_kp = val;
                        if isfield(rec, 'time_tag')
                            kp_time_str = char(string(rec.time_tag));
                        elseif isfield(rec, 'time')
                            kp_time_str = char(string(rec.time));
                        end
                        kp_ok = true;
                    end
                elseif iscell(dati_json) && ~isempty(dati_json)
                    row = dati_json{end};
                    if numel(row) >= 2
                        val = parseKpValue(row{2});
                        if ~isnan(val)
                            indice_kp = val;
                            kp_time_str = string(row{1});
                            kp_ok = true;
                        end
                    end
                end
            end
        catch
            % Fallback fallito
        end
    end

    if kp_ok
        if ~isempty(kp_time_str)
            descrizione_tempesta = sprintf('NOAA Kp attuale (%s UTC): %.2f', kp_time_str, indice_kp);
        else
            descrizione_tempesta = sprintf('NOAA Kp attuale: %.2f', indice_kp);
        end
    else
        descrizione_tempesta = 'Fonte NOAA non raggiungibile o formato inatteso';
    end
    catch
        descrizione_tempesta = 'Connessione non disponibile - usando valori di default';
    end
end % fine if usa_dati_storici per Kp

% ========== DATI IN TEMPO REALE - FLUSSO DI PROTONI (GOES) ==========
proton_flux_pfu = 0; % pfu = particelle/(cm^2 s sr)
descrizione_protoni = 'Dati protoni non disponibili (usando valore di default)';
protoni_time_str = '';  % inizializza sempre
fattore_protoni_global = 1.0; % fattore moltiplicativo medio lungo la rotta

if usa_dati_storici
    % Modalità storica: usa i valori dell'evento selezionato
    proton_flux_pfu = evento_selezionato.proton_flux_10mev;
    gotP = true;
    protoni_time_str = evento_selezionato.data;  % usa la data dell'evento
    descrizione_protoni = sprintf('EVENTO STORICO - %s (%s): Proton Flux (>=10 MeV) = %.1f pfu', ...
        evento_selezionato.nome, evento_selezionato.data, proton_flux_pfu);
else
    % Modalità tempo reale: recupera dati da NOAA GOES

try
    % Nota: gli endpoint NOAA hanno il trattino tra "integral" e "protons"
    % Endpoint funzionanti (JSON, GOES primary):
    url_p_primary = 'https://services.swpc.noaa.gov/json/goes/primary/integral-protons-1-day.json';
    url_p_fallback = 'https://services.swpc.noaa.gov/json/goes/primary/integral-protons-7-day.json';
    optionsP = weboptions('Timeout', 10, 'ContentType', 'json');

    gotP = false;

    try
        Pjson = webread(url_p_primary, optionsP);
        [flux, tstr] = extractP10(Pjson);
        if ~isnan(flux)
            proton_flux_pfu = flux;
            protoni_time_str = tstr;
            gotP = true;
        end
    catch
        % Proveremo fallback
    end

    if ~gotP
        try
            Pjson = webread(url_p_fallback, optionsP);
            [flux, tstr] = extractP10(Pjson);
            if ~isnan(flux)
                proton_flux_pfu = flux;
                protoni_time_str = tstr;
                gotP = true;
            end
        catch
        end
    end

    if gotP
        if ~isempty(protoni_time_str)
            descrizione_protoni = sprintf('GOES Proton Flux (>=10 MeV, %s UTC): %.2f pfu', protoni_time_str, proton_flux_pfu);
        else
            descrizione_protoni = sprintf('GOES Proton Flux (>=10 MeV): %.2f pfu', proton_flux_pfu);
        end
    else
        descrizione_protoni = 'GOES protoni non raggiungibile o formato inatteso';
    end
    catch
        descrizione_protoni = 'Connessione non disponibile - protoni default';
    end
end % fine if usa_dati_storici per protoni

% ========== STATO EVENTO SEP (Solar Energetic Particles) ==========
sep_active = false;
sep_level = 'S0';
sep_descrizione = 'Nessun evento SEP attivo';
if proton_flux_pfu >= 100000
    sep_active = true; sep_level = 'S5'; sep_descrizione = 'Evento SEP attivo (S5 - Estremo, >=100000 pfu)';
elseif proton_flux_pfu >= 10000
    sep_active = true; sep_level = 'S4'; sep_descrizione = 'Evento SEP attivo (S4 - Severo, >=10000 pfu)';
elseif proton_flux_pfu >= 1000
    sep_active = true; sep_level = 'S3'; sep_descrizione = 'Evento SEP attivo (S3 - Forte, >=1000 pfu)';
elseif proton_flux_pfu >= 100
    sep_active = true; sep_level = 'S2'; sep_descrizione = 'Evento SEP attivo (S2 - Moderato, >=100 pfu)';
elseif proton_flux_pfu >= 10
    sep_active = true; sep_level = 'S1'; sep_descrizione = 'Evento SEP attivo (S1 - Minore, >=10 pfu)';
end

% ========== FATTORIZZAZIONE PROTONI LUNGO LA ROTTA ==========
% Peso maggiore a quote alte e a lat geomagnetiche >=55-60°
fattori_protoni = ones(1, n_punti);
beta_p = 0.6; % intensità dell'effetto protoni
flux_strength = log10(proton_flux_pfu + 1); % 0 per quiete, ~1 per 10 pfu, ~2 per 100 pfu
for k = 1:n_punti
    alt_km = altitudine_profilo(k) / 1000;
    alt_factor = max(0, min(1, (alt_km - 8) / 4)); % da 8km a 12km

    gmlat = geomag_latitude(lat_rotta_deg(k), lon_rotta_deg(k));
    geomag_factor = max(0, min(1, (gmlat - 45) / 15)); % 0 sotto 45°, 1 a 60°+

    fattori_protoni(k) = 1 + beta_p * flux_strength * alt_factor * geomag_factor;
end
fattore_protoni_global = mean(fattori_protoni);

% Calcola il fattore di correzione per le tempeste solari
% Kp 0-3: attività bassa, nessuna correzione (fattore = 1.0)
% Kp 4-5: attività moderata, correzione moderata (fattore = 1.2-1.4)
% Kp 6-7: tempesta, correzione significativa (fattore = 1.5-2.0)
% Kp 8-9: tempesta severa, correzione alta (fattore = 2.0-3.0)

if indice_kp < 4
    fattore_tempesta = 1.0;
    livello_tempesta = 'CALMO';
elseif indice_kp < 6
    fattore_tempesta = 1.0 + (indice_kp - 4) * 0.2;  % 1.0-1.4
    livello_tempesta = 'MODERATO';
elseif indice_kp < 8
    fattore_tempesta = 1.4 + (indice_kp - 6) * 0.3;  % 1.4-2.0
    livello_tempesta = 'TEMPESTA';
else
    fattore_tempesta = 2.0 + (indice_kp - 8) * 0.5;  % 2.0-3.0
    livello_tempesta = 'TEMPESTA SEVERA';
end

% Applica i fattori (tempesta geomagnetica + protoni GOES) alla dose di radiazione
fattore_sep = fattore_tempesta * fattore_protoni_global; % SEP: proton flux + lat geomag + Kp
fattore_totale = fattore_sep; % totale = solo SEP sopra GCR base (GCR già incluso nel modello base)
% Componenti separate
radiazione_media_oraria_gcr = radiazione_media_oraria; % GCR: quota + lat geomag + ciclo solare
radiazione_media_oraria_sep_extra = radiazione_media_oraria_gcr * max(0, fattore_totale - 1); % contributo additivo SEP (solo se amplifica)

dose_volo_corretto = dose_volo * fattore_totale;
radiazione_media_oraria_corretto = radiazione_media_oraria_gcr * fattore_totale;

    % Applica il fattore dose specifico per categoria
    dose_volo_finale = dose_volo_corretto * fattore_dose_categoria;
    radiazione_media_oraria_finale = radiazione_media_oraria_corretto * fattore_dose_categoria;
    
    % Aggiungi la dose di questo volo al totale cumulativo
    dose_cumulativa = dose_cumulativa + dose_volo_finale;
    
    % Salva la rotta attuale nella lista di tutte le rotte
    tutte_le_rotte{num_voli}.lon = lon_rotta_deg;
    tutte_le_rotte{num_voli}.lat = lat_rotta_deg;
    tutte_le_rotte{num_voli}.distanza_nm = distanza_nm;
    
    % Salva l'aeroporto di arrivo per il prossimo volo
    ultimo_aeroporto_arrivo = id_arrivo;

% Determina il livello di rischio (con correzione tempesta solare e categoria)
if dose_volo_finale < 0.01
    livello_rischio = 'RISCHIO MOLTO BASSO';
    colore_rischio = [0 1 0];  % Verde
elseif dose_volo_finale < 0.05
    livello_rischio = 'RISCHIO BASSO';
    colore_rischio = [0.2 1 0.2];  % Verde chiaro
elseif dose_volo_finale < 0.1
    livello_rischio = 'RISCHIO MODERATO';
    colore_rischio = [1 1 0];  % Giallo
else
    livello_rischio = 'RISCHIO ELEVATO';
    colore_rischio = [1 0.5 0];  % Arancione
end

% ========== VISUALIZZAZIONE RISULTATI ==========
fprintf('\n');
fprintf('╔════════════════════════════════════════════════════════════╗\n');
fprintf('║                   RISULTATI CALCOLO ROTTA                  ║\n');
fprintf('╚════════════════════════════════════════════════════════════╝\n');
fprintf('\n');

fprintf('AEROPORTO DI PARTENZA:\n');
fprintf('  Nome:      %s\n', aero1.nome);
fprintf('  IATA:      %s\n', aero1.iata);
fprintf('  Città:     %s\n', aero1.citta);
fprintf('  Nazione:   %s\n', aero1.nazione);
fprintf('  Coordinate: %.4f°N, %.4f°E\n', aero1.lat, aero1.lon);
fprintf('\n');

fprintf('AEROPORTO DI ARRIVO:\n');
fprintf('  Nome:      %s\n', aero2.nome);
fprintf('  IATA:      %s\n', aero2.iata);
fprintf('  Città:     %s\n', aero2.citta);
fprintf('  Nazione:   %s\n', aero2.nazione);
fprintf('  Coordinate: %.4f°N, %.4f°E\n', aero2.lat, aero2.lon);
fprintf('\n');

fprintf('DATI DELLA ROTTA:\n');
fprintf('  Distanza:       %.2f km (%.2f NM)\n', distanza_km, distanza_nm);
fprintf('  Tipo di rotta:  %s\n', tipo_rotta);
fprintf('  Tipo di volo:   %s\n', tipo_volo);
fprintf('  Categoria utente: %s\n', categoria_scelta);
fprintf('  Quota crociera: FL%.0f (%.0f ft / %.0f m)\n', quota_crociera_ft/100, quota_crociera_ft, quota_crociera_m);
fprintf('  Rotta iniziale: %.1f° (da Nord in senso orario)\n', rotta_deg);
fprintf('  Tempo di volo:  %d h %d min (a 900 km/h)\n', ore, minuti);
fprintf('\n');

% Mostra modalità dati (tempo reale o storica)
if usa_dati_storici
    fprintf('===================================================================\n');
    fprintf(' MODALITA'' SIMULAZIONE EVENTO STORICO\n');
    fprintf(' Evento: %s\n', evento_selezionato.nome);
    fprintf(' Data: %s\n', evento_selezionato.data);
    fprintf(' %s\n', evento_selezionato.descrizione);
    fprintf('===================================================================\n');
    fprintf('\n');
end

fprintf('RADIAZIONI COSMICHE:\n');
fprintf('  GCR (quota + lat geomagnetica + ciclo solare): %.4f mSv/h\n', radiazione_media_oraria_gcr);
fprintf('  SEP (proton flux + Kp + lat geomagnetica): +%.4f mSv/h\n', radiazione_media_oraria_sep_extra);
fprintf('  Radiazione media oraria totale in volo: %.4f mSv/h\n', radiazione_media_oraria_corretto);
fprintf('  Dose totale di radiazione: %.4f mSv\n', dose_volo_corretto);
fprintf('\n');
fprintf('DATI TEMPESTE SOLARI (NOAA):\n');
fprintf('  Indice Kp (attività geomagnetica): %.1f\n', indice_kp);
fprintf('  Livello di attività: %s\n', livello_tempesta);
fprintf('  Fattore di correzione: %.2f×\n', fattore_tempesta);
fprintf('  %s\n', descrizione_tempesta);
fprintf('  %s\n', descrizione_protoni);
sep_line = 'Nessun evento SEP attivo';
if sep_active
    sep_line = sep_descrizione;
end
fprintf('  Evento SEP: %s\n', sep_line);
fprintf('  Fattore protoni (medio sulla rotta): %.2f×\n', fattore_protoni_global);
fprintf('\n');
fprintf('DOSE CORRETTA PER TEMPESTE SOLARI:\n');
fprintf('  Radiazione media oraria (corretta): %.4f mSv/h\n', radiazione_media_oraria_corretto);
fprintf('  Dose totale di radiazione (corretta): %.4f mSv\n', dose_volo_corretto);
fprintf('\n');
    fprintf('DOSE SPECIFICA PER CATEGORIA (%s):\n', categoria_scelta);
    fprintf('  Fattore dose categoria: %.2f× (%s)\n', fattore_dose_categoria, note_categoria);
    fprintf('  Radiazione media oraria (finale): %.4f mSv/h\n', radiazione_media_oraria_finale);
    fprintf('  Dose totale di radiazione (questo volo): %.4f mSv\n', dose_volo_finale);
    fprintf('\n');
    fprintf('RIEPILOGO VOLI:\n');
    fprintf('  Numero voli effettuati: %d\n', num_voli);
    fprintf('  Dose cumulativa totale: %.4f mSv\n', dose_cumulativa);
    if ~isnan(limite_annuo_msv)
        percent_limite_cumulativo = (dose_cumulativa / limite_annuo_msv) * 100;
        fprintf('  Percentuale del limite annuo (%.0f mSv): %.2f%%\n', limite_annuo_msv, percent_limite_cumulativo);
    else
        fprintf('  Limite annuo: non normato\n');
    end
    fprintf('  Livello di rischio: %s\n', livello_rischio);
fprintf('\n');
fprintf('  Fase di volo con maggiore esposizione: CROCIERA (FL%.0f)\n', quota_crociera_ft/100);
fprintf('  Radiazione max alla quota di crociera: ~%.4f mSv/h\n', radiazione_media_oraria_corretto * 1.2);
fprintf('\n');
fprintf('  Classificazione del rischio per i piloti:\n');
fprintf('    < 0.01 mSv per volo: MOLTO BASSO (sicuro)\n');
fprintf('    0.01-0.05 mSv per volo: BASSO (accettabile)\n');
fprintf('    0.05-0.1 mSv per volo: MODERATO (monitorare)\n');
fprintf('    > 0.1 mSv per volo: ELEVATO (attenzione)\n');
fprintf('  Nota: Radiazione più alta ai poli (~1.0 mSv/anno), più bassa all''equatore (~0.3 mSv/anno)\n');
fprintf('  Avvertenza: Durante tempeste solari (Kp > 6), considerare ritardi o rerouting per rotte polari\n');

% ========== VISUALIZZAZIONE GRAFICA ==========

% Crea la figura principale
fig_principale = figure('Position', [100, 100, 1200, 700]);

% Subplot per la mappa della rotta (top row, 70% della larghezza)
ax1 = subplot(2, 10, 1:7);
hold(ax1, 'on');
box(ax1, 'on');

% Disegna sfondo bianco
set(ax1, 'Color', [1 1 1]);

% Carica e disegna le coste
load coastlines
% Disegna i contorni delle coste in nero
plot(coastlon, coastlat, 'k-', 'LineWidth', 1.5, 'Parent', ax1);

% Disegna meridiani e paralleli
for lon_line = -180:30:180
    plot([lon_line lon_line], [-90 90], 'k:', 'LineWidth', 0.5, 'Color', [0.5 0.5 0.5], 'Parent', ax1);
end
for lat_line = -60:30:60
    plot([-180 180], [lat_line lat_line], 'k:', 'LineWidth', 0.5, 'Color', [0.5 0.5 0.5], 'Parent', ax1);
end
% Equatore
plot([-180 180], [0 0], 'k-', 'LineWidth', 1.0, 'Color', [0.3 0.3 0.3], 'Parent', ax1);
% Meridiano di Greenwich
plot([0 0], [-90 90], 'k-', 'LineWidth', 1.0, 'Color', [0.3 0.3 0.3], 'Parent', ax1);

% Disegna la rotta con gradiente di colore basato sull'altitudine
% Normalizza l'altitudine per il mapping dei colori (0-1)
altitudine_norm = altitudine_profilo / max(altitudine_profilo);

% Crea un colormap personalizzato: blu (basso) -> verde -> giallo -> rosso (alto)
n_colors = 256;
cmap_custom = [linspace(0, 1, n_colors)', linspace(0.2, 1, n_colors)', linspace(0.8, 0, n_colors)'];

% Leggenda colore quota (molto compatta)
colormap(ax1, cmap_custom);
alt_max_m = max(altitudine_profilo);
alt_ticks_norm = [0 0.25 0.5 0.75 1];
alt_ticks_ft = round(alt_ticks_norm * alt_max_m * 3.28084 / 1000) * 1000; % converti a ft e arrotonda a 1000
cbar_quota = colorbar(ax1, 'EastOutside');
cbar_quota.Position(3) = cbar_quota.Position(3) * 0.35; % riduce larghezza
cbar_quota.Position(1) = cbar_quota.Position(1) + 0.035; % sposta a destra contro il bordo
cbar_quota.Ticks = alt_ticks_norm;
cbar_quota.TickLabels = arrayfun(@(v) sprintf('%.0f ft', v), alt_ticks_ft, 'UniformOutput', false);
cbar_quota.Label.String = '';
cbar_quota.FontSize = 7;

% Disegna la rotta con segmenti colorati in base all'altitudine
for i = 1:length(lon_rotta_deg)-1
    % Determina il colore basato sull'altitudine media del segmento
    alt_media = (altitudine_norm(i) + altitudine_norm(i+1)) / 2;
    color_idx = max(1, min(n_colors, round(alt_media * n_colors)));
    segment_color = cmap_custom(color_idx, :);
    
    plot([lon_rotta_deg(i) lon_rotta_deg(i+1)], [lat_rotta_deg(i) lat_rotta_deg(i+1)], ...
        '-', 'Color', segment_color, 'LineWidth', 3, 'Parent', ax1);
end

% Segna gli aeroporti sulla mappa principale
plot(aero1.lon, aero1.lat, 'go', 'MarkerSize', 8, 'MarkerFaceColor', [0 0.8 0], ...
    'DisplayName', sprintf('Partenza: %s', aero1.iata), 'LineWidth', 1.5, 'Parent', ax1);
plot(aero2.lon, aero2.lat, 'rs', 'MarkerSize', 8, 'MarkerFaceColor', [0.9 0 0], ...
    'DisplayName', sprintf('Arrivo: %s', aero2.iata), 'LineWidth', 1.5, 'Parent', ax1);

xlabel(ax1, 'Longitudine [°]', 'FontSize', 11);
ylabel(ax1, 'Latitudine [°]', 'FontSize', 11);
title(ax1, sprintf('Rotta Aerea - %s', tipo_rotta), 'FontSize', 12, 'FontWeight', 'bold');
grid(ax1, 'on');
% Zoom automatico sulla rotta per tratte brevi (<1000 NM)
if distanza_nm < 1000
    lat_min = min(lat_rotta_deg);
    lat_max = max(lat_rotta_deg);
    lon_min = min(lon_rotta_deg);
    lon_max = max(lon_rotta_deg);
    % Margini di sicurezza per dare respiro al grafico
    margin_lat = max(3, 0.1 * (lat_max - lat_min + eps));
    margin_lon = max(3, 0.1 * (lon_max - lon_min + eps));
    axis(ax1, [max(-180, lon_min - margin_lon), min(180, lon_max + margin_lon), ...
               max(-90, lat_min - margin_lat),  min(90,  lat_max + margin_lat)]);
else
    axis(ax1, [-180 180 -90 90]);
end
set(ax1, 'Layer', 'top');

% ========== PANEL DATI DI NAVIGAZIONE ==========
ax2 = subplot(2, 10, 8:10);
axis(ax2, 'off');

% Sposta il panel leggermente più a destra
pos = get(ax2, 'Position');
pos(1) = pos(1) + 0.04;
set(ax2, 'Position', pos);

% Titolo in rosso con categoria tra parentesi
% Abbrevia "Ricercatori scientifici (frequentanti rotte polari)" a "Ricercatori"
categoria_display = categoria_scelta;
if startsWith(categoria_display, 'Ricercatori')
    categoria_display = 'Ricercatori';
end
titolo_panel = sprintf('DATI DI VOLO (%s)', categoria_display);
text(0.95, 1.02, titolo_panel, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 9.5, 'FontWeight', 'bold', ...
    'Color', [1 0 0], 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

% Gestisci nomi lunghi degli aeroporti con a capo automatico
nome_partenza = aero1.nome;
nome_arrivo = aero2.nome;

% Se il nome è più lungo di 24 caratteri, inserisci a capo
if length(nome_partenza) > 24
    nome_partenza = [nome_partenza(1:24) '\n' nome_partenza(25:end)];
end
if length(nome_arrivo) > 24
    nome_arrivo = [nome_arrivo(1:24) '\n' nome_arrivo(25:end)];
end

% Sezione PARTENZA e ARRIVO (parte superiore)
dati_partenza_arrivo = sprintf(['PARTENZA:\n' ...
    '%s\n%s - %s, %s\n' ...
    '\n' ...
    'ARRIVO:\n' ...
    '%s\n%s - %s, %s'], ...
    nome_partenza, aero1.iata, aero1.citta, aero1.nazione, ...
    nome_arrivo, aero2.iata, aero2.citta, aero2.nazione);

text(0.95, 0.90, dati_partenza_arrivo, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

% Riga 1: QUOTA CROCIERA (sinistra) e TEMPO DI VOLO (destra)
dati_quota = sprintf(['QUOTA CROCIERA:\n' ...
    'FL%.0f (%.0f ft)'], ...
    quota_crociera_ft/100, quota_crociera_ft);

dati_tempo = sprintf(['TEMPO DI VOLO:\n' ...
    '%dh %dmin'], ...
    ore, minuti);

text(0.48, 0.45, dati_quota, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

text(0.95, 0.45, dati_tempo, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

% Riga 2: TIPO VOLO (sinistra) e TIPO ROTTA (destra)
dati_tipo_volo = sprintf(['TIPO VOLO:\n' ...
    '%s'], ...
    tipo_volo);

dati_tipo_rotta = sprintf(['TIPO ROTTA:\n' ...
    '%s'], ...
    tipo_rotta);

text(0.48, 0.28, dati_tipo_volo, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

text(0.95, 0.28, dati_tipo_rotta, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

% Riga 3: RADIAZIONE (sinistra) e TEMPESTA SOLARE (destra)
% Formatta i timestamp con spazio tra data e ora ed elimina eventuale 'Z'
kp_time_disp = kp_time_str;
if ~isempty(kp_time_disp)
    kp_time_disp = char(strrep(kp_time_disp, 'T', ' '));
    kp_time_disp = regexprep(kp_time_disp, 'Z$', '');
end
protoni_time_disp = protoni_time_str;
if ~isempty(protoni_time_disp)
    protoni_time_disp = char(strrep(protoni_time_disp, 'T', ' '));
    protoni_time_disp = regexprep(protoni_time_disp, 'Z$', '');
end

if ~isempty(kp_time_disp)
    rad_header = sprintf('RADIAZIONE:\n(%s UTC)', kp_time_disp);
else
    rad_header = 'RADIAZIONE:';
end
dati_radiazione = sprintf(['%s\n' ...
    '%.4f mSv (finale)\n%s'], ...
    rad_header, dose_volo_finale, livello_rischio);

% Mostra minimo 0.01 pfu se il flusso è molto basso
flux_display = max(0.01, proton_flux_pfu);

    % Percentuale del limite annuo specifico per categoria (cumulativa)
    if ~isnan(limite_annuo_msv)
        percent_limite_annuo = (dose_cumulativa / limite_annuo_msv) * 100;
        if num_voli > 1
            limite_msg = sprintf('Totale %d voli: %.2f%%\n del limite annuo (%.0f mSv)', num_voli, percent_limite_annuo, limite_annuo_msv);
        else
            limite_msg = sprintf('Questo volo: %.2f%%\n del limite annuo (%.0f mSv)', percent_limite_annuo, limite_annuo_msv);
        end
    else
        limite_msg = 'Limite annuo: non normato';
    end

% SEP status: mostra categoria o messaggio completo senza prefisso "SEP:"
if sep_active
    sep_line = sprintf('SEP: %s', sep_level);
else
    sep_line = 'nessun evento SEP attivo';
end

if ~isempty(protoni_time_disp)
    temp_header = sprintf('TEMPESTA SOLARE:\n(%s UTC)', protoni_time_disp);
else
    temp_header = 'TEMPESTA SOLARE:';
end
dati_tempesta = sprintf(['%s\n' ...
    'Kp %.1f\nProton Flux: %.2f pfu\n%s\n' ...
    'Dose (finale): %.4f mSv\n' ...
    'Dose cumulativa: %.4f mSv\n' ...
    '%s'], ...
    temp_header, indice_kp, flux_display, sep_line, dose_volo_finale, dose_cumulativa, limite_msg);

text(0.95, 0.11, dati_radiazione, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Interpreter', 'none');

% Sposta TEMPESTA SOLARE ancora più in basso sul lato sinistro del pannello
text(0.95, -0.18, dati_tempesta, 'Parent', ax2, 'VerticalAlignment', 'top', ...
    'HorizontalAlignment', 'right', 'FontSize', 8.5, 'FontName', 'Courier New', 'Units', 'normalized', 'Clipping', 'off', 'Interpreter', 'none');

% ========== MAPPA DI RADIAZIONE COSMICA ==========
% Subplot per la mappa di radiazione (bottom row, stessa larghezza della mappa della rotta)
ax3 = subplot(2, 10, 11:17);
imagesc(lon_grid, lat_grid, radiazione, 'Parent', ax3);
set(ax3, 'YDir', 'normal');
colormap(ax3, hot);
cbar = colorbar(ax3);
cbar.Label.String = 'Radiazione (mSv/anno)';

% Sovrapponi le coastlines
hold(ax3, 'on');
plot(coastlon, coastlat, 'w-', 'LineWidth', 1.0, 'Parent', ax3);

% Disegna tutte le rotte sulla mappa di radiazione con colori non conflittuali
palette_rotte = [
    0.00 0.45 1.00;  % blu intenso (no rosso/arancione/giallo/nero)
    0.20 0.65 0.90;  % azzurro
    0.00 0.80 0.70;  % teal
    0.55 0.00 0.65;  % viola
    0.10 0.55 0.90;  % blu medio
];
for i = 1:num_voli
    cidx = 1 + mod(i-1, size(palette_rotte, 1));
    c = palette_rotte(cidx, :);
    if i < num_voli
        % Rotte precedenti più spesse e visibili ma distinte
        plot(tutte_le_rotte{i}.lon, tutte_le_rotte{i}.lat, '-', 'Color', c, ...
            'LineWidth', 2.5, 'Parent', ax3);
    else
        % Rotta attuale ancora più spessa
        plot(tutte_le_rotte{i}.lon, tutte_le_rotte{i}.lat, '-', 'Color', c, ...
            'LineWidth', 4.0, 'Parent', ax3);
    end
end

% Segna solo il primo aeroporto di partenza (verde) e l'ultimo di arrivo (rosso)
plot(aero1.lon, aero1.lat, 'go', 'MarkerSize', 10, 'MarkerFaceColor', [0 1 0], 'LineWidth', 2, 'Parent', ax3, 'DisplayName', 'Partenza primo volo');
plot(aero2.lon, aero2.lat, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', [1 0.3 0.3], 'LineWidth', 2, 'Parent', ax3, 'DisplayName', sprintf('Arrivo ultimo volo (%d)', num_voli));

xlabel(ax3, 'Longitudine [°]', 'FontSize', 11);
ylabel(ax3, 'Latitudine [°]', 'FontSize', 11);
title(ax3, 'Mappa di Radiazione Cosmica e Rotta Aerea', 'FontSize', 12, 'FontWeight', 'bold');
grid(ax3, 'on');
axis(ax3, [-180 180 -90 90]);

    fprintf('\n');
    
    % Pulsante "Altro Volo" in basso a destra (più in alto, dopo la percentuale)
    btn_si = uicontrol('Style', 'pushbutton', ...
        'String', 'Altro Volo →', ...
        'Units', 'normalized', ...
        'Position', [0.85, 0.22, 0.13, 0.05], ...
        'FontSize', 11, ...
        'FontWeight', 'bold', ...
        'BackgroundColor', [0.3 0.9 0.3], ...
        'ForegroundColor', [1 1 1], ...
        'Callback', @(src, event) set(src, 'UserData', 'SI'));
    
    % Pulsante "Termina" in basso a destra (sotto il primo)
    btn_no = uicontrol('Style', 'pushbutton', ...
        'String', 'Termina', ...
        'Units', 'normalized', ...
        'Position', [0.85, 0.16, 0.13, 0.05], ...
        'FontSize', 11, ...
        'FontWeight', 'bold', ...
        'BackgroundColor', [0.9 0.3 0.3], ...
        'ForegroundColor', [1 1 1], ...
        'Callback', @(src, event) set(src, 'UserData', 'NO'));
    
    % Attendere finché l'utente non clicca uno dei pulsanti
    scelta_button = '';
    while isempty(scelta_button)
        % Verifica che i pulsanti esistano ancora
        if ~ishandle(btn_no) || ~ishandle(btn_si)
            % Se la finestra è stata chiusa, termina
            scelta_button = 'NO';
            break;
        end
        
        if ~isempty(get(btn_no, 'UserData'))
            scelta_button = get(btn_no, 'UserData');
        elseif ~isempty(get(btn_si, 'UserData'))
            scelta_button = get(btn_si, 'UserData');
        end
        pause(0.1);
    end
    
    % Elimina i pulsanti se esistono ancora
    if ishandle(btn_no)
        delete(btn_no);
    end
    if ishandle(btn_si)
        delete(btn_si);
    end
    
    if strcmp(scelta_button, 'NO')
        continua_volo = false;
    end
    
end  % Fine del loop while

fprintf('\n');
fprintf('╔════════════════════════════════════════════════════════════╗\n');
fprintf('║              RIEPILOGO FINALE TUTTI I VOLI                 ║\n');
fprintf('╚════════════════════════════════════════════════════════════╝\n');
fprintf('\n');
fprintf('  Categoria: %s\n', categoria_scelta);
fprintf('  Numero totale voli: %d\n', num_voli);
fprintf('  Dose cumulativa totale: %.4f mSv\n', dose_cumulativa);
if ~isnan(limite_annuo_msv)
    percent_limite_finale = (dose_cumulativa / limite_annuo_msv) * 100;
    fprintf('  Percentuale del limite annuo (%.0f mSv): %.2f%%\n', limite_annuo_msv, percent_limite_finale);
    if percent_limite_finale > 100
        fprintf('  ATTENZIONE: Limite annuo superato!\n');
    elseif percent_limite_finale > 80
        fprintf('  AVVISO: Prossimo al limite annuo\n');
    end
else
    fprintf('  Limite annuo: non normato\n');
end
fprintf('\nProgramma completato.\n\n');

function val = parseKpValue(v)
    if isnumeric(v)
        val = double(v);
        return;
    end
    s = strtrim(string(v));
    d = str2double(s);
    if ~isnan(d)
        val = d; return;
    end
    c = char(s);
    if isempty(c)
        val = NaN; return;
    end
    base = str2double(regexprep(c, '[^0-9].*$', ''));
    if isnan(base)
        val = NaN; return;
    end
    if contains(c, '+')
        val = base + 0.33;
    elseif contains(c, '-')
        val = base - 0.33;
    else
        val = base;
    end
end

function gmlat = geomag_latitude(lat_deg, lon_deg)
% Calcola una latitudine geomagnetica approssimata usando un dipolo centrato
% Polo geomagnetico nord (approssimato): 80.4N, 72.6W
    lat_p = 80.4; lon_p = -72.6;
    lat = deg2rad(lat_deg);
    lon = deg2rad(lon_deg);
    latp = deg2rad(lat_p);
    lonp = deg2rad(lon_p);
    cospsi = sin(lat).*sin(latp) + cos(lat).*cos(latp).*cos(lon - lonp);
    cospsi = max(-1,min(1,cospsi));
    psi = acos(cospsi); % colatitudine geomagnetica
    gmlat = 90 - rad2deg(psi);
end

function [flux, tstr] = extractP10(recArray)
% Estrae l'ultimo flusso protoni >=10 MeV e timestamp (char)
    flux = NaN; tstr = '';
    if isstruct(recArray)
        % Raccogli gli indici compatibili con >=10 MeV
        idx = [];
        for ii = 1:numel(recArray)
            if isfield(recArray(ii),'energy')
                e = lower(char(string(recArray(ii).energy)));
                if contains(e,'>=10') || (contains(e,'10') && contains(e,'mev'))
                    idx(end+1) = ii; %#ok<AGROW>
                end
            end
        end
        % Se nessun match esplicito, usa tutte le righe come fallback
        if isempty(idx)
            idx = 1:numel(recArray);
        end
        % Costruisci vettori di tempo e flusso
        times = -inf(1,numel(idx));
        fluxes = NaN(1,numel(idx));
        for k = 1:numel(idx)
            ii = idx(k);
            % Tempo
            if isfield(recArray(ii),'time_tag')
                ts = char(string(recArray(ii).time_tag));
            elseif isfield(recArray(ii),'time')
                ts = char(string(recArray(ii).time));
            else
                ts = '';
            end
            try
                dt = datetime(ts,'TimeZone','UTC');
                times(k) = datenum(dt);
            catch
                times(k) = -inf;
            end
            % Flusso
            fval = NaN;
            if isfield(recArray(ii),'flux')
                v = recArray(ii).flux;
                if isnumeric(v)
                    fval = double(v);
                else
                    fval = str2double(char(string(v)));
                end
            end
            fluxes(k) = fval;
        end
        % Ordina per tempo e prendi l'ultimo non-zero/non-NaN
        [~, order] = sort(times,'ascend');
        for kk = numel(order):-1:1
            ii = idx(order(kk));
            f = fluxes(order(kk));
            if ~isnan(f) && f > 0
                flux = f;
                if isfield(recArray(ii),'time_tag')
                    tstr = char(string(recArray(ii).time_tag));
                elseif isfield(recArray(ii),'time')
                    tstr = char(string(recArray(ii).time));
                end
                break;
            end
        end
        % Se tutti sono zero/NaN, usa l'ultimo disponibile anche se zero
        if isnan(flux)
            ii = idx(order(end));
            f = fluxes(order(end));
            if ~isnan(f)
                flux = f;
                if isfield(recArray(ii),'time_tag')
                    tstr = char(string(recArray(ii).time_tag));
                elseif isfield(recArray(ii),'time')
                    tstr = char(string(recArray(ii).time));
                end
            end
        end
    elseif iscell(recArray)
        row = recArray{end};
        if numel(row) >= 2
            f = str2double(char(string(row{2})));
            if ~isnan(f), flux = f; end
            tstr = char(string(row{1}));
        end
    end
end
