<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table border=1>
        <tr>
            <th>DNI</th>
            <th>NOMBRE</th>
            <th>APELLIDOS</th>
            <th>EMAIL</th>
            <th>AULA</th>
        </tr>
        
        <?php
            require (__DIR__."/funcionesConexionBBDD.php");
            
            $conexion = establecerConexion('localhost', 'root', '', 'campus');

            $resultado = $conexion -> query('select al.dni, al.nombre, al.apellidos, al.email, au.id 
                                             from alumnado al, aulasvirtuales au, matricula mat
                                             where al.dni = mat.dni and mat.id_aula = au.id');

            $ar_datos = $resultado -> fetch_object();

            while($ar_datos != null){
                echo "<tr>
                        <td>{$ar_datos -> dni}</td>
                        <td>{$ar_datos -> nombre}</td>
                        <td>{$ar_datos -> apellidos}</td>
                        <td>{$ar_datos -> email}</td>
                        <td>{$ar_datos -> id}</td>
                      </tr>";
                $ar_datos = $resultado -> fetch_object();
            }

            $conexion -> close();
        ?>

    </table>
</body>
</html>