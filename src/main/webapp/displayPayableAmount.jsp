<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat, java.sql.Date" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="mystyle.css">
<head>
<meta charset="UTF-8">
<title>Estimate</title>
</head>
<body style="background-color: #3d3d3d;">
	<% 
	   Double distance = Double.parseDouble(request.getParameter("distance"));
	   Double packetWeight = Double.parseDouble(request.getParameter("packet-weight"));
	   Double deliveryCharge = 0.0d;
	   Double freightRatePerg = 0.0;
	   Double minimumCharges = 50.0d;
	   if(packetWeight >0 && packetWeight < 1000) {
	   			if(distance > 0 && distance < 100){
	   				deliveryCharge = minimumCharges + packetWeight;
	   				freightRatePerg = 1.0d;
	   				
	   			}
	   			else if(distance >= 100 && distance < 500){
	   				minimumCharges = 80.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.9;
	   				freightRatePerg = 0.9;
	   			}
	   			else if(distance >= 500 && distance < 1000) {
	   				minimumCharges = 90.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.8;
	   				freightRatePerg = 0.8;
	   			}
	   			else if(distance >= 1000){
	   				minimumCharges = 100.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.7;
	   				freightRatePerg = 0.7;
	   			}
	   }
	   else if(packetWeight >=1000 && packetWeight < 100000) {
	   			if(distance > 0 && distance < 100){
	   				minimumCharges = 60.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.9;
	   				freightRatePerg = 0.9;
	   			}
	   			else if(distance >= 100 && distance < 500){
	   				minimumCharges = 70.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.8;
	   				freightRatePerg = 0.8;
	   			}
	   			else if(distance >= 500 && distance < 1000) {
	   				minimumCharges = 80.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.75;
	   				freightRatePerg = 0.75;
	   			}
	   			else if(distance >= 1000){
	   				minimumCharges = 100.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.7;
	   				freightRatePerg = 0.7;
	   			}
	   }
	   else if(packetWeight >=  100000) {
		   			minimumCharges = 120.0d;
	   				deliveryCharge = minimumCharges + packetWeight*0.9;
	   				freightRatePerg = 0.9;
	   }
	   
	   HttpSession sess = request.getSession();
	   sess.setAttribute("deliveryCharge", deliveryCharge);
	   
	   %>
	   
	   <div class="courier-booking-form" style="background-color: white;">
	   <form action="MakePayment.jsp" method="post">
	   		<h3 style="background-color: yellow; width: 500px; padding-top: 15px; padding-bottom: 15px;">Estimate</h3>
	   		<table>
	   			<tr><td><label for="distance">Distance (in Kms.)</label></td><td><input type="number" step="any" name="distance" id="distance" value="<%= distance %>" readonly></td></tr>
				<tr><td><label for="packet-weight">Packet Weight</label></td><td><input type="text" name="packet-weight" id="packet-weight" value="<%= packetWeight %>" readonly></td></tr>
				<tr><td><label for="freight-rate">Freight Rate</label></td><td><input type="text" name="freight-rate" id="freight-rate"  value="<%= freightRatePerg %>/gm" readonly></td></tr>
				<tr><td><label for="delivery-subtotal">Delivery Subtotal</label></td><td><input type="text" name="delivery-subtotal" value="<%= packetWeight %>  *  <%= freightRatePerg %>  =  <%= (packetWeight*freightRatePerg) %>" id="delivery-subtotal" readonly></td></tr>
				<tr><td><label for="minimum-charges">Minimum Charges</label></td><td><input type="text" name="minimumCharges" id="minimumCharges" value="<%= minimumCharges %>" readonly></td></tr>
				<tr><td><label for="total-charge">Total Charges</label></td><td><input type="text" name="total-charge" id="total-charge" value="<%= (deliveryCharge) %>" readonly></td></tr>
			</table>
	   		<input type="submit" id="makePayment-button" class="courier-button" value="Pay">
	   	</form>
	   </div>
</body>
</html>