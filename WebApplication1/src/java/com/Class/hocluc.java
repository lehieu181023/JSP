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
public class hocluc implements chucnang{
    private float diemtll;
    private String masv;
    private String xeploai;

    public float getDiemtll() {
        return diemtll;
    }

    public void setDiemtll(float diemtll) {
        this.diemtll = diemtll;
    }

    public String getMasv() {
        return masv;
    }

    public void setMasv(String masv) {
        this.masv = masv;
    }

    public String getXeploai() {
        return xeploai;
    }

    public void setXeploai(String xeploai) {
        this.xeploai = xeploai;
    }

    public hocluc() {
    }

    public hocluc(float diemtll, String masv, String xeploai) {
        this.diemtll = diemtll;
        this.masv = masv;
        this.xeploai = xeploai;
    }
    
    public void ktdiemc(){
            if(diemtll >= 0 && diemtll < 4){
                xeploai = "Kém";
            }
            else if(diemtll >= 4 && diemtll < 5){
                xeploai = "Yếu";
            }
            else if(diemtll >= 5 && diemtll < 7){
                xeploai = "Trung bình";
            }
            else if(diemtll >= 7 && diemtll < 8){
                xeploai = "Khá";
            }
            else if(diemtll >=8 && diemtll < 9){
                xeploai = "Giỏi";
            }
            else if(diemtll >=9 && diemtll <=10){
                xeploai ="Xuất sắc";
            }
            else{
                xeploai ="Ero";
            }

        }
    DBconnect db = new DBconnect();
    @Override
    public void them() {
        String sql0 = "SELECT * FROM `qlsinhvien`";
        DBconnect dbht = db.getrs(sql0);
        ResultSet rs = dbht.getRs();
        
        try {
            while(rs.next()){
                String MAsv = rs.getString("MASV");
                String sql1 = "SELECT qldiem.MASV,(SUM(SOTINCHI*TBCHP)/SUM(SOTINCHI)) AS diemtl FROM qldiem,qlmonhoc WHERE MASV = '"+MAsv+"' AND qldiem.MAMH = qlmonhoc.MAMH";
                DBconnect dbht2 = db.getrs(sql0);
                ResultSet rs2 = dbht.getRs();
                while(rs2.next()){
                    hocluc hl = new hocluc();
                    hl.setDiemtll(rs2.getInt("diemtl")); 
                    hl.setMasv(rs2.getString("MASV"));
                    hl.ktdiemc();
                    String sql_update = "UPDATE `qlsinhvien` SET `TBCHT`= "+hl.getDiemtll()+" ,`XEPLOAI`='"+hl.getXeploai()+"' WHERE MASV = '"+hl.getMasv()+"'";
                    db.chucnang(sql_update);
                }
            }
        } catch (Exception e) {
        }
        
    }

    @Override
    public void sua() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void xoa() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
