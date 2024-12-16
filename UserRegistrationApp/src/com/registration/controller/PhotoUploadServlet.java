package com.registration.controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // Limit to 16MB
public class PhotoUploadServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:postgresql://localhost:5432/registration_db";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "KajalPuniya";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        // Retrieve the photo file
        Part filePart = request.getPart("photoUpload");
        InputStream inputStream = null;

        if (filePart != null) {
            // Prints out details for debugging
            System.out.println("File Name: " + filePart.getSubmittedFileName());
            System.out.println("File Size: " + filePart.getSize());
            System.out.println("Content Type: " + filePart.getContentType());
            inputStream = filePart.getInputStream();
        }

        try {
            // Save the photo to the database
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO users (photo) VALUES (?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            if (inputStream != null) {
                stmt.setBinaryStream(1, inputStream, (int) filePart.getSize());
            }

            int row = stmt.executeUpdate();
            if (row > 0) {
                response.getWriter().println("Photo uploaded successfully!");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Photo upload failed!");
        }
    }
}
