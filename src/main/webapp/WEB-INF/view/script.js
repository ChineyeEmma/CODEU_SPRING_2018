function onSignIn(googleUser){

	var profile=googleUser.getBasicProfile();
	$(".g-signin").css("display","none");
	$(".data").css("display","block");
}