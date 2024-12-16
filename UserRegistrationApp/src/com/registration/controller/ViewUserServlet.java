package com.registration.controller;

//ViewUserServlet.java
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.registration.dao.UserDao;
import com.registration.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewUser")
public class ViewUserServlet extends HttpServlet {
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private UserDao userDao = new UserDao();

 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     List<User> userList = userDao.getAllUsers();
     request.setAttribute("userList", userList);
     request.getRequestDispatcher("viewUser.jsp").forward(request, response);
 }
}
