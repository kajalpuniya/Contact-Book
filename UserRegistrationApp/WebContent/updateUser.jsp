<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Database connection setup
    String dbURL = "jdbc:postgresql://localhost:5432/registration_db";
    String dbUser = "postgres";
    String dbPassword = "KajalPuniya";

    String email = request.getParameter("email");
    String fullName = request.getParameter("fullName");
    String mobile = request.getParameter("mobile");
    String gender = request.getParameter("gender");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        String sql = "UPDATE users SET full_name = ?, mobile = ?, gender = ? WHERE email = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, fullName);
        stmt.setString(2, mobile);
        stmt.setString(3, gender);
        stmt.setString(4, email);
        
        int rowsUpdated = stmt.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<script>alert('User updated successfully!'); window.location.href = 'admindashboard.html';</script>");
        } else {
            out.println("<script>alert('Failed to update user. Please try again.'); window.location.href = 'admindashboard.html';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred.'); window.location.href = 'admindashboard.html';</script>");
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
