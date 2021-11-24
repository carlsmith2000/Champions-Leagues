<?php
class ModelChampionsLeagues extends dataBase
{

    protected function getAllEquipes()
    {
        $sql = "SELECT * FROM equipes";
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute();
        return $stm->fetchAll();
    }

    protected function getEquipeById($idEquipe)
    {
        $sql = "SELECT * FROM equipes WHERE id_equipes = ? ";
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$idEquipe]);
        return $stm->fetch();
    }

    protected function getMatchByPhase($idGroupe, $phase)
    {
        $sql = "SELECT * FROM `matchs` WHERE `idGroupe`= ? AND phase_matchs = ? ";
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$idGroupe, $phase]);
        return $stm->fetchAll();
    }


    protected function getAllMatchs()
    {
        $sql = "SELECT * FROM matchs";
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute();
        return $stm->fetchAll();
    }

    protected function getEquipesLot($idLot, $idEquipe)
    {
        $sql = 'SELECT * FROM equipes WHERE id_lots_eq = ? AND id_equipes != ? ;';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$idLot, $idEquipe]);
        return $stm->fetch();
    }

    protected function getAline()
    {
        $sql = 'SELECT * FROM equipes WHERE id_equipes <= ( SELECT COUNT(id_equipes)/2 FROM equipes);';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute();
        return $stm->fetchAll();
    }
    protected function updateGroup($idGroupe, $idEquipe)
    {
        $sql = 'UPDATE equipes SET id_groupe = ? WHERE id_equipes = ?';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$idGroupe, $idEquipe]);
    }

    protected function getAllGroupe($idGroupe)
    {
        $sql = 'SELECT * FROM equipes WHERE id_groupe = ? ORDER BY  id_groupe, id_lots_eq';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$idGroupe]);
        return $stm->fetchAll();
    }

    protected function updateMatchId($idMatch, $idEquipe1, $idEquipe2)
    {
        $sql = 'UPDATE matchs SET idEq1_matchs = ?, idEq2_matchs = ? WHERE id_matchs = ?';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$idEquipe1, $idEquipe2, $idMatch]);
    }


    protected function updateIdMatchPremierTour()
    {
        $groupeA = $this->getAllGroupe(1);
        $groupeB = $this->getAllGroupe(2);

        foreach ($this->getAllMatchs() as $key => $match) {

            if ($match->phase_matchs == 'Premier Tour') {

                $position_1 = ($match->position_eq_1 - 1);
                $position_2 = ($match->position_eq_2 - 1);

                if ($match->idGroupe == 1) {
                    $this->updateMatchId($match->id_matchs, $groupeA[$position_1]->id_equipes, $groupeA[$position_2]->id_equipes);
                } elseif ($match->idGroupe == 2) {
                    $this->updateMatchId($match->id_matchs, $groupeB[$position_1]->id_equipes, $groupeB[$position_2]->id_equipes);
                }
            }
        }
    }

    protected function updateMatch($idMatch, $scoreEquipe1, $scoreEquipe2)
    {
        $sql = 'UPDATE matchs SET scoreEq1_matchs  = ?, scoreEq2_matchs = ? WHERE id_matchs = ?';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([$scoreEquipe1, $scoreEquipe2, $idMatch]);
    }

    // REINITALISER LE CHAMPIONNAT

    protected function reinitialiserGroup()
    {
        $sql = 'UPDATE equipes SET id_groupe = NULL';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([]);
    }

    protected function reinitialiserMatchId()
    {
        $sql = 'UPDATE matchs SET idEq1_matchs = NULL, idEq2_matchs = NULL';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([]);
    }

    protected function testTirage(){
        $sql = 'SELECT *  FROM equipes WHERE id_groupe IS NULL';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([]);
        $stm->fetchAll();
        return ($stm->rowCount() > 0);
    }

    protected function testAffiche()
    {
        $sql = 'SELECT *  FROM matchs WHERE idEq1_matchs IS NULL OR idEq2_matchs IS NULL';
        $stm = $this->getConnectionToBD()->prepare($sql);
        $stm->execute([]);
        $stm->fetchAll();
        return ($stm->rowCount() > 0);
    }
   

}
