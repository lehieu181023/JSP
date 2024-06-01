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
    public void getconnect(){
        try {
            String dbURL = "jdbc:mysql://localhost:3306/webphp";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(dbURL,user,pass);
            stmt = conn.createStatement();
            System.out.print("connected");
        } catch (Exception e) {
            int choice = JOptionPane.showConfirmDialog(null, "Lỗi:"+e.toString(), "ERO", JOptionPane.YES_OPTION);
        }
    }
    public ResultSet getResult(String sql){    
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    public void update(String sql){
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void chucnang(String sql){
        try {
            DBconnect db = new DBconnect();
            db.getconnect();
            db.update(sql);
            System.out.println("update sus");
        }catch (Exception ex){
            JOptionPane.showConfirmDialog(null, "Lỗi: "+ex.getMessage(),"Loi",JOptionPane.OK_OPTION);
        }
    }
    public ResultSet getrs(String sql){
        DBconnect db = new DBconnect();
        db.getconnect();
        return db.getResult(sql);
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
