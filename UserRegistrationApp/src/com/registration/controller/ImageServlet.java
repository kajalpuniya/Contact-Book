package com.registration.controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.pept.transport.Connection;



@WebServlet("/image")
public class ImageServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id")); // Get user ID from the request

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            String url = "jdbc:postgresql://localhost:5432/registration_db"; // Update with your database URL
            String user = "postgres";
            String password = "KajalPuniya"; 
            conn = (Connection) DriverManager.getConnection(url, user, password);

            // Prepare SQL statement for fetching the image
            String sql = "SELECT photo FROM users WHERE id = ?";
            pstmt = ((java.sql.Connection) conn).prepareStatement(sql);
            pstmt.setInt(1, userId); // Set user ID

            rs = pstmt.executeQuery();

            if (rs.next()) {
                byte[] imageBytes = rs.getBytes("photo"); // Get image as byte array
                response.setContentType("image/jpeg"); // Set response content type
                response.getOutputStream().write(imageBytes); // Write image bytes to response
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // User not found
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Handle database error
        } finally {
            // Clean up resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
