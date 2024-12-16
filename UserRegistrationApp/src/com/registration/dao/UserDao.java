package com.registration.dao;

import com.registration.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao {
    private String jdbcURL = "jdbc:postgresql://localhost:5432/registration_db"; 
    private String jdbcUsername = "postgres"; 
    private String jdbcPassword = "KajalPuniya"; 

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver"); 
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Insert user into database
    public void registerUser(User user) {
        String sql = "INSERT INTO users (full_name, email, mobile, gender, occupation, "
                     + "id_type, id_number, address, highest_qualification, institute_name, photo) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getMobile());
            statement.setString(4, user.getGender());
            statement.setString(5, user.getOccupation());
            statement.setString(6, user.getIdType());
            statement.setString(7, user.getIdNumber());
            statement.setString(8, user.getAddress());
            statement.setString(9, user.getHighestQualification());
            statement.setString(10, user.getInstituteName());
            statement.setBytes(11, user.getPhoto());  

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateUser(User user) throws SQLException {
        String updateSQL = "UPDATE users SET full_name = ?, email = ?, mobile = ?, gender = ?, photo_path = ? WHERE email = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getMobile());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setBytes(12, user.getPhoto());
            preparedStatement.setString(6, user.getEmail()); 

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0; 
        } catch (SQLException e) {
            e.printStackTrace(); 
            throw e; 
        }
    }

    // Fetch a user by ID
    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String fullName = resultSet.getString("full_name");
                String email = resultSet.getString("email");
                String mobile = resultSet.getString("mobile");
                String gender = resultSet.getString("gender");
                String occupation = resultSet.getString("occupation");
                String idType = resultSet.getString("id_type");
                String idNumber = resultSet.getString("id_number");
                String address = resultSet.getString("address");
                String highestQualification = resultSet.getString("highest_qualification");
                String instituteName = resultSet.getString("institute_name");
               
                byte[] photo = resultSet.getBytes("photo");
       

                // Create a new User object
                user = new User(id, fullName, email, mobile, gender, occupation, idType, idNumber, address, highestQualification, instituteName, photo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<User> getAllUsers() {
        // TODO: Implement method to fetch all users from the database
        return null;
    }
}
