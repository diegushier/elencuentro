<?php
session_start();
require "../aux.php";
require __DIR__ . "/aux.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <?= linkcss() ?>
    <title>Document</title>
</head>

<body>
    <?php

    const PAR = [
        'usuario' => [
            'def' => '',
            'tipo' => TIPO_CADENA,
            'etiqueta' => 'Usuario'
        ],
        'passwd' => [
            'def' => '',
            'tipo' => TIPO_CADENA,
            'etiqueta' => 'Contraseña'
        ],
    ];
    $pdo = conectar();
    $errores = [];
    $args = comprobarParametros(PAR, $errores);
    
    
    ?>
    <?= navbar() ?>
    <?= loginForm($errores) ?>
    <?= feet() ?>
</body>

</html>