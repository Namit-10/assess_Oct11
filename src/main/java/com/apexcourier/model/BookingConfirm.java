package com.apexcourier.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apexcourier.dao.CourierDao;


@WebServlet("/BookingConfirm")
public class BookingConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerName = request.getParameter("customer-name");
		String mobileNo = request.getParameter("mobile-no");
		String sourceCity = request.getParameter("source-city");
		String destinationCity = request.getParameter("destination-city");
		Double distance = Double.parseDouble(request.getParameter("distance"));
		Double packetWeight = Double.parseDouble(request.getParameter("packet-weight"));
		Date departureDate = Date.valueOf(request.getParameter("booking-date"));
		
		
		HttpSession sess = request.getSession();
		sess.setAttribute("customerName",customerName);
		sess.setAttribute("mobileNo",mobileNo);
		sess.setAttribute("source_place",sourceCity);
		sess.setAttribute("destination_place",destinationCity);
		sess.setAttribute("distance",distance);
		sess.setAttribute("packetWeight",packetWeight);
		sess.setAttribute("departureDate",departureDate);
		
		PrintWriter out = response.getWriter();
		
		
		RequestDispatcher rd = request.getRequestDispatcher("displayPayableAmount.jsp");
		rd.include(request, response);
		
//		out.println("The values received are : "+customerName+" "+mobileNo+" "+sourceCity+" "+destinationCity+" "+packetWeight+" "+departureDate);
	}

}
