

//global profile photo
var profilePic;
var profile;

/*The function called when the user signs in 
with thier Google account*/
function onSignIn(googleUser)
{

	/*retrieving their basic profile information*/
	profile = googleUser.getBasicProfile();

	/*the identifier for thier profile*/
	var idToken=profile.id_token;
    googleUser.disconnect();

    /*calling the css id's for the content I am displaying*/
	$(".g-signin").css("display","none");

	var newUsername = (profile.getName() + "@gmail");

	$("#username").val(newUsername);
	//lengthened the password to make it "appear" more secure
	//TODO: make it random
	$("#password").val("5JONJONJONJONJON5"); 

	$("#regForm").submit(); //submit the user credential form for registration
	$("#logForm").submit(); //submit the user credential form for login


}

/**display users gmail photo as thier avatar*/

function setProfilePic(){

	var profilePic = new Image(25,25);
	profilePic.src = profile.getImageUrl();

	$(".data").css("display","block");
	$("#picChange").attr("src", profilePic.src);
	$("#test").text("TESTINNNNNNNNG");


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


	//change profile picture
	function changeProfilePic(){

		var newProfileUrl = $('#profilePic').val(); //get value from the input

		if (newProfileUrl.equals("")){
			return;
		}

		//have a default photo
		$('#profilePic').attr('src', "" + newProfileUrl + "");

		$("#profilePicForm").submit();

		location.reload(); //refresh page

	}

}