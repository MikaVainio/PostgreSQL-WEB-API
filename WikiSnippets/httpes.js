// PALVELIMEN MÄÄRITTELY

// Kirjastojen lataukset, otetaan käyttöön Express web-palvelin
const express = require('express')


// Luodaan Express-sovellus
const app = express()

// Määritellään parser middleware: JSON ja URL tietojen käsittelyyn (Express:n oma parseri)
app.use(express.json())
app.use(express.urlencoded({
    extended: false
}))

// Määritellään kuuneltava TCP-portti
const port = 3000

// REITTIEN MÄÄRITTELYT

// Palautetaan HTTP-pyynnön body takaisin lähettäjälle body -> body
app.get('/body', (request, response) => {
    response.json(request.body)
})

// Palautetaan kyselyparametrit takaisin lähettäjälle  query -> body
app.get('/http-query', (request, response) => {
    response.json(request.query)
})

// Palautetaan reititysparametrit takaisin lähettäjälle route -> body
app.get('/route-query/:id', (request, response) => {
    response.json(request.params)
})

// Luodaan kuuntelija TCP-portille ja kaiutetaan tieto konsolille
app.listen(port, () => {
    console.log(`Sovellus kuuntelee TCP-porttia ${port}.`)
})