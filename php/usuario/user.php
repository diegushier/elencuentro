<?php 
    session_start();
    require __DIR__ . '/../aux.php';
    require __DIR__ . '/aux.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel='stylesheet' href='/css/style.css'>
    <title>Document</title>
</head>
<body>
    <?php 
        $errores = [];
        $pdo = conectar();
        if(es_GET()){
            if(isset($_GET['nombre'])){
                $nombre = trim($_GET['nombre']);
            }else {
                $errores += ['Nombre no especificado' => 'error'];
            }
        } 


        $sql = 'SELECT * FROM usuarios WHERE nombre = :nombre;'
    ?>

    <?= navbar() ?>
    <?= mostrarUsuario($pdo, $sql, $errores, $nombre) ?>
    <?= feet()   ?>
</body>
</html>