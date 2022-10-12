<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession, com.apexcourier.dao.*, java.sql.Date, java.sql.ResultSet" %>

<% 
	HttpSession sess = request.getSession();
	if(sess != null){
	String customerName = (String)sess.getAttribute("customerName");
	String mobileNo = (String)sess.getAttribute("mobileNo");
	String source_place = (String)sess.getAttribute("source_place");
	String destination_place = (String)sess.getAttribute("destination_place");
	double distance = (Double)sess.getAttribute("distance");
	double packetWeight = (Double)sess.getAttribute("packetWeight");
	double deliveryCharge = (Double)sess.getAttribute("deliveryCharge");
	
	int courierId = 0;
	Date bookingDate = Date.valueOf("2022-10-15"), shippingDate = Date.valueOf("2022-10-15"),deliveryDate = Date.valueOf("2022-10-15");
	String deliveryStatus= "";
	
	int status = CourierDao.addDetails(customerName,mobileNo,source_place,destination_place,distance,packetWeight,deliveryCharge);
	CourierDao.backgroundUpdateCourierStatus();
	if(status > 0){
		ResultSet res = CourierDao.recentCourierStatus();
		if(res.next()){
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
		else{
			System.out.println("res is null");
		}
	}
	
	
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Make Payment</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('invoice-table'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("invoice.pdf");
                }
            });
        }
    </script>
</head>
<body style="margin:0; paddin: 0;">
	<div class= "head-noti" style="color: white; background-color: green; width:100%; padding: 0px;height: 60px; margin:0px;">
	<h1 style="color: white;">Payment successful! Booking Confirmed.</h1>
	<p style="color: white; background-color: green; width:100%; padding: 0px;height: 30px; margin:0px;">Click <a href="bookingDetails.jsp">here</a> to book another courier.</p>
	</div>
	<div class="outside-box" style="width: 1000px; height: 800px; margin-left:420px; ">
	<div class = "invoice" style="margin-left: 22.5%; align-items: center; border: 1px solid black; width: 500px; padding: 30px; text-align: center; margin-top: 5%;">
	
	<h3>Booking Invoice</h3>
		<table id="invoice-table">
			<tr><th colspan="2">Apex Courier Booking Invoice</th></tr>
			<tr><td><label for="courierId">Courier Id</label></td><td><input type="text" step="any" name="courierId" id="courierId" value="<%= courierId %>" readonly></td></tr>
			<tr><td><label for="packet-weight">Customer Name</label></td><td><input type="text" name="customer-name" id=""customer-name"" value="<%= customerName %>" readonly></td></tr>
			<tr><td><label for="mobileNo">Mobile No.</label></td><td><input type="text" step="any" name="mobileNo" id="mobileNo" value="<%= mobileNo %>" readonly></td></tr>
			<tr><td><label for="source-place">Source Town/City (From)</label></td><td><input type="text" name="source-place" id="source-place" value="<%= source_place %>" readonly></td></tr>
			<tr><td><label for="destination-place">Destination Town/City (To)</label></td><td><input type="text" step="any" name="destination-place" id="destination-place" value="<%= destination_place %>" readonly></td></tr>
			<tr><td><label for="distance">Distance (in Kms.)</label></td><td><input type="text" step="any" name="distance" id="distance" value="<%= distance %>" readonly></td></tr>
			<tr><td><label for="packet-weight">Packet Weight</label></td><td><input type="text" name="packet-weight" id="packet-weight" value="<%= packetWeight %>" readonly></td></tr>
			
			<tr><td><label for="delivery-charge">Total Delivery Charge</label></td><td><input type="text" name="delivery-charge" id=""delivery-charge"" value="<%= deliveryCharge %>" readonly></td></tr>
			
			<tr><td><label for="shipping-date">Shipping Date</label></td><td><input type="text" step="any" name="shipping-date" id="shipping-date" value="<%= shippingDate %>" readonly></td></tr>
			<tr><td><label for="delivery-date">Expected Delivery Date</label></td><td><input type="text" step="any" name="delivery-date" id="delivery-date" value="<%= deliveryDate %>" readonly></td></tr>
			<tr><td><label for="delivery-status">Delivery Status</label></td><td><input type="text" name="delivery-status" id="delivery-status" value="<%= deliveryStatus %>" readonly></td></tr>
		</table>
		<button onclick="Export()">Print invoice</button>
	</div>
	</div>
</body>
</html>
<% sess.invalidate(); %>
<%} %>
