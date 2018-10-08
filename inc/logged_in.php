<?php

if(!Session::exists('user')) {
	Redirect::to('login.php');
}  

$logInTimeDate = Session::get('logInTimeDate');
$urlVisited = $_SERVER['REQUEST_URI'];
$urlVisitTimeDate = date("Y-m-d H:i:s");
$userID = Session::get('user');
	
$activitySql = "INSERT INTO activity (logInTimeDate, urlVisited, urlVisitTimeDate, userID) VALUES (?, ?, ?, ?)";
$activityQuery = $handler->prepare($activitySql);
$activityQuery->execute(array($logInTimeDate, $urlVisited, $urlVisitTimeDate, $userID));






if(isset($_POST['logOut'])) {
	$userID = Session::get('user');
	$logOutTimeDate = date("Y-m-d H:i:s");
	$activitySql = "UPDATE activity SET logOutTimeDate = ? WHERE userID = $userID AND logOutTimeDate IS NULL";
	$activityQuery = $handler->prepare($activitySql);
	$activityQuery->execute(array($logOutTimeDate));

	Session::delete('user');
	Session::delete('logInTimeDate');

	Redirect::to('login.php');
}

?>

			<form method="POST" name="logOutForm">
				<input type="submit" name="logOut" value="Log Out">
			</form>