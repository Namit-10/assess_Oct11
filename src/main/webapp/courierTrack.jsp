<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession, com.apexcourier.dao.*, java.sql.ResultSet, java.sql.Date " %>
<!DOCTYPE html>
<html>
<head>
<%  CourierDao.backgroundUpdateCourierStatus();
	HttpSession sess = request.getSession();
	ResultSet res = (ResultSet)sess.getAttribute("courierTrackingDetailsRs");
	
	int courierId = 0;
	String customerName = "", mobileNo= "", source_place= "", destination_place= "", deliveryStatus= "";
	double distance = 0d, packetWeight= 0d,deliveryCharge = 0d;
	Date bookingDate = Date.valueOf("2022-10-15"), deliveryDate = Date.valueOf("2022-10-15"),shippingDate = Date.valueOf("2022-10-15");
	if( res != null && res.next()){
		courierId = res.getInt(1);
		//System.out.println("The value of courier id is : "+courierId);
		customerName = res.getString(2);
		mobileNo = res.getString(3);
		source_place = res.getString(4);
		destination_place = res.getString(5);
		distance = (Double)res.getDouble(6);
		packetWeight = (Double)res.getDouble(7);
		bookingDate = (Date)res.getDate(8);
		deliveryCharge = (Double)res.getDouble(9);
		shippingDate = (Date)res.getDate(10);
		deliveryDate = (Date)res.getDate(11);
		deliveryStatus = (String)res.getString(12);
	}
	else {
		response.sendRedirect("bookingDetails.jsp");
	}
%>

<meta charset="UTF-8">
<title>Tracking details</title>
</head>
<body style="background-color: #3d3d3d;">
	<table id="invoice-table">
			<tr><th colspan="2">Apex Courier Status Check</th></tr>
			<tr><td><label for="courierId">Courier Id</label></td><td><input type="text" step="any" name="courierId" id="courierId" value="<%= courierId %>" readonly></td></tr>
			<tr><td><label for="customer-name">Customer Name</label></td><td><input type="text" name="customer-name" id=""customer-name"" value="<%= customerName %>" readonly></td></tr>
			<tr><td><label for="mobileNo">Mobile No.</label></td><td><input type="text" step="any" name="mobileNo" id="mobileNo" value="<%= mobileNo %>" readonly></td></tr>
			<tr><td><label for="source-place">Source Town/City (From)</label></td><td><input type="text" name="source-place" id="source-place" value="<%= source_place %>" readonly></td></tr>
			<tr><td><label for="destination-place">Destination Town/City (To)</label></td><td><input type="text" step="any" name="destination-place" id="destination-place" value="<%= destination_place %>" readonly></td></tr>
			<tr><td><label for="distance">Distance (in Kms.)</label></td><td><input type="text" step="any" name="distance" id="distance" value="<%= distance %>" readonly></td></tr>
			<tr><td><label for="packet-weight">Packet Weight</label></td><td><input type="text" name="packet-weight" id="packet-weight" value="<%= packetWeight %>" readonly></td></tr>
			
			<tr><td><label for="delivery-charge">Total Delivery Charge</label></td><td><input type="text" name="delivery-charge" id="delivery-charge" value="<%= deliveryCharge %>" readonly></td></tr>
			
			<tr><td><label for="shipping-date">Shipping Date</label></td><td><input type="text" step="any" name="shipping-date" id="shipping-date" value="<%= shippingDate %>" readonly></td></tr>
			<tr><td><label for="delivery-date">Expected Delivery Date</label></td><td><input type="text" step="any" name="delivery-date" id="delivery-date" value="<%= deliveryDate %>" readonly></td></tr>
			<tr><td><label for="delivery-status">Delivery Status</label></td><td><input type="text" name="delivery-status" id="delivery-status" value="<%= deliveryStatus %>" readonly></td></tr>
		</table>
</body>
</html>