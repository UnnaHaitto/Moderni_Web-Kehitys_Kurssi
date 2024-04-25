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

    $id = $yhteys->real_escape_string($_GET["id"]);

    if (isset($_POST["vastaus"])) { 
        $vastaus = $yhteys->real_escape_string(strip_tags($_POST["vastaus"])); 
        $nimi = $_SESSION["nimimerkki"];
        
        $lisayssql = "INSERT INTO vastaus (sisalto, paivamaara, nimimerkki, kysymys) VALUES ('$vastaus', now(),'$nimi', $id)";
        
        $tulos = $yhteys->query($lisayssql);
    }

    $hakusql = "SELECT * FROM kysymys where id = $id";

    $tulokset = $yhteys->query($hakusql);

    if ($tulokset->num_rows > 0) {
    while($rivi = $tulokset->fetch_assoc()) {

    ?>

    <div id="kysymys">
        <h2><a href="kysymys.php?id=<?php echo $rivi["id"] ?>"><?php echo $rivi["otsikko"] ?></a></h2>
        <p><?php echo $rivi["nimimerkki"] ?> <?php echo $rivi["paivamaara"] ?></p>
        <p><?php echo $rivi["sisalto"] ?>
    </div>
    <?php
        // while-silmukka päättyy
        }
        } else {
        echo "Ei tuloksia";
        }

        $hakusql = "SELECT * FROM vastaus where kysymys = $id order by paivamaara desc";
    $tulokset = $yhteys->query($hakusql);

    if ($tulokset->num_rows > 0) {
    while($rivi = $tulokset->fetch_assoc()) {

    ?>

    <div id="vastaus">
        <p><?php echo $rivi["nimimerkki"] ?> <?php echo $rivi["paivamaara"] ?></p>
        <p><?php echo $rivi["sisalto"]?>
    </div>

    <?php
        }
        } else {
        echo "Ei tuloksia";
        }

        if(isset($_SESSION["nimimerkki"])){

        
    ?>

    <div id="vastaus-kysymys">
    <form action="kysymys.php?id=<?php echo $id ?>" method="post">
        <textarea name="vastaus" id="" cols="30" rows="10"></textarea>
        <br>
        <input type="submit" value="Lähetä" id="kysymys-nappi">
    </form>
    </div>
    <?php
    
        }
    ?>
<?php include_once("footer.php"); ?>