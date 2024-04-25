
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="neuvontapalsta.css">
    <title>Document</title>
</head>
<body>
<div id="sailio">
    <nav>
        <ul>
            <li><a href="neuvontapalsta.php">Pää sivu</a></li>
            <?php
            if(isset($_SESSION["nimimerkki"])) {
                echo '<li><a href="kirjautuminen.php?ulos">Kirjaudu ulos</a></li>';
                echo '<li><a href="esitakysymys.php">Kysymysten esittäminen</a></li>';
            }
            else {
                echo '<li><a href="rekisteroituminen.php">Rekisteröituminen</a></li>';
                echo '<li><a href="kirjautuminen.php">Kirjautuminen</a></li>';
            }
            ?>
        </ul>
    </nav>
    <h1>neuvontapalsta</h1>