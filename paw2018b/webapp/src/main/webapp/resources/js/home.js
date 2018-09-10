/* Gives color to Buy or Rent buttons */

//String operation;
var operation = "FOR RENT";

$(document).ready(function() {
	$('#myul li').bind("click", function(e){
        var ul = $(this).parent();
        var index = ul.children().index(this);
        color(index);
    });
});

function color(index) {
	var ullist = document.getElementById("myul");
	var listlength = 2;
		
	for (i = 0; i < listlength; i++) { 
		var element = ullist.children[i];
		element.classList.remove("selected");
		if (i == index) {
			element.classList.add("selected");
			element.style.backgroundColor = "#ffb86b";
		} else {
			element.style.backgroundColor = 'rgb(' + 200 + ',' + 200 + ',' + 200 + ')';
		}
	}
}

function operation_sel(op){
	console.log("I got: " + op.valueOf());
	operation = op;
}

/* Searches and shows (if it's necessary) the message error */
function search() {
	var input_search = document.getElementById("input_search");
	var ullist = document.getElementById("myul");
	var listlength = 2;
	var j = 0;
	
	for (i = 0; i < listlength; i++) { 
		if(ullist.children[i].classList.contains("selected"))
			j++;
	}
	
	if (j == 0) {
		var msg = document.getElementById('msg_error_search');
		msg.innerHTML = 'Please, choose between Buy or Rent before clicking Search';
		msg.style.display = "block";
	} else if(/[^a-zA-Z]/.test(input_search.value)){
		var msg = document.getElementById('msg_error_search');
		msg.innerHTML = 'Wrong format'; //Tal vez habria que permitir otras cosas en el formato pero chequear ojo con sql injection
		msg.style.display = "block";
	} else {

		document.getElementById("link").href="./list?input=" + input_search.value + "&operation=" + operation;
		document.getElementById("link").click();
	}
}

