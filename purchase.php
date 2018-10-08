<?php
	$pageTitle = "Purchasing eCoin";
	require_once "inc/header.php";
	require_once "inc/logged_in.php";

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		if (isset($_POST['submitCard'])) {
			if(Token::check($_POST['tokenCard'], 'tokenCard')) {
				$cardName = trim(filter_input(INPUT_POST, "nameOnCard", FILTER_SANITIZE_SPECIAL_CHARS));
				$cardNo = trim(filter_input(INPUT_POST, "cardNo", FILTER_SANITIZE_NUMBER_INT));
				$expiryMonth = $_POST['month'];
				$expiryYear = $_POST['year'];
				$securityCode = trim(filter_input(INPUT_POST, "securityCode", FILTER_SANITIZE_NUMBER_INT));
				$address = trim(filter_input(INPUT_POST, "paymentAddress", FILTER_SANITIZE_SPECIAL_CHARS));
				$postcode = trim(filter_input(INPUT_POST, "paymentPostCode", FILTER_SANITIZE_SPECIAL_CHARS));

				if(!empty($_POST['cardType']) && !empty($cardName) && !empty($cardNo) && !empty($expiryMonth) && !empty($expiryYear) && !empty($securityCode) && !empty($address) && !empty($postcode)) {
					$cardType = $_POST['cardType'];
					if (strlen($cardName) < 4 || strlen($cardName) > 25) {
						$error = "Please enter a name that is has more than 4 characters and less than 25";
					} elseif(strlen($cardNo) !== 16) {
						$error = "Please enter the right 16 digit card number.";
					} elseif (strlen($securityCode) !== 3) {
						$error = "Please enter the right 3 digit security code behind your card.";
					} elseif (strlen($address) < 2 || strlen($address) > 40 || strlen($postcode) < 4 || strlen($postcode) > 16) {
						$error = "Please enter a valid address and post code.";
					} else {
						$lastFourCardNo = substr($cardNo, -4);
						$sql = "INSERT INTO card (cardType, cardName, cardNumber, expiryDate, securityCode, billingAddress, billingPostCode, addedDate, userID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
						$query = $handler->prepare($sql);
						$query->execute(array($cardType, $cardName, $lastFourCardNo, date($expiryYear . '-' . $expiryMonth . '-01'), $securityCode, $address, $postcode, date("Y-m-d H:i:s"), Session::get('user')));
						$confirmed = "Your card has now been added.";
					}	
				} else {
					$error = "Please fill all fields to add your a card for payment.";
				}
			}

		}


		if (isset($_POST['submitPurchase'])) {
			if(Token::check($_POST['tokenBuy'], 'tokenBuy')) {
				$amount = trim(filter_input(INPUT_POST, "amount", FILTER_SANITIZE_NUMBER_INT));

				if(!empty($amount)) {
					if(!empty($_POST["card"][0]) || !empty($_POST["card"][1]) || !empty($_POST["card"][2]) || !empty($_POST["card"][3]) || !empty($_POST["card"][4])) {

						$usernameSql = "SELECT username, pubKey FROM user WHERE userID = ?";
						$usernameQuery = $handler->prepare($usernameSql);
						$usernameQuery->bindParam(1, Session::get('user'), PDO::PARAM_INT);
						$usernameQuery->execute();

						while ($row = $usernameQuery->fetch(PDO::FETCH_ASSOC)) {
							$username = $row['username'];
							$pubKey = $row['pubKey'];
						}

						if(isset($username)) {

							// encrypt eCoin
							$encryptionConfig = array(
									    "hash" => "sha512",
									    "private_key_bits" => 4096,
									    "private_key_type" => OPENSSL_KEYTYPE_RSA,
							);

							$ecoinKeys = openssl_pkey_new($encryptionConfig);

							openssl_pkey_export($ecoinKeys, $ecoinPrivKey);

							$ecoinPubKey = openssl_pkey_get_details($ecoinKeys);
							$ecoinPubKey = $ecoinPubKey["key"];

							openssl_public_encrypt($amount, $encryptedAmount, $ecoinPubKey);



							//put eCoin private key in user's private key file
							$ecoinPrivateKeysFile = file_get_contents("json/keys/ecoin_keys/private_keys/" . $username . ".json");
							$ecoinPrivateKeys = json_decode($ecoinPrivateKeysFile, true);

							$ecoinPrivateKeys[] = $ecoinPrivKey;

							$encodedPrivateKeys = json_encode($ecoinPrivateKeys);
							file_put_contents("json/keys/ecoin_keys/private_keys/" . $username . ".json", $encodedPrivateKeys);


							//put eCoin public key in user's public key file
							$ecoinPublicKeysFile = file_get_contents("json/keys/ecoin_keys/public_keys/" . $username . ".json");
							$ecoinPublicKeys = json_decode($ecoinPublicKeysFile, true);

							$ecoinPublicKeys[] = $ecoinPubKey;

							$encodedPublicKeys = json_encode($ecoinPublicKeys);
							file_put_contents("json/keys/ecoin_keys/public_keys/" . $username . ".json", $encodedPublicKeys);

							//get ecoin file
							$userEcoinFile = file_get_contents("json/ecoins/" . $username . "_ecoins.json");
							$userEcoins = json_decode($userEcoinFile, true);

							//decrypt if file is not empty
							if(!isset($userEcoins[0])) {
								$usersPrivateKeysFiles = file_get_contents("json/keys/users_priKeys.json");
								$usersPrivateKeys = json_decode($usersPrivateKeysFiles, true);

								for ($i=0; $i < count($usersPrivateKeys); $i++) { 
									if($usersPrivateKeys[$i][$username]) {
										$privKey = $usersPrivateKeys[$i][$username];
									}
								}

								openssl_private_decrypt($userEcoins, $ecoins, $privKey);

								$encodedUsersPrivateKeys = json_encode($usersPrivateKeys);
								file_put_contents("json/keys/users_priKeys.json", $encodedUsersPrivateKeys);
								
							}

							//add encrypted eCoin to ecoin file
							$userEcoins[] = array(
								'amount' => utf8_encode($encryptedAmount),
								'transactionType' =>  'in'
							);

							//encrypt file using user's public key
							openssl_public_encrypt($userEcoins, $encryptedUserEcoins, $pubKey);


							//put file back
							$encodedUserEcoinFile = json_encode($userEcoins);
							file_put_contents("json/ecoins/" . $username . "_ecoins.json", $encodedUserEcoinFile);

							$buyingMessage = 'Payment successful. You have added ' . $amount . ' eCoins to your wallet.';



							$transactionSQL = "INSERT INTO transaction (transactionDate, transactionType, transactorID, userID) VALUES (?, ?, ?, ?)";
							$transactionQuery = $handler->prepare($transactionSQL);
							$transactionQuery->execute(array(date("Y-m-d H:i:s"), 'in', 1, Session::get('user')));

						}
					} else {
						$buyingError = 'Please choose a card to pay with.';
					}

				} else {
					$buyingError = 'Please enter the amount of eCoin you wish to purchase.';
				}				

			}
		}
	}
?>
			
			<form method="POST" name="purchase">
				<?php 
					if(isset($buyingMessage)) {
						echo '<p class="buyingMessage">' . $buyingMessage . '</p>'; 
					} elseif (isset($buyingError)) {
						echo '<p class="buyingError">' . $buyingError  . '</p>'; 
					} else {
						echo '<p></p>';
					}

				?>

				<input type="number" name="amount" placeholder="£0.00">
				<p>E0.00</p>

				<fieldset>
					<?php
						$cardSql = "SELECT cardID, cardType, cardNumber, expiryDate FROM card WHERE userID = ?";
						$cardQuery = $handler->prepare($cardSql);
						$cardQuery->bindParam(1, $user, PDO::PARAM_INT);
						$cardQuery->execute();
						while ($cardRow = $cardQuery->fetch(PDO::FETCH_ASSOC)) {
							$cardExpiryDate = $cardRow['expiryDate'];
							$cardExpiryYMD = explode("-", $cardExpiryDate);
							$cardExpiryYear = $cardExpiryYMD['0'];
							$cardExpiryYr = substr($cardExpiryYear, -2);

							$purchaseBlock = '<fieldset>';
							$purchaseBlock .= '<input type="radio" name="card" value="' . $cardRow['cardID'] . '" id="' . $cardRow['cardID'] . '"">';
							$purchaseBlock .= '<label for="' . $cardRow['cardID'] . '">';
							$purchaseBlock .= '<span>' . $cardRow['cardType'] . ' ' . $cardRow['cardNumber'] . '</span>';
							$purchaseBlock .= '<span>' . $cardExpiryYMD['1'] . '/' . $cardExpiryYr . '</span>';
							$purchaseBlock .= '</label>';
							$purchaseBlock .= '</fieldset>';
							echo $purchaseBlock;
						}
					?>
				</fieldset>
				<input type="hidden" name="tokenBuy" value="<?php echo Token::generate('tokenBuy')?>">
				<input type="submit" name="submitPurchase" value="Buy eCoins">
			</form>

			<form method="POST" name="addCard">
				<?php
					if(isset($error)) {
						echo '<p class="addCardError">' . $error . '</p>'; 
					} elseif (isset($confirmed)) {
						echo '<p class="addCardConfirmed">' . $confirmed . '</p>'; 
					}
				?>
				<p>Card Payment</p>
				<select name="cardType">
					<option disabled selected>Type of Card..</option>
					<option>American Express</option>
					<option>Master Card</option>
					<option>Visa Credit Card</option>
					<option>Visa Debit Card</option>
				</select>
				<input type="text" name="nameOnCard" placeholder="Name on card.." value="<?php if(isset($cardName)) { echo escape($cardName); } ?>">
				<input type="number" name="cardNo" placeholder="Card number..">
				<fieldset>
					<label for="month">Expiry Date..</label>
					<select id="month" name="month">
						<option></option>
						<?php
							foreach (range(01, 12) as $number) {
								if(strlen($number) == 1) {
									echo '<option> 0'. $number . '</option>';
								} else {
									echo '<option>'. $number . '</option>';
								}
							}
						?>
					</select>
					<select name="year">
						<option></option>
						<?php
							foreach (range(2018, 2023) as $number) {
	    						echo '<option>'. $number . '</option>';
							}
						?>
					</select>
				</fieldset>
				<input type="number" name="securityCode" placeholder="Security Code">

				<p>Billing Address</p>
				<input type="text" name="paymentAddress" placeholder="Address Line 1.." value="<?php if(isset($address)) { echo escape($address); } ?>">
				<input type="text" name="paymentPostCode" placeholder="Post Code.." value="<?php if(isset($postcode)) { echo escape($postcode); } ?>">
				<input type="hidden" name="tokenCard" value="<?php echo Token::generate('tokenCard')?>">
				<input type="submit" name="submitCard" value="Add Card">

			</form>
			
<?php require_once "inc/footer.php"; ?>