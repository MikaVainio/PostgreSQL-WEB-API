// Uuden työntekijän lisäys
const createWorker = (request, response) => {

    // Haetaan HTTP-pyynnöstä tarvittavat arvot ja tallennetaan ne vakioihin
    const etunimi = request.body.givenname // $1:n arvoksi, on HTTP- pyynnössä givenname-avaimen arvona
    const sukunimi = request.body.surname // $2:n arvoksi, on pyynnössä surname-avaimen arvona 

    // Luodaan kysenlyn SQL-lause ja sijoitetaan etunimi ja sukunimi parametrien arvoiksi vektorina
    pool.query('INSERT INTO tyontekija (etunimi, sukunimi) VALUES ($1, $2)', [etunimi, sukunimi], (error, results) => {
        
        // Virheenkäsittely: Jos kyselyssä tapahtuu virhe, lähetetään poikkeus
        if (error) {
            throw error
        }

        // Muussa tapauksessa lähetetään statustieto 201 (Created) ja selväkielinen teksti 
        response.status(201).send(`Uusi yöntekijä lisätty `) 
    })
}