package com.apexcourier.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apexcourier.dao.CourierDao;


@WebServlet("/CourierStatus")
public class CourierStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int courierId = Integer.parseInt(request.getParameter("courierId"));
		try {
			ResultSet rs = CourierDao.specificCourierStatus(courierId);
			if(rs.next()) {
				RequestDispatcher rd = request.getRequestDispatcher("courierTrack.jsp");
				rd.include(request,response);
				HttpSession sess = request.getSession();
				sess.setAttribute("courierTrackingDetailsRs", rs);
			}
			else {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
