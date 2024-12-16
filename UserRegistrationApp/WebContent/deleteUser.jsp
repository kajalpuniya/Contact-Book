<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Database connection setup
    String dbURL = "jdbc:postgresql://localhost:5432/registration_db";
    String dbUser = "postgres";
    String dbPassword = "KajalPuniya";

    String email = request.getParameter("email");
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
       
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
      
        String sql = "DELETE FROM users WHERE email = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0) {
         
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
         
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
