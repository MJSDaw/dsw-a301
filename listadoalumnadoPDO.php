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
            
            $conexion = establecerConexion('localhost', 'postgres', 'moises', 'campus');

            $resultado = querySelect('select al.dni, al.nombre, al.apellidos, al.email, au.id 
                                      from alumnado al, aulasvirtuales au, matriculas mat
                                      where al.dni = mat.dni and mat.id_aula = au.id', $conexion);

            while($dato = $resultado -> fetch(PDO::FETCH_OBJ)){
                echo "<tr>
                        <td>{$dato -> dni}</td>
                        <td>{$dato -> nombre}</td>
                        <td>{$dato -> apellidos}</td>
                        <td>{$dato -> email}</td>
                        <td>{$dato -> id}</td>
                      </tr>";
            }
            
        ?>

    </table>
</body>
</html>