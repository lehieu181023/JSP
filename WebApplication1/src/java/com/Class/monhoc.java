/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lehie
 */
public class monhoc implements chucnang{

    private String mamh;
    private String tenmh;
    private int sotinchi;

    public monhoc(){};
    
    public monhoc(String mamh, String tenmh, int sotinchi) {
        this.mamh = mamh;
        this.tenmh = tenmh;
        this.sotinchi = sotinchi;
    }
    
    public void setMamh(String mamh) {
        this.mamh = mamh;
    }

    public void setTenmh(String tenmh) {
        this.tenmh = tenmh;
    }

    public void setSotinchi(int sotinchi) {
        this.sotinchi = sotinchi;
    }

    public String getMamh() {
        return mamh;
    }

    public String getTenmh() {
        return tenmh;
    }

    public int getSotinchi() {
        return sotinchi;
    }
    
    DBconnect db = new DBconnect();
    @Override
    public void them() {
        String sql = "INSERT INTO `qlmonhoc` (`MAMH`, `TENMH`, `SOTINCHI`) VALUES ('"+mamh+"', '"+tenmh+"', '"+sotinchi+"')";
        db.chucnang(sql);
    }

    @Override
    public void sua() {
        String sql = "UPDATE qlmonhoc SET TENMH='"+tenmh+"', SOTINCHI='"+sotinchi+"' WHERE MAMH='"+mamh+"'";
        db.chucnang(sql);
    }

    @Override
    public void xoa() {
        String sql = "DELETE FROM qlmonhoc WHERE MAMH='"+mamh+"'";
        db.chucnang(sql);
    }
    
    public List<monhoc> hienthi(){
        List<monhoc> lmh = new ArrayList<>();
        String sql = "SELECT * FROM qlmonhoc";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {
                monhoc mh = new monhoc();
                mh.setMamh(rs.getString("MAMH"));
                mh.setSotinchi(rs.getInt("SOTINCHI"));
                mh.setTenmh(rs.getString("TENMH"));
                lmh.add(mh);               
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lmh;
    }
    public List<monhoc> hienthi(String sotrang){
        int sodong = 8;
        int st = Integer.parseInt(sotrang);
        List<monhoc> lmh = new ArrayList<>();
        String sql = "SELECT * FROM qlmonhoc LIMIT "+((st-1)*sodong)+","+sodong;
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {
                monhoc mh = new monhoc();
                mh.setMamh(rs.getString("MAMH"));
                mh.setSotinchi(rs.getInt("SOTINCHI"));
                mh.setTenmh(rs.getString("TENMH"));
                lmh.add(mh);               
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lmh;
    }    
}
