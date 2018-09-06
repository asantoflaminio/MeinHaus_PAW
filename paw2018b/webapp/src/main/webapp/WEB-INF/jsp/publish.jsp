<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="shortcut icon" href="
        <c:url value="/resources/pics/favicon.ico" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/publish.css" />
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
        	<a href="./home">
           		<img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
            </a>
            <div class="dropdown">
	                <img src="
	                <c:url value="/resources/pics/user.png" />
	                " alt="user" id="user_icon" class="navbar_item">
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
        
		
		<div class="polaroid_agency">
		  <div class="container3">
			<h3 id="titl" >STEP 1</h3>
		     <c:url value="/hello/publish" var="postPath"/>
			<form:form modelAttribute="firstPublicationForm" action="${postPath}" method="post">
		     	<div class="fillers">
				     <form:label for="title" path="title">TITLE</form:label>
		    		 <form:input type="text" id="title" name="title" path="title" placeholder="Property type and main features"/>
		    		 <form:errors path="title" cssClass="error" element="p"/>
		    		 
		    		 <form:label for="address" path="address">ADDRESS</form:label>
		    		 <form:input type="text" id="address" name="address" path="address" placeholder="Property address..."/>
		    		 <form:errors path="address" cssClass="error" element="p"/>
		    		  
		    		 <label>OPERATION TYPE</label>
		    		 <div class="op-type-box">
                        		<input class="radio-1" name="operation" type="radio" name="op-type" value="FSale">For sale<br>
                        		<input class="radio-2" name="operation" type="radio" name="op-type" value="FRent">For rent<br>
                     </div>   
		    		 
		    		 <form:label for="price" path="price">PRICE</form:label>
		    		 <form:input type="text" id="price" path="price" name="price" placeholder="Price in US dollars..."/>
		    		 <form:errors path="price" cssClass="error" element="p"/>
		    		 		    		 
		    		 <input class="signup-submit" type="submit" value="NEXT">
	    		 </div>
	    	</form:form>
		  </div>
		</div>
         <footer>

          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
    </body>
</html>