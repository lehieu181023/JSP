/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author lehie
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class database {
    public static void main(String[] args) {
        String name = "á á";
        String email = "lehieu18102k3@gmail.com";
        String comment = "ádasda";

        // Chuỗi kết nối JDBC
        String jdbcUrl = "jdbc:mysql://localhost:3306/your_database_name?useUnicode=true&characterEncoding=utf8";
        String username = "your_username";
        String password = "your_password";

        String sql = "INSERT INTO `lienhe`(`name`, `email`, `comment`) VALUES (?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, comment);

            preparedStatement.executeUpdate();
            System.out.println("Insert thành công");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
