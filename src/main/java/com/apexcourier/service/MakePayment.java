package com.apexcourier.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apexcourier.dao.CourierDao;


@WebServlet("/MakePayment")
public class MakePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		if(sess != null){
			String customerName = (String)sess.getAttribute("customerName");
			String mobileNo = (String)sess.getAttribute("mobileNo");
			String source_place = (String)sess.getAttribute("source_place");
			String destination_place = (String)sess.getAttribute("destination_place");
			double distance = Double.parseDouble((String)sess.getAttribute("distance"));
			double packetWeight = Double.parseDouble((String)sess.getAttribute("packetWeight"));
			double deliveryCharge = Double.parseDouble((String)sess.getAttribute("deliveryCharge"));
			
			try {
				int status = CourierDao.addDetails(customerName,mobileNo,source_place,destination_place,distance,packetWeight,deliveryCharge);
				if(status > 0) {
//					response.sendRedirect("BookingConfirmed.jsp");
					System.out.println("Added successfully to the database");
				}
				else {
					System.out.println("Could not add to the database");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			response.sendRedirect("bookingDetails.jsp");
		}
	}

}
