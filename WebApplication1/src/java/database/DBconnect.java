/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author lehie
 */
public class DBconnect {
    public Connection conn; 
    public Statement stmt;
    public ResultSet rs;
    public void getconnect(){
        try {
            String dbURL = "jdbc:mysql://localhost:3306/webphp";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(dbURL,user,pass);
            stmt = conn.createStatement();
            System.out.println("connected");
        } catch (Exception e) {
            int choice = JOptionPane.showConfirmDialog(null, "Lỗi:"+e.toString(), "ERO", JOptionPane.YES_OPTION);
        }
    }
    public void getResult(String sql){    
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        DBconnect db = new DBconnect();
        db.getconnect();
    }
}
