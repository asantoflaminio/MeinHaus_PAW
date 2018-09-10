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
			<h3 id="titl"><spring:message code="publish2.step"/></h3>
		    <c:url value="/hello/publish2" var="postPath"/>
			<form:form modelAttribute="secondPublicationForm" action="${postPath}" method="post">
		     	<div class="fillers">
				     <form:label for="description" path="description"><spring:message code="publish2.description"/></form:label>
				     <spring:message code="publish2.placeholderDescription" var="description"/>		    		 
		    		 <textarea cols="30" rows="8" placeholder="${description}"></textarea>
		    		 <label for="PROPERTY TYPE"><spring:message code="publish2.propertyType"/></label>	
		    		 <div class="prop-type-box">
                        		<input class="radio-1" checked="checked" name="operation" type="radio" name="op-type" value="FSale"><spring:message code="publish2.apartment"/><br>
                        		<input class="radio-2" name="operation" type="radio" name="op-type" value="FRent"><spring:message code="publish2.house"/><br>
	                 </div>   
		    		 <spring:message code="publish2.submitPublish" var="submitValue"/>
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