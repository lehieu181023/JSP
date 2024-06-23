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
public class diem implements chucnang{
    private String iddiem;
    private int masv;
    private String hoten;
    private String mamh;
    private double diemcc;
    private double diemgk;
    private int lanhoc;
    private int lanthi;
    private double dthi;
    private double tbchp;
    private String dchu;
    private String note;

    public diem(){}

    public diem(String iddiem, double diemcc, double diemgk, int lanhoc, int lanthi, double dthi, String note) {
        this.iddiem = iddiem;
        this.diemcc = diemcc;
        this.diemgk = diemgk;
        this.lanhoc = lanhoc;
        this.lanthi = lanthi;
        this.dthi = dthi;
        this.note = note;
    }   

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }
    
    public String getIddiem() {
        return iddiem;
    }

    public void setIddiem(String iddiem) {
        this.iddiem = iddiem;
    }

    public int getMasv() {
        return masv;
    }

    public void setMasv(int masv) {
        this.masv = masv;
    }

    public String getMamh() {
        return mamh;
    }

    public void setMamh(String mamh) {
        this.mamh = mamh;
    }

    public double getDiemcc() {
        return diemcc;
    }

    public void setDiemcc(double diemcc) {
        this.diemcc = diemcc;
    }

    public double getDiemgk() {
        return diemgk;
    }

    public void setDiemgk(double diemgk) {
        this.diemgk = diemgk;
    }

    public int getLanhoc() {
        return lanhoc;
    }

    public void setLanhoc(int lanhoc) {
        this.lanhoc = lanhoc;
    }

    public int getLanthi() {
        return lanthi;
    }

    public void setLanthi(int lanthi) {
        this.lanthi = lanthi;
    }

    public double getDthi() {
        return dthi;
    }

    public void setDthi(double dthi) {
        this.dthi = dthi;
    }

    public double getTbchp() {
        return tbchp;
    }

    public void setTbchp(double tbchp) {
        this.tbchp = tbchp;
    }

    public String getDchu() {
        return dchu;
    }

    public void setDchu(String dchu) {
        this.dchu = dchu;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public DBconnect getDb() {
        return db;
    }

    public void setDb(DBconnect db) {
        this.db = db;
    }
    
    public boolean tinhTBCHP(){
        if(diemcc >= 0 && diemcc <= 10 && diemgk >= 0 && diemgk <= 10 && dthi >= 0 && dthi <=10){
             tbchp = (diemcc/100)*10 + (diemgk/100)*20 + (dthi/100)*70;
             return true;
        }
        else{
            return  false;
        }
    }
    
    public boolean ktdiemc(){
        if(tbchp >= 0 && tbchp < 4){
            dchu = "F";
            return true;
        }
        else if(tbchp >= 4 && tbchp <= 5.4){
            dchu = "D";
            return true;
        }
        else if(tbchp > 5.4 && tbchp < 7){
            dchu = "C";
            return true;
        }
        else if(tbchp >= 7 && tbchp <= 8.4){
            dchu = "B";
            return true;
        }
        else if(tbchp >8.4 && tbchp <= 10){
            dchu = "A";
            return true;
        }
        else{
            return  false;
        }
    }
    DBconnect db = new DBconnect();
    @Override
    public void them() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public void them(String khoa,String khoahoc,String monh){
        String sql = "SELECT `MASV` FROM `qlsinhvien` WHERE MAK = '"+khoa+"' AND khoahoc = '"+khoahoc+"'";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {
                String masvt = rs.getString("MASV");
                String iddiemt = masv + monh;
                String sqlt = "INSERT INTO `qldiem`(`IDDIEM`, `MASV`, `MAMH`) VALUES ('"+iddiemt+"','"+masvt+"','"+monh+"')";
                db.chucnang(sqlt);
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void sua() {
        
        if(tinhTBCHP()&& ktdiemc() ){
            String sql = "UPDATE `qldiem` SET `DIEMCC`='"+diemcc+"',`DIEMGK`='"+diemgk+"',`LANHOC`='"+lanhoc+"',`LANTHI`='"+lanthi+"',`DTHI`='"+dthi+"',`TBCHP`='"+tbchp+"',`DCHU`='"+dchu+"',`NOTE`='"+note+"' WHERE IDDIEM = '"+iddiem+"'";
            db.chucnang(sql);
        }
        else {
            System.out.println("diem nhap vao khong hop le ! ");
        }
    }

    @Override
    public void xoa() {
        String sql = "DELETE FROM `qldiem` WHERE IDDIEM = '"+iddiem+"'"; 
        db.chucnang(sql);
    }
    
    public String tenmonhoc(String mamh){
        String sql = "SELECT * FROM `qlmonhoc` WHERE MAMH = '"+mamh+"'";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        String tenmh = "";
        try {
            while (rs.next()) {
                tenmh = rs.getString("TENMH");
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tenmh;
    }
    
    public List<diem> hienthi(String mak,String khoahoc,String mamh){
        List<diem> ld = new ArrayList<>();
        String sql = "SELECT `IDDIEM`, qldiem.MASV,qlsinhvien.HOTEN, `MAMH`, `DIEMCC`, `DIEMGK`, `LANHOC`, `LANTHI`, `DTHI`, `TBCHP`, `DCHU`, `NOTE` FROM `qldiem`,`qlsinhvien` WHERE MAK = '"+mak+"' AND Khoahoc = '"+khoahoc+"' AND  MAMH = '"+mamh+"' AND qldiem.MASV = qlsinhvien.MASV ORDER BY SUBSTRING_INDEX(REVERSE(HOTEN), ' ', 1)";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {
                diem d = new diem();
                d.iddiem = rs.getString("IDDIEM");
                d.masv = rs.getInt("MASV");
                d.hoten = rs.getString("HOTEN");
                d.mamh = rs.getString("MAMH");
                d.diemcc = rs.getDouble("DIEMCC");
                d.diemgk = rs.getDouble("DIEMGK");
                d.lanhoc = rs.getInt("LANHOC");
                d.lanthi = rs.getInt("LANTHI");
                d.dthi = rs.getDouble("DTHI");
                d.tbchp = rs.getDouble("TBCHP");
                d.dchu = rs.getString("DCHU");
                if(rs.wasNull()){
                    d.dchu = "";
                }
                if("".equals(d.dchu)){
                
                }
                d.note = rs.getString("NOTE");
                if(rs.wasNull()){
                    d.note = "";
                }
                ld.add(d);                       
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ld;
    }
        
}
