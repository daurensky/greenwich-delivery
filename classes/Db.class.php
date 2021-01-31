<?php

require_once 'Config.class.php';

class Db
{
    private $conn;

    function __construct()
    {
        $cfg = new Config();
        $conn = new mysqli(
            $cfg->dbServer,
            $cfg->dbUser,
            $cfg->dbPassword,
            $cfg->dbDb
        );

        if ($conn->connect_errno) {
            echo "Failed to connect to MySQL: $conn->connect_error";
            exit;
        }

        $this->conn = $conn;
    }

    public static function app()
    {
        return new Db();
    }

    public function select($table, array $values, array $where = null, string $order = null)
    {
        $conn = $this->conn;

        $stringValues = implode(', ', $values);

        $tableValue = is_array($table) ? $table['table'] : $table;

        if ($where) {
            $whereArr = [];

            foreach ($where as $key => $value) {
                $whereArr[] = "$key like '$value'";
            }

            $whereString = implode(' ', $whereArr);
            $sql = "SELECT $stringValues FROM $tableValue WHERE $whereString";
        } else {
            $sql = "SELECT $stringValues FROM $tableValue";
        }

        if ($order) {
            $sql .= " ORDER BY $order";
        }

        $result = $conn->query($sql);

        if (!$result) {
            echo http_response_code(400);
        }

        if ($result->num_rows === 1 && !isset($table['onlyArray'])) {
            return $result->fetch_assoc();
        }

        if ($result->num_rows > 0) {
            return $result->fetch_all(MYSQLI_ASSOC);
        }

        return null;
    }

    public function insert(string $table, array $values)
    {
        $conn = $this->conn;

        $valuesNames = [];
        foreach ($values as $valueKey => $value) {
            $valuesNames[] = $valueKey;
            $values[$valueKey] = "'$value'";
        }

        $insertNames = implode(', ', $valuesNames);
        $insertValues = implode(', ', $values);

        $sql = "INSERT INTO $table ($insertNames) VALUES ($insertValues)";

        if ($conn->query($sql) !== true) {
            die("Error: $sql <br/> $conn->error");
        }
    }

    public function update(string $table, array $values, array $where)
    {
        $conn = $this->conn;

        $whereArr = [];
        $valuesArr = [];

        foreach ($where as $key => $value) {
            $whereArr[] = "$key='$value'";
        }

        $whereString = implode(' ', $whereArr);

        foreach ($values as $key => $value) {
            $valuesArr[] = "$key='$value'";
        }

        $valuesString = implode(', ', $valuesArr);

        $sql = "UPDATE $table SET $valuesString WHERE $whereString";

        if ($conn->query($sql) !== true) {
            die("Error: $sql <br/> $conn->error");
        }
    }

    public function getUserId(string $login)
    {
        return $this->select('users', ['id'], ['login' => $login])['id'];
    }

    public function delete(string $table, array $where)
    {
        $conn = $this->conn;

        $whereArr = [];

        foreach ($where as $key => $value) {
            $whereArr[] = "$key='$value'";
        }

        $whereString = implode(' ', $whereArr);

        $sql = "DELETE FROM $table WHERE $whereString";

        if ($conn->query($sql) !== true) {
            die("Error: $sql <br/> $conn->error");
        }
    }
}
