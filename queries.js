// TIETOKANTAKYSELYT

// Otetaan käyttöön PG-kirjaston Pool-luokan toiminnot
const Pool = require('pg').Pool

// Määritellään PostgreSQL-yhteys StaraPG:n tarkastus-tietokantaan luomalla pool-olio, tähän voi vaihtaa oman tietokannan tiedot
const pool = new Pool({
    user: 'postgres',
    host: '10.66.0.15',
    database: 'tarkastus',
    password: 'Q2werty',
    port: 5432
})

// Määritellään kysely ja mahdollinen virheilmoitus: kaikki työntekijät
const getWorkers = (request, response) => {
    pool.query('SELECT * FROM tyontekija', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

//Kysely yksittäisestä työntekijästä ID:n perusteella
const getWorkerById = (request, response) => {
    const id = parseInt(request.params.id) // URL:ssa merkkijono, tietokannassa INT

    pool.query('SELECT * FROM tyontekija WHERE tyontekija_id = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

// Uuden työntekijän lisäys
const createWorker = (request, response) => {
    const {
        givenname,
        surname
    } = request.body // Tietokannassa tyontekija_id on laskuri (serial), joten sitä ei anneta

    pool.query('INSERT INTO tyontekija (etunimi, sukunimi) VALUES ($1, $2)', [givenname, surname], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`Käyttäjä lisätty tunnisteella: ${results.rows[0].tyontekija_id}`) // Selvitetään taulun laskurin arvo
    })
}

// Työntekijän tietojen päivitys
const updateWorker = (request, response) => {
    const id = parseInt(request.params.id)
    const {
        givenname,
        surname
    } = request.body

    pool.query(
        'UPDATE tyontekija SET etunimi = $1, sukunimi = $2 WHERE tyontekija_id = $3',
        [givenname, surname, id],
        (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).send(`User modified with ID: ${id}`)
        }
    )
}

// Työntekijän poistaminen
const deleteWorker = (request, response) => {
    const id = parseInt(request.params.id)

    pool.query('DELETE FROM tyontekija WHERE tyontekija_id = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).send(`User deleted with ID: ${id}`)
    })
}

// Julkaistaan kyselyt index.js-tiedostossa käytettäväksi
module.exports = {
    getWorkers,
    getWorkerById,
    createWorker,
    updateWorker,
    deleteWorker
}