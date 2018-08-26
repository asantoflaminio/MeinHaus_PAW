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
		     <form action="/action_page.php">
		     	<div class="fillers">
				     <label for="name">Name</label>
		    		 <input type="text" id="name" name="name" placeholder="Your name...">
		    		 
		    		 <label for="email">Email</label>
		    		 <input type="text" id="email" name="email" placeholder="Your email...">
		    		 
		    		 <label for="message">Message</label>
		    		 <input type="text" id="message" name="message" placeholder="Write a message...">
		    		 
		    		 <button class="button">Contact Agent</button>
	    		 </div>
	    	</form>
		  </div>
		</div>
		
		<div class="polaroid_overview">
		  <div class="container4">
		     <p class="polaroid_title">Overview</p>
		     <p class="agency_text">Bedrooms: 5</p>
		     <p class="agency_text">Bathrooms: 7</p>
		     <p class="agency_text">Floor size: 4,184 sqft</p>
		     <p class="agency_text">Parking: 2 vehicles</p>
		     <p class="agency_text">Days on MeinHaus: 4 days</p> 
		  </div>
		</div>
		
		<div class="polaroid_des">
		  <div class="container">
		  	<p class="polaroid_title">Description</p>
		    <p class="agency_text">Newly built Cape Cod style home with the perfect floor plan and the finest of custom finishes throughout! Boasting an incredible dream-like backyard with stone décor pool, spa, waterfall, outdoor dining that is covered by lit trellis, along with a separate pool house cabana that is equipped with a fireplace and TV. The home offers 5 bedrooms, 7 baths and a separate office. Located on a quiet cul-de-sac in an ideal Brentwood location next to exceptional hiking trails, yet a short distance to schools, shopping and restaurants. The formal living room and dining area create an elegant setting for large gatherings. The Chef's dream kitchen offers top of the line appliances, Carrera marble counters, butler 's pantry with wine cooler, enormous main walk-in pantry and breakfast area with bay window viewing the backyard, huge center island that comfortably sits 6 people. The upstairs master suite offers a luxurious bathroom with relaxing soaking tub, marble shower and huge walk in closet.</p>
		  </div>
		</div>

        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
    </body>
</html>
