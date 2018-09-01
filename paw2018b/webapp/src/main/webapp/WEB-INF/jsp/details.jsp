<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="shortcut icon" href="
        <c:url value="/resources/pics/favicon.ico" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/details.css" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/navbar.css" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/footer.css" />
        ">
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
                <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>

    <body>
          <nav>
        	<a href="./home">
           		<img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
            </a>
             <div class="dropdown" id="user_icon">
	                <img src="
	                <c:url value="/resources/pics/user.png" />
	                " alt="user" class="navbar_item">
                <div id="myDropdown" class="dropdown-content"> 
                    <a href="./help.html">Profile</a>
                    <a href="./help.html">Log Out</a>
                </div>
            </div>
            <div class="dropdown" id="sign_in">
                <a class="navbar_item" href="#">Sign in</a>
                <div class="dropdown-content">
                    <form class="form_login">
                        <div class="email">
                            <input oninvalid="this.setCustomValidity('Please, enter a valid email address')" class="form-control form-control-lg form-control-borderless" type="email" placeholder="Email" required>
                        </div>
                        <div class="password">
                            <input oninvalid="this.setCustomValidity('Please, complete this input')" class="form-control form-control-lg form-control-borderless" type="password" placeholder="Password" required>
                        </div>
                        <div class="msg_error">
                        	<label></label>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox"/>Remember me</label>
                        </div>
                        <div class="sign_b">
                            <button class="btn" onclick="check_input();">Sign in</button>
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label> Forgot password? Click Here!</label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" id="sign_up" href="./signUp">Sign up</a>
            </div>
        </nav>
        
             
         <div class="polaroid">
          
          <div class="w3-content w3-display-container" style="max-width:800px">
			  <img class="mySlides" src="<c:url value="/resources/pics/casa1.jpg" />" style="width:100%">
			  <img class="mySlides" src="<c:url value="/resources/pics/casa2.jpg" />" style="width:100%">
			  <img class="mySlides" src="<c:url value="/resources/pics/casa3.jpg" />" style="width:100%">
			  <img class="mySlides" src="<c:url value="/resources/pics/casa4.jpg" />" style="width:100%">
			  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
			    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(4)"></span>
			  </div>
			</div>
          
		  <!-- <img class="polaroid_img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre" style="width:100%">  -->
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
		     <p class="agency_text">Floor size: 388 m2</p>
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
        <script src="<c:url value="/resources/js/details.js" />"></script>
    </body>
</html>