/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import com.Class.lienhe;
import com.Class.taikhoan;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author lehie
 */
public class DBconnect {
    private Connection conn; 
    private Statement stmt;
    private ResultSet rs;

    public ResultSet getRs() {
        return rs;
    }
    //kết nối tới csdl
    private void getconnect(){
        try {
            String dbURL = "jdbc:mysql://localhost:3306/webphp";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(dbURL,user,pass);
            stmt = conn.createStatement();
        } catch (Exception e) {
            
        }
    }
    //nhập rs  
    private ResultSet getResult(String sql){    
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    // nhap stmt
    private void update(String sql){
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // thuc hien các lệnh thay đổi dữ liệu
    public void chucnang(String sql){
        try {
            DBconnect db = new DBconnect();
            db.getconnect();
            db.update(sql);
            db.dis();
        }catch (Exception ex){
            JOptionPane.showConfirmDialog(null, "Lỗi: "+ex.getMessage(),"Loi",JOptionPane.OK_OPTION);
        }
    }
    // trả về rs
    public DBconnect getrs(String sql){
        DBconnect db = new DBconnect();
        db.getconnect();
        db.rs = db.getResult(sql);
        return db;  
    }
    // ngăt kết nối
    public void dis(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        lienhe lh = new lienhe();
        List<lienhe> ltk = lh.hienthi();
        for(int i =0;i < ltk.size();i++){
            System.out.println("--");
            System.out.println("tai khoan: "+ltk.get(i).name);
            System.out.println("mat khau: "+ltk.get(i).email);
            System.out.println("duyet: "+ltk.get(i).comment);
        }
    }
}
