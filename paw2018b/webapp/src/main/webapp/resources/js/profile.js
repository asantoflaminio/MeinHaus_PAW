function showData() {
    // Declare variables
    var dat, pub, fav;
    var curr = document.getElementsByClassName("current")[0];
    if(curr === undefined);else{curr.removeAttribute("class", "current");}
    
    rm = document.getElementById("Publications");
    rm.style.display = "none";
    
    fav = document.getElementById("Favourites");
    fav.style.display = "none";
    
    dat = document.getElementById("Data");
    dat.style.display = "block";
    document.getElementById("dat").setAttribute("class", "current");
    
}

function showPublications() {
    // Declare variables
    var dat, pub, fav;
    var curr = document.getElementsByClassName("current")[0];
    if(curr === undefined);else{curr.removeAttribute("class", "current");}
    
    dat = document.getElementById("Data");
    dat.style.display = "none";
    
    fav = document.getElementById("Favourites");
    fav.style.display = "none";
    
    pub = document.getElementById("Publications");
    pub.style.display = "block";
    document.getElementById("pub").setAttribute("class", "current");
    
}

function showFavourites() {
    // Declare variables
    var dat, pub, fav;
    var curr = document.getElementsByClassName("current")[0];
    if(curr === undefined);else{curr.removeAttribute("class", "current");}
    
    dat = document.getElementById("Data");
    dat.style.display = "none";
    
    pub = document.getElementById("Publications");
    pub.style.display = "none";
    
    fav = document.getElementById("Favourites");
    fav.style.display = "block";
    document.getElementById("fav").setAttribute("class", "current");
    
}