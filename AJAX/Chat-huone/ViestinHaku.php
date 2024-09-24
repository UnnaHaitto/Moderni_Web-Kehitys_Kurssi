<?php
$palvelin = "localhost";
$kayttaja = "Jokunen";  // tämä on tietokannan käyttäjä, ei tekemäsi järjestelmän
$salasana = "Kouluhomma123";
$tietokanta = "chathuone";

// luo yhteys
$yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);

// jos yhteyden muodostaminen ei onnistunut, keskeytä ja näytä virheilmoitus
if ($yhteys->connect_error) {
   die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
}
// aseta merkistökoodaus (muuten ääkköset sekoavat)
$yhteys->set_charset("utf8");

$hakusql = "SELECT * FROM postaus";

if(isset($_GET["id"])){
    $id = $yhteys->real_escape_string($_GET["id"]);

    $hakusql = "SELECT * FROM postaus WHERE id > $id";
}

// suorita kysely ja sijoita palautetut rivit $tulokset-muuttujaan
$tulokset = $yhteys->query($hakusql);

// jos tulosrivejä löytyi
// hae joka silmukan kierroksella uusi rivi - silmukka päättyy, kun rivit loppuvat$rivit = array();
while($postaus = $tulokset->fetch_assoc()) {
    $rivit[] = $postaus;  // lisätään käsiteltävänä oleva rivi syötteeseen
}

header('Content-Type: application/json; charset=UTF-8');  // asetetaan content-type ja merkistö
$json = json_encode($rivit);
echo $json;

$yhteys->close();
?>
