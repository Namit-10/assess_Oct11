<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title>Booking Details</title>
</head>
<body style="background-color: #3d3d3d;" >
	<div class="courier-booking-form" style="background-color: white;">
		<form action="BookingConfirm" method="post">
			<h3 style="background-color: yellow; width: 500px; padding-top: 15px; padding-bottom: 15px;">Courier Booking Details</h3>
			<table>
				
				<tr><td><label for="cutomer-name">Customer Name</label></td><td><input type="text" name="customer-name" id="customer-name" required></td></tr>
				<tr><td><label for="mobile-no">Mobile No.</label></td><td><input type="number" name="mobile-no" id="mobile-no" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" required></td></tr>
				<tr><td><label for="source-city">Source Town/City (From Place)</label></td><td><input type="text" name="source-city" id="source-city" required></td></tr>
				<tr><td><label for="booking-date">Booking date</label></td><td><input type="date" value="<%= java.time.LocalDate.now() %>" name="booking-date" id="booking-date" readonly></td></tr>
				<tr><td><label for="destination-city">Destination Town/City (To Place)</label></td><td><input type="text" name="destination-city" id="destination-city" required></td></tr>
				<tr><td><label for="distance">Distance (in Kms.)</label></td><td><input type="number" step="any" name="distance" id="distance" min=0 required></td></tr>
				<tr><td><label for="packet-weight">Packet Weight (in gms.)</label></td><td><input type="number" step="any" name="packet-weight" id="packet-weight" min = 0 required></td></tr>
				
			</table>
			<input type="submit" style="background-color: black; color: white; font-size: 15px;" class="courier-button" value="Courier">
		</form>
	</div>
</body>
</html>