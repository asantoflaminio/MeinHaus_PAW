function check_input(){
	var email = document.getElementsByClassName("email")[0].children[0].value; 
	var pass = document.getElementsByClassName("password")[0].children[0].value; 
		
	if(email.length > 0 && pass.length > 0){
		hidden_items();
	} else {
		var msg_error = document.getElementsByClassName('msg_error')[0].children[0];
		document.getElementsByClassName("msg_error")[0].style.visibility = "visible";
		if(email.length > 0 ){
			msg_error.innerHTML = 'Your password is wrong ';
		} else if(email.length > 0) {
			msg_error.innerHTML = 'Your email is wrong';
		} else {
			msg_error.innerHTML = 'Your email and password are wrong';
		}
	}
}

function hidden_items(){
	document.getElementById("sign_in").style.display = "none";
	document.getElementById("sign_up").style.display = "none";
	document.getElementById("user_icon").style.display = "block";
}