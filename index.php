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
    // $allMatchs = $viewChampionsL->afficherMatchs();

    ?>
    <!-- AFFICHAGE DE TOUTES LES EQUIPES DU CHAMPIONNAT -->

    <!-- <div class="img-table">
            
        </div> -->
    <div>
        <table border="1">
            <tr>
                <th>Lot #1 <br>1e Tete de Serie </th>
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



    <?php
    if (isset($_POST['lanceTirage'])) {
        $controlerChampionsL->createGroupe();

        // BOUTTON PERMETTANT DE JOUER UN MATCH
    }
    if (isset($_POST['jouerMatch'])) {
        $controlerChampionsL->updateMatchJouer($_POST['idMatch'], $_POST['scoreEquipe1'], $_POST['scoreEquipe2']);
        // echo "ooooooooooooooooook";
        // print_r($_POST);
    }

    if (isset($_POST['resetChamp'])) {
        $controlerChampionsL->reinitialiserGroupe();
        $controlerChampionsL->reinitialiserMtchId();
    }

    ?>
    <?php
    if (!$controlerChampionsL->testTirageMatch() == true) {
        $groupeA = $viewChampionsL->getGroupe_A();
        $groupeB = $viewChampionsL->getGroupe_B();
    ?>
        <!-- Boutton Permettant de lancer un tirage -->


        <div>
            <form action="index.php" method="POST">
                <input type="submit" value="Lancer Tirage" name="lanceTirage" disabled>
            </form>
        </div>

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

    } else {
    ?>
        <!-- Boutton Permettant de lancer un tirage -->
        <div>
            <form action="index.php" method="POST">
                <input type="submit" value="Lancer Tirage" name="lanceTirage">
            </form>
        </div>
    <?php
    }
    ?>

    <!-- AFFICHAGE DE TOUS LES  MATCHS -->

    <?php

    $matchsPremierTourA = $viewChampionsL->matchByPhase(1, 'Premier Tour');
    $matchsPremierTourB = $viewChampionsL->matchByPhase(2, 'Premier Tour');

    ?>
    <!-- LES MATCHS DU GROUPE A -->
    <table>
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
                        <?= ' Match  ' . $matchsPremierTourA[$key]->idMatch ?>
                    </td>

                    <td class="blockEq">
                        <div class="blockEquipe">
                            <div class="drapeauEtNom">
                                <img class="drapeau" src=<?= $lien . $matchsPremierTourA[$key]->equipe1->drapeau_equipes ?> alt="">
                                <?= $matchsPremierTourA[$key]->equipe1->nom_equipes ?>
                            </div>

                            <div>
                                <img class="vs" src="./assets/img/vs.png" alt="">
                            </div>

                            <div class="drapeauEtNom">
                                <img class="drapeau" src=<?= $lien . $matchsPremierTourA[$key]->equipe2->drapeau_equipes ?> alt="">
                                <?= $matchsPremierTourA[$key]->equipe2->nom_equipes ?>
                            </div>

                        </div>
                    </td>


                    <td>
                        <form action="index.php" method="POST">
                            <div>
                                <input class="scoreEquipe" type="hidden" name="idMatch" value=<?= $matchsPremierTourA[$key]->idMatch ?>>
                                <input class="scoreEquipe" type="number" name="scoreEquipe1" min=0 max=25 required value=<?= $matchsPremierTourA[$key]->scoreEquipe1 ?>>
                                <input class="scoreEquipe" type="number" name="scoreEquipe2" min=0 max=25 required value=<?= $matchsPremierTourA[$key]->scoreEquipe2 ?>>
                                <input class="btnJouer" type="submit" name="jouerMatch" value="Jouer">
                            </div>

                        </form>
                    </td>

                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>

    <!-- LES MATCHS DU GROUPE B -->

    <table>
        <thead>
            <tr>
                <th>GROUPE B</th>
                <th>AFFICHES</th>
                <th>SCORE</th>
            </tr>
        </thead>

        <tbody>

            <?php
            foreach ($matchsPremierTourB as $key => $match) {
            ?>
                <tr>
                    <td>
                        <?= ' Match  ' . $matchsPremierTourB[$key]->idMatch ?>
                    </td>

                    <td class="blockEq">
                        <div class="blockEquipe">
                            <div class="drapeauEtNom">
                                <img class="drapeau" src=<?= $lien . $matchsPremierTourB[$key]->equipe1->drapeau_equipes ?> alt="">
                                <?= $matchsPremierTourB[$key]->equipe1->nom_equipes ?>
                            </div>

                            <div>
                                <img class="vs" src="./assets/img/vs.png" alt="">
                            </div>

                            <div class="drapeauEtNom">
                                <img class="drapeau" src=<?= $lien . $matchsPremierTourB[$key]->equipe2->drapeau_equipes ?> alt="">
                                <?= $matchsPremierTourB[$key]->equipe2->nom_equipes ?>
                            </div>

                        </div>
                    </td>


                    <td>
                        <form action="index.php" method="POST">
                            <div>
                                <input class="scoreEquipe" type="hidden" name="idMatch" value=<?= $matchsPremierTourA[$key]->idMatch ?>>
                                <input class="scoreEquipe" type="number" name="scoreEquipe1" min=0 max=25 required value=<?= $matchsPremierTourB[$key]->scoreEquipe1 ?>>
                                <input class="scoreEquipe" type="number" name="scoreEquipe2" min=0 max=25 required value=<?= $matchsPremierTourB[$key]->scoreEquipe2 ?>>
                                <input class="btnJouer" type="submit" name="jouerMatch" value="Jouer">
                            </div>

                        </form>
                    </td>

                </tr>
            <?php
            }

            ?>
        </tbody>
    </table>

    <!-- BOUTTON PERMETTANT DE RECOMMENCER LE CHAMPIONNAT -->

    <div class="btnReset">
        <form action="index.php" method="POST">
            <div>
                <input class="btnJouerR" type="submit" name="resetChamp" value="reset">
            </div>
        </form>
    </div>


</body>

</html>