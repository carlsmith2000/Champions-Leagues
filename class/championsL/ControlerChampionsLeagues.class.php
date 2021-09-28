<?php
class ControlerChampionsLeagues extends ModelChampionsLeagues
{
    public function createGroupe()
    {

        $firstLine = $this->getAline();

        foreach ($firstLine as $equipe_1) {
            $equipe_2 = $this->getEquipesLot($equipe_1->id_lots_eq, $equipe_1->id_equipes);
            $groupEquipe = [$equipe_1, $equipe_2];

            $idEquipe1 = $groupEquipe[0]->id_equipes;
            $idEquipe2 = $groupEquipe[1]->id_equipes;

            if ($groupEquipe[rand(0, 1)] == $groupEquipe[0]) {

                $this->updateGroup(1, $idEquipe1);
                $this->updateGroup(2, $idEquipe2);
            } else {
                $this->updateGroup(2, $idEquipe1);
                $this->updateGroup(1, $idEquipe2);
            }
        }
    }
    public function updateAllGroup($idGroupe, $idEquipe)
    {
        return $this->updateGroup($idGroupe, $idEquipe);
    }

    public function createMatchs(){
        $this->updateIdMatchPremierTour();
    }

}
