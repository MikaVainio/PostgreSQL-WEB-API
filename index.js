// PALVELIMEN MÄÄRITTELY

// Kirjastojen lataukset, otetaan käyttöön Express web-palvelin
const express = require('express')

// Kyselyt sisältävän modulin käyttöönotto (queries.js)
const db = require('./queries')

// Luodaan Express-sovellus
const app = express()

// Määritellään parser middleware: JSON ja URL tietojen käsittelyyn (Express:n oma parseri)
app.use(express.json())
app.use(express.urlencoded({extended: false}))

// Määritellään kuuneltava TCP-portti
const port = 3000

// REITTIEN MÄÄRITTELYT

// Määritellään juuren vastaus
app.get('/',(request, response) => {
    response.json({info: 'Node Postgres Web REST API Testausympäristö'})
})

// Määritellään /tyontekijat URL:n vastaus
app.get('/tyontekijat', db.getWorkers)

// Määritellään yksittäisen työntekijän haku-URL /tyontekijat/:id
app.get('/tyontekijat/:id', db.getWorkerById)

//Määritellään uuden työntekijän lisäys

app.post('/tyontekijat', db.createWorker)

// PALVELIMEN KÄYNNISTYS

// Luodaan kuuntelija TCP-portille ja kaiutetaan tieto konsolille
app.listen(port, () => {console.log(`Sovellus kuuntelee TCP-porttia ${port}.`)})