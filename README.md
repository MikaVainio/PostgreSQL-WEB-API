# PostgreSQL WEB API
 Harjoituksia backend-ohjelmointiin Node.js-ympäristössä javascript-ohjelmointikielellä. Pääkomponetteina järjestelmässä ovat Express-kirjastoon pohjautuva Node web-palvelin ja PostgreSQL-tietokantapalvelin. Tietokantaa käytetään REST-arkkitehtuurin mukaisen rajapinnan kautta. Rajapinnan testaamiseen käytetään Postman-sovellusta. Harjoituksissa voi käyttää Starasoft.intra-verkon PostgreSQL-palvelinta tai omaan työasemaan asennettuva virtuaalipalvelinta.

 Harjoitusten tekemiseen tarvitaan Node.js-ohjelmistopaketti. Sen voi ladata osoitteesta https://nodejs.org/en/. Asennuksen jälkeen luodaan hakemisto sovellukselle. Järkevintä on luoda versionhallitasovelluksella, esim. Visual Studio -kehitysympäristöllä tai Github Desktop -ohjelmalla, repositorio, joka on samalla sovelluksen hakemisto. Github Desktop -ohjelmalla on helppo lisätä repostitorioon .gitignore tiedosto, joka estää Node.js-kirjastojen tarpeettoman tallentamisen. 

 ## Alkutoimet sovelluksen luomiseksi
 Sovellus vaatii toimiakseen joitakin Node.js-kirjastoja. Sovelluksen omat perustiedot määritellään niin ikään ennen varsinaisen sovelluskoodin kirjoittamista.
 ### Sovelluksen perustiedot
 Sovelluksen perustiedot tallennetaan package.json-tiedostoon. Se luodaan kirjoittamalla komento `npm init` kehitysmpäristön terminaali-ikkunaan.
 
 Init-komennon suorittamisen jälkeen pyydetään sovelluksen perustiedot. Oletusasetukset hyväksytään Enter-näppäimellä. Harjoituksessa asetukset ovat seuraavat:
 ```javascript
 {
  "name": "postgresql-web-api",
  "version": "1.0.0",
  "description": "REST API for PostgreSQL based Inspection database",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/MikaVainio/PostgreSQL-WEB-API.git"
  },
  "keywords": [
    "REST",
    "PostgreSQL"
  ],
  "author": "Mika Vainio",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/MikaVainio/PostgreSQL-WEB-API/issues"
  },
  "homepage": "https://github.com/MikaVainio/PostgreSQL-WEB-API#readme"
}
```
### Kirajstojen asentaminen
Seuraavassa vaiheessa otetaann käyttöön sovelluksessa tarvittavat kirjastot. Express-kirjaston avulla rakennetaan web-palvelimen runko. Se sisältää middleware-toiminnot HTTP-pyyntöjen sisällön käsittelyyn, URL-reitityksessä vaadittavat toiminnot sekä muut web-palvelimen perustoiminnot. Pg-kirjasto puolestaan mahdollistaa tietokantayhteyksien muodostamisen ja tietojen siirron web-palvelimen ja tietokantapalvelimen välillä. Kirjastot asennetaan komennolla `npm install express pg`.

### Sovelluksen ajamaminen
Node.js-sovelluksia ajetaan komennolla `node`, jonka parametksi annetaan pääohjelman javascript-tiedoston nimi, joka tässä harjoituksessa on `index.js`. Sovelluskehitysvaiheessa jokaisen muutoksen jälkeen ajoympäristö on pysäytettävä terminaali-istunnossa `CTRL+C` näppäinyhdistelmällä ja käynnistettävä uudelleen `node index.js` komennolla. Tästä syystä on järkevää käyttää ajoympäristönä nodemon-työkalua. Sen voi asentaa globaalisti oman tietokoneeseen komennolla `npm install -g nodemon`. Toinen vaihtoehto on tehdä sille sovelluskehitysriippuvuus komennolla `npm install --save-dev nodemon`. Sovelluskehityksen aikana sovellus käynnistetään komennolla `nodemon index.js`. Kun ohjelmakoodi tallennetaan, sovellus päivittyy saman tien. Jos asiakasohjelmistona käytetään selainta, sivu on päivitettävä tarvittaessa.

Kirjastojen asentamisen jälkeen `package.json`-tiedostoon lisätään merkinnät kirjaistoista. Tämä tapahtuu automaattisesti. Tiedoston loppu näyttää seuraavalta:
```javascript
"homepage": "https://github.com/MikaVainio/PostgreSQL-WEB-API#readme",
  "dependencies": {
    "express": "^4.17.1",
    "pg": "^7.14.0"
  },
  "devDependencies": {
    "nodemon": "^2.0.2"
  }
}
```
Sovelluksien kirjastot saattavat puolestaan käyttää muita kirjastoja. Riippuvuudet selviävät tiedostosta `package-lock.json`. Normaalissa perussovelluskehityksessä ohjelmoijan ei tarvitse huomioida näitä. Kun sovelluskoodia säilytetään GitHub-repositoriossa, repostitorion omistaja saa ilmoituksen haavoittuvuuksista, joita mäahdollisesti sisältyy hänen käyttämiinsä kirjastoihin. Niihin saa yleensä myös korjausehdotukset.

## Valmiit tiedostot
Harjoitukseen on tehty sovelluksen pääohjelman runko `index.js` sekä CRUD-kyselyt `tyontekijat`-tauluun tiedostossa `queries.js`. Sovelluksen arkkitehtuuria ja testauksessa tarvittavia työkaluja käsitellään tarkemmin Wiki-sivuilla.



