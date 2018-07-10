/*The function called when the user signs in 
with thier Google account*/
function onSignIn(googleUser)
{

	/*retrieving their basic profile information*/
	var profile=googleUser.getBasicProfile();

	/*the identifier for thier profile*/
	var idToken=profile.id_token;
    googleUser.disconnect();

    /*calling the css id's for the content I am displaying*/
	$(".g-signin").css("display","none");
	$(".data").css("display","block");
	$("#pic").attr('src', profile.getImageUrl());
	$("#email").text(profile.getEmail());
}

/**Google Oauth - Sign Out The User**/
function signOut()
{
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(

		/*notifying the user that they are sucessfully signed out*/
		function()
		{

			alert("You have been signed out, have a good one!");

			$(".g-signin2").css("display", "none");
		}
	);
}