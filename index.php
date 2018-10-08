<?php
	$pageTitle = "eCoin Home";
	require_once "inc/header.php";
	require_once "inc/logged_in.php";
	$user = Session::get('user');

	$usernameSql = "SELECT username, pubKey FROM user WHERE userID = ?";
	$usernameQuery = $handler->prepare($usernameSql);
	$usernameQuery->bindParam(1, $user, PDO::PARAM_INT);
	$usernameQuery->execute();

	while ($row = $usernameQuery->fetch(PDO::FETCH_ASSOC)) {
		$username = $row['username'];
		$pubKey = $row['pubKey'];
	}

	if(isset($username)) {
		$userEcoinFile = file_get_contents("json/ecoins/" . $username . "_ecoins.json");
		$userEcoins = json_decode($userEcoinFile, true);

		$ecoinPrivateKeysFile = file_get_contents("json/keys/ecoin_keys/private_keys/" . $username . ".json");
		$ecoinPrivateKeys = json_decode($ecoinPrivateKeysFile, true);

		$amount = 0;
		for ($i=0; $i < count($userEcoins); $i++) { 
			if ($userEcoins[$i]['transactionType'] == 'in') {

				openssl_private_decrypt(utf8_decode($userEcoins[$i]['amount']), $decrypted, $ecoinPrivateKeys[$i]);
				$amount = $amount + $decrypted;
			}
		}

	}
?>

			<div class="index_01">

				<p>eCoin Wallet</p>
				<p><?php echo 'e' . $amount; ?></p>
				<a href="purchase.php">Buy eCoin</a>
			</div>

			<!-- <div class="index_02"> -->

				<!-- <ul class="cf"> -->

				<?php
					$transactionIDs = array();
					$transactionDates = array();
					$transactorID = array();

					$sql = "SELECT * FROM transaction WHERE userID = ?";
					$query = $handler->prepare($sql);
					$query->bindParam(1, $user, PDO::PARAM_INT);
					$query->execute();


					while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
						$transactionIDs[] = $row['transactionID'];
						$transactionDates[] = $row['transactionDate'];
						$transactorID[] = $row['transactorID'];
					}




					for ($i=0; $i < count($userEcoins); $i++) { 
						openssl_private_decrypt(utf8_decode($userEcoins[$i]['amount']), $amountDecrypted, $ecoinPrivateKeys[$i]);
 
						// $li = '<li><ul>';

						// $newSql = "SELECT * FROM transactor WHERE transactorID = ?";
						// $newQuery = $handler->prepare($newSql);
						// $newQuery->bindParam(1, $transactorID[$i], PDO::PARAM_INT);
						// $newQuery->execute();


						// while ($newRow = $newQuery->fetch(PDO::FETCH_ASSOC)) {
						// 	 $newRow['transactorName'];
						// 	$li .= '<li>' . $newRow['transactorName'] . '</li>';
						// }


						// $li .= '<li>' . $amountDecrypted . '</li>';
						// $li .= '<li>' . $transactionDates[$i] . '</li>';
						// $li. = '</ul></li>';

					}

					// echo $li;

				?>

				<!-- </ul> -->
				
			<!-- </div> -->
			
<?php require_once "inc/footer.php"; ?>