<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Database connection setup
    String dbURL = "jdbc:postgresql://localhost:5432/registration_db";
    String dbUser = "postgres";
    String dbPassword = "KajalPuniya";

    String email = request.getParameter("email");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String fullName = "";
    String mobile = "";
    String gender = "";
    String occupation = "";
    String idType = "";
    String idNumber = "";
    String address = "";
    String highestQualification = "";
    String instituteName = "";

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        String sql = "SELECT full_name, mobile, gender, occupation, id_Type, id_Number, address, highest_Qualification, institute_Name FROM users WHERE email = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            fullName = rs.getString("full_name");
            mobile = rs.getString("mobile");
            gender = rs.getString("gender");
            occupation = rs.getString("occupation");
            idType = rs.getString("id_Type");
            idNumber = rs.getString("id_Number");
            address = rs.getString("address");
            highestQualification = rs.getString("highest_Qualification");
            instituteName = rs.getString("institute_Name");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Include Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f3f4f6;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            display: flex;
            align-items: center;
            color: #333;
            font-size: 24px;
        }

        h2 img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            width: 400px; /* Adjust width as necessary */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 2px solid #007bff;
        }

        .input-container {
            display: flex;
            align-items: center; /* Align items vertically centered */
            margin-bottom: 16px;
        }

        .input-container i {
            margin-right: 10px; /* Space between icon and input field */
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        select {
            flex: 1; /* Allow input fields to take available space */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form {
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>
            <img src="https://tse2.mm.bing.net/th?id=OIP.NfQXJGQIFEdceeyi1sIW8AHaHa&pid=Api&P=0&h=180" alt="">
            Edit User
        </h2>
        <form action="updateUser.jsp" method="post">
            <div class="input-container">
                <i class="fas fa-user"></i>
                <input type="text" name="fullName" value="<%= fullName %>" placeholder="Full Name" required>
            </div>

            <div class="input-container">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" value="<%= email %>" placeholder="Email" readonly>
            </div>
            
            <div class="input-container">
                <i class="fas fa-phone"></i>
                <input type="text" name="mobile" value="<%= mobile %>" placeholder="Mobile" required>
            </div>
            
            <div class="input-container">
                <i class="fas fa-venus-mars"></i>
                <select name="gender">
                    <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                </select>
            </div>

            <div class="input-container">
                <i class="fas fa-briefcase"></i>
                <input type="text" name="occupation" value="<%= occupation %>" placeholder="Occupation" required>
            </div>

            <div class="input-container">
                <i class="fas fa-id-card"></i>
                <input type="text" name="idType" value="<%= idType %>" placeholder="ID Type" required>
            </div>

            <div class="input-container">
                <i class="fas fa-key"></i>
                <input type="text" name="idNumber" value="<%= idNumber %>" placeholder="ID Number" required>
            </div>

            <div class="input-container">
                <i class="fas fa-home"></i>
                <input type="text" name="address" value="<%= address %>" placeholder="Address" required>
            </div>

            <div class="input-container">
                <i class="fas fa-graduation-cap"></i>
                <input type="text" name="highestQualification" value="<%= highestQualification %>" placeholder="Highest Qualification" required>
            </div>

            <div class="input-container">
                <i class="fas fa-school"></i>
                <input type="text" name="instituteName" value="<%= instituteName %>" placeholder="Institute Name" required>
            </div>

            <input type="submit" value="Update User">
        </form>
    </div>
</body>
</html>
