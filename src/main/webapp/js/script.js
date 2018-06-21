function onSignIn(googleUser)
{

	var profile=googleUser.getBasicProfile();

	var idToken=profile.id_token;
    googleUser.disconnect()

	$(".g-signin").css("display","none");
	$(".data").css("display","block");
	$("#pic").attr('src',profile.getImageUrl());
	$("#email").text(profile.getEmail());
}

/**Google Oauth - Sign Out The User**/
function signOut()
{
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(


		function()
		{

			alert("You have been signed out, have a good one!");

			$(".g-signin2").css("display", "none");
		}
	);
}