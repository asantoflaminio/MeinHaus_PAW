/* Changes heart icon according to the one that corresponds */
function fav(heart){
	if (heart.src.includes("heart_filled"))
		heart.src = "/null/resources/pics/heart.png";
	else
		heart.src = "/null/resources/pics/heart_filled.png";
}



/* Remove search filters */
function deleteFilter(filter){
	filter.parentElement.style.display = "none";
}



/* Expands a section of the filter list */
function expand(arrow){
	if (arrow.src.includes("arrow_up")) {
		arrow.src = "/null/resources/pics/arrow_down.png";
		arrow.parentElement.nextElementSibling.style.display = "block";
	} else {
		arrow.src = "/null/resources/pics/arrow_up.png";
		arrow.parentElement.nextElementSibling.style.display = "none";
	}
}

/* Searches and shows (if it's necessary) the message error */
function search(operation) {
	var input_search = document.getElementById("search_input");
	
	if(input_search.value === ""){
		
	//no hay nada, no hago nada
		
	}	else if(/[^a-zA-Z]/.test(input_search.value)){
		//habria q mostrar error
		//var msg = document.getElementById('msg_error_search');
		//msg.innerHTML = 'Wrong format'; //Tal vez habria que permitir otras cosas en el formato pero chequear ojo con sql injection
		//msg.style.display = "block";
	} else {
		
		//document.getElementById("link").href="./list?input=" + input_search.value + "&operation=" + operation;
		window.location.href = "./list?input=" + input_search.value + "&operation=" + operation;
	}
}
