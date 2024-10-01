<?php
    function establecerConexion($dominio, $usuario, $password, $database){
        // Creacion de variable temporal que almacena el resultado de la conexión
        $conexion = new mysqli('localhost',
                            'root',
                            '',
                            'campus');

        // Comprobar el error con el atributo connect_errno
        $error = $conexion -> connect_errno;
        if ($error != null) {
            echo $error;
            die();
        }

        return $conexion;
    }
?>