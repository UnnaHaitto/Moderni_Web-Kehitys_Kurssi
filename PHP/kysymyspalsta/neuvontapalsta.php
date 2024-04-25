<?php session_start(); ?>
<?php include_once("otsake.php"); ?>

    <body>
        <div id="paa-sivu">

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

            $hakusql = "SELECT * FROM kysymys order by paivamaara desc";

            $tulokset = $yhteys->query($hakusql);

            if ($tulokset->num_rows > 0) {
            while($rivi = $tulokset->fetch_assoc()) {
        
        ?>

            <div id="kysymys">
                <h2><a href="kysymys.php?id=<?php echo $rivi["id"] ?>"><?php echo $rivi["otsikko"] ?></a></h2>
                <p><?php echo $rivi["nimimerkki"] ?> <?php echo $rivi["paivamaara"] ?></p>
            </div>
            <?php
                // while-silmukka päättyy
                }
                } else {
                echo "Ei tuloksia";
                }
                $yhteys->close();
            ?>
        </div>

<?php include_once("footer.php"); ?>
