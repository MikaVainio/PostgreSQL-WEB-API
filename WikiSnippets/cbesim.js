// FUNKTIOIDEN MÄÄRITTELY

// Määritellään callback-funktio, joka annetaan jonkun toisen funktion parametriksi
// Tarkoituksena suorittaa se pääfunktion sisältä
const callbackFunction = (data) => {
  // Funktion toiminnot, esim. otsikko ja tiedot konsolille
  console.log(`Huoltoilmoitus: ${data}`)
}

// Määritellään varsinainen funktio, joka saa parametrikseen callback-funktion
const mainFunction = (callback) => {
  // Funktion toiminnot, esim. tietojen määritys (on callback-funktion data-parametri)
  callback('Palovaroitin vaihdettu 12.12.2019')
}

// Taavanomaisen funktion määritys
const otherFunction = () => {
    console.log(`Työpäivä päättyi!`)
}

// FUNKTIODEN SUORITUS

//Annetaan varsinaisen funktion parametsiksi callback-funktio ja suoritetaan se
mainFunction(callbackFunction)

// Suoritetaan tavanomainen funktio
otherFunction()