<?php
    function establecerConexion($host, $usuario, $password, $database){
        // Creacion de variable temporal que almacena el resultado de la conexión
        $conexion = new PDO("pgsql:host=$host;dbname=$database",
                             $usuario,
                             $password);

        return $conexion;
    }

    function querySelect($stringQuery, $conexion){
        return $conexion -> query($stringQuery);
    }
?>