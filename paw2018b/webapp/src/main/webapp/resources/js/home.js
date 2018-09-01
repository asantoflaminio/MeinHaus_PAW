/* Give color to Buy or Rent buttons */

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

$(document).ready(function() {
	$('#myul li').bind("click", function(e){
        var ul = $(this).parent();
        var index = ul.children().index(this);
        color(index);
    });
});

/* Search and show (if it's necessary) the message error */
function search() {
	var input_search = document.getElementById("input_search");
	
	var ullist = document.getElementById("myul");
	var listlength = 2;
	var j = 0;
	
	for (i = 0; i < listlength; i++) { 
		if(ullist.children[i].classList.contains("selected")){
			j++;
		}
	}
	
	if (j == 0) {
		var msg = document.getElementById('msg_error_search');
		msg.innerHTML = 'Please, choose between Buy or Rent before clicking Search';
		msg.style.display = "block";
	} else {
		document.getElementById("link").href="./list";
	}
}

