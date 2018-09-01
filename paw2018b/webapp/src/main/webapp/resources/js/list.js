function fav(heart){
	if(heart.src.includes("heart_filled"))
		heart.src = "/null/resources/pics/heart.png";
	else
		heart.src = "/null/resources/pics/heart_filled.png";
}

function deleteFilter(filter){
	filter.parentElement.style.display = "none";
}

function expand(arrow){
	if(arrow.src.includes("arrow_up")){
		arrow.src = "/null/resources/pics/arrow_down.png";
		arrow.parentElement.nextElementSibling.style.display = "block";
	}
	else {
		arrow.src = "/null/resources/pics/arrow_up.png";
		arrow.parentElement.nextElementSibling.style.display = "none";
	}
}