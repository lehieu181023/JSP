/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author lehie
 */
public class lienhe implements chucnang{

    public lienhe(String email, String comment, String name) {
        this.email = email;
        this.comment = comment;
        this.name = name;
    }
    public String email;
    public String comment;
    public String name;
    public Date ngaygui;
    public lienhe(){}
    
    DBconnect db = new DBconnect();
    
    @Override
    public void them() {
        String sql = "INSERT INTO `lienhe`(`name`, `email`, `comment`) VALUES ('"+name+"','"+email+"','"+comment+"')";
        System.out.println(sql);
        db.chucnang(sql);
    }

    @Override
    public void sua() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void xoa() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<lienhe> hienthi(){
        List<lienhe> llh = new ArrayList<>();
        String sql = "SELECT * FROM lienhe";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {
                lienhe lh = new lienhe();
                lh.name = rs.getString("name");
                lh.email = rs.getString("email");
                lh.comment = rs.getString("comment");
                lh.ngaygui = rs.getDate("ngaygui");
                llh.add(lh);
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return llh;
    }
    
}
