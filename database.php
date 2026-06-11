<?php

$host     = getenv('MYSQLHOST')     ?: 'localhost';
$user     = getenv('MYSQLUSER')     ?: 'root';
$password = getenv('MYSQLPASSWORD') ?: '';
$database = getenv('MYSQLDATABASE') ?: 'aic_fashion';
$port     = getenv('MYSQLPORT')     ?: 3306;

$conn = mysqli_connect($host, $user, $password, $database, $port);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>