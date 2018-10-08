<?php
	$pageTitle = "eCoin Registration";
	require_once "inc/header.php";

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		if (isset($_POST['submitRegistration'])) {
			if(Token::check($_POST['tokenRegister'], 'tokenRegister')) {
				$fullname = trim(filter_input(INPUT_POST, "fullname", FILTER_SANITIZE_SPECIAL_CHARS));
				$email = trim($_POST["email"]);
				$phone = trim(filter_input(INPUT_POST, "phone", FILTER_SANITIZE_NUMBER_INT));
				$address = trim(filter_input(INPUT_POST, "address", FILTER_SANITIZE_SPECIAL_CHARS));
				$postcode = trim(filter_input(INPUT_POST, "postcode", FILTER_SANITIZE_SPECIAL_CHARS));
				$username = trim(filter_input(INPUT_POST, "registrationUsername", FILTER_SANITIZE_STRING));
				$password01 = filter_input(INPUT_POST, "registrationPassword01", FILTER_SANITIZE_STRING);
				$password02 = filter_input(INPUT_POST, "registrationPassword02", FILTER_SANITIZE_STRING);
				$secretCode01 = filter_input(INPUT_POST, "secretCode01", FILTER_SANITIZE_STRING);
				$secretCode02 = filter_input(INPUT_POST, "secretCode02", FILTER_SANITIZE_STRING);


				if(!empty($fullname) && !empty($email) && !empty($phone) && !empty($address) && !empty($postcode) && !empty($username) && !empty($password01) && !empty($password02) && !empty($secretCode01) && !empty($secretCode02)) {

					if (strlen($fullname) < 5 || strlen($fullname) > 25) {
						$error = "Please enter a name that is longer than 5 characters and less than 25";
					} elseif (strlen($phone) < 7 || strlen($phone) > 16) {
						$error = "Please enter a a phone number that is longer than 5 characters and less than 25";
					} elseif (strlen($address) < 2 || strlen($address) > 40 || strlen($postcode) < 4 || strlen($postcode) > 16) {
						$error = "Please enter a valid address and post code.";
					} elseif (strlen($username) < 2 || strlen($username) > 12) {
						$error = "Please enter a username that is longer than 2 characters and shorter than 12";
					} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
						$error = "Please enter a valid email address.";
					} elseif ($password01 !== $password02) {
						$error = "Please enter matching passwords that you will remember.";
					} elseif (strlen($password01) < 11) {
						$error = "Please enter a password which has 11 characters or more.";
					} elseif ($secretCode01 !== $secretCode02) {
						$error = "Please enter matching secret codes that you will remember.";
					} elseif(strlen($secretCode01) < 8) {
						$error = "Please enter a secret code which has 8 characters or more.";
					} else {

						$usernameSql = "SELECT username FROM user WHERE username = ?";
						$usernameQuery = $handler->prepare($usernameSql);
						$usernameQuery->bindParam(1, $username, PDO::PARAM_STR);
						$usernameQuery->execute();

						if ($usernameQuery->fetch(PDO::FETCH_ASSOC)) {
							$error = "Your choosen username has been taken. Please try another one.";
						} else {

							// Source: http://php.net/manual/en/function.openssl-pkey-new.php
							//encryption array
							$encryptionConfig = array(
							    "hash" => "sha512",
							    "private_key_bits" => 4096,
							    "private_key_type" => OPENSSL_KEYTYPE_RSA,
							);

							//create the private and public key
							$privateAndPublicKey = openssl_pkey_new($encryptionConfig);

							//extract the private key from $privateAndPublicKey to $privKey
							openssl_pkey_export($privateAndPublicKey, $privKey);

							//extract the public key from $privateAndPublicKey to $pubKey
							$pubKey = openssl_pkey_get_details($privateAndPublicKey);
							$pubKey = $pubKey["key"];

							//data to be encrypted
							// $data = 'plaintext data goes here';

							// Encrypt the data to $encrypted using the public key
							// openssl_public_encrypt($data, $encrypted, $pubKey);
							// openssl_private_decrypt($encrypted, $decrypted, $privKey);




							//to the database
							$salt = Hash::salt(32);
							$hashedPassword = Hash::make($password01, $salt);

							$secretSalt = Hash::salt(32);
							$hashedSecret = Hash::make($secretCode01, $secretSalt);

							$registerSql = "INSERT INTO user (username, password, salt, secretCode, secretSalt, pubKey, name, email, phone, address, postCode, joined) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
							$registerQuery = $handler->prepare($registerSql);
							$registerQuery->execute(array($username, $hashedPassword, $salt, $hashedSecret, $secretSalt, $pubKey, $fullname, $email, $phone, $address, $postcode, date("Y-m-d H:i:s")));





							// store new user priKey to users' private key file
							$usersPrimaryKeysFile = file_get_contents("json/keys/users_priKeys.json");
							$usersPrimaryKeys = json_decode($usersPrimaryKeysFile, true);

							$userKey = array($username => $privKey);
							$usersPrimaryKeys[] = $userKey;

							$encodedPrimaryKeys = json_encode($usersPrimaryKeys);
							file_put_contents("json/keys/users_priKeys.json", $encodedPrimaryKeys);


							//create ecoin file for new user
							$ecoinFile = array();
							$encodedeCoinFile = json_encode($ecoinFile);
							file_put_contents("json/ecoins/" . $username . "_ecoins.json", $encodedeCoinFile);

							//create private key file for new user
							$privateFile = array();
							$encodedePrivateFile = json_encode($privateFile);
							file_put_contents("json/keys/ecoin_keys/private_keys/" . $username . ".json", $encodedePrivateFile);


							//create public key file for new user
							$publicFile = array();
							$encodedePublicFile = json_encode($publicFile);
							file_put_contents("json/keys/ecoin_keys/public_keys/" . $username . ".json", $encodedePublicFile);


							Redirect::to('login.php');
						}
					}
				} else {
					$error = "Please fill all fields to register.";
				}


			}
		}
	}

?>

			<form method="POST" name="registration">
				<p><?php if(isset($error)) {echo $error; } ?></p>
				<fieldset>
					<p>Personal Information</p>
					<input type="text" name="fullname" placeholder="Full Name.." value="<?php if(isset($fullname)) { echo escape($fullname); } ?>">
					<input type="text" name="email" placeholder="Email.." value="<?php if(isset($email)) { echo escape($email); } ?>">
					<input type="number" name="phone" placeholder="Phone.." value="<?php if(isset($phone)) { echo escape($phone); } ?>">
					<input type="text" name="address" placeholder="Address Line 1.." value="<?php if(isset($address)) { echo escape($address); } ?>">
					<input type="text" name="postcode" placeholder="Post Code.." value="<?php if(isset($postcode)) { echo escape($postcode); } ?>">
				</fieldset>

				<fieldset>
					<p>Login Details</p>
					<input type="text" name="registrationUsername" placeholder="Username.." value="<?php if(isset($username)) { echo escape($username); } ?>">
					<input type="password" name="registrationPassword01" placeholder="Password..">
					<input type="password" name="registrationPassword02" placeholder="Repeat Password..">
				</fieldset>

				<fieldset>
					<p>Secret Code</p>
					<input type="password" name="secretCode01" placeholder="Secret Code">
					<input type="password" name="secretCode02" placeholder="Repeat Secret Code">
				</fieldset>

				<fieldset>
					<input type="hidden" name="tokenRegister" value="<?php echo Token::generate('tokenRegister')?>">
					<input type="submit" name="submitRegistration" value="Register for an eCoin Account">
					<p>OR</p>
					<a href="login.php">Log Into Your Account</a>
				</fieldset>
			</form>

<?php require_once "inc/footer.php"; ?>