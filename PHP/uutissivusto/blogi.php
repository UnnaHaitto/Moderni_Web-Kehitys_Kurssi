<?php

    $palvelin = "localhost";
    $kayttaja = "Jokunen"; 
    $salasana = "Kouluhomma123";
    $tietokanta = "uutissivusto";

    $yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);

    if ($yhteys->connect_error) {
    die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
    }
    $yhteys->set_charset("utf8");

    $hakusql = "SELECT * FROM blogi join blogikirjoitus on blogi.blogi_id = blogikirjoitus.blogi_id order by julkaisuaika desc";

    $tulokset = $yhteys->query($hakusql);

    if ($tulokset->num_rows > 0) {
    header("Content-Type: application/xml; charset=utf-8");
    $xml = new SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><blogi></blogi>');

    while($rivi = $tulokset->fetch_assoc()) {
        $kirjoitus = $xml->addChild('kirjoitus');
        $kirjoitus->addChild('otsikko', $rivi["otsikko"]);
        $kirjoitus->addChild('teksti', $rivi["teksti"]);
        $kirjoitus->addChild('julkaisuaika', $rivi["julkaisuaika"]);
        $kirjoitus->addChild('blogin_nimi', $rivi["nimi"]);
        $kirjoitus->addChild('kirjoittaja', $rivi["kirjoittaja"]);
    }
    $xmlTeksti = $xml->asXML();
    echo $xmlTeksti;
    } else {
    echo "Ei tuloksia";
    }

    $yhteys->close();
?>