<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="shortcut icon" href="<c:url value="/resources/pics/favicon.ico" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/profile.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/navbar.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/footer.css" />">
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="<c:url value="/resources/js/profile.js" />"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>


		<body onload="selectContainer('${option}')">
        <nav>
        	<a href="./home">
           		<img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
            </a>
            <div class="dropdown">
	        	<img src="<c:url value="/resources/pics/user.png" />" alt="user" id="user_icon" class="navbar_item">
                <div id="myDropdown" class="dropdown-content"> 
                    <a href="./help.html"><spring:message code="nav.profile"/></a>
                    <a href="./help.html"><spring:message code="nav.logOut"/></a>
                </div>
            </div>
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
        
        
        <aside>
      		<div class="leftcol">
	       		<ul>
	       		  <li id="pub"><a href="#" onclick="showPublications();"><spring:message code="profile.optionPublications"/></a></li>
		          <li id="dat"><a href="#" onclick="showData();"><spring:message code="profile.optionData"/></a></li>
		          <!-- <li id="fav"><a href="#" onclick="showFavourites();"><spring:message code="profile.optionFavourites"/></a></li> -->
	        	</ul>
      		</div>
		</aside>
      
		<section>
       		<div id="Data">
       	 	 	<div class="data polaroid">
        			<div class="title-container">       
	          			<h3><spring:message code="profile.titlePersonalData"/></h3>  
					</div>
					<c:url value="/meinHaus/profileData" var="postPath"/>
				 	<form:form modelAttribute="ProfileForm" action="${postPath}" method="post">
				 	<c:set var = "name" scope = "session" value = "${firstNameValue}"/>
				 	<c:set var = "surname" scope = "session" value = "${lastNameValue}"/>
				 	<c:set var = "oldEmail" scope = "session" value = "${emailValue}"/>
				 	<c:set var = "phone" scope = "session" value = "${phoneNumberValue}"/>
				 	<c:set var = "errorForm" scope = "session" value = "${error}"/>
						<div class="form">
							<div class="editdata-list-item">
	                        	<form:label path="firstName"><spring:message code="profile.firstName"/></form:label>
	                        	<spring:message code="profile.placeholderFirstName" var="firstName"/>
	                        	<form:input class="editdata-input" path="firstName" type="text" placeholder="${firstName}" name="firstName" value="${name}"/>
	                        	<form:errors path="firstName" cssClass="error" element="p"/>
	                        </div>
							<div class="editdata-list-item">
	                        	<form:label path="lastName"><spring:message code="profile.lastName"/></form:label>
	                        	<spring:message code="profile.placeholderLastName" var="lastName"/>
	                        	<form:input class="editdata-input" path="lastName" type="text" placeholder="${lastName}" name="lastName" value="${surname}"/>
	                        	<form:errors path="lastName" cssClass="error" element="p"/>
	                        </div>
							<div class="editdata-list-item">
	                        	<form:label path="email"><spring:message code="profile.email"/></form:label>
	                        	<spring:message code="profile.placeholderEmail" var="email"/>
	                        	<form:input class="editdata-input" path="email" type="text" placeholder="${email}" name="email" value="${oldEmail}"/>
	                        	<form:errors path="email" cssClass="error" element="p"/>
	                        	<c:if test="${errorForm == 'email'}">
	                        		<p class="error"><spring:message code="signUp.emailTaken"/></p>
	                        	</c:if>
                        	</div>  
							<div class="editdata-list-item">
	                        	<form:label path="phoneNumber"><spring:message code="profile.phoneNumber"/></form:label>
	                        	<spring:message code="profile.placeholderPhoneNumber" var="phoneNumber"/>
	                        	<form:input class="editdata-input" path="phoneNumber" type="text" placeholder="${phoneNumber}" name="phoneNumber" value="${phone}"/>
	                        	<form:errors path="phoneNumber" cssClass="error" element="p"/>
                        	</div>
	                        <div>
	                        	<spring:message code="profile.submit" var="sumbit"/>
	                        	<input class="editdata-submit" type="submit" value="${sumbit}">
							</div>
						</div>
           			</form:form>
           		</div>
           
           		<div class="data polaroid last">
	           		<div class="title-container">       
		          		<h3><spring:message code="profile.titleNewPassword"/></h3>  
					</div>
					<c:url value="/meinHaus/profilePassword" var="postPathpass"/>
					<form:form modelAttribute="PasswordForm" action="${postPathpass}" method="post">
						<div class="form">
							<div class="editdata-list-item">
	                        	<form:label path="passwordOld"><spring:message code="profile.password"/></form:label>
	                        	<spring:message code="profile.placeholderPassword" var="password"/>
	                        	<form:input class="editdata-input" path="passwordOld" type="password" placeholder="${password}" name="password"/>
	                        	<form:errors path="passwordOld" cssClass="error" element="p"/>
	                        	<c:if test="${errorForm == 'password'}">
	                        		<p class="error"><spring:message code="profile.passwordError"/></p>
	                        	</c:if>
	                        </div>
							<div class="editdata-list-item">
	                        	<form:label path="passwordNew"><spring:message code="profile.newpassword"/></form:label>
	                        	<spring:message code="profile.placeholderNewPassword" var="password"/>
	                        	<form:input class="editdata-input" path="passwordNew" type="password" placeholder="${password}" name="password"/>
	                        	<form:errors path="passwordNew" cssClass="error" element="p"/>
	                        </div>
	                        <div>
	                        	<spring:message code="profile.submit" var="sumbit"/>
	                        	<input class="editdata-submit" type="submit" value="${sumbit}">
							</div>
	                 	</div>  
	           		</form:form>
           		</div>
			</div>
		</section>
		
		
		<section>
			<div id="Publications">
				<h2 class="title_section"><spring:message code="profile.publications" /></h2> 
				<div class="section_publications">
		        	<div class="favourites" id="list-of-publications">	        		
		        		<c:set var = "listLength" scope = "session" value = "${fn:length(publications)}"/>
			        	<c:set var = "maxLength" scope = "session" value = "3"/>
			        	<c:set var = "page" scope = "session" value = "${page}"/>
			        	<c:set var = "init" scope = "session" value = "${(page - 1) * maxLength}"/>
			        	<c:set var = "current" scope = "session" value = "1"/>
	        			<c:forEach var="row" varStatus="status" items="${publications}" step="1" begin="${init}">
	        			<c:if test = "${current <= maxLength}">
	        			<c:set var = "current" scope = "session" value = "${current+1}"/>
	        			
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/meinHaus/images/${row.publicationid}" />" alt="5 Terre">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">U$S <c:out value = "${row.price}"/></h2>
							</div>
							<div class="property-container">
								<div class="property-title-container">
									<h3 class="property-title"><c:out value = "${row.title}"/></h3>
									<h4 class="address"><c:out value = "${row.address}"/></h4>
								</div>					
								<div class="property-characteristics">
									<div class="column-1">
										<h4 class="bedroom"><strong><c:out value = "${row.bedrooms}"/></strong> <spring:message code="list.bedroomMinus"/></h4>
										<h4><strong><c:out value = "${row.bathrooms}"/></strong> <spring:message code="list.bathroomsMinus"/></h4>
										<h4><strong><c:out value = "${row.parking}"/></strong> <spring:message code="list.parkingMinus"/></h4>	
									</div>
									<div class="column-2">
										<h4><strong><c:out value = "${row.floorSize}"/></strong> <spring:message code="list.floorSizeMinus"/></h4>
										<h4><c:out value = "${row.operation}"/></h4>
									</div>				
								</div>
								<div class="more-info">
									<a class="more-info-title" href="profileDelete?page=${page}&pubid=${row.publicationid}"><img class="delete" src="
	                        <c:url value="/resources/pics/trash.png" />
	                        "><spring:message code="profile.delete"/> </a>
								</div>		
							</div>
						</div>	
					</c:if>
				</c:forEach>		
				</div>	
				
			<c:if test="${listLength == 0}">	        
	 	       <div id="no-results">
					<h2 id="no-results-title"><spring:message code="profile.noResultsTitle"/></h2>
					<div id="info-and-link">
						<h3 id="no-results-info"><spring:message code="profile.noResultsInfo"/></h3>
						<a id="no-results-link" href="./publish"><spring:message code="profile.clickHere"/></a>
					</div>
				</div>
	        </c:if>
			

			</div>
			
			<c:set var = "maxPageDouble" scope = "session" value = "${listLength/maxLength}"/>
	        <fmt:formatNumber var="maxPageInteger" value="${maxPageDouble}" maxFractionDigits="0" />
	        
	        <c:if test="${maxPageDouble == maxPageInteger}">
	        	<c:set var = "maxPage" scope = "session" value = "${listLength/maxLength}"/>
	        </c:if>
	        
	        <c:if test="${maxPageDouble != maxPageInteger}">
	        	<c:set var = "maxPage" scope = "session" value = "${(listLength/maxLength) + 1}"/>
	        </c:if>
	       	
	       	<c:if test="${page == maxPage}">
	       		<c:set var = "nextPage" scope = "session" value = "${maxPage}"/>
	       	</c:if>
	       	
	        <c:if test="${page != maxPage}">
	      	  <c:if test="${listLength > maxLength}">
	       		<c:set var = "nextPage" scope = "session" value = "${page + 1}"/>
	       		<!--<h2>${maxPage}</h2>-->
	       		</c:if>
	       	</c:if>
	       	
	        <c:if test="${page == 1}">
	       		<c:set var = "previousPage" scope = "session" value = "1"/>
	       	</c:if>
	        <c:if test="${page != 1}">
	       		<c:set var = "previousPage" scope = "session" value = "${page - 1}"/>
	       	</c:if>
	       	
	       	<c:if test="${listLength != 0}">
	       		<c:if test="${listLength <= maxLength}">
	 	      		<div class="page-nums-container">
						<div class="page-nums">
							<a class="page-number" href="profile?page=${previousPage}">&laquo;</a>
							<c:set var="counter" value="1"/>
							<a class="page-number" href="profile?page=${counter}">${counter}</a>
							<c:set var="counter" value="${counter+1}"/>
 							<a class="page-number" href="profile?page=${nextPage}">&raquo;</a>
						</div>	        
					</div>
				</c:if>	        
	       		<c:if test="${listLength > maxLength}">
		        	<div class="page-nums-container">
						<div class="page-nums">
								<a class="page-number" href="profile?page=${previousPage}">&laquo;</a>
							<c:set var="counter" value="1"/>
							<c:forEach begin="1" end="${maxPage}" varStatus="loop">
								<a class="page-number" href="profile?page=${counter}">${counter}</a>
								<c:set var="counter" value="${counter+1}"/>
							</c:forEach>
 							<a class="page-number" href="profile?page=${nextPage}">&raquo;</a>
						</div>	        
					</div>
				</c:if>	        
			</c:if>	   
			
			</div>
		</section>
		
		
		<section>
		<div id="Favourites">
				<h2 class="title_section"><spring:message code="profile.favourites" /></h2>  
	        	<div class="section_publications">
	        		<div class="favourites">
						<div class="polaroid-property">
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "245.000"/></h2>
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
								<h2 class="price-tag">$<c:out value = "35.000"/></h2>
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
								<h2 class="price-tag">$<c:out value = "35.000"/></h2>
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