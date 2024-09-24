<?php
$palvelin = "localhost";
$kayttaja = "Jokunen";  // tämä on tietokannan käyttäjä, ei tekemäsi järjestelmän
$salasana = "Kouluhomma123";
$tietokanta = "kommentointisivusto";

// luo yhteys
$yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);

// jos yhteyden muodostaminen ei onnistunut, keskeytä ja näytä virheilmoitus
if ($yhteys->connect_error) {
   die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
}
// aseta merkistökoodaus (muuten ääkköset sekoavat)
$yhteys->set_charset("utf8");

$otsikko = $yhteys->real_escape_string($_POST["otsikko"]);

$teksti = $yhteys->real_escape_string($_POST["teksti"]);

$kommentoija = $yhteys->real_escape_string($_POST["kommentoija"]);

$asiakirja_id = $yhteys->real_escape_string($_POST["asiakirja_id"]);

$lisayssql = "INSERT INTO kommentti (otsikko, teksti, pvm, kommentoija, asiakirja_id) VALUES ('$otsikko', '$teksti', now(), '$kommentoija', $asiakirja_id)";

$tulos = $yhteys->query($lisayssql);

if ($tulos === TRUE) {
   echo "Tuote lisätty.";
} else {
   echo "Virhe: " . $lisayssql . "<br>" . $yhteys->error;
}

$yhteys->close();
?>