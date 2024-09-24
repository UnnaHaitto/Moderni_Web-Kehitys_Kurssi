<?php 
$palvelin = "localhost";
$kayttaja = "Jokunen";  // tämä on tietokannan käyttäjä, ei tekemäsi järjestelmän
$salasana = "Kouluhomma123";
$tietokanta = "Kommentointisivusto";

// luo yhteys
$yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);

// jos yhteyden muodostaminen ei onnistunut, keskeytä ja näytä virheilmoitus
if ($yhteys->connect_error) {
   die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
}
// aseta merkistökoodaus (muuten ääkköset sekoavat)
$yhteys->set_charset("utf8");

$hakusql = "SELECT * FROM kommentti";

if(isset($_GET["id"])){
   $id = $yhteys->real_escape_string($_GET["id"]);
   $hakusql = "SELECT * FROM kommentti WHERE asiakirja_id = $id";
}

// suorita kysely ja sijoita palautetut rivit $tulokset-muuttujaan
$tulokset = $yhteys->query($hakusql);

$rivit = array();
while($rivi = $tulokset->fetch_assoc()) {
   $rivit[] = $rivi;   // lisätään käsiteltävänä oleva rivi syötteeseen
}
header('Content-Type: application/json; charset=UTF-8');  // asetetaan content-type ja merkistö
$json = json_encode($rivit);
echo $json;

$yhteys->close();
?>