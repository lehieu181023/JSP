/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.sql.ResultSet;

/**
 *
 * @author lehie
 */
public class ptrdiem implements chucnang{
    private int dcc;
    private int dgk;
    private int dt;
    
    public ptrdiem(){}

    public ptrdiem(int dcc, int dgk, int dt) {
        this.dcc = dcc;
        this.dgk = dgk;
        this.dt = dt;
    }

    public int getDcc() {
        return dcc;
    }

    public void setDcc(int dcc) {
        this.dcc = dcc;
    }

    public int getDgk() {
        return dgk;
    }

    public void setDgk(int dgk) {
        this.dgk = dgk;
    }

    public int getDt() {
        return dt;
    }

    public void setDt(int dt) {
        this.dt = dt;
    }
    DBconnect db = new DBconnect();
    @Override
    public void them() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void sua() {
        String sql = "UPDATE `qlphamtramd` SET `chuyencan`= "+dcc+",`diemgiuaky`="+dgk+",`diemthi`="+dt+" WHERE maptd = 1";
        db.chucnang(sql);
    }

    @Override
    public void xoa() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ptrdiem hienthi(){
        ptrdiem ptrd = new ptrdiem();
        String sql = "SELECT * FROM `qlphamtramd`";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while(rs.next()){
                ptrd.setDcc(rs.getInt("chuyencan"));
                ptrd.setDgk(rs.getInt("diemgiuaky"));
                ptrd.setDt(rs.getInt("diemthi"));
            }
        } catch (Exception e) {
        }
        return ptrd;
    }
    
}
