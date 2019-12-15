// Otetaan käyttöön modulin funces julkaistut funktiot
const funcs = require('./funces')

// Käytetään modulin bmi-funktiota
let myBmi = funcs.bodyMassIndex(77, 1.7)
console.log(`Painoineksi on ${myBmi}`)
