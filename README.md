# PostgreSQL WEB API
 Harjoituksia backend-ohjelmointiin Node.js-ympäristössä javascript-ohjelmointikielellä. Pääkomponetteina järjestelmässä ovat Express-kirjastoon pohjautuva Node web-palvelin ja PostgreSQL-tietokantapalvelin. Tietokantaa käytetään REST-arkkitehtuurin mukaisen rajapinnan kautta. Rajapinnan testaamiseen käytetään Postman-sovellusta. Harjoituksissa voi käyttää Starasoft.intra-verkon PostgreSQL-palvelinta tai omaan työasemaan asennettuva virtuaalipalvelinta.

 Harjoitusten tekemiseen tarvitaan Node.js-ohjelmistopaketti. Sen voi ladata osoitteesta https://nodejs.org/en/. Asennuksen jälkeen luodaan hakemisto sovellukselle. Järkevintä on luoda se versionhallitasovelluksella, esim. Visual Studio -kehitysympäristöllä tai Github Desktop -ohjelmalla, repositorio, joka on samalla sovelluksen hakemisto. Github Desktop ohjelmalla on helppo lisätä repostitorioon .gitignore tiedosto, joka estää Node.js-kirjastojen tarpeettoman tallentamisen. 

 ## Alkutoimet sovelluksen luomiseksi
 Sovelluksen perustiedot tallennetaan package.json-tiedostoon. Se luodaan kirjoittamalla seuraava komento kehitysmpäristön terminaali-ikkunaan:
 ```javascript
 npm init
 ```
 Init-komennon suorittamisen jälkeen pyydetään sovelluksen perustiedot. Harjoituksessa ne ovat seuraavat:
 ```
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
Seuraavassa vaiheessa otetaann käyttöön sovelluksessa tarvittavat kirjastot. Express-kirjaston avulla rakennetaan web-palvelimen runko. Se sisältää middleware-toiminnot HTTP-pyyntöjen sisällön käsittelyyn, URL-reitityksessä vaadittavat toiminnot sekä muut web-palvelimen perustoiminnot. Pg-kirjasto puolestaan mahdollistaa tietokantayhteyksien muodostamisen ja tietojen siirron web-palvelimen ja tietokantapalvelimen välillä.
