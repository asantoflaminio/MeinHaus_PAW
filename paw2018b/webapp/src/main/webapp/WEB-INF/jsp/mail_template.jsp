<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>MeinHaus</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mail_template.css" />">
	<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	<table class="table full-width">	
		<tr>
			<td id="td1">
				<table class="table" id="table1">
					<tr>
						<td id="td2" align="center" bgcolor="#ccc" >
							<img class="img" src="./Logo4.png" alt="Creating Email Magic" width="150" height="50"  />
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff" id="td3">
							<table class="table full-width">
								<tr>
									<td id="td4">
										<b>Te contactaron de MeinHaus!</b>
									</td>
								</tr>
								<tr>
									<td id="td5">
										Te llegó un mail de: 
										<a href="#" class="sender">lala@gmail.com</a>
									</td>
								</tr>
								<tr>
									<td id="msg-title">
										Con el siguiente mensaje:
									</td>
								</tr>
								<tr>
									<td id="msg-content">
										Me encanta tu propiedad! Me podés mandar más información?
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#FD8907" id="td7">
							<table class="table full-width">
								<tr>
									<td id="td8" width="75%">
										&reg; Meinhaus, 2018<br/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>