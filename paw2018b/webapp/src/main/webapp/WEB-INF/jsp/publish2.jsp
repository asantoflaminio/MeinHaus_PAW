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
        <c:url value="/resources/css/publish2.css" />
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>

    <body background="<c:url value="/resources/pics/background5.png" />">
        <nav>
            <img src="
            <c:url value="/resources/pics/Logo4.png" />
            " alt="Home" id="logo">
            <div class="dropdown">
                <img src="
                <c:url value="/resources/pics/Settings.png" />
                " alt="Settings" id="settings" class="navbar_item">
                <div id="myDropdown" class="dropdown-content"> 
                    <a href="./help.html">Profile</a>
                    <a href="./help.html">Log Out</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="navbar_item" href="#">Sign in</a>
                <div class="dropdown-content">
                    <form class="form_login">
                        <div class="email">
                            <input class="form-control form-control-lg form-control-borderless" type="email" placeholder="Email" required>
                        </div>
                        <div class="password">
                            <input class="form-control form-control-lg form-control-borderless" type="password" placeholder="Password" required>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox" />Remember me</label>
                        </div>
                        <div class="sign_b">
                            <button class="btn" type="submit">Sign in</button>
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label> Forgot password? Click Here!</label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" href="">Sign up</a>
            </div>
        </nav>
		
		<div class="polaroid_agency">
		  <div class="container3">
			<h3 id="titl">STEP 2</h3>
		     <form action="/action_page.php">
		     	<div class="fillers">
				     <label for="description">DESCRIPTION</label>		    		 
		    		 <textarea cols="30" rows="8" placeholder="Property description..."></textarea>
		    		 <label for="PROPERTY TYPE">PROPERTY TYPE</label>	
		    		 <div class="prop-type-box">
	                        		<input class="radio-1" type="radio" name="prop-type" value="Apt">Apartment<br>
	                        		<input class="radio-2" type="radio" name="prop-type" value="House">House<br>
	                 </div>   
		    		 <a class="button" href="./publish3">NEXT</a>
	    		 </div>
	    		 
	    		 
	    	</form>
		  </div>
		</div>
         <footer>

          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
    </body>
</html>