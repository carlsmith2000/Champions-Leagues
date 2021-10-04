<?php
    class ViewChampionsLeagues extends ModelChampionsLeagues{

        public function afficherEquipes(){
            return $this->getAllEquipes();
        }

        public function afficherMatchs(){
            return $this->getAllMatchs();
        }


        public function getGroupe_A(){
            return $this->getAllGroupe(1);
        }

        public function getGroupe_B(){
            return $this->getAllGroupe(2);
        }

        public function matchByPhase($idGroupe, $phase){
            return array_map( function($matchs){
                return(object)[
                    'idMatch' => $matchs->id_matchs,
                    'equipe1' => $this->getEquipeById($matchs->idEq1_matchs),
                    'equipe2' => $this->getEquipeById($matchs->idEq2_matchs),
                    'scoreEquipe1' => $matchs->scoreEq1_matchs,
                    'scoreEquipe2' => $matchs->scoreEq2_matchs,
                    'jouer' => $matchs->siJouer_matchs,
                    'matchTerminer'=> $matchs->matchs_termine,
                    'numeroMatch'=> $matchs->match_num	
                ];
            }, $this->getMatchByPhase($idGroupe, $phase));
        }
    }
?>

<!--  -->