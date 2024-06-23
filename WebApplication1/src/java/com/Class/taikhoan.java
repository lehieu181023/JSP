/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author lehie
 */
@ManagedBean
public class taikhoan implements chucnang{
    DBconnect db = new DBconnect();
    public taikhoan(String taikhoan, String matkhau, String duyet) {
        this.taikhoan = taikhoan;
        this.matkhau = matkhau;
        this.duyet = duyet;
    }
    public taikhoan(){}
    public String getTaikhoan() {
        return taikhoan;
    }

    public void setTaikhoan(String taikhoan) {
        this.taikhoan = taikhoan;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getDuyet() {
        return duyet;
    }

    public void setDuyet(String duyet) {
        this.duyet = duyet;
    }
    private String taikhoan;
    private String matkhau;
    private String duyet;

    @Override
    public void them() {   
        String sql = "INSERT INTO `taikhoan`(`username`, `password`, `duyet`) VALUES ('"+taikhoan+"','"+matkhau+"','"+duyet+"')";
        db.chucnang(sql);
    }

    @Override
    public void sua() {
        String sql = "UPDATE `taikhoan` SET`password`='"+matkhau+"',`duyet`='"+duyet+"' WHERE  `username`='"+taikhoan+"'";
        db.chucnang(sql);
    }

    @Override
    public void xoa() {
        String sql = "DELETE FROM `taikhoan` WHERE username ='"+taikhoan+"'";
        db.chucnang(sql);
    }

    public List<taikhoan> hienthi() {
        List<taikhoan> ltk = new ArrayList<>();
        String sql = "SELECT * FROM taikhoan";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {
                taikhoan tk = new taikhoan();
                tk.setTaikhoan(rs.getString("username"));
                tk.setMatkhau(rs.getString("password"));
                tk.setDuyet(rs.getString("duyet"));
                ltk.add(tk);
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ltk;
    }
    public String checkd(){
        return "checked";
    }

}
