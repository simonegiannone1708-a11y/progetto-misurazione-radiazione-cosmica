# Progetto Misurazione Radiazione Cosmica

## Descrizione

Sistema di calcolo della dose di radiazione cosmica ricevuta durante voli aerei, con integrazione di dati meteo spaziali e simulazione di eventi solari storici.

Il programma calcola l'esposizione alle radiazioni ionizzanti su rotte aeree internazionali, considerando:
- **GCR (Galactic Cosmic Rays)**: radiazione galattica di fondo dipendente da quota e latitudine
- **SEP (Solar Energetic Particles)**: particelle solari energetiche durante tempeste geomagnetiche

## Caratteristiche Principali

### 📡 Dati in Tempo Reale
- **NOAA SWPC Integration**: indice Kp (attività geomagnetica) e flusso di protoni GOES
- **Aggiornamenti Live**: Kp ogni minuto, proton flux giornaliero

### 🌩️ Eventi SEP Storici
Simulazione con database di tempeste solari reali:
- **Gennaio 2005**: 5040 pfu, Kp=8.0 (forte)
- **Halloween Storm - Ottobre 2003**: 29500 pfu, Kp=9.0 (estremo)
- **Settembre 2017**: 6530 pfu, Kp=8.3 (severo)

### ✈️ Database Aeroporti
74 aeroporti internazionali su 6 continenti:
- **Europa** (18): FCO, MXP, VCE, NAP, CTA, CDG, BCN, LHR, AMS, FRA, MAD, VIE, ZRH, MUC, BRU, SVO, ATH, IST
- **Nord America** (12): JFK, LAX, ORD, DFW, ATL, MIA, SFO, BOS, YYZ, YVR, MEX
- **Asia** (11): NRT, HKG, SIN, BKK, DEL, ICN, PEK, SHA, DXB, DOH, AUH
- **Sud America** (7): GRU, GIG, EZE, LIM, SCL, BOG, CCS
- **Africa** (5): JNB, CPT, NBO, CAI, ADD
- **Oceania** (4): SYD, MEL, PER, AKL
- **Rotte polari** (13): ANC, KEF, TOS, MRV, NRL, GOH, SFJ, INK, YZF, BRW, HFT, LYR, ARH
- **Russia** (4): LED, OVB, SVX, VVO

### 🛫 Tipi di Rotta
- **Ortodromica (Great Circle)**: rotta più breve su sfera (>300 NM)
- **Lossodromica (Rhumb Line)**: rotta con angolo costante con meridiani (≤300 NM)

---

## 📖 Manuale di Utilizzo

**Per istruzioni dettagliate, consulta [docs/MANUALE_UTILIZZO.md](docs/MANUALE_UTILIZZO.md).**

Il manuale contiene:
- Avvio rapido dello script principale
- Sistema di validazione interna (script in `validation/`)
- Guida all'interpretazione dei risultati
- Troubleshooting

---

## ⚡ Avvio Rapido

```matlab
cd 'path/al/progetto'
calcolo_rotta_aerei_new
```

Seleziona aeroporti, quota e condizioni spaziali → Ottieni dose GCR/SEP.

---

## Requisiti Tecnici

- **MATLAB R2019b+**
- Connessione Internet (opzionale, per dati NOAA tempo reale)

---

## Autore

Simone Giannone

## Repository

https://github.com/simonegiannone1708-a11y/progetto-misurazione-radiazione-cosmica
