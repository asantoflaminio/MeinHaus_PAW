<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
			<div class="signup-container">
				<div id="signup-title">
					<h3>SIGN UP</h3>
				</div>
				<c:url value="/hello/signUp" var="postPath"/>
				 <form:form modelAttribute="signUpForm" action="${postPath}" method="post">
					<div class="signup-list">
						<div class="signup-list-item">
                        	<form:label path="firstName">FIRST NAME*</form:label>
                        	<form:input class="sign-up-input" path="firstName" type="text" placeholder="First name" name="firstName"/>
                        	<form:errors path="firstName" cssClass="error" element="p"/>
                        </div>
						<div class="signup-list-item">
                        	<form:label path="lastName">LAST NAME*</form:label>
                        	<form:input class="sign-up-input" path="lastName" type="text" placeholder="Last name" name="lastName"/>
                        	<form:errors path="lastName" cssClass="error" element="p"/>
                        </div>
						<div class="signup-list-item">
                        	<label>ACCOUNT TYPE*</label>
                        	<div class="acc-type-box">
                        		<input class="signup-radio-1" type="radio" name="acc-type" value="Buyer">Buyer<br>
                        		<input class="signup-radio-2" type="radio" name="acc-type" value="Seller">Seller<br>
                        	</div>   	
                        </div>						
                        <div class="signup-list-item">
                        	<form:label path="email">E-MAIL*</form:label>
                        	<form:input class="sign-up-input" path="email" type="text" placeholder="example@eg.com" name="email"/>
                        	<form:errors path="email" cssClass="error" element="p"/>
                        </div>
                        <div class="signup-list-item">
                        	<form:label path="password">PASSWORD*</form:label>
                        	<form:input class="sign-up-input" path="password" type="password" placeholder="Password" name="password"/>
                        	<form:errors path="password" cssClass="error" element="p"/>
                        </div>
						<div class="signup-list-item">
                        	<form:label path="phoneNumber">PHONE NUMBER</form:label>
                        	<form:input class="sign-up-input" path="phoneNumber" type="text" placeholder="(XXX)XXX-XXXX" name="phoneNumber"/>
                        	<form:errors path="phoneNumber" cssClass="error" element="p"/>
                        </div>
                        	<input class="signup-submit" type="submit" value="SIGN UP">
					</div>
                </form:form>
			</div>
		</div>
		
		<div class="polaroid-member">
			<div class="signup-container">
				<div id="signup-title">
					<h3>ALREADY A MEMBER? SING IN!</h3>
				</div>
					<div class="signup-list">
						<div class="signup-list-item">
                        	<label>E-MAIL*</label>
                        	<input class="sign-up-input" type="text" placeholder="example@eg.com">
                        </div>
                        <div class="signup-list-item signup-list-item-last">
                        	<label>PASSWORD*</label>
                        	<input class="sign-up-input" type="password" placeholder="Password">
                        </div>
                    <input class="signup-submit" type="submit" value="SIGN IN">  
					</div>
			</div>
		</div>

    </body>