function fav(heart){
	if(heart.src.includes("heart_filled"))
		heart.src = "/null/resources/pics/heart.png";
	else
		heart.src = "/null/resources/pics/heart_filled.png";
}