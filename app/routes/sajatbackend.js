const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  
  var connection
  function db_connect(){
    var mysql = require('mysql')

    connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'vallas'
    })
    
    connection.connect()
    
  }
  app.get('/idezet', (req, res) => {

    db_connect()
      
      connection.query('SELECT * from idezet inner join kategoria on idezet_kategoria=kategoria_id order by idezet_id desc', function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
    })
    app.delete('/torles_idezet', (req, res) => {
      db_connect()
      let parancs="DELETE FROM idezet WHERE idezet.idezet_id="+req.body.bevitel1+";";
      connection.query(parancs, function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
  
  })
  app.delete('/torles_velemeny', (req, res) => {
    db_connect()
    let parancs="DELETE FROM velemeny WHERE velemeny.velemeny_id="+req.body.bevitel1+";";
    connection.query(parancs, function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()

})
    app.post('/keresidezet', (req, res) => {
  
      db_connect()
      
      
      let parancs='SELECT * from idezet inner join kategoria on idezet_kategoria=kategoria_id where idezet.idezet_szoveg like "%'+req.body.bevitel1+'%" order by idezet_id desc'
      connection.query(parancs, function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
  
  })
  app.post('/keresvelemeny', (req, res) => {
  
    db_connect()
    
    let f='"%'+req.body.bevitel1+'%"'
    let parancs='SELECT * from velemeny inner join idezet on idezet_id=velemeny_idezet_id inner join kategoria on idezet_kategoria=kategoria_id where velemeny_szoveg like '+f+' order by velemeny_id desc'
    connection.query(parancs, function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()

})


app.get('/idezet', (req, res) => {

  db_connect()
    
    connection.query('SELECT * from idezet inner join kategoria on idezet_kategoria=kategoria_id order by idezet_id desc', function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()
  })
  app.get('/statisztika3', (req, res) => {

    db_connect()
      
      connection.query('SELECT count(id) as userscount FROM users', function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
    })
  app.get('/kategoria', (req, res) => {

  db_connect()
    
    connection.query('SELECT * from kategoria', function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()



    
  })
  

  app.post('/felvitel', (req, res) => {

    db_connect()
    
    connection.query("INSERT INTO idezet  VALUES (NULL, '"+req.body.bevitel1+"',NOW(),'"+req.body.bevitel2+"' ,'"+req.body.bevitel3+"' ,'"+req.body.bevitel4+"')", function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log("Sikeres felvitel!")
      res.send("Sikeres felvitel!")}
      
    })
    
    connection.end()

    
  })
app.get('/velemenyek', (req, res) => {

    db_connect()
    
    connection.query("select * from velemeny inner join idezet on idezet_id=velemeny_idezet_id inner join kategoria on idezet_kategoria=kategoria_id order by velemeny_id desc", function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log("Sikeres felvitel!")
      res.send(rows)}
      
    })
    
    connection.end()

    
  })
app.get('/statisztika1', (req, res) => {

    db_connect()
    
    connection.query("SELECT count(idezet_id) as idezetek_szama  FROM idezet", function (err, rows, fields)
     {
      if (err) 
        console.log( err)
      else{
      console.log("Sikeres felvitel!")
      res.send(rows)}
      
    })
    
    connection.end()

    
  })
 app.get('/statisztika2', (req, res) => {

    db_connect()
    
    connection.query("SELECT count(velemeny_id) as velemenyek_szama  FROM velemeny", function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log("Sikeres felvitel!")
      res.send(rows)}
      
    })
    
    connection.end()

    
  })
app.post('/velemeny', (req, res) => {

    db_connect()
    
    connection.query("INSERT INTO velemeny  VALUES (NULL, '"+req.body.bevitel1+"',NOW(),'"+req.body.bevitelvelemenyid+"')", function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log("Sikeres felvitel!")
      res.send("Sikeres felvitel!")}
      
    })
    
    connection.end()

    
  })
  app.get('/film', (req, res) => {

    db_connect()
      connection.query('SELECT * from film', function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
   })
  




};
