<?php
    function establecerConexion($host, $usuario, $password, $database){
        // Creacion de variable temporal que almacena el resultado de la conexión
        try{
            $conexion = new PDO("pgsql:host=$host;dbname=$database",
                                $usuario,
                                $password);

            $conexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $conexion;
        } catch (PDOExepcion $e){
            echo "Error de conexión: " . $e -> getMessage();
        }
    }

    function querySelect($stringQuery, $conexion){
        return $conexion -> query($stringQuery);
    }
?>