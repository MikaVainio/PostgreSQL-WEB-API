// Funktion määrittely perinteiseen tapaan
function bodyMassIndex(weight, height) {
    return weight / (height * height);
}

// Määrittely ES6:n tapaan
const bodyMassIndexV2 = (weight, height) => {
    return weight / (height * height);
}
// Funktion käyttäminen
let bmi = bodyMassIndex(70, 1.7);
let bmi2 = bodyMassIndexV2(77, 1.7);
console.log(`bmi on ${bmi} ja bmi2 on ${bmi2}`);