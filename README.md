# Progetto Misurazione Radiazione Cosmica

## Descrizione

Sistema avanzato di calcolo della dose di radiazione cosmica ricevuta durante voli aerei, con integrazione in tempo reale di dati meteo spaziali e simulazione di eventi solari storici.

Il programma calcola l'esposizione alle radiazioni ionizzanti per diverse categorie di utenti (equipaggio, passeggeri, ricercatori) su rotte aeree internazionali, considerando:
- **GCR (Galactic Cosmic Rays)**: radiazione galattica di fondo dipendente da quota, latitudine geomagnetica e ciclo solare
- **SEP (Solar Energetic Particles)**: particelle solari energetiche durante tempeste geomagnetiche
---

##  Obiettivi
- Stimare l’esposizione alle **radiazioni ionizzanti** in ambiente aeronautico
- Integrare **dati reali NOAA SWPC**
- Simulare **eventi solari estremi (SEP)**

---
## Caratteristiche Principali


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

### Fattore Didattico

La modalità simulazione fornisce un ambiente interattivo per:
- Comprendere i principi della radiazione cosmica 
- Visualizzare l’effetto del campo geomagnetico sulle rotte 
- Valutare l’impatto di eventi solari estremi (S-scale NOAA) sulle dosi
- Stimare e confrontare la dose in ambiente aeronautico per diverse categorie utente

---

## 📊 Modello di Calcolo

###  Calcoli Fisici

#### Componente GCR

**Formula completa:**
```
Dose_GCR = base_GCR × f_alt × f_lat × f_solar × t_volo
```

Dove:
- **base_GCR** = 5.0 μSv/h (dose base a quota di crociera, 45°N)
- **f_alt** = fattore altitudine = `exp(0.2 × (h_km - 10))` dove h_km è quota in km
- **f_lat** = fattore latitudine geomagnetica = `1 + 0.5 × |sin(gmlat)|`
- **f_solar** = fattore ciclo solare = 1.0 (placeholder, varia da 0.7 a 1.3 nel ciclo 11 anni)
- **t_volo** = tempo di volo in ore

**Dipendenze:**
- **Altitudine**: incremento esponenziale con la quota (massimo a ~12 km / FL390)
  - FL250 (7.6 km): f_alt ≈ 0.55
  - FL350 (10.7 km): f_alt ≈ 1.15
  - FL390 (11.9 km): f_alt ≈ 1.42
- **Latitudine geomagnetica**: massima ai poli (campo magnetico terrestre più debole), minima all'equatore
  - Equatore (0°): f_lat = 1.0
  - Media latitudine (45°): f_lat ≈ 1.35
  - Poli (90°): f_lat = 1.5
- **Ciclo solare**: attività solare riduce GCR (minimo solare → massima radiazione cosmica)

#### Componente SEP

**Formula completa:**
```
Dose_SEP = base_SEP × (proton_flux / 100)^0.75 × (Kp / 5) × f_lat × t_volo
```

**Condizione di attivazione:** SEP si attiva solo se `proton_flux ≥ 10 pfu`

Dove:
- **base_SEP** = 2.0 μSv/h (dose base per flux 100 pfu, Kp=5)
- **proton_flux** = flusso protonico ≥10 MeV in pfu (particles/cm²·s·sr)
- **Esponente 0.75** = scaling non-lineare del flusso protonico
- **Kp** = indice K planetario (0-9, misura attività geomagnetica)
- **f_lat** = fattore latitudine geomagnetica (stesso del GCR)
- **t_volo** = tempo di volo in ore

**Classificazione NOAA S-scale:**
- **S0**: <10 pfu (nessun evento SEP attivo)
- **S1**: ≥10 pfu (minor)
- **S2**: ≥100 pfu (moderate)
- **S3**: ≥1000 pfu (strong)
- **S4**: ≥10000 pfu (severe)
- **S5**: ≥100000 pfu (extreme)

#### Dose Totale per Categoria Utente

```
Dose_finale = (Dose_GCR + Dose_SEP) × fattore_categoria
```

**Fattori dose per categoria:**

| Categoria | Fattore | Motivazione |
|-----------|---------|-------------|
| **Pilota** | 1.0× | Posizione cockpit, massima esposizione |
| **Cabin Crew** | 0.90× | Schermatura migliore in cabina passeggeri |
| **Passeggero adulto** | 0.85× | Posizione centrale fusoliera |
| **Bambino** | 1.20× | Maggiore radiosensibilità tessuti in crescita |
| **Donna in gravidanza** | 1.0× | Protezione fetale (no fattore aggiuntivo, ma limite più basso) |
| **Ricercatori polari** | 1.20× | Frequente esposizione a rotte ad alta latitudine |

**Note sui fattori:**
- Il fattore categoria modifica la dose finale per riflettere:
  1. **Schermatura differenziale** nella fusoliera (cockpit vs cabina)
  2. **Radiosensibilità biologica** (adulti vs bambini)
  3. **Condizioni di esposizione** (frequenza rotte polari per ricercatori)
- Categorie vulnerabili (bambini, gravidanza) hanno fattore >1.0 o limiti più conservativi

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

**Spiegazione**: si tratta di un modello a “barra” (dipolo) per stimare la protezione magnetica: ai poli campo più debole → dose ↑, all’equatore campo più forte → dose ↓. È rapido, coglie il trend principale; anomalie locali richiederebbero modelli completi ma non servono per questa simulazione.

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
misura_radiazione_cosmica.m
```

### Categorie Utenti

Lo script supporta 6 categorie di utenti con caratteristiche specifiche:

| Categoria | Descrizione | Frequenza Voli | Rotte Tipiche | Dose Annua Attesa |
|-----------|-------------|---------------|----|---|
| **1. Pilota** | Piloti di linea aerea (cockpit crew) | 500–1000 h/anno | Tutte le rotte internazionali, incluse polari | ~2–4 mSv |
| **2. Cabin Crew** | Assistenti di volo (flight attendants) | 400–800 h/anno | Tutte le rotte, alta esposizione | ~1.5–3 mSv |
| **3. Passeggero Adulto** | Passeggeri adulti occasionali o frequenti | 1–50 voli/anno | Rotte variabili | ~0.05–0.5 mSv |
| **4. Passeggero Bambino** | Bambini (< 12 anni) con vulnerabilità aumentata | 1–20 voli/anno | Rotte familiari | ~0.03–0.3 mSv |
| **5. Donna in Gravidanza** | Donne incinte (esposizione fetale) | 0–5 voli/anno | Rotte brevi/medie | ~0.02–0.1 mSv |
| **6. Ricercatori Scientifici** | Ricercatori che studiano radiazione su rotte polari | Variabile | Rotte polari (KEF, ANC, TOS, NRL) | ~1–3 mSv |

**Note:**
- **Limite normativo ICRP**: 20 mSv/anno per lavoratori esposti (categorie 1–2: piloti e cabin crew)
- **Protezione categorie vulnerabili**: donne incinte e bambini hanno limiti più conservativi (~1 mSv/anno)
- **Dose di riferimento**: i passeggeri ricevono ~0.04 mSv per attraversamento atlantico
- **Ciclo solare**: varia il fattore GCR di ±30% (minimo solare → dose maggiore)

### Flusso Operativo
1. **Selezione modalità dati**: tempo reale (NOAA) o evento SEP storico
2. **Categoria utente**: scegli fra 6 categorie (vedi tabella sopra)
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
---

### Limitazioni Attuali
- Ciclo solare: fattore fisso (placeholder 1.0), non integrato con dati SSN (Sunspot Number)
- Altitudine: profilo idealizzato (salita/crociera/discesa lineare)
--- 

## Autore

Simone Giannone 

## Repository

https://github.com/simonegiannone1708-a11y/progetto-misurazione-radiazione-cosmica