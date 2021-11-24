
<?php
require_once('./classes/database/Database.class.php');
require_once('./classes/equipes/TeamModel.class.php');
require_once('./classes/equipes/TeamView.class.php');

$imagesLink = './css/images/';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil | Coupe Inuka</title>
    <link type="text/css" rel="stylesheet" href="./css/accueil.css">
</head>

<body>
    <section id="accueil">
        <h1>COUPE INUKA</h1>
        <!-- <img src="./css/images/world-cup.png" alt="World Cup Trophy"> -->
        <a href="./includes/championship.php">Calendrier du Championnat</a>
    </section>

</body>