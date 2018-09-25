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
            	<div class="dropdown">
            	    <a class="navbar_item" id="userName" href="#"><c:out value="${pageContext.request.userPrincipal.name}" /></a>
           			<div class="dropdown-content" id="profile_dropdown">
          				<a class="user_dropdown" href="./publish"><spring:message code="nav.myProfile"/></a>
           			    <a class="user_dropdown" href="#"><spring:message code="nav.logOut"/></a>
           			</div>
           		</div>
            </div>            <div>
                <a class="navbar_item" id="publish" href="./publish"><spring:message code="nav.publish"/></a>
            </div>
            </c:if>
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
                        	<form:label path="firstName"><spring:message code="profile.firstName"/></form:label>
                        	<spring:message code="profile.placeholderFirstName" var="firstName"/>
                        	<form:input class="editdata-input" path="firstName" type="text" placeholder="${firstName}" name="firstName"/>
                        	<form:errors path="firstName" cssClass="error" element="p"/>
                        </div>
						<div class="editdata-list-item">
                        	<form:label path="lastName"><spring:message code="profile.lastName"/></form:label>
                        	<spring:message code="profile.placeholderLastName" var="lastName"/>
                        	<form:input class="editdata-input" path="lastName" type="text" placeholder="${lastName}" name="lastName"/>
                        	<form:errors path="lastName" cssClass="error" element="p"/>
                        </div>
											
                        <div class="editdata-list-item">
                        	<form:label path="email"><spring:message code="profile.email"/></form:label>
                        	<spring:message code="profile.placeholderEmail" var="email"/>
                        	<form:input class="editdata-input" path="email" type="text" placeholder="${email}" name="email"/>
                        	<form:errors path="email" cssClass="error" element="p"/>
                        </div>  
						<div class="editdata-list-item">
                        	<form:label path="phoneNumber"><spring:message code="profile.phoneNumber"/></form:label>
                        	<spring:message code="profile.placeholderPhoneNumber" var="phoneNumber"/>
                        	<form:input class="editdata-input" path="phoneNumber" type="text" placeholder="${phoneNumber}" name="phoneNumber"/>
                        	<form:errors path="phoneNumber" cssClass="error" element="p"/>
                        </div>
                        <div>
                        	<spring:message code="profile.submit" var="sumbit"/>
                        	<input class="editdata-submit" type="submit" value="${sumbit}">
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
                        	<spring:message code="profile.placeholderNewPassword" var="password"/>
                        	<form:input class="editdata-input" path="password" type="password" placeholder="${password}" name="password"/>
                        	<form:errors path="password" cssClass="error" element="p"/>
                        </div>
                         <div>
                        	<spring:message code="profile.submit" var="sumbit"/>
                        	<input class="editdata-submit" type="submit" value="${sumbit}">
						</div>
                        </div>
                        
           </form:form>
           </div>
		</article>
		</div>
		
		<div id="Publications">
		<h3>Publications</h3>  
		</div>
		
		<section>
		<div id="Favourites">
			
				<h2 class="title_section"><spring:message code="profile.favourites" /></h2>  
				
	        
	        	<c:set var = "listLength" scope = "session" value = ""/>
	        	<c:set var = "maxLength" scope = "session" value = "1"/>
	        	<c:set var = "current" scope = "session" value = "1"/>
	        	<div class="favourites">
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "245.000$"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "Venta Departamento Belgrano"/></h3>
									<h4 class="address"><c:out value = "Cabildo 123"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "2"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "45m2"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "Venta"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
						
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "35.000$"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "Alquiler Casa 4 Ambientes"/></h3>
									<h4 class="address"><c:out value = "Cabildo 123"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "3"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "2"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "85m2"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "Alquiler"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
						
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "35.000$"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "Alquiler Casa 4 Ambientes"/></h3>
									<h4 class="address"><c:out value = "Cabildo 123"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "3"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "2"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "85m2"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "Alquiler"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "35.000$"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "Alquiler Casa 4 Ambientes"/></h3>
									<h4 class="address"><c:out value = "Cabildo 123"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "3"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "2"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "85m2"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "Alquiler"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "35.000$"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "Alquiler Casa 4 Ambientes"/></h3>
									<h4 class="address"><c:out value = "Cabildo 123"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "3"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "2"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "85m2"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "Alquiler"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "35.000$"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "Alquiler Casa 4 Ambientes"/></h3>
									<h4 class="address"><c:out value = "Cabildo 123"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "3"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "2"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "1"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "85m2"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "Alquiler"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
			
			
			</div>
		</div>
		</section>
        <footer>
        	<div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          	</div>
        </footer>
        <script src="<c:url value="/resources/js/details.js" />"></script>
    </body>
</html>