<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, org.json.JSONArray, org.json.JSONObject" %>

<%
    response.setContentType("application/json");
    JSONArray jsonArray = new JSONArray();

    try {
        Class.forName("org.postgresql.Driver"); 
        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/registration_db", "postgres", "KajalPuniya");
             PreparedStatement stmt = conn.prepareStatement("SELECT full_Name, email, mobile, gender, occupation, id_Type, id_Number, address, highest_Qualification, institute_Name FROM users");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("fullName", rs.getString("full_Name"));
                jsonObject.put("email", rs.getString("email"));
                jsonObject.put("mobile", rs.getString("mobile"));
                jsonObject.put("gender", rs.getString("gender"));
                jsonObject.put("occupation", rs.getString("occupation"));
                jsonObject.put("idType", rs.getString("id_Type"));
                jsonObject.put("idNumber", rs.getString("id_Number"));
                jsonObject.put("address", rs.getString("address"));
                jsonObject.put("highestQualification", rs.getString("highest_Qualification"));
                jsonObject.put("instituteName", rs.getString("institute_Name"));
              
               
                
                
                
                
             
                
                
                
                
                
                
                
                
                
                
                
                
                
                jsonArray.put(jsonObject);
                
                
                
                
                
                
                
            }
            out.print(jsonArray.toString());
        }
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\": \"An error occurred while processing your request.\"}");
        e.printStackTrace();
    }
%>
























