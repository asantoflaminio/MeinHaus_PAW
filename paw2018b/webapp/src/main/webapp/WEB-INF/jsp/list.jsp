<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
        
        
        <div class="breadcrumb">
	        <ul class="breadcrumb-list">
			  <li><a href="home">Home</a></li>
			  <li><a href="">List</a></li>
			  <li><a href="#"></a></li>
			  <!-- <li>Brooklyn</li> -->
			</ul>
		</div>
        
		<div class="wrap">
		   <div class="search">
		   	  <spring:message code="list.placeholderSearch" var="title"/>
		      <input id="search_input" type="text" class="searchTerm" placeholder="address" value = "<c:out value="${address}"/>" >
		      <button  href="#" type="submit" class="searchButton">
		        <img src="<c:url value="/resources/pics/search_icon.png" />" alt="Search" id="search-img"></img>
		     </button>
		   </div>
		</div>
		
		<div id="results-container">
			<div class="results" id="res">
				<h3 id="res-title"><spring:message code="list.resultsTitle"/></h3>
			</div>
			
			<div class="results" id="order">
				<select id="order-select">
					<option value="Lowest price" onclick="sortHighestPrice()"><spring:message code="list.lowest"/></option>
					<option value="Highest price" onclick="sortHighestPrice()"><spring:message code="list.highest"/></option>
					<option value="Newest"><spring:message code="list.newest"/></option>
					<option value="Oldest"><spring:message code="list.oldest"/></option>
				</select>				
				<h3 id="order-title"><spring:message code="list.orderTitle"/></h3>
			</div>
		</div>

    	<div class="filters">
    		<ul id="applied-filters-list">
    		  <li class="applied-filters-list-item"><c:out value="${address}"/></li>
			  <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/><c:out value="${operation}"/></li>

			 
			  
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
					  			</div>
					  		<div class="filters-list-item"><spring:message code="list.price"/><img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
					  			<div class="expandible">
					  				<form>
					  					<fieldset id="price" price="null">
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(50000)" name="price"/><spring:message code="list.up50000"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(150000)" name="price"/><spring:message code="list.up150000"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(350000)" name="price"/><spring:message code="list.up350000"/></label>
		                        			</div>
		                        			<div class="check_box">
		                            			<label><input type="radio" onclick="filterPrice(750000)" name="price"/><spring:message code="list.up750000"/></label>
		                        			</div>
		                        		</fieldset>
                        			</form>
					  			</div>
					  		<div class="filters-list-item"><spring:message code="list.bedrooms"/><img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
								<div class="expandible filters-list-item-last">
									<form>
					  					<fieldset id="bedroom" bedroom="null">
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(1)" name="bedrooms"/>1 <spring:message code="list.bedroomMinus"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(2)" name="bedrooms"/>2 <spring:message code="list.bedroomsMinus"/></label>
		                        			</div>
							  				<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(3)" name="bedrooms"/>3 <spring:message code="list.bedroomsMinus"/></label>
		                        			</div>
		                        			<div class="check_box">
		                            			<label><input type="radio" onclick="filterBedroom(4)" name="bedrooms"/>4 <spring:message code="list.bedroomsMinus"/></label>
		                        			</div>
									</form>
					  					</fieldset>
					  			</div>
						</div>
					</div>
				</div>
			</aside>
			
	        <section id="publications">
	        	<c:forEach var="row" varStatus="status" items="${publications}" step="1" begin="0">
					<div class="polaroid-property" id = "publication_<c:out value = "${row.publicationid}"/>" >
			    	<div class="img-with-tag">
			    		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
			    		<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
			    		<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
						<h2 class="price-tag">$<c:out value = "${row.price}"/></h2>
					</div>
					<div class="property-container">
						<div class="property-title-container">
							<h3 class="property-title"><c:out value = "${row.title}"/><h3>
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
						<h4 class="address"><c:out value = "${row.address}"/></h4>
						<div class="more-info">
							<a class="more-info-title" href="details?publicationid=${row.publicationid}"><spring:message code="list.moreInfo"/> ></a>
						</div>	
					</div>
				</div>	
				</c:forEach>
	        </section>
	        
        </div>
        
        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
      	
    </body>
    
</html>