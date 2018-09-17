
/* Changes heart icon according to the one that corresponds */
function fav(heart){
	if (heart.src.includes("heart_filled"))
		heart.src = "/resources/pics/heart.png";
	else
		heart.src = "/resources/pics/heart_filled.png";
}



/* Remove search filters */
function deleteFilter(filter){
	filter.parentElement.style.display = "none";
}



/* Expands a section of the filter list */
function expand(arrow){
	if (arrow.src.includes("arrow_up")) {
		arrow.src = "/resources/pics/arrow_down.png";
		arrow.parentElement.nextElementSibling.style.display = "block";
	} else {
		arrow.src = "/resources/pics/arrow_up.png";
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

function filterPrice(price){
	document.getElementById("price").setAttribute("price",price);
	filterCondition()
}

function filterBedroom(bedroom){
	document.getElementById("bedroom").setAttribute("bedroom",bedroom);
	filterCondition()
}

function filterCondition(){
	var price = document.getElementById("price").getAttribute("price");
	var bedroom = document.getElementById("bedroom").getAttribute("bedroom")
	var publications = document.querySelectorAll(".polaroid-property");
	var priceChilds = document.getElementsByClassName("price-tag");
	var bedroomChilds = document.getElementsByClassName("bedroom");

	for (i = 0; i < publications.length; i++) {
		var bedroomInner = bedroomChilds[i].innerHTML
			if( (parseInt(bedroomInner.charAt(8)) == parseInt(bedroom) || bedroom == "null") &&
				(parseInt(priceChilds[i].innerHTML.substring(1)) <= parseInt(price)) || price == "null")
    			publications[i].style.display = "flex";
    		else
    			publications[i].style.display = "none";
	}
}

function sortHighestPrice(){
	sortList();
}

function sortList() {
  var publications = document.querySelectorAll(".polaroid-property");
  var publicationsSorted = document.querySelectorAll(".polaroid-property");
  var father = document.getElementById("publications");
  var i, j, k;
  var max = -1;
  var maxElement;

  while (father.firstChild) {
   		father.removeChild(father.firstChild);
  }

  for(i = 0; i < publications.length; i++){
  	max = -1;
  	for(j = 0; j < publications.length; j++){
  		if(publications[j] != null){
	  		var price = parseInt(publications[j].getElementsByClassName("price-tag")[0].innerHTML.substring(1));
	  		if(price > max){
	  			max = price;
	  			maxElement = publications[j];
	  			k = j;
	  		}
  		}else{
  			alert("was null")
  		}
  	}
  	alert("max price index " + i + " is " + max);
  	publicationsSorted[i] = publications[k];
  	publications[k] = null;
  	
  }

  for(i = 0; i < publicationsSorted.length; i++){
  	father.appendChild(publicationsSorted[i]);
  }

  alert("a")
}