<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
img, label {
	display: inline-block;
}

label {
	width: 130px;
}

button {
	background-color: blue;
	color: white;
	font-size: 15px;
}

.g-signin2 {
	width: 100%;
}

.g-signin2>div {
	margin: 0 auto;
}
</style>
<meta name="google-signin-client_id"
	content="60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com">
</head>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<!-- <script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script> -->
<!-- <script>
function init(){
	console.log('init');
	gapi.load('auth2', function(){
		console.log('auth2');
		window.gauth = gapi.auth2.init({
			client_id: '60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com'
		})
	});
}
</script> -->
<body>
	<div style='width: 100%; text-align: center; padding-top: 100px'>
		<form method="post" action="loginOk">
			<h1>Lost & Found</h1>
			<div>
				<label>User Id: </label><input type='text' name='userid' />
			</div>
			<br>
			<div>
				<label>Password: </label><input type='password' name='password' />
			</div>
			<br>
			<button type='submit'>login</button>
		</form>

	</div>
	<div class="g-signin2" data-onsuccess="onSignIn"
		data-scope="https://www.googleapis.com/auth/plus.login"
		data-accesstype="offline"
		data-redirecturi="http://localhost:8080/winter/login/oauth2callback"></div>
</body>

</html>