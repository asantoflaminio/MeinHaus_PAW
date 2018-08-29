<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="shortcut icon" href="<c:url value="/resources/pics/favicon.ico" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/list.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/navbar.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/footer.css" />">
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    
    <body>       
        <nav>
            <img src="
            <c:url value="/resources/pics/Logo4.png" />
            " alt="Home" id="logo">
            <div class="dropdown">
                <img src="
                <c:url value="/resources/pics/Settings.png" />
                " alt="Settings" id="settings" class="navbar_item">
                <div id="myDropdown" class="dropdown-content"> 
                    <a href="./help.html">Profile</a>
                    <a href="./help.html">Log Out</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="navbar_item" href="#">Sign in</a>
                <div class="dropdown-content">
                    <form class="form_login">
                        <div class="email">
                            <input class="form-control form-control-lg form-control-borderless" type="email" placeholder="Email" required>
                        </div>
                        <div class="password">
                            <input class="form-control form-control-lg form-control-borderless" type="password" placeholder="Password" required>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox" />Remember me</label>
                        </div>
                        <div class="sign_b">
                            <button class="btn" type="submit">Sign in</button>
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label> Forgot password? Click Here!</label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" href="./signUp">Sign up</a>
            </div>
        </nav>
        
        <div class="breadcrumb">
	        <ul class="breadcrumb-list">
			  <li><a href="#">Home</a></li>
			  <li><a href="#">Rent</a></li>
			  <li><a href="#">NY</a></li>
			  <li>Brooklyn</li>
			</ul>
		</div>
        
		<div class="wrap">
		   <div class="search">
		      <input type="text" class="searchTerm" placeholder="Search by address, neighborhood or ZIP code">
		      <button type="submit" class="searchButton">
		        <img src="<c:url value="/resources/pics/search_icon.png" />" alt="Search" id="search-img"></img>
		     </button>
		   </div>
		</div>
		
		<div id="results-container">
			<div class="results" id="res">
				<h3 id="res-title">Results for:</h3>
			</div>
			
			<div class="results" id="order">
				<select id="order-select">
					<option value="Lowest price">Lowest price</option>
					<option value="Highest price">Highest price</option>
					<option value="Newest">Newest</option>
					<option value="Oldest">Oldest</option>
				</select>				
				<h3 id="order-title">Order by:</h3>
			</div>
		</div>

    	<div class="filters">
    		<ul id="applied-filters-list">
			  <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" alt="Delete" class="delete-img">For rent</li>
			  <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" alt="Delete" class="delete-img">Brooklyn</li>
			  <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" alt="Delete" class="delete-img">2 bedrooms</li>
			</ul>
    	</div>
    	
    	<div>
    		<aside>    		
			    <div class="polaroid">
					<div class="container">
					<div id="filters-title">
						<h3>FILTERS</h3>
					</div>
						<div id="filters-list">
					  		<div class="filters-list-item">LOCATION <img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" class="arrow-up-filters"></img></div>
					  		<div class="filters-list-item">PRICE<img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" class="arrow-up-filters"></img></div>
					  		<div class="filters-list-item filters-list-item-last">BEDROOMS<img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" class="arrow-up-filters"></img></div>
						</div>
					</div>
				</div>
			</aside>

	        <section>
			    <div class="polaroid-property">
			    	<div class="img-with-tag">
			    		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
			    		<img class="favorite-icon" src="<c:url value="/resources/pics/heart.png" />" alt="Fave">
			    		<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
						<h2 class="price-tag">$10.000</h2>
					</div>
					<div class="property-container">
						<div class="property-title-container">
							<h3 class="property-title">Av. Cabildo 300, Colegiales</h3>
							<h4 class="property-date">published 3 days ago</h4>
						</div>
						<div class="property-characteristics">
							<div class="column-1">
								<h4><strong>2</strong> bedrooms</h4>
								<h4><strong>3</strong> bathrooms</h4>
								<h4>Garage</h4>
								<h4>Swimming pool</h4>
							</div>
							<div class="column-2">
								<h4>Pets allowed</h4>
								<h4><strong>300</strong> sq. meters</h4>
								<h4>For rent</h4>
								<h4>Colegiales</h4>
							</div>
						</div>
						<div class="more-info">
							<a class="more-info-title" href="#">MORE INFO ></a>
						</div>	
					</div>
				</div>	
				
				<div class="polaroid-property">
			    	<div class="img-with-tag">
			    		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa2.jpg" />" alt="5 Terre">
			    		<img class="favorite-icon" src="<c:url value="/resources/pics/heart.png" />" alt="Fave">
			    		<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
						<h2 class="price-tag">$15.000</h2>
					</div>					<div class="property-container">
						<div class="property-title-container">
							<h3 class="property-title">Av. Cabildo 300, Colegiales</h3>
							<h4 class="property-date">published 3 days ago</h4>
						</div>
						<div class="property-characteristics">
							<div class="column-1">
								<h4><strong>2</strong> bedrooms</h4>
								<h4><strong>3</strong> bathrooms</h4>
								<h4>Garage</h4>
								<h4>Swimming pool</h4>
							</div>
							<div class="column-2">
								<h4>Pets allowed</h4>
								<h4><strong>300</strong> sq. meters</h4>
								<h4>For rent</h4>
								<h4>Colegiales</h4>
							</div>
						</div>
						<div class="more-info">
							<a class="more-info-title" href="#">MORE INFO ></a>
						</div>	
					</div>
				</div>	
				
				<div class="polaroid-property">
			    	<div class="img-with-tag">
			    		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa3.jpg" />" alt="5 Terre">
			    		<img class="favorite-icon" src="<c:url value="/resources/pics/heart.png" />" alt="Fave">
						<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
						<h2 class="price-tag">$12.000</h2>
					</div>					<div class="property-container">
						<div class="property-title-container">
							<h3 class="property-title">Av. Cabildo 300, Colegiales</h3>
							<h4 class="property-date">published 3 days ago</h4>
						</div>
						<div class="property-characteristics">
							<div class="column-1">
								<h4><strong>2</strong> bedrooms</h4>
								<h4><strong>3</strong> bathrooms</h4>
								<h4>Garage</h4>
								<h4>Swimming pool</h4>
							</div>
							<div class="column-2">
								<h4>Pets allowed</h4>
								<h4><strong>300</strong> sq. meters</h4>
								<h4>For rent</h4>
								<h4>Colegiales</h4>
							</div>
						</div>
						<div class="more-info">
							<a class="more-info-title" href="#">MORE INFO ></a>
						</div>	
					</div>
				</div>	
				
				<div class="polaroid-property">
			    	<div class="img-with-tag">
			    		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa4.jpg" />" alt="5 Terre">
			    		<img class="favorite-icon" src="<c:url value="/resources/pics/heart.png" />" alt="Fave">
			    		<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
						<h2 class="price-tag">$8.000</h2>
					</div>					<div class="property-container">
						<div class="property-title-container">
							<h3 class="property-title">Av. Cabildo 300, Colegiales</h3>
							<h4 class="property-date">published 3 days ago</h4>
						</div>
						<div class="property-characteristics">
							<div class="column-1">
								<h4><strong>2</strong> bedrooms</h4>
								<h4><strong>3</strong> bathrooms</h4>
								<h4>Garage</h4>
								<h4>Swimming pool</h4>
							</div>
							<div class="column-2">
								<h4>Pets allowed</h4>
								<h4><strong>300</strong> sq. meters</h4>
								<h4>For rent</h4>
								<h4>Colegiales</h4>
							</div>
						</div>
						<div class="more-info">
							<a class="more-info-title" href="#">MORE INFO ></a>
						</div>	
					</div>	
				</div>	
	        </section>
        </div>
        
        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
      	
    </body>
    
</html>