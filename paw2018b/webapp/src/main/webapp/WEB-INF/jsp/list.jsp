<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/list.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/navbar.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/footer.css" />">
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <link rel="shortcut icon" href="<c:url value="/resources/pics/favicon.ico" />">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="<c:url value="/resources/js/list.js" />"></script>
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
                <c:url value="/meinHaus/home" var="loginUrl" />
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
        
        
        <div class="breadcrumb">
	        <ul class="breadcrumb-list">
			  <li><a href="home">Home</a></li>
			  <li><a href="">List</a></li>
			  <li><a href="#"></a></li>
			  <!-- <li>Brooklyn</li> -->
			</ul>
		</div>
        
		<div class="wrap">
		   <c:url value="/meinHaus/list" var="postPath"/>
		   <form:form modelAttribute="homeSearchForm" action="${postPath}" method="post">

           <div class="search_list">
		  	 <fieldset class="search_list-container rounded">
				   <div class="search_list-item" id="buy">
					   <input value="FSale" type="radio" name="oper" checked><label id="buy-label"><spring:message code="home.buy"/></label>
    		       </div>
    		       <div class="search_list-item">
    	    	 	  <input value="FRent" type="radio" name="oper"><label id="rent-label"><spring:message code="home.rent"/></label>
				   </div>
			   </fieldset>
		   </div>	
			      
		   <div class="search">
		   	  <spring:message code="list.placeholderSearch" var="title"/>
		      <form:input path="search" type="text" class="searchTerm" placeholder="${title}"/>
		      <form:errors path="search" cssClass="error" element="p"/>
		      <button  href="#" type="submit" class="searchButton">
		        <img src="<c:url value="/resources/pics/search_icon.png" />" alt="Search" id="search-img"></img>
		      </button>
		   </div>
		   
           </form:form>
		</div>
		
		<div id="results-container">
			<div class="results" id="res">
				<h3 id="res-title"><spring:message code="list.resultsTitle"/></h3>
			</div>
			
			<div class="results" id="order">
				<select id="order-select">
					<option value="Lowest price" onclick="sortLowestPrice()"><spring:message code="list.lowest"/></option>
					<option value="Highest price" onclick="sortHighestPrice()"><spring:message code="list.highest"/></option>
					<option value="Newest" class="ocultar"><spring:message code="list.newest"/></option>
					<option value="Oldest" class="ocultar"><spring:message code="list.oldest"/></option>
				</select>				
				<h3 id="order-title"><spring:message code="list.orderTitle"/></h3>
			</div>
		</div>

    	<div class="filters">
    		<ul id="applied-filters-list">
    		  <li class="applied-filters-list-item"><c:out value="${address}"/></li>
			  <li class="applied-filters-list-item"><c:out value="${operation}"/></li>
			  <li class="applied-filters-list-item" id="filterPrice" ><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/><spring:message code="list.noLimit"/></li>
			  <li class="applied-filters-list-item" id="filterBedroom"><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/><spring:message code="list.noLimit"/></li>

			 
			  
			  <!-- <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/>2 bedrooms</li> -->
			</ul>
    	</div>
    	
    	<div>
    		<aside>    		
			    <div class="polaroid">
					<div class="container">
					<div id="filters-title">
						<h3><spring:message code="list.filters"/></h3>
					</div>
						<div id="filters-list">
					  		<div class="filters-list-item"><spring:message code="list.location"/> <img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
					  			<div class="expandible">
					  				<div class="check_box">
                            			<label><input type="checkbox"/>Belgrano</label>
                        			</div>
					  				<div class="check_box">
                            			<label><input type="checkbox"/>Caballito</label>
                        			</div>
					  				<div class="check_box">
                            			<label><input type="checkbox"/>Palermo</label>
                        			</div>
                        			<div class="check_box">
                            			<label><input type="checkbox"/>Recoleta</label>
                        			</div>
                        			<div class="apply-container">
                        				<input type="button" class="apply-btn" value="APLICAR"/>
					  				</div>
					  			</div>
					  		<div class="filters-list-item"><spring:message code="list.price"/><img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
					  			<div class="expandible">
					  				<form>
					  					<fieldset id="price" price="null">
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(50000)" name="price" class="priceFilter"/><spring:message code="list.up50000"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(150000)" name="price" class="priceFilter"/><spring:message code="list.up150000"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(350000)" name="price" class="priceFilter"/><spring:message code="list.up350000"/></label>
		                        			</div>
		                        			<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(750000)" name="price" class="priceFilter"/><spring:message code="list.up750000"/></label>
		                        			</div>
		                       				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice('null')" name="price" class="priceFilter" id="priceNull"/><spring:message code="list.noLimit"/></label>
		                        			</div>
		                        			<div class="apply-container">
                        						<input type="button" class="apply-btn" value="APLICAR"/>
					  						</div>
		                        		</fieldset>
                        			</form>
					  			</div>
					  		<div class="filters-list-item"><spring:message code="list.bedrooms"/><img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
								<div class="expandible filters-list-item-last">
									<form>
					  					<fieldset id="bedroom" bedroom="null">
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(1)" name="bedrooms" class="bedroomFilter"/>1 <spring:message code="list.bedroomMinus"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(2)" name="bedrooms" class="bedroomFilter"/>2 <spring:message code="list.bedroomsMinus"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(3)" name="bedrooms" class="bedroomFilter"/>3 <spring:message code="list.bedroomsMinus"/></label>
		                        			</div>
		                        			<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(4)" name="bedrooms" class="bedroomFilter"/>4 <spring:message code="list.bedroomsMinus"/></label>
		                        			</div>
		                     				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom('null')" name="bedrooms" class="bedroomFilter" id="bedroomNull"/><spring:message code="list.noLimit"/></label>
		                        			</div>
                        					<div class="apply-container">
                        						<input type="button" class="apply-btn" value="APLICAR"/>
					  						</div>									
					  					</fieldset>
					  				</form>
					  					
					  			</div>
						</div>
					</div>
				</div>
			</aside>
			
	        <section id="publications">
	        
	        	<c:set var = "listLength" scope = "session" value = "${fn:length(publications)}"/>
	        	<c:set var = "maxLength" scope = "session" value = "1"/>
	        	<c:set var = "current" scope = "session" value = "1"/>
	        	
	        	<c:forEach var="row" varStatus="status" items="${publications}" step="1" begin="0">
	        		<c:if test = "${current <= maxLength}">
	        			<c:set var = "current" scope = "session" value = "${current+1}"/>
	        		
						<div class="polaroid-property" id = "publication_<c:out value = "${row.publicationid}"/>" >
				    		<div class="img-with-tag">
				   		 		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
				    			<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
				    			<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
								<h2 class="price-tag">$<c:out value = "${row.price}"/></h2>
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
									<a class="more-info-title" href="details?publicationid=${row.publicationid}"><spring:message code="list.moreInfo"/> ></a>
								</div>	
							</div>
						</div>
					</c:if>
				</c:forEach>

	        </section>
	        
	        <div class="page-nums-container">
				<div class="page-nums">
						<a class="page-number" href="#">&laquo;</a>
					<c:set var="counter" value="1"/>
					<c:forEach begin="1" end="${listLength/maxLength + listLength%maxLength}" varStatus="loop">
						<a class="page-number" href="#">${counter}</a>
						<c:set var="counter" value="${counter+1}"/>
					</c:forEach>
 					<a class="page-number" href="#">&raquo;</a>
				</div>	        
			</div>	        
        </div>
        
        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
      	
    </body>
    
</html>