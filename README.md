# Progetto Misurazione Radiazione Cosmica

## Descrizione

Sistema avanzato di calcolo della dose di radiazione cosmica ricevuta durante voli aerei, con integrazione in tempo reale di dati meteo spaziali e simulazione di eventi solari storici.

Il programma calcola l'esposizione alle radiazioni ionizzanti per diverse categorie di utenti (equipaggio, passeggeri, ricercatori) su rotte aeree internazionali, considerando:
- **GCR (Galactic Cosmic Rays)**: radiazione galattica di fondo dipendente da quota, latitudine geomagnetica e ciclo solare
- **SEP (Solar Energetic Particles)**: particelle solari energetiche durante tempeste geomagnetiche

## Caratteristiche Principali

### 📡 Dati in Tempo Reale
- **NOAA SWPC Integration**: recupero automatico dell'indice Kp (attività geomagnetica) e flusso di protoni GOES
- **Aggiornamenti Live**: dati satellitari aggiornati ogni minuto (Kp) e ogni giorno (proton flux ≥10 MeV)

### 🌩️ Eventi SEP Storici
Modalità simulazione con database di tempeste solari reali:
- **Gennaio 2005**: 5040 pfu, Kp=8.0 (forte)
- **Halloween Storm - Ottobre 2003**: 29500 pfu, Kp=9.0 (estremo - uno degli eventi più intensi mai registrati)
- **Settembre 2017**: 6530 pfu, Kp=8.3 (severo)

### ✈️ Database Aeroporti
74 aeroporti internazionali su 6 continenti:
- **Europa** (18): FCO, MXP, VCE, NAP, CTA, CDG, BCN, LHR, AMS, FRA, MAD, VIE, ZRH, MUC, BRU, SVO, ATH, IST
- **Nord America** (12): JFK, LAX, ORD, DFW, ATL, MIA, SFO, BOS, YYZ, YVR, MEX (include USA, Canada, Messico)
- **Asia** (11): NRT, HKG, SIN, BKK, DEL, ICN, PEK, SHA, DXB, DOH, AUH, TLV, RUH (include Medio Oriente)
- **Sud America** (7): GRU, GIG, EZE, LIM, SCL, BOG, CCS
- **Africa** (5): JNB, CPT, NBO, CAI, ADD
- **Oceania** (4): SYD, MEL, PER, AKL
- **Rotte polari** (13): ANC (Anchorage), KEF (Reykjavik), TOS (Tromsø), MRV (Murmansk), NRL (Naryan-Mar), GOH (Nuuk), SFJ (Sondre Strømfjord), INK (Inuvik), YZF (Yellowknife), BRW (Barrow), HFT (Hammerfest), LYR (Longyearbyen), ARH (Arkhangelsk)
- **Russia** (4): LED (San Pietroburgo), OVB (Novosibirsk), SVX (Ekaterinburg), VVO (Vladivostok)

**Aeroporti italiani disponibili**: FCO (Roma Fiumicino), MXP (Milano Malpensa), VCE (Venezia), NAP (Napoli), CTA (Catania)

### 🛫 Tipi di Rotta
- **Ortodromica (Great Circle)**: rotta più breve su sfera (>300 NM) - ottimale per lunghe distanze
- **Lossodromica (Rhumb Line)**: rotta che interseca tutti i meridiani con lo stesso angolo (≤300 NM) - ottimale per le tratte brevi

# 🌌 Progetto Misurazione Radiazione Cosmica

Sistema avanzato per il **calcolo della dose di radiazione cosmica** ricevuta durante voli aerei, con integrazione di **dati meteo spaziali in tempo reale** e **simulazione di eventi solari storici**.

Il progetto è pensato per analisi scientifiche, supporto alla sicurezza aeronautica e valutazione dell’esposizione radiologica di equipaggi e passeggeri su rotte internazionali, incluse **rotte polari ad alta latitudine**.

---

## ✨ Obiettivi
- Stimare l’esposizione alle **radiazioni ionizzanti** in ambiente aeronautico
- Integrare **dati reali NOAA SWPC**
- Simulare **eventi solari estremi (SEP)**
- Valutare la conformità ai **limiti normativi ICRP**

---

## 🔬 Tipologie di Radiazione Considerate

### ☄️ GCR – Galactic Cosmic Rays
Radiazione cosmica galattica di fondo dipendente da:
- **Altitudine di volo**
- **Latitudine geomagnetica**
- **Fase del ciclo solare**

### ☀️ SEP – Solar Energetic Particles
Particelle solari energetiche durante:
- Tempeste geomagnetiche
- Espulsioni di massa coronale (CME)
- Eventi solari estremi storici

---

## 📡 Dati in Tempo Reale

- **NOAA SWPC Integration**
  - Indice **Kp** (attività geomagnetica)
  - Flusso protonico **GOES ≥10 MeV**
- **Aggiornamenti**
  - Kp: ogni minuto
  - Proton flux: giornaliero

---

## 🌩️ Eventi SEP Storici (Modalità Simulazione)

| Evento | Proton Flux (pfu) | Kp | Intensità |
|------|------------------|----|-----------|
| Gennaio 2005 | 5.040 | 8.0 | Forte |
| Halloween Storm (2003) | 29.500 | 9.0 | **Estremo** |
| Settembre 2017 | 6.530 | 8.3 | Severo |

---

## 📊 Modello di Calcolo

### 👥 Categorie Utenti con Limiti Normativi
1. **Pilota**: 20 mSv/anno (ICRP 2007)
2. **Cabin Crew**: 20 mSv/anno
3. **Passeggero adulto**: 1 mSv/anno (pubblico generico)
4. **Bambino**: 1 mSv/anno (maggiore radiosensibilità)
5. **Donna in gravidanza**: 1 mSv/anno (protezione fetale)
6. **Ricercatori scientifici (rotte polari)**: 20 mSv/anno (esposizione professionale su rotte ad alta latitudine)

### 📊 Calcoli Fisici

#### Componente GCR
```
Dose_GCR = f(altitudine, latitudine_geomagnetica, fase_ciclo_solare)
```
- **Altitudine**: incremento esponenziale con la quota (massimo a ~12 km / FL390)
- **Latitudine geomagnetica**: massima ai poli (campo magnetico terrestre più debole), minima all'equatore
- **Ciclo solare**: attività solare riduce GCR (minimo solare → massima radiazione cosmica)

#### Componente SEP
```
Dose_SEP = f(proton_flux, Kp_index, latitudine_geomagnetica)
```
- **Proton flux**: intensità particelle ≥10 MeV (pfu = particles/cm²·s·sr)
- **Classificazione NOAA**: S0-S5 (None → Extreme)
	- S0: <10 pfu (nessun evento)
	- S1: ≥10 pfu (minor)
	- S2: ≥100 pfu (moderate)
	- S3: ≥1000 pfu (strong)
	- S4: ≥10000 pfu (severe)
	- S5: ≥100000 pfu (extreme)

### 📈 Output e Visualizzazioni

#### Report Console
- Dati aeroporti (nome, IATA, coordinate)
- Parametri rotta (distanza, tipo, quota crociera, tempo volo)
- Radiazione separata: GCR + SEP + Totale (mSv/h e mSv totali)
- Dati NOAA: Kp, livello tempesta, proton flux, classificazione SEP
- Livello di rischio: BASSO / MODERATO / ELEVATO
- Percentuale limite annuo cumulativo (multi-volo)

#### Visualizzazioni Grafiche
1. **Mappa Rotta**: coastlines + tracciato volo con altitudine profilo (salita/crociera/discesa)
2. **Panel Dati Volo**: 
	 - Partenza/Arrivo
	 - Quota crociera, Tempo volo
	 - Tipo volo, Tipo rotta
	 - Radiazione finale e livello rischio
	 - Tempesta solare (Kp, proton flux, SEP status)
	 - Dose cumulativa e % limite annuo
3. **Mappa Radiazione Cosmica**: heatmap globale con overlay rotte multiple

### 🔄 Modalità Multi-Volo
- Accumulo dose cumulativa su più voli consecutivi
- Tracking percentuale rispetto al limite annuo
- Visualizzazione differenziata rotte precedenti/corrente
- Pulsanti interattivi: "Altro Volo" / "Termina"

## Modello Geofisico

### Campo Geomagnetico
Approssimazione dipolare con polo magnetico a:
- **Latitudine**: 80.4°N
- **Longitudine**: 72.6°W (Groenlandia)

Calcolo latitudine geomagnetica:
```matlab
gmlat = asin(sin(lat)*sin(lat_mag) + cos(lat)*cos(lat_mag)*cos(lon - lon_mag))
```

### Profilo Altimetrico
- **Salita**: 0-10 km, pendenza 300 m/NM
- **Crociera**: quota costante (FL350-FL410 tipicamente)
- **Discesa**: ultimi 10 km, pendenza -300 m/NM

## Requisiti Tecnici

### Software
- **MATLAB R2020+** 
- Mapping Toolbox (per coastlines.mat)
- Connessione Internet (modalità tempo reale)

### Dipendenze
```matlab
coastlines.mat  % Dati coastline mondiali
```

### API Esterne
- NOAA SWPC JSON API:
	- `planetary_k_index_1m.json` (Kp 1-min)
	- `integral-protons-1-day.json` (GOES proton flux)

## Utilizzo

### Avvio
```matlab
calcolo_rotta_aerei_new
```

### Flusso Operativo
1. **Selezione modalità dati**: tempo reale o evento storico
2. **Categoria utente**: scegli tra 6 categorie
3. **Aeroporto partenza**: lista con ricerca
4. **Aeroporto arrivo**: lista con ricerca
5. **Visualizzazione risultati**: mappe + report + panel interattivo
6. **Multi-volo** (opzionale): aggiungi altri voli o termina

### Caso d'Uso: Simulazione Halloween Storm 2003
```
1. Modalità: "Evento SEP storico - Ottobre 2003 Halloween Storm"
2. Categoria: "Ricercatori scientifici (frequentanti rotte polari)"
3. Rotta: JFK (New York) → KEF (Reykjavik)
4. Risultato: dose SEP estremamente elevata su rotta polare durante tempesta record
```

## Riferimenti Normativi

- **ICRP 2007**: International Commission on Radiological Protection
- **NOAA Space Weather Scales**: classificazione eventi SEP (S-scale)
- **EURATOM 96/29**: limiti dose per lavoratori esposti
- **ICAO Annex 6**: standard aviazione civile internazionale

## Limiti e Sviluppi Futuri

### Limitazioni Attuali
- Ciclo solare: fattore fisso (placeholder 1.0), non integrato con dati SSN (Sunspot Number)
- Modello GCR: semplificato (non considera composizione spettrale completa)
- Altitudine: profilo idealizzato (salita/crociera/discesa lineare)

### Possibili Estensioni
- Integrazione database SSN per correzione ciclo solare reale
- Supporto proton flux ≥100 MeV per SEP ad alta energia
- Calcolo dose equivalente per singoli organi (dosimetria differenziata)
- Export dati in formato CSV/Excel per analisi statistica
- Database eventi SEP esteso (ultimi 30 anni di storia solare)

## Autore

Simone Giannone 

## Repository

https://github.com/simonegiannone1708-a11y/progetto-misurazione-radiazione-cosmica