// Funktion määrittely perinteinen tapa
function bodyMassIndex(weight, height) {
    return weight / (height * height);
}


// Funktion käyttäminen
let bmi = bodyMassIndex(70, 1.7);
console.log(`bmi on ${bmi}`);
