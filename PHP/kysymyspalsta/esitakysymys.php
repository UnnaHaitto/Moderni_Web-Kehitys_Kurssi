<?php session_start(); ?>
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

    if (isset ($_POST["otsikko"])){

        $otsikko =  $yhteys->real_escape_string(strip_tags($_POST["otsikko"]));

        $kysymys = $yhteys->real_escape_string(strip_tags($_POST["kysymys"]));

        $nimi = $_SESSION["nimimerkki"]; 

        $lisayssql = "INSERT INTO kysymys (otsikko, paivamaara, nimimerkki, sisalto) VALUES ('$otsikko', now(), '$nimi', '$kysymys')";

        $tulos = $yhteys->query($lisayssql);

        header("Location: neuvontapalsta.php");
        die(); 
        
    }

    $yhteys->close();

    ?>

<?php include_once("otsake.php"); ?>

    <div id="esitakysymys">
    <form action="esitakysymys.php" method="post">
    <input type="text" name="otsikko" id="">
    <br>
    <textarea name="kysymys" id="" cols="30" rows="10"></textarea>
    <br>
    <input type="submit" value="Lähetä!" id="laheta">
    </form>
    </div>
<?php include_once("footer.php"); ?>