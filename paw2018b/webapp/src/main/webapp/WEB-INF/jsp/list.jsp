<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
//String id = request.getParameter("address");

String address=request.getParameter("input");
String operation=request.getParameter("operation");



String connectionUrl = "jdbc:postgresql://localhost/postgres";
String dbName = "postgres";
String userId = "postgres";
String password = "123456";



Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

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
            <div class="dropdown" id="user_icon">
	                <img src="
	                <c:url value="/resources/pics/user.png" />
	                " alt="user" class="navbar_item">
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
        
        
        <div class="breadcrumb">
	        <ul class="breadcrumb-list">
			  <li><a href="#">Home</a></li>
			  <li><a href="#"><%=operation.substring(0, 1).toUpperCase()+ operation.substring(1).toLowerCase()%></a></li>
			  <li><a href="#"><%=address.substring(0, 1).toUpperCase()+ address.substring(1).toLowerCase()%></a></li>
			  <!-- <li>Brooklyn</li> -->
			</ul>
		</div>
        
		<div class="wrap">
		   <div class="search">
		      <input id="search_input" type="text" class="searchTerm" placeholder=<%=address%>>
		      <button  href="#" type="submit" class="searchButton">
		        <img src="<c:url value="/resources/pics/search_icon.png" />" onclick="search('<%=operation%>')" alt="Search" id="search-img"></img>
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
			  <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/><%=operation%></li>
			  <%
			  if(!address.equals("")){
			  %> 
			  <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/><%=address%></li>
			  <% 
			  }
			  %>
			 
			  
			  <!-- <li class="applied-filters-list-item"><img src="<c:url value="/resources/pics/delete.png" />" onclick="deleteFilter(this);" alt="Delete" class="delete-img"/>2 bedrooms</li> -->
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
					  		<div class="filters-list-item">LOCATION <img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
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
					  		<div class="filters-list-item">PRICE<img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
					  			<div class="expandible">
					  				<div class="check_box">
                            			<label><input type="checkbox"/>Up to USD 50.000</label>
                        			</div>
					  				<div class="check_box">
                            			<label><input type="checkbox"/>Up to USD 150.000</label>
                        			</div>
					  				<div class="check_box">
                            			<label><input type="checkbox"/>Up to USD 350.000</label>
                        			</div>
                        			<div class="check_box">
                            			<label><input type="checkbox"/>Up to USD 750.000</label>
                        			</div>
					  			</div>
					  		<div class="filters-list-item">BEDROOMS<img src="<c:url value="/resources/pics/arrow_up.png" />" alt="Arrow Up" onclick="expand(this);" class="arrow-up-filters"></img></div>
								<div class="expandible filters-list-item-last">
					  				<div class="check_box">
                            			<label><input type="checkbox"/>1 bedroom</label>
                        			</div>
					  				<div class="check_box">
                            			<label><input type="checkbox"/>2 bedrooms</label>
                        			</div>
					  				<div class="check_box">
                            			<label><input type="checkbox"/>3 bedrooms</label>
                        			</div>
                        			<div class="check_box">
                            			<label><input type="checkbox"/>4 bedrooms</label>
                        			</div>
					  			</div>
						</div>
					</div>
				</div>
			</aside>

	        <section>
	        
	        <!-- ACA EMPIEZA -->
	        
	        	<%
				try{ 
					connection = DriverManager.getConnection(connectionUrl, userId, password);
					statement=connection.createStatement();
					
					String sql ="SELECT * FROM publications WHERE operation = \'" + operation + "\' AND address LIKE '%" + address.toUpperCase() +"%'";
					System.out.println("sql quedo " + sql);
					resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
				%>

					<div class="polaroid-property">
			    	<div class="img-with-tag">
			    		<img class="polaroid-property-img" src="<c:url value="/resources/pics/casa1.jpg" />" alt="5 Terre">
			    		<img class="favorite-icon" onclick="fav(this);" src="<c:url value="/resources/pics/heart.png"/>" alt="Fave">
			    		<img class="next-image" src="<c:url value="/resources/pics/arrow_right.png" />" alt="Next">
						<h2 class="price-tag"><%="$" + resultSet.getString("price") %></h2>
					</div>
					<div class="property-container">
						<div class="property-title-container">
							<h3 class="property-title"><%=resultSet.getString("title") %></h3>
							<h4 class="property-date">published X days ago</h4>
						</div>
						<div class="property-characteristics">
							<div class="column-1">
								<h4><strong>X</strong> bedrooms</h4>
								<h4><strong>X</strong> bathrooms</h4>
								<h4><strong>X</strong> parking</h4>	
							</div>
							<div class="column-2">
								<h4><strong>X</strong> sq. meters</h4>
								<h4><%=resultSet.getString("operation") %></h4>
							</div>				
						</div>
						<h4 class="address"><%=resultSet.getString("address") %></h4>
						<div class="more-info">
							<a class="more-info-title" href="details?address=<%=resultSet.getString("address")%>">MORE INFO ></a>
						</div>	
					</div>
				</div>	
				
	
				
				<% 
				}
				
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
	        
	        
	        
	        

			
	
	        </section>
        </div>
        
        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
      	
    </body>
    
</html>