<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
   		 <META http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- <meta charset="UTF-8"> -->
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

	<body>
        <nav>
        	<a href="./home">
           		<img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
            </a>
            <c:if test="${empty pageContext.request.userPrincipal}">
            <div class="dropdown" id="sign_in">
                <a class="navbar_item" href="#"><spring:message code="nav.signIn"/></a>
                <c:url value="/meinHaus/home" var="loginUrl" />
				<form action="${loginUrl}" method="POST" class="form_login"  enctype="application/x-www-form-urlencoded">
                <div class="dropdown-content dropdown-padding">
                        <div class="email">
                        	<spring:message code="nav.placeholderEmail" var="navEmail"/>
                            <input class="form-control form-control-lg form-control-borderless" type="email" placeholder="${navEmail}" name="j_username">
                        </div>
                        <div class="password">
                        	<spring:message code="nav.placeholderPassword" var="navPassword"/>
                            <input class="form-control form-control-lg form-control-borderless" type="password" placeholder="${navPassword}" name="j_password">
                        </div>
                        <div class="msg_error">
                        	<label></label>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox" name="j_rememberme" /><spring:message code="nav.rememberMe"/></label>
                        </div>
                        <div class="sign_b">
                            <input type="submit" class="btn" value="<spring:message code="nav.buttonSignIn"/>" >
                        </div>

                </div>
                </form>
            </div>
            <div>
                <a class="navbar_item" id="sign_up" href="./signUp"><spring:message code="nav.signUp"/></a>
            </div>
            </c:if>
            <c:if test="${not empty pageContext.request.userPrincipal}">
            <div>
            	<div class="dropdown">
            	    <a class="navbar_item" id="userName" href="#"><c:out value="${pageContext.request.userPrincipal.name}" /></a>
           			<div class="dropdown-content" id="profile_dropdown">
          				<a class="user_dropdown" href="./profile"><spring:message code="nav.myProfile"/></a>
           			    <a class="user_dropdown" href="./logout"><spring:message code="nav.logOut"/></a>
           			</div>
           		</div>
            </div>
            <div>
                <a class="navbar_item" id="publish" href="./publish"><spring:message code="nav.publish"/></a>
            </div>
            </c:if>
        </nav>
        
		
		<div class="polaroid_agency">
		  <div class="container3">
		  	<div id="step2-title">
				<h3 id="titl"><spring:message code="publish2.step"/></h3>
			</div>
		    <c:url value="/meinHaus/publish2" var="postPath"/>
			<form:form modelAttribute="secondPublicationForm" action="${postPath}" method="post">
		     	<div class="fillers">
		     	
		     		 <form:input type="hidden" path="title" value="${title}"/>
		    		 <form:input type="hidden" path="address" value="${address}"/>
		    		 <form:input type="hidden" path="price" value="${price}"/>
		    		 <input type="hidden" path="operation" value="${operation}" name="operation">
				<div class="signup-list-item">
				     <form:label for="description" path="description"><spring:message code="publish2.description"/></form:label><br>
				     <spring:message code="publish2.placeholderDescription" var="description"/>    		 
		    		 <form:textarea path="description" placeholder="${description}"/><br>
		    		 <form:errors path="description" cssClass="error" element="p"/>
		    	</div>
				<div class="signup-list-item">
		    		 <label for="PROPERTY TYPE"><spring:message code="publish2.propertyType"/></label>	
		    		 <div class="prop-type-box">
                        		<input class="radio-1" checked="checked" type="radio" name="type" value="Apartment"><spring:message code="publish2.apartment"/><br>
                        		<input class="radio-2" type="radio" name="type" value="House"><spring:message code="publish2.house"/><br>
	                 </div>   
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