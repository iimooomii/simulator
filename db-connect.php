<?php
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', 'root');
define('NAME', 'betting-simulator');

$connection = mysqli_connect(HOST, USER, PASS, NAME);

if (!$connection) {
    die;
}