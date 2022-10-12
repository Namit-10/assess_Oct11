<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title>Courier Status</title>
</head>
<body>
	<div class="courier-booking-form">
		<form action="CourierStatus" method="post">
			<h3>Track Courier Status</h3>
			<table>
				
				<tr><td><label for="courierId">Courier Id</label></td><td><input type="text" name="courierId" id="courierId" placeholder="Enter courierId to track"></td></tr>
				
				
			</table>
			<input type="submit" class="courier-button" value="Track">
		</form>
	</div>
</body>
</html>