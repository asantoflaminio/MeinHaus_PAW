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
            </div>            <div>
                <a class="navbar_item" id="publish" href="./publish"><spring:message code="nav.publish"/></a>
            </div>
            </c:if>
        </nav>
        
		
		<div class="polaroid_agency">
		  <div class="container3">
		  	<div id="step1-title">
				<h3 id="titl" ><spring:message code="publish.step"/></h3>
			</div>
		     <c:url value="/meinHaus/publish" var="postPath"/>
			<form:form modelAttribute="firstPublicationForm" action="${postPath}" method="post">
		     	<div class="fillers">
		     	
				<div class="signup-list-item">
				     <form:label for="title" path="title"><spring:message code="publish.title"/></form:label>
				     <spring:message code="publish.placeholderTitle" var="title"/>
		    		 <form:input type="text" id="title" name="title" path="title" autocomplete="off" placeholder="${title}"/>
		    		 <form:errors path="title" cssClass="error" element="p"/>
		    	</div>
		    	<div class="signup-list-item">
		    		 <form:label for="address" path="address"><spring:message code="publish.address"/></form:label>
		    		 <spring:message code="publish.placeholderAddress" var="address"/>
		    		 <form:input type="text" id="address" name="address" path="address" autocomplete="off" placeholder="${address}"/>
		    		 <form:errors path="address" cssClass="error" element="p"/>
		    	</div>
				<div class="signup-list-item">
		    		 <label><spring:message code="publish.operationType"/></label>
		    		 <div class="op-type-box">
                        		<input class="radio-1" checked="checked" name="operation" type="radio" name="op-type" value="FSale"><spring:message code="publish.forSale"/><br>
                        		<input class="radio-2" name="operation" type="radio" name="op-type" value="FRent"><spring:message code="publish.forRent"/><br>
                     </div>  
		    	</div>
				<div class="signup-list-item">
		    		 <form:label for="price" path="price"><spring:message code="publish.price"/></form:label>
		    		 <spring:message code="publish.placeholderPrice" var="price"/>
		    		 <form:input type="text" id="price" path="price" name="price" autocomplete="off" placeholder="${price}" />
		    		 <form:errors path="price" cssClass="error" element="p"/>
		    	</div>
		    		 <spring:message code="publish.submitPublish" var="submitValue"/>
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