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


$hakusql = "SELECT * FROM saa";

if(isset($_GET["viikko"])){
   $viikko = $yhteys->real_escape_string(strip_tags($_GET["viikko"]));

   $hakusql = "SELECT * FROM saa WHERE vko = $viikko order by paiva";
}

$tulokset = $yhteys->query($hakusql);

if ($tulokset->num_rows > 0) {
   $rivit = array();
   while($saa = $tulokset->fetch_assoc()) {
      $rivit[] = $saa;  
   }

   $json = json_encode($rivit);
   echo $json;

} else {
   echo "Ei tuloksia";
}

$yhteys->close();
?>