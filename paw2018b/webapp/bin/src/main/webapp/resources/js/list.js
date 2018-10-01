
$(document).ready(function() {
	$('.search_list-item').bind("click", function(e){
        var fieldset = $(this).parent()[0];
        var index = 0;
        if(this.getElementsByTagName("label")[0].innerHTML == "Comprar" || this.getElementsByTagName("label")[0].innerHTML == "Buy")
        	index = 0;
        else
        	index = 1;	
        color(index);
    });
	
	$('.page-number').bind("click", function(e){
        var num = this.innerHTML;
        changeSelectedPage(num);
    });
});

function changeSelectedPage(index) {
	var pub = document.getElementById("publications").children;
	
	for(i = 0; i < pub.length; i++){
		pub[i].style.display = "none";
	}
}

function color(index) {
	var list = document.getElementsByClassName("search_list-container")[0];
	var listlength = 2;
		
	for (i = 0; i < listlength; i++) { 
		var element = list.children[i];
		element.classList.remove("selected");
		if (i == index) {
			element.classList.add("selected");
			element.style.backgroundColor = "#fd8907";
			element.onmouseover = function() {
			    this.style.backgroundColor = "#fd8907";
			}
			element.onmouseleave = function() {
				this.style.backgroundColor = "#fd8907";
			}
			element.getElementsByTagName("input")[0].checked = true;
		} else {
			element.style.backgroundColor = 'rgb(' + 200 + ',' + 200 + ',' + 200 + ')';
			element.onmouseover = function() {
			    this.style.backgroundColor = "#fecc94";
			}
			element.onmouseleave = function() {
				this.style.backgroundColor = 'rgb(' + 200 + ',' + 200 + ',' + 200 + ')';

			}
		}
	}
}


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
	var filterId = filter.parentElement.getAttribute("id")
	if(filterId == "filterPrice"){
		document.getElementById("price").setAttribute("price","null");
		document.getElementById("priceNull").checked = true;
	}
	else{
		document.getElementById("bedroom").setAttribute("bedroom","null");
		document.getElementById("bedroomNull").checked = true;
	}
	filterCondition()
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

function filterPrice(price){
	var priceRadios = document.getElementsByClassName("priceFilter");
	var priceFilter = document.getElementById("filterPrice")
	var childDelete = priceFilter.firstChild
	var i;
	for(i = 0; i < priceRadios.length; i++){
		if(priceRadios[i].checked == true)
			priceFilter.innerText = priceRadios[i].parentElement.innerText
	}
	priceFilter.insertBefore(childDelete, priceFilter.firstChild);
	priceFilter.style.display = "inline-block";
	document.getElementById("price").setAttribute("price",price);
	
	document.getElementById("searchPrice").setAttribute("value",price)
	document.getElementById("filterPriceInput").setAttribute("value",price)
}

function filterBedroom(bedroom){
	var bedroomRadios = document.getElementsByClassName("bedroomFilter");
	var bedroomFilter = document.getElementById("filterBedroom")
	var childDelete = bedroomFilter.firstChild
	var i;
	for(i = 0; i < bedroomRadios.length; i++){
		if(bedroomRadios[i].checked == true)
			bedroomFilter.innerText = bedroomRadios[i].parentElement.innerText
	}
	bedroomFilter.insertBefore(childDelete, bedroomFilter.firstChild);
	bedroomFilter.style.display = "inline-block";
	document.getElementById("bedroom").setAttribute("bedroom",bedroom);
	document.getElementById("searchBedrooms").setAttribute("value",bedroom)
	document.getElementById("filterBedroomsInput").setAttribute("value",bedroom)
}

function setFilter(operation){
	document.getElementById("filterOperation").setAttribute("value",operation)
}

function chargeParameters(address,operation,price,bedrooms){
	document.getElementById("filterOperation").setAttribute("value",operation)
	document.getElementById("filterAddress").setAttribute("value",address)

	var bedroomRadios = document.getElementsByClassName("bedroomFilter");
	var bedroomFilter = document.getElementById("filterBedroom")
	var childDelete = bedroomFilter.firstChild
	var bedroomRadioInteger
	var i;

	for(i = 0; i < bedroomRadios.length; i++){
		bedroomRadioInteger = (bedroomRadios[i].parentElement.innerText).replace(/(^\d+)(.+$)/i,'$1');
		if(bedrooms == bedroomRadioInteger){
			bedroomRadios[i].checked = true
			bedroomFilter.innerText = bedroomRadios[i].parentElement.innerText
			break
		}

		if(i == bedroomRadios.length - 1){
			bedroomRadios[i].checked = true
			bedroomFilter.innerText = bedroomRadios[i].parentElement.innerText
		}
	}
	bedroomFilter.insertBefore(childDelete, bedroomFilter.firstChild);
	bedroomFilter.style.display = "inline-block";
	document.getElementById("bedroom").setAttribute("bedroom",bedrooms);
	document.getElementById("searchBedrooms").setAttribute("value",bedrooms)
	document.getElementById("filterBedroomsInput").setAttribute("value",bedrooms)

	var priceRadios = document.getElementsByClassName("priceFilter");
	var priceFilter = document.getElementById("filterPrice")
	var childDelete = priceFilter.firstChild
	var numberPattern = /\d+/g;
	var priceRadioInteger
	for(i = 0; i < priceRadios.length; i++){
		if(i == priceRadios.length - 1){
			priceFilter.innerText = priceRadios[i].parentElement.innerText
			priceRadios[i].checked = true
			break
		}
		priceRadioInteger = (priceRadios[i].parentElement.innerText).match(numberPattern)[0] * 1000
		if(price == priceRadioInteger){
			priceRadios[i].checked = true
			priceFilter.innerText = priceRadios[i].parentElement.innerText
			break
		}

	}
	priceFilter.insertBefore(childDelete, priceFilter.firstChild);
	priceFilter.style.display = "inline-block";
	document.getElementById("price").setAttribute("price",price);
	document.getElementById("searchPrice").setAttribute("value",price)
	document.getElementById("filterPriceInput").setAttribute("value",price)

	var buy = document.getElementById("Fsale")
	var rent = document.getElementById("Frent")

	if(operation == "FSale"){
		buy.checked = true;
		buy.parentElement.classList.add("selected");
		buy.parentElement.style.backgroundColor = "#fd8907";
	}else{
		rent.checked = true;
		rent.parentElement.classList.add("selected");
		rent.parentElement.style.backgroundColor = "#fd8907";
	}
}


function sortHighestPrice() {
  var publications = document.querySelectorAll(".polaroid-property");
  var sort = [];
  var father = document.getElementById("publications");
  var i, j, k;
  var max = null;
  while (father.firstChild) {
   		father.removeChild(father.firstChild);
  }
  for(i = 0; i < publications.length; i++){
  	max = null;
  	for(j = 0; j < publications.length; j++){
  		if(publications[j].getAttribute("visited") != "true"){
	  		var price = parseInt(publications[j].getElementsByClassName("price-tag")[0].innerHTML.substring(1));
	  		if(price > max || max == null){
	  			max = price;
	  			k = j;
	  		}
  		}
  	}
  	sort.push(k);
  	publications[k].setAttribute("visited",true);
  }
  for(i = 0; i < sort.length; i++){
  	publications[i].setAttribute("visited",false);
  	father.appendChild(publications[sort[i]]);
  }
}

function sortLowestPrice() {
  var publications = document.querySelectorAll(".polaroid-property");
  var sort = [];
  var father = document.getElementById("publications");
  var i, j, k;
  var min = null;

  while (father.firstChild) {
   		father.removeChild(father.firstChild);
  }
  for(i = 0; i < publications.length; i++){
  	min = null;
  	for(j = 0; j < publications.length; j++){
  		if(publications[j].getAttribute("visited") != "true"){
	  		var price = parseInt(publications[j].getElementsByClassName("price-tag")[0].innerHTML.substring(1));
	  		if(min == null || price < min){
	  			min = price;
	  			k = j;
	  		}
  		}
  	}
  	sort.push(k);
  	publications[k].setAttribute("visited",true);
  }
  for(i = 0; i < sort.length; i++){
  	publications[i].setAttribute("visited",false);
  	father.appendChild(publications[sort[i]]);
  }
}


