<?php
	$pageTitle = "eCoin Authentication";
	require_once "inc/header.php";

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		if (isset($_POST['submitLogin'])) {
			if(Token::check($_POST['tokenLogin'], 'tokenLogin')) {
				$username = trim(filter_input(INPUT_POST, "usernameLogin", FILTER_SANITIZE_STRING));
				$password = filter_input(INPUT_POST, "passwordLogin", FILTER_SANITIZE_STRING);

				if(!empty($username) && !empty($password)) {
					$usernameSql = "SELECT * FROM user WHERE username = ?";
					$usernameQuery = $handler->prepare($usernameSql);
					$usernameQuery->bindParam(1, $username, PDO::PARAM_STR);
					$usernameQuery->execute();

					while ($row = $usernameQuery->fetch(PDO::FETCH_ASSOC)) {
						$db_userID = $row['userID'];
						$db_username = $row['username'];
						$db_password = $row['password'];
						$db_salt = $row['salt'];
						$db_secretCode = $row['secretCode'];
					}

					if(isset($db_username)) {
						if($username == $db_username && $db_password === Hash::make($password, $db_salt)) {
							Session::put('user', $db_userID);
							Session::put('logInTimeDate', date("Y-m-d H:i:s"));
							Redirect::to('index.php');
						} else {
							$error = "Please enter a valid username and password.";
						}
					} else {
						$error = "Please enter a valid username and password.";
					}
				} else {
					$error = "Please fill all fields.";
				}

			}
		}
	}			
		 

?>

			<form method="POST" name="login">
				<p><?php if(isset($error)) {echo $error; } ?></p>
				<input type="text" name="usernameLogin" placeholder="Username.." value="<?php if(isset($username)) { echo escape($username); } ?>">
				<input type="password" name="passwordLogin" placeholder="Password..">

				<!-- The random password selection doesn't currently work due to the hashing of secret code which can't be unreversed -->
				<p>Please enter the right characters from your secret code.</p>

				<?php
					$numRange = range(1, 8);
					shuffle($numRange);
					$chosenNumRange = array($numRange[1], $numRange[3], $numRange[4], $numRange[7]);
					sort($chosenNumRange);

					function ordinal($number) {
					    $ends = array('th','st','nd','rd','th','th','th','th','th','th');
					    if ((($number % 100) >= 11) && (($number%100) <= 13))
					        return $number. 'th';
					    else
					        return $number. $ends[$number % 10];
					}
				?>

				<fieldset>
					<label for="secretCode01"><?php echo ordinal($chosenNumRange[0]); ?></label>
					<select id="secretCode01" name="secretCode01">
						<?php
							foreach (range(0, 9) as $number) {
	    						echo '<option>'. $number . '</option>';
							}

							foreach (range(a, z) as $letter) {
	    						echo '<option>'. $letter . '</option>';
							}
						?>
					</select>
				</fieldset>

				<fieldset>
					<label for="secretCode02"><?php echo ordinal($chosenNumRange[1]); ?></label>
					<select id="secretCode02" name="secretCode02">
						<?php
							foreach (range(0, 9) as $number) {
	    						echo '<option>'. $number . '</option>';
							}
							
							foreach (range(a, z) as $letter) {
	    						echo '<option>'. $letter . '</option>';
							}
						?>
					</select>
				</fieldset>

				<fieldset>
					<label for="secretCode03"><?php echo ordinal($chosenNumRange[2]); ?></label>
					<select id="secretCode03" name="secretCode03">
						<?php
							foreach (range(0, 9) as $number) {
	    						echo '<option>'. $number . '</option>';
							}
							
							foreach (range(a, z) as $letter) {
	    						echo '<option>'. $letter . '</option>';
							}
						?>
					</select>
				</fieldset>

				<fieldset>
					<label for="secretCode04"><?php echo ordinal($chosenNumRange[3]); ?></label>
					<select id="secretCode04" name="secretCode04">
						<?php
							foreach (range(0, 9) as $number) {
	    						echo '<option>'. $number . '</option>';
							}
							
							foreach (range(a, z) as $letter) {
	    						echo '<option>'. $letter . '</option>';
							}
						?>
					</select>
				</fieldset>

				<input type="hidden" name="tokenLogin" value="<?php echo Token::generate('tokenLogin')?>">
				<input type="submit" name="submitLogin" value="Log Into My eCoin Account">

				<p>OR</p>
				<a href="register.php">Register Your Account</a>
			</form>

			
<?php require_once "inc/footer.php"; ?>