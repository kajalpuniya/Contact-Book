<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #007BFF;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            color:black;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #003366;
            color: white;
            padding: 15px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 2px solid #007BFF;
        }

        button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            th, td {
                padding: 10px;
            }

            img {
                width: 40px;
                height: 40px;
            }

            button {
                width: 100%;
                font-size: 14px;
            }
        }
    </style>
    <script>
        function viewUser(button) {
            const email = button.getAttribute('data-user-email');
            const url = `viewUser.jsp?email=${encodeURIComponent(email)}`;
            window.location.href = url;
        }
    </script>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String url = "jdbc:postgresql://localhost:5432/registration_db"; 
    String user = "postgres";
    String password = "KajalPuniya"; 

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();

        String sql = "SELECT full_name, email, mobile, gender, occupation, id_type, id_number, address, highest_qualification, institute_name, photo FROM users"; 
        rs = stmt.executeQuery(sql);

        if (!rs.isBeforeFirst()) { 
%>
            <p>No users found.</p>
<%
        } else {
%>
            <h2>User List</h2>
            <table>
                <tr>
                    <th>Photo</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Gender</th>
                    <th>Occupation</th>
                    <th>ID Type</th>
                    <th>ID Number</th>
                    <th>Address</th>
                    <th>Highest Qualification</th>
                    <th>Institute Name</th>
                    <th>Action</th>
                </tr>
<%
            while (rs.next()) {
                String fullName = rs.getString("full_name");
                String email = rs.getString("email");
                String mobile = rs.getString("mobile");
                String gender = rs.getString("gender");
                String occupation = rs.getString("occupation");
                String idType = rs.getString("id_type");
                String idNumber = rs.getString("id_number");
                String address = rs.getString("address");
                String highestQualification = rs.getString("highest_qualification");
                String instituteName = rs.getString("institute_name");

                byte[] photoBytes = rs.getBytes("photo");
                String photo = null;
                if (photoBytes != null) {
                    photo = Base64.getEncoder().encodeToString(photoBytes);
                } else {
                    photo = "path/to/default/image.jpg"; 
                }
%>
                <tr>
                    <td><img src="data:image/jpeg;base64,<%= photo %>" alt="User Photo"/></td>
                    <td><%= fullName %></td>
                    <td><%= email %></td>
                    <td><%= mobile %></td>
                    <td><%= gender %></td>
                    <td><%= occupation %></td>
                    <td><%= idType %></td>
                    <td><%= idNumber %></td>
                    <td><%= address %></td>
                    <td><%= highestQualification %></td>
                    <td><%= instituteName %></td>
                    <td><button onclick="viewUser(this)" data-user-email="<%= email %>">View</button></td>
                </tr>
<%
            }
%>
            </table>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace(); 
%>
        <p>Error retrieving user data.</p>
<%
    } catch (ClassNotFoundException e) {
        e.printStackTrace(); 
%>
        <p>PostgreSQL JDBC Driver not found.</p>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
    <button onclick="window.history.back()">Go Back</button>
</body>
</html>
