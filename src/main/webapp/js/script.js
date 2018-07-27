

//global profile photo
var profilePic;
var profile;

/*The function called when the user signs in 
with thier Google account*/
function onSignIn(googleUser)
{

	/*retrieving their basic profile information*/
	profile = googleUser.getBasicProfile();
	profilePic = new Image(25,25);
	profilePic.src = profile.getImageUrl();
	document.getElementById("picChange").src = profilePic.src;


	/*the identifier for thier profile*/
	var idToken=profile.id_token;
    googleUser.disconnect();

    /*calling the css id's for the content I am displaying*/
	$(".g-signin").css("display","none");

	var newUsername = (profile.getName() + "@gmail");

	$("#picChange").attr("src", "" + profilePic.src);

	$("#username").val(newUsername);
	//lengthened the password to make it "appear" more secure
	//TODO: make it random
	$("#password").val("5JONJONJONJON5"); 

	$("#regForm").submit(); //submit the user credential form for registration
	$("#logForm").submit(); //submit the user credential form for login


}

/**display users gmail photo as thier avatar*/

function setProfilePic(){

//document.getElementById("picChange").src = profilePic.src;

/*retrieving their basic profile information*/
	// profile = googleUser.getBasicProfile();
	// profilePic = new Image(25,25);
	// profilePic.src = profile.getImageUrl();
	$(".data").css("display","block");
	$("#picChange").attr("src", "" + profilePic.src);
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


}