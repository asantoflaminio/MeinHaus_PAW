function color(index){
	var ullist = document.getElementById("myul");
	var listlength = 2;
	
	for (i = 0; i < 2; i++) { 
		if(i==index){
			ullist.children[i].style.backgroundColor = "#ffb86b";
		}else{
			ullist.children[i].style.backgroundColor = 'rgb(' + 200 + ',' + 200 + ',' + 200 + ')';
		}
	}
}

$(document).ready(function()
{
	$('#myul li').bind("click", function(e){
        var ul = $(this).parent();
        var index = ul.children().index(this);
        color(index);
    });
});