/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import javax.faces.bean.ManagedBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "JSFtop3")
@RequestScoped

public class JSFtop3 {
    public int so =1;
    public List<sinhvien> lsv = new ArrayList<>();
    public List<sinhvien> JSFtop3(){
        DBconnect db = new DBconnect();
        String sql = "SELECT `MASV`, `HOTEN`,`XEPLOAI`,TENK ,GIOITINH FROM `qlsinhvien`,khoa WHERE qlsinhvien.MAK = khoa.MAK AND khoahoc = CONCAT('K',(YEAR(CURDATE()) - 2012)) ORDER BY TBCHT DESC LIMIT 3";
        db = db.getrs(sql);
        ResultSet rs = db.getRs();
        try {
            while (rs.next()) {
                sinhvien tk = new sinhvien();
                tk.setHoten(rs.getString("HOTEN"));
                tk.setMasv(rs.getString("MASV"));
                tk.setNganh(rs.getString("TENK"));
                tk.setXeploai(rs.getString("XEPLOAI"));
                lsv.add(tk);
            }
            db.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lsv;
    }
    
    public String getnganh(int i){
        return lsv.get(i).getNganh();
    }
    public String gethocluc(int i){
        return lsv.get(i).getXeploai();
    }
    public String getmasvhoten(int i){
        return lsv.get(i).getHoten() + " - "+lsv.get(i).getMasv();
    }
    public static void main(String[] args) {
        JSFtop3 t3 = new JSFtop3();
        List<sinhvien> lsv = t3.JSFtop3();
        for(int i =0;i < 3;i++){
            System.out.println("hoten: "+lsv.get(i).getHoten());
            System.out.println("nganh: "+lsv.get(i).getNganh());
        }
    }
}
