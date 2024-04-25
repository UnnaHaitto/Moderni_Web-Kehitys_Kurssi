<?php session_start(); ?>
<?php include_once("otsake.php"); ?>

    <?php
    $palvelin = "localhost";
    $kayttaja = "Jokunen";
    $salasana = "Kouluhomma123";
    $tietokanta = "neuvontapalsta";
    
    $yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);
    
    if ($yhteys->connect_error) {
       die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
    }
    $yhteys->set_charset("utf8");

    if (isset($_POST["nimimerkki"])){
        $nimimerkki = $yhteys->real_escape_string(strip_tags($_POST["nimimerkki"]));

        $sposti = $yhteys->real_escape_string(strip_tags($_POST["sposti"]));

        $salasana = $yhteys->real_escape_string(strip_tags($_POST["salasana"]));

        $lisayssql = "INSERT INTO kayttaja (nimimerkki, salasana, sposti) VALUES ('$nimimerkki', '$salasana', '$sposti')";

        $tulos = $yhteys->query($lisayssql);

        if ($tulos) {
            echo "KÄYTTÄJÄ LISÄTTY";
        }
    }

    $yhteys->close();

    ?>

    <div id="ei_rekisteroitunut">
        <form action="rekisteroituminen.php" method="post">
            <p>Nimimerkki</p>
            <input type="text" name="nimimerkki">
            <p>Sähköposti</p>
            <input type="email" name="sposti">
            <p>Salasana</p>
            <input type="password" name="salasana">
            <button>Lähetä</button>
        </form>
    </div>
<?php include_once("footer.php"); ?>