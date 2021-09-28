<?php
include("./autoLoader/autoLoader.php");
$lien = './assets/img/';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/style.css">
    <title>Document</title>
</head>

<body>
    <?php
    $viewChampionsL = new ViewChampionsLeagues();
    $controlerChampionsL = new ControlerChampionsLeagues();

    $allEquipes = $viewChampionsL->afficherEquipes();
    $controlerChampionsL->createGroupe();

    $allMatchs = $viewChampionsL->afficherMatchs();

    $controlerChampionsL->createGroupe();
    $groupeA = $viewChampionsL->getGroupe_A();
    $groupeB = $viewChampionsL->getGroupe_B();


    $controlerChampionsL->createMatchs();
    ?>
    <div>
        <table border="1">
            <tr>
                <th>Lot #1 <br>1e Tete de Serie</th>
                <th>Lot #2 <br>2e Tete de Serie</th>
                <th>Lot #3 <br>3e Tete de Serie</th>
                <th>Lot #4 <br>4e Tete de Serie</th>
            </tr>
            <tr>
                <?php
                foreach ($allEquipes as $equipe) {
                    if ($equipe->id_equipes <= 4) {
                ?>
                        <td>
                            <img class="drapeau" src="<?= $lien . $equipe->drapeau_equipes ?>">
                            <?= $equipe->nom_equipes ?>
                        </td>
                <?php
                    }
                }
                ?>
            </tr>

            <tr>
                <?php
                foreach ($allEquipes as $equipe) {
                    if ($equipe->id_equipes > 4) {
                ?>

                        <td>
                            <img class="drapeau" src="<?= $lien . $equipe->drapeau_equipes ?>">
                            <?= $equipe->nom_equipes ?>
                        </td>

                <?php
                    }
                }
                ?>
            </tr>

        </table>
    </div>



    <div>
        <form action="index.php" method="POST">
            <input type="submit" value="Lancer Tirage" name="lanceTirage">
        </form>
    </div>



    <?php
    if (isset($_POST['lanceTirage'])) {

    ?>
        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Groupe A</th>
                        <th>Groupe B</th>
                    </tr>
                </thead>

                <tbody>
                    <?php

                    foreach ($groupeA as $cle => $equipe) {
                    ?>

                        <tr>
                            <td>
                                <img class="drapeau" src="<?= $lien . $equipe->drapeau_equipes ?>">
                                <?= $equipe->nom_equipes ?>
                            </td>
                            <td>
                                <img class="drapeau" src="<?= $lien . $groupeB[$cle]->drapeau_equipes ?>">
                                <?= $groupeB[$cle]->nom_equipes ?>
                            </td>
                        </tr>

                    <?php
                    }
                    ?>

                </tbody>
            </table>

        </div>
        <?php
        $matchsPremierTourA = $viewChampionsL->matchByPhase(1, 'Premier Tour');
        $matchsPremierTourB = $viewChampionsL->matchByPhase(2, 'Premier Tour');
        ?>
        <table border="1">
            <thead>
                <tr>
                    <th>GROUPE A</th>
                    <th>AFFICHES</th>
                    <th>SCORE</th>
                </tr>
            </thead>

            <tbody>

                <?php
                foreach ($matchsPremierTourA as $key => $match) {
                ?>
                    <tr>
                        <td>
                            <?= 'Match ' . $key+1 ?>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img class="drapeau" src=<?= $lien . $matchsPremierTourA[$key]->equipe1->drapeau_equipes ?> alt="">
                            <?= $matchsPremierTourA[$key]->equipe1->nom_equipes ?>
                        </td>
                    
                        <td>
                            <img class="drapeau" src=<?= $lien . $matchsPremierTourA[$key]->equipe2->drapeau_equipes ?> alt="">
                            <?= $matchsPremierTourA[$key]->equipe2->nom_equipes ?>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <?=$key+1 ?>
                        </td>
                    </tr>
            <?php
                }
            }

            ?>
            </tbody>
        </table>

</body>

</html>