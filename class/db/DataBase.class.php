<?php
class DataBase
{
    private $host = 'localhost';
    private $dbname = 'champions-league';
    private $userName = 'root';
    private $password = '';

    public function getConnectionToBD()
    {
        try {
            $dsn = ("mysql:host=" . $this->host . ";dbname=" . $this->dbname . ";charset=utf8");
            $pdo = new PDO($dsn, $this->userName, $this->password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
            return $pdo;
        }catch (PDOException $e) {
            die('Error : '.$e->getMessage());
        }
    }
}
