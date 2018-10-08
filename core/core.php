<?php
session_start();

try {
	$handler = new PDO('mysql:host=127.0.0.1;dbname=db_ecoin', 'root', '');
	$handler->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
	die("Sorry, there has been an error.");
}


require_once 'classes/hash.php';
require_once 'classes/redirect.php';
require_once 'classes/session.php';
require_once 'classes/token.php';
require_once 'functions/sanitize.php';