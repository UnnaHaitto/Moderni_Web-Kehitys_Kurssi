<!DOCTYPE html>
<html lang="fi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="uutissivu.css">
    <title>Document</title>
</head>
<body>
    <div id="sailio">
    <header>
    <div id="otsikko-osio">
    <h1>Satuvaltakunnan tärinät</h1>
    <h2>Uutisia lumotusta maasta</h2>
    </div>

    <section>
        <h3>Viikos sää - Viikko 21</h3>
        <div id="saa-laatikko">
            <?php

            $json = file_get_contents("http://localhost/uutissivusto/saa.php?viikko=21");
            $saa = json_decode($json, true); // puretaan taulukoksi
            foreach($saa as $paivansaa){
            $pvm = date_create($paivansaa["paiva"]);
            ?>
            <div class="saa">
                <p class="paivamaara"><?php echo date_format($pvm, "d.m.Y");?></p>
                <p class="lampotila"><?php echo $paivansaa["lampotila"];?> &deg;C</p> 
                <p class="saa-otsikko">Säätila:</p>
                <p class="tieto"><?php echo $paivansaa["saatila"];?></p>
                <p class="saa-otsikko">Tuulennopeus:</p>
                <p class="tieto"><?php echo $paivansaa["tuulennopeus"];?> m/s</p>
            </div>
            <?php
            }
            ?>
        
        </div>      
    </section>
    </header>
    <?php  
    $palvelin = "localhost";
    $kayttaja = "Jokunen";  // tämä on tietokannan käyttäjä, ei tekemäsi järjestelmän
    $salasana = "Kouluhomma123";
    $tietokanta = "uutissivusto";

    // luo yhteys
    $yhteys = new mysqli($palvelin, $kayttaja, $salasana, $tietokanta);

    // jos yhteyden muodostaminen ei onnistunut, keskeytä ja näytä virheilmoitus
    if ($yhteys->connect_error) {
    die("Yhteyden muodostaminen epäonnistui: " . $yhteys->connect_error);
    }
    // aseta merkistökoodaus (muuten ääkköset sekoavat)
    $yhteys->set_charset("utf8");
    ?>
    <div id="tekstit">
    <main>
        <?php $hakusql = "SELECT * FROM uutiset order by julkaisuaika desc limit 2";

        $tulokset = $yhteys->query($hakusql);

        if ($tulokset->num_rows > 0) {
        while($rivi = $tulokset->fetch_assoc()) { 
            $pvm = date_create($rivi["julkaisuaika"]);
            ?>
            <div class="koko_uutinen">
            <h3><?php echo $rivi["otsikko"]?></h3>
            <p id="uutisen-perustiedot"><?php echo date_format($pvm, "d.m.Y");?> klo <?php echo date_format($pvm, "H.i");?> || <?php echo $rivi["kirjoittaja"]?></p>
            <p><?php echo "<p>" . str_replace("\r\n", "</p><p>", $rivi["sisalto"]) . "</p>"?></p>
            </div>
            <?php
        } 
        } else {
        echo "Ei tuloksia";
        }
        ?>

    </main>

    <aside>
        <div>
        <h3>Uusimmat uutiset</h3>
        <?php
        $hakusql = "SELECT * FROM uutiset order by julkaisuaika desc";

        $tulokset = $yhteys->query($hakusql);

        if ($tulokset->num_rows > 0) {
           while($rivi = $tulokset->fetch_assoc()) { 
            $pvm = date_create($rivi["julkaisuaika"]);
            ?>
              
            <div class="uutinen">
                <div class="otsikko">
                <p><b><?php echo $rivi["otsikko"]?></b></p>
                </div>
                <div class="sivu-tiedot">
                <p><?php echo date_format($pvm, "d.m.Y");?> klo <?php echo date_format($pvm, "H.i");?></p>
                </div>
            </div>
            <?php
           }
        } else {
           echo "Ei tuloksia";
        }
        ?>
        </div>

        <h3>Vierailevat kirjoittajat</h3>
        <?php $xml = simplexml_load_file("http://localhost/uutissivusto/blogi.php"); 
        foreach($xml->children() as $kirjoitus) {
        ?>
        <div class="kirjoitus">
            <div class="otsikko">
            <p><b><?php echo $kirjoitus->blogin_nimi; ?>:</b><?php echo $kirjoitus->otsikko; ?></p>
            </div>
            <div class="sivu-tiedot">
            <p><span class="kirjoittaja"><?php echo $kirjoitus->kirjoittaja; ?></span>
            <span class="julkaisuaika"><?php echo $kirjoitus->julkaisuaika; ?></span></p>
            </div>
        </div>
        <?php
        }
        ?>
    </aside>
    </div>
    </div>
</body>
</html>