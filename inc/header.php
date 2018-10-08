<?php
	require_once 'core/core.php';
	if (Session::exists('user')) {
		$user = Session::get('user');
	} 
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php echo $pageTitle ?></title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<link href='https://fonts.googleapis.com/css?family=Droid+Serif' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>

	<body>
		<header>
			<h1><a href="index.php">eCoin</a></h1>
			<p>For your fastest and safest financial transactions on the web.</p>
		</header>

		<section>