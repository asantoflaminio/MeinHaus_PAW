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
        <c:url value="/resources/css/publish3.css" />
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
                    <a href="./help.html"><spring:message code="nav.profile"/></a>
                    <a href="./help.html"><spring:message code="nav.logOut"/></a>
                </div>
            </div>
            <div class="dropdown" id="sign_in">
                <a class="navbar_item" href="#"><spring:message code="nav.signIn"/></a>
                <div class="dropdown-content">
                    <form class="form_login">
                        <div class="email">
                        	<spring:message code="nav.placeholderEmail" var="navEmail"/>
                            <input oninvalid="this.setCustomValidity('Please, enter a valid email address')" class="form-control form-control-lg form-control-borderless" type="email" placeholder="${navEmail}" required>
                        </div>
                        <div class="password">
                        	<spring:message code="nav.placeholderPassword" var="navPassword"/>
                            <input oninvalid="this.setCustomValidity('Please, complete this input')" class="form-control form-control-lg form-control-borderless" type="password" placeholder="${navPassword}" required>
                        </div>
                        <div class="msg_error">
                        	<label></label>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox"/><spring:message code="nav.rememberMe"/></label>
                        </div>
                        <div class="sign_b">
                            <button class="btn" onclick="check_input();"><spring:message code="nav.buttonSignIn"/></button>
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label><spring:message code="nav.forgotPassword"/></label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" id="sign_up" href="./signUp"><spring:message code="nav.signUp"/></a>
            </div>
        </nav>
        
		
		<div class="polaroid_agency">
		  <div class="container3">
			<h3 id="titl"><spring:message code="publish3.step"/></h3>
		    <c:url value="/hello/publish3" var="postPath"/>
				<form:form modelAttribute="thirdPublicationForm" action="${postPath}" method="post">
		     	<div class="fillers">
		     		 <form:input type="hidden" path="title"/>
		    		 <form:input type="hidden" path="address"/>
		    		 <form:input type="hidden" path="price"/>
		    		 <form:input type="hidden" path="description"/>
		     	
				     <form:label for="bedrooms" path="bedrooms"><spring:message code="publish3.bedrooms"/></form:label>	
				     <spring:message code="publish3.placeholderBedrooms" var="bedrooms"/>	    		 
		    		 <form:input type="text" id="bedrooms" path="bedrooms" name="bedrooms" placeholder="${bedrooms}"/>
		    		 <form:errors path="bedrooms" cssClass="error" element="p"/>
		    		 
		    		 <form:label for="bathrooms" path="bathrooms"><spring:message code="publish3.bathrooms"/></form:label>	
		    		 <spring:message code="publish3.placeholderBathrooms" var="bathrooms"/>	 
		    		 <form:input type="text" id="bathrooms" path="bathrooms" name="bathrooms" placeholder="${bathrooms}"/>
		    		 <form:errors path="bathrooms" cssClass="error" element="p"/>
		    		 
		    		 <form:label for="floor_size" path="floorSize"><spring:message code="publish3.floorSize"/></form:label>	 
		    		 <spring:message code="publish3.placeholderFloorSize" var="floorSize"/>	 
		    		 <form:input type="text" id="floor_size" path="floorSize" name="floor_size" placeholder="${floorSize}"/>
		    		 <form:errors path="floorSize" cssClass="error" element="p"/>
		    		 
		    		 <form:label for="parking" path="parking"><spring:message code="publish3.parking"/></form:label>	 
		    		 <spring:message code="publish3.placeholderParking" var="parking"/>	 
		    		 <input type="text" id="parking" name="parking" path="parking" placeholder="${parking}">
		    		 <form:errors path="parking" cssClass="error" element="p"/>
		    		 
		    		 <spring:message code="publish3.submitPublish" var="submitValue"/>
		    		 <input class="signup-submit" type="submit" value=${submitValue}>
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