package com.apexcourier.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.apexcourier.util.Util;

public class CourierDao {
	public static int addDetails(String customerName, String mobileNo, String sourcePlace, String destinationPlace,double distance,double packetWeight, double deliveryCharge) throws SQLException {
		Statement stmt = Util.getConnection().createStatement();
		String sql = "";
		if(distance < 500 ) {
			sql = "insert into courierDetails(customerName,mobileNo,source_place,destination_place,distance,packetWeight,bookingDate, deliveryCharge, shippingDate, deliveryDate, deliveryStatus) values('"+customerName+"','"+mobileNo+"','"+sourcePlace+"','"+destinationPlace+"',"+distance+","+packetWeight+",curdate(),"+deliveryCharge+", date_add(curdate(),INTERVAL 1 DAY), date_add(curdate(),INTERVAL 3 DAY),'PROCESSING') ";
		}
		else {
			sql = "insert into courierDetails(customerName,mobileNo,source_place,destination_place,distance,packetWeight,bookingDate, deliveryCharge, shippingDate, deliveryDate, deliveryStatus) values('"+customerName+"','"+mobileNo+"','"+sourcePlace+"','"+destinationPlace+"',"+distance+","+packetWeight+",curdate(),"+deliveryCharge+", date_add(curdate(),INTERVAL 2 DAY), date_add(curdate(),INTERVAL 5 DAY),'PROCESSING') ";
		}
		
		int status1 = stmt.executeUpdate(sql);
		
	
		return status1;
	}
	
	public static ResultSet recentCourierStatus() throws SQLException {
		ResultSet rs;
		Statement stmt = Util.getConnection().createStatement();
		String sql = "select * from courierDetails where courierId = (select max(courierId) from courierDetails) ";
		
		rs = stmt.executeQuery(sql);
		
		return rs;
	}
	
	public static ResultSet specificCourierStatus(int courierId) throws SQLException {
		ResultSet rs;
		Statement stmt = Util.getConnection().createStatement();
		String sql = "select * from courierDetails where courierId =  "+courierId+" ";
		
		rs = stmt.executeQuery(sql);
		
		return rs;
	}
	
	public static void backgroundUpdateCourierStatus() throws SQLException {
		
		Statement stmt = Util.getConnection().createStatement();
		String shippingQuery = "update courierDetails set deliveryStatus = 'SHIPPED' where shippingDate=curdate()";
		
		int status1 = stmt.executeUpdate(shippingQuery);
		
		
		Statement stmt2 = Util.getConnection().createStatement();
		String deliveryQuery = "update courierDetails set deliveryStatus = 'DELIVERED' where deliveryDate=curdate()";
		
		int status2  = stmt2.executeUpdate(deliveryQuery);

	}
}
