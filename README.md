# webbackend2023

Telepítés menete:
- Telepíteni kell a node.js programot, ami a frontend és a backend működéséhez kell. Letöltése: https://nodejs.org/en, és az lts verziót ajánlott. 
- Telepíteni kell az XAMPP nevű programot, ami tartalmazza az Mysql/phpMyAdmin adatbáziskezelőt. Letöltése: https://www.apachefriends.org/hu/download.html, ebből a 8.1.12 -es verziót.
- Telepíteni kell a Git programot https://git-scm.com/downloads.
- Meg kell nyitni Fájlkezelőt, utána egy tetszőleges könyvtába belépve, vagy egy új mappa. Utána Shiht+jobb egérgomb Megnyitás Terminálban vagy PowerShell-ablak nyitása itt opció kiválasztása.

- A webfrontend és a webbackend egy mappában kell lennie pl:                                Vallas/webfrontend
Vallas/webbackend
 Mindkét esetben az npm i  --force parancsot kell kiadni, a függőségek telepítéséhez. 
A Windows 11 esetén a terminálban vannak fülek, úgy ahogy a böngészőben is. Itt a + gombbal lehet új terminált nyitni. Az egyikben a backend a másikban a frontend mappa van.

 XAMPP programot el kell indítani.                                                      
Itt az Apache-t és a Mysql-t el indítani a Start gomb segítségével. Majd az aktívvá váló Admin gombra megnyílik a phpMyAdmin a böngészőben.                                     Az importálás menüben be kell importálni a vallas.sql fájlt.
 Először a backendet kell utána a frontendet. A backend indításához a node server.js parancssot kell kiadni és a frontendhez pedig a npm start parancsot kell kiadni.              Ha mindent jól csináltunk elindul a webes felület és lehet használni. Ammenyiben nem nyílik meg automatikusan a böngészö, akkor el kell indítani és a címsorba a http://local
host:8081/ címet kell beírni.                                                      A webeshez nem kell internet a telepítés után, mert ez a localhoston kommunikál, így működik offline, ha minden problémamentesen zajlott le.
