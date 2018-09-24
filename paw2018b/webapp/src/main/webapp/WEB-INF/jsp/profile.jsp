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
        <c:url value="/resources/css/profile.css" />
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
        <script src="<c:url value="/resources/js/profile.js" />"></script>
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
                <a class="navbar_item" id="publish" href="./publish"><spring:message code="nav.publish"/></a>
            </div>
            <div>
                <a class="navbar_item" id="sign_up" href="./signUp"><spring:message code="nav.signUp"/></a>
            </div>
        </nav>
        
        <aside>
      		<div class="leftcol">
       		<ul>
	          <li id="dat"><a href="#" onclick="showData();"><spring:message code="profile.optionData"/></a></li>
	          <li id="pub"><a href="#" onclick="showPublications();"><spring:message code="profile.optionPublications"/></a></li>
	          <li id="fav"><a href="#" onclick="showFavourites();"><spring:message code="profile.optionFavourites"/></a></li>
        	</ul>
      		</div>
      	</aside>
      
        
        <div id="Data">
        <article>     
        	<div class="data polaroid">
        	<div>       
	          		<h3><spring:message code="profile.titlePersonalData"/></h3>  
			</div>
			<c:url value="/hello/profile" var="postPath"/>
				 <form:form modelAttribute="ProfileForm" action="${postPath}" method="post">
					<div class="form">
						<div class="editdata-list-item">
                        	<form:label path="firstName"><spring:message code="signUp.firstName"/></form:label>
                        	<spring:message code="signUp.placeholderFirstName" var="firstName"/>
                        	<form:input class="editdata-input" path="firstName" type="text" placeholder="${firstName}" name="firstName"/>
                        	<form:errors path="firstName" cssClass="error" element="p"/>
                        </div>
						<div class="editdata-list-item">
                        	<form:label path="lastName"><spring:message code="signUp.lastName"/></form:label>
                        	<spring:message code="signUp.placeholderLastName" var="lastName"/>
                        	<form:input class="editdata-input" path="lastName" type="text" placeholder="${lastName}" name="lastName"/>
                        	<form:errors path="lastName" cssClass="error" element="p"/>
                        </div>
											
                        <div class="editdata-list-item">
                        	<form:label path="email"><spring:message code="signUp.email"/></form:label>
                        	<spring:message code="signUp.placeholderEmail" var="email"/>
                        	<form:input class="editdata-input" path="email" type="text" placeholder="${email}" name="email"/>
                        	<form:errors path="email" cssClass="error" element="p"/>
                        </div>  
						<div class="editdata-list-item">
                        	<form:label path="phoneNumber"><spring:message code="signUp.phoneNumber"/></form:label>
                        	<spring:message code="signUp.placeholderPhoneNumber" var="phoneNumber"/>
                        	<form:input class="editdata-input" path="phoneNumber" type="text" placeholder="${phoneNumber}" name="phoneNumber"/>
                        	<form:errors path="phoneNumber" cssClass="error" element="p"/>
                        </div>
                        <div class="editdata-list-item">
                        	<spring:message code="signUp.submitSignUp" var="signUpValue"/>
                        	<input class="editdata-submit" type="submit" value="${signUpValue}">
						</div>
						
          		</div>
           </form:form>
           </div>
           
           <div class="data polaroid">
           	<div>       
	          		<h3><spring:message code="profile.titleNewPassword"/></h3>  
			</div>
			<c:url value="/hello/profile" var="postPath"/>
				 <form:form modelAttribute="ProfileForm" action="${postPath}" method="post">
						<div class="form">
						<div class="editdata-list-item">
                        	<form:label path="password"><spring:message code="profile.password"/></form:label>
                        	<spring:message code="profile.placeholderPassword" var="password"/>
                        	<form:input class="editdata-input" path="password" type="password" placeholder="${password}" name="password"/>
                        	<form:errors path="password" cssClass="error" element="p"/>
                        </div>
						<div class="editdata-list-item">
                        	<form:label path="password"><spring:message code="profile.newpassword"/></form:label>
                        	<spring:message code="signUp.placeholderPassword" var="password"/>
                        	<form:input class="editdata-input" path="password" type="password" placeholder="${password}" name="password"/>
                        	<form:errors path="password" cssClass="error" element="p"/>
                        </div>
                         <div class="editdata-list-item">
                        	<spring:message code="signUp.submitSignUp" var="signUpValue"/>
                        	<input class="editdata-submit" type="submit" value="${signUpValue}">
						</div>
                        </div>
                        
           </form:form>
           </div>
		</article>
		</div>
		
		<div id="Publications">
		<h3>Publications</h3>  
		</div>
		
		<div id="Favourites">
		<h3>Favourites</h3>  
		</div>
		
        <footer>
        	<div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          	</div>
        </footer>
        <script src="<c:url value="/resources/js/details.js" />"></script>
    </body>
</html>