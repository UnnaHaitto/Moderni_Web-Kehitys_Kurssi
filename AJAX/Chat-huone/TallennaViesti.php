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

if(isset($_POST["nimimerkki"]) && $_POST["nimimerkki"] != "" && isset($_POST["postaus"]) && $_POST["postaus"]){
    $nimi = $yhteys->real_escape_string($_POST["nimimerkki"]);
    $teksti = $yhteys->real_escape_string($_POST["postaus"]);

    $lisayssql = "INSERT INTO postaus (nimimerkki, postaus, aika) VALUES ('$nimi', '$teksti', now())";

    $tulos = $yhteys->query($lisayssql);

    if ($tulos === TRUE) {
    echo "Postaus julkaistu, odota hetki niin se tulee näkyviin";
    } else {
    echo "Virhe: " . $lisayssql . "<br>" . $yhteys->error;
    }
}

$yhteys->close();
?>

