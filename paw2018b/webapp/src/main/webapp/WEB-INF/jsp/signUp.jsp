<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Sign Up</title>
        <link rel="shortcut icon" href="<c:url value="/resources/pics/favicon.ico" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/signUp.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/navbar.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/footer.css" />">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
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
            <c:if test="${empty pageContext.request.userPrincipal}">
            <div class="dropdown" id="sign_in">
                <a class="navbar_item" href="#"><spring:message code="nav.signIn"/></a>
                <c:url value="/hello/home" var="loginUrl" />
				<form action="${loginUrl}" method="POST" class="form_login"  enctype="application/x-www-form-urlencoded">
                <div class="dropdown-content">
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
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label><spring:message code="nav.forgotPassword"/></label>
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
                <a class="navbar_item" id="userName" href="#"><c:out value="${pageContext.request.userPrincipal.name}" /></a>
            </div>
            <div>
                <a class="navbar_item" id="publish" href="./publish"><spring:message code="nav.publish"/></a>
            </div>
            </c:if>
        </nav>
        
        
	    <div class="polaroid">
			<div class="signup-container">
				<div id="signup-title">
					<h3><spring:message code="signUp.title"/></h3>
				</div>
				<c:url value="/signUp/create" var="postPath"/>
				 <form:form modelAttribute="signUpForm" action="${postPath}" method="post">
					<div class="signup-list">
						<div class="signup-list-item">
                        	<form:label path="firstName"><spring:message code="signUp.firstName"/></form:label>
                        	<spring:message code="signUp.placeholderFirstName" var="firstName"/>
                        	<form:input class="sign-up-input" path="firstName" type="text" placeholder="${firstName}" name="firstName"/>
                        	<form:errors path="firstName" cssClass="error" element="p"/>
                        </div>
						<div class="signup-list-item">
                        	<form:label path="lastName"><spring:message code="signUp.lastName"/></form:label>
                        	<spring:message code="signUp.placeholderLastName" var="lastName"/>
                        	<form:input class="sign-up-input" path="lastName" type="text" placeholder="${lastName}" name="lastName"/>
                        	<form:errors path="lastName" cssClass="error" element="p"/>
                        </div>
						<div class="signup-list-item">
                        	<label><spring:message code="signUp.account"/></label>
                        	<div class="acc-type-box">
                        		<input class="signup-radio-1" type="radio" name="acc-type" value="Buyer"><spring:message code="signUp.buyer"/><br>
                        		<input class="signup-radio-2" type="radio" name="acc-type" value="Seller"><spring:message code="signUp.seller"/><br>
                        	</div>   	
                        </div>						
                        <div class="signup-list-item">
                        	<form:label path="email"><spring:message code="signUp.email"/></form:label>
                        	<spring:message code="signUp.placeholderEmail" var="email"/>
                        	<form:input class="sign-up-input" path="email" type="text" placeholder="${email}" name="email"/>
                        	<form:errors path="email" cssClass="error" element="p"/>
                        </div>
                        <div class="signup-list-item">
                        	<form:label path="password"><spring:message code="signUp.password"/></form:label>
                        	<spring:message code="signUp.placeholderPassword" var="password"/>
                        	<form:input class="sign-up-input" path="password" type="password" placeholder="${password}" name="password"/>
                        	<form:errors path="password" cssClass="error" element="p"/>
                        </div>
						<div class="signup-list-item">
                        	<form:label path="phoneNumber"><spring:message code="signUp.phoneNumber"/></form:label>
                        	<spring:message code="signUp.placeholderPhoneNumber" var="phoneNumber"/>
                        	<form:input class="sign-up-input" path="phoneNumber" type="text" placeholder="${phoneNumber}" name="phoneNumber"/>
                        	<form:errors path="phoneNumber" cssClass="error" element="p"/>
                        </div>
                        	<spring:message code="signUp.submitSignUp" var="signUpValue"/>
                        	<input class="signup-submit" type="submit" value="${signUpValue}">
					</div>
                </form:form>
			</div>
		</div>
		

		<div class="polaroid-member">
			<div class="signup-container">
				<div id="signup-title">
					<h3><spring:message code="signUp.signInTitle"/></h3>
				</div>
					<div class="signup-list">
						<c:url value="/signUp/signUp" var="signUpLogInUrl" />
						<form action="${signUpLogInUrl}" method="POST" enctype="application/x-www-form-urlencoded">
						<div class="signup-list-item">
                        	<label><spring:message code="signUp.email"/></label>
                        	<input class="sign-up-input" type="text" placeholder="${email}" name="j_username"/>
                        </div>
                        <div class="signup-list-item signup-list-item-last">
                        	<label><spring:message code="signUp.password"/></label>
                        	<input class="sign-up-input" type="password" placeholder="${password}" name="j_password"/>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox" name="j_rememberme" /><spring:message code="nav.rememberMe"/></label>
                        </div>
	                    <spring:message code="signUp.submitSignIn" var="signInValue"/>
	                    <input class="signup-submit" type="submit" value="${signInValue}">  
	                    </form>
					</div>
			</div>
		</div>
		

    </body>