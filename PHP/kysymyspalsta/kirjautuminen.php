<?php session_start(); ?>
<?php

$viesti = "";

if(isset($_GET["ulos"])){
    session_unset();
    session_destroy(); 
}

if(isset($_POST["nimimerkki"])){
    $palvelin = "localhost";
    $kayttaja = "Jokunen"; 
    $salasana = "Kouluhomma123";
    $tietokanta = "neuvontapalsta";

    
    $yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);

    
    if ($yhteys->connect_error) {
    die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
    }

    $yhteys->set_charset("utf8");

    $nimimerkki = $yhteys->real_escape_string(strip_tags($_POST["nimimerkki"]));

    $salasana = $yhteys->real_escape_string(strip_tags($_POST["salasana"]));

    $hakusql = "SELECT * FROM kayttaja where nimimerkki = '$nimimerkki'  and salasana = '$salasana'";

    
    $tulokset = $yhteys->query($hakusql);

    
    if ($tulokset->num_rows > 0) {
        $_SESSION["nimimerkki"] = $nimimerkki;
        header("Location: neuvontapalsta.php");
        die();
    } else {
        $viesti = "VÄÄRIN";
    }
    }
?>

<?php include_once("otsake.php"); ?>

    <div id="kirjautunut">
        <form action="kirjautuminen.php" method="post">
            <?php echo $viesti ?>
            <p>Nimimerkki</p>
            <input type="text" name="nimimerkki">
            <p>Salasana</p>
            <input type="password" name="salasana">
            <button>Lähetä</button>
        </form>
    </div>

<?php include_once("footer.php"); ?>