<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/details.css" />">
        <script src="js/jquery-3.3.1.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    </head>

    <body background="<c:url value="/resources/pics/background2.jpg" />">
        <nav>
          <img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
                <div class="dropdown" >
                  <img src="<c:url value="/resources/pics/Settings.png" />" alt="Settings" id="settings" class="navbar_item">
                  <div id="myDropdown" class="dropdown-content" > 
                    <a href="./help.html">Log In</a>
                    <a href="./help.html">Register</a>
                    <a href="./help.html">Publish</a>
                  </div>
                </div>
        </nav>
             
         <div class="polaroid">
		  <img class="polaroid_img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre" style="width:100%">
		  <div class="container">
		    <p class="direction">2538 La Condesa Dr, Los Angeles, CA</p>
		  </div>
		</div>
		
		<div class="polaroid_price">
		  <div class="container2">
		    <p class="price_text">For sale: $4,575,000</p>
		  </div>
		</div>
		
		<div class="polaroid_agency">
		  <div class="container3">
		     <img class="polaroid_img_agency" src="<c:url value="/resources/pics/richmond.png" />" alt="5 Terre" style="width:100%">
		     <p class="agency_text">Contact the agent!</p>
		     <p class="agency_text">(310) 255-5454</p>
		     <p class="agency_text">aca vendria un formulario para contactar x mail</p>
		  </div>
		</div>
		
		</div>

        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
    </body>
</html>
