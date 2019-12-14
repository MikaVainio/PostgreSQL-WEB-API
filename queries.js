// TIETOKANTAKYSELYT

// Määritellään PostgreSQL-yhteys StaraPG:n tarkastus-tietokantaan
const Pool = require('pg').Pool
const pool = new Pool({
    user: 'postgres',
    host: '10.66.0.15',
    database: 'tarkastus',
    password: 'Q2werty',
    port: 5432
})

// Määritellään kysely ja mahdollinen virheilmoitus
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
    const { givenname, surname } = request.body
   // console.log(`tallennetaan ${givenname}.`)
  
    pool.query('INSERT INTO tyontekija (etunimi, sukunimi) VALUES ($1, $2)', [givenname, surname], (error, results) => {
      if (error) {
        throw error
      }
      response.status(201).send(`Käyttäjä lisätty tunnisteella: ${results.rows[0].tyontekija_id}`)
    })
  }

  // Julkaistaan kyselyt
module.exports = {
    getWorkers,
    getWorkerById,
    createWorker,
}