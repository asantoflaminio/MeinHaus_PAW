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
                            <input type="submit" class="btn" value="<spring:message code="nav.buttonSignIn"/>" >
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label><spring:message code="nav.forgotPassword"/></label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" id="publish" href="./publish"><spring:message code="nav.publish"/></a>
            </div>
            <div>
                <a class="navbar_item" id="sign_up" href="./signUp"><spring:message code="nav.signUp"/></a>
            </div>
        </nav>
        
             
         <div class="polaroid">       
          <div class="w3-content w3-display-container" style="max-width:800px">
           	<div class="size_div">
           		  <img class="mySlides" src="<c:url value="/resources/pics/casa1.jpg" />" >
				  <img class="mySlides" src="<c:url value="/resources/pics/casa2.jpg" />" >
				  <img class="mySlides" src="<c:url value="/resources/pics/casa3.jpg" />" >
				  <img class="mySlides" src="<c:url value="/resources/pics/casa4.jpg" />" >
           	</div>
			  
			  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
			    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(4)"></span>
			  </div>
			</div>
		  <div class="container">
		    <p class="direction"><c:out value="${address}"/></p>
		  </div>
		</div>
		
		<div class="polaroid_price">
		  <div class="container2">
		    <div class="price_text">
		    	<p id="rent_sale" style="text-transform: uppercase"><spring:message code="details.price"/></p> 
		    	<p id="price_tag"><c:out value="${price}"/></p>
		  	</div>
		  </div>
		</div>
		
		<div class="polaroid_agency">
		  <div class="container3">
		     <img class="polaroid_img_agency" src="<c:url value="/resources/pics/richmond.png" />" alt="5 Terre" style="width:100%">
		     <p class="agency_text"><spring:message code="details.contact"/></p>
		     <p class="agency_text"><c:out value="${phoneNumber}"/></p>
		     <c:url value="/hello/details" var="postPath"/>
			<form:form modelAttribute="MessageForm" action="${postPath}" method="post" class="ocultar">
		     	<div class="fillers">
				     <form:label path="name"><spring:message code="details.name"/></form:label>
				     <spring:message code="details.placeholderName" var="detailsName"/>
		    		 <form:input type="text" path="name" id="name" name="name" placeholder="${detailsName}" />
		    		 
		    		 <form:label for="email" path="email"><spring:message code="details.email"/></form:label>
		    		 <spring:message code="details.placeholderEmail" var="detailsEmail"/>
		    		 <form:input type="text" path="email" id="email" name="email" placeholder="${detailsEmail}"/>
		    		 
		    		 <form:label path="message" for="message"><spring:message code="details.message"/></form:label>
		    		 <spring:message code="details.placeholderMessage" var="detailsMessage"/>
		    		 <form:input id="message" path="message" placeholder="${detailsMessage}"/>
		    		 
		    		 <spring:message code="details.contactButton" var="submitValue"/>
		    		 <input class="button" type="submit" value=${submitValue}>
	    		 </div>
	    	</form:form>
		  </div>
		</div>
		
		<div class="polaroid_overview">
		  <div class="container4">
		     <p class="polaroid_title"><spring:message code="details.overview"/></p>
		     <p class="agency_text"><spring:message code="details.bedrooms"/><c:out value="${bedrooms}"/></p>
		     <p class="agency_text"><spring:message code="details.bathrooms"/><c:out value="${bathrooms}"/></p>
		     <p class="agency_text"><spring:message code="details.floorSize"/><c:out value="${floorSize}"/> m2</p>
		     <p class="agency_text"><spring:message code="details.parking"/><c:out value="${parking}"/> <spring:message code="details.vehicles"/></p>
		  </div>
		</div>
		
		<div class="polaroid_des">
		  <div class="container">
		  	<p class="polaroid_title"><c:out value="${title}"/></p>
		    <p class="agency_text"><c:out value="${description}"/></p>
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