package com.registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/upload")
@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtain the uploaded file from the request
        Part filePart = request.getPart("photo"); // Form field name is "photo"
        InputStream inputStream = filePart.getInputStream(); // Get the input stream of the file

        // Retrieve other parameters
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish database connection
            String url = "jdbc:postgresql://localhost:5432/registration_db"; // Update with your database URL
            String user = "postgres";
            String password = "KajalPuniya"; 
            conn = DriverManager.getConnection(url, user, password);

            // Prepare SQL statement for insertion
            String sql = "INSERT INTO users (full_name, email, photo) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setBinaryStream(3, inputStream, (int) filePart.getSize()); // Save image as binary data

            // Execute the update
            pstmt.executeUpdate();
            response.getWriter().println("Image uploaded successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } finally {
            // Clean up resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
