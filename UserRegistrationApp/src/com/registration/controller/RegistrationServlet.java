package com.registration.controller;

import com.registration.dao.UserDao;
import com.registration.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.ByteArrayOutputStream;
import java.io.IOException;



@WebServlet("/register")
@MultipartConfig
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8"); 
    	
    	
    	    
    	    
        // Get parameters from the request
    	String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String occupation = request.getParameter("occupation");
        String idType = request.getParameter("idType");
        String idNumber = request.getParameter("idNumber");
        String address = request.getParameter("address");
        String highestQualification = request.getParameter("highestQualification");
        String instituteName = request.getParameter("instituteName");

        
        System.out.println("Received Parameters:");
        System.out.println("Full Name: " + fullName);
        System.out.println("Email: " + email);
        System.out.println("Mobile: " + mobile);
        System.out.println("Gender: " + gender);
        System.out.println("Occupation: " + occupation);
        System.out.println("ID Type: " + idType);
        System.out.println("ID Number: " + idNumber);
        System.out.println("Address: " + address);
        System.out.println("Highest Qualification: " + highestQualification);
        System.out.println("Institute Name: " + instituteName);
        

        
        // Create a new User object
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setGender(gender);
        user.setOccupation(occupation);
        user.setIdType(idType);
        user.setIdNumber(idNumber);
        user.setAddress(address);
        user.setHighestQualification(highestQualification);
        user.setInstituteName(instituteName);

        // Handling the photo upload
        Part photoPart = request.getPart("photo"); // Get the photo part from the request
        byte[] photoBytes = null;

        // Convert InputStream to byte array
        if (photoPart != null && photoPart.getSize() > 0) { // Check if the photo part is valid
            try (java.io.InputStream inputStream = photoPart.getInputStream();
                 ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                photoBytes = outputStream.toByteArray(); // Get the byte array of the photo
            }
        }

        // Create a new User object with photo bytes
        User newUser = new User(0, fullName, email, mobile, gender, occupation, idType, 
                idNumber, address, highestQualification, instituteName, photoBytes);

        // Register the user
        userDao.registerUser(newUser);
        try {
            response.sendRedirect("registration-success.html");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registration-error.html");
        }
    }
}
