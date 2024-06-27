/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lehie
 */
public class sinhvien implements chucnang{
    private String hoten;
    private String masv;
    private String khoahoc;
    private Date ngaysinh;
    private String gioitinh;
    private float TBCHT;
    private String xeploai;
    private String nganh;
    private String anhsv;

    public sinhvien(){}

    public sinhvien(String hoten, String masv, String khoahoc, Date ngaysinh, String gioitinh, String nganh, String anhsv) {
        this.hoten = hoten;
        this.masv = masv;
        this.khoahoc = khoahoc;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.nganh = nganh;
        this.anhsv = anhsv;
    }
    public String getNganh() {
        return nganh;
    }

    public void setNganh(String nganh) {
        this.nganh = nganh;
    }
    
    

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getMasv() {
        return masv;
    }

    public void setMasv(String masv) {
        this.masv = masv;
    }

    public String getKhoahoc() {
        return khoahoc;
    }

    public void setKhoahoc(String khoahoc) {
        this.khoahoc = khoahoc;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public float getTBCHT() {
        return TBCHT;
    }

    public void setTBCHT(float TBCHT) {
        this.TBCHT = TBCHT;
    }

    public String getXeploai() {
        return xeploai;
    }

    public void setXeploai(String xeploai) {
        this.xeploai = xeploai;
    }

    public String getAnhsv() {
        return anhsv;
    }

    public void setAnhsv(String anhsv) {
        this.anhsv = anhsv;
    }

    DBconnect db = new DBconnect();
    
    @Override
    public void them() {
        String sql = "INSERT INTO `qlsinhvien` (`MASV`, `MAK`, `khoahoc`, `HOTEN`, `NGAYSINH`, `GIOITINH`,`anhsv`) VALUES ('"+this.masv+"', '"+this.nganh+"', '"+this.khoahoc+"', '"+this.hoten+"', '"+this.getsimpeldate(this.ngaysinh)+"', '"+this.gioitinh+"', '"+this.anhsv+"')";
        db.chucnang(sql);
    }

    @Override
    public void sua() {
        String sql = "UPDATE qlsinhvien SET HOTEN='"+this.hoten+"', NGAYSINH='"+this.getsimpeldate(this.ngaysinh)+"', GIOITINH='"+this.gioitinh+"', MAK='"+this.nganh+"', khoahoc='"+this.khoahoc+"',`anhsv`='"+this.anhsv+"' WHERE MASV='"+this.masv+"'";
        db.chucnang(sql);
    }

    @Override
    public void xoa() {
        String sql = "DELETE FROM qlsinhvien WHERE MASV='"+this.masv+"'";
        db.chucnang(sql);
    }
    
    public String getsimpeldate(Date a){       
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String formattedDate = sdf.format(a);
        return formattedDate;
    }
    
    public String ckgioitinh(){
        String check = "";
        if("Nữ".equals(gioitinh)){
            check = "checked";
        }
        return check;
    }
    public List<sinhvien> hienthi(){
            String sql = "SELECT * FROM qlsinhvien";
            DBconnect dbht = db.getrs(sql);
            ResultSet rs = dbht.getRs();
            List<sinhvien> lsv = new ArrayList<>();
        try {
            while (rs.next()) {
                sinhvien sv = new sinhvien();
                sv.setMasv(rs.getString("MASV"));
                sv.setHoten(rs.getString("HOTEN"));
                sv.setGioitinh(rs.getString("GIOITINH"));
                sv.setKhoahoc(rs.getString("khoahoc"));
                sv.setNganh(rs.getString("MAK"));
                sv.setNgaysinh(rs.getDate("NGAYSINH"));
                sv.setTBCHT(rs.getFloat("TBCHT"));
                sv.setXeploai(rs.getString("XEPLOAI"));
                lsv.add(sv);
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lsv;
    }
    
    public List<sinhvien> hienthi(String sotrang){
            int sodong = 8;
            int st = Integer.parseInt(sotrang);
            String sql = "SELECT * FROM qlsinhvien LIMIT "+((st-1)*sodong)+","+sodong;
            DBconnect dbht = db.getrs(sql);
            ResultSet rs = dbht.getRs();
            List<sinhvien> lsv = new ArrayList<>();
        try {
            while (rs.next()) {
                sinhvien sv = new sinhvien();
                sv.setMasv(rs.getString("MASV"));
                sv.setHoten(rs.getString("HOTEN"));
                sv.setGioitinh(rs.getString("GIOITINH"));
                sv.setKhoahoc(rs.getString("khoahoc"));
                sv.setNganh(rs.getString("MAK"));
                sv.setNgaysinh(rs.getDate("NGAYSINH"));
                sv.setTBCHT(rs.getFloat("TBCHT"));
                sv.setXeploai(rs.getString("XEPLOAI"));
                sv.setAnhsv(rs.getString("anhsv"));
                lsv.add(sv);
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lsv;
    }
    public List<sinhvien> hienthi(String mak,String khoahoc, String soluong){
        
            String sql = "SELECT * FROM qlsinhvien WHERE MAK = '"+mak+"'  AND khoahoc = '"+khoahoc+"' ORDER BY TBCHT DESC LIMIT "+soluong+"";
            DBconnect dbht = db.getrs(sql);
            ResultSet rs = dbht.getRs();
            List<sinhvien> lsv = new ArrayList<>();
        try {
            while (rs.next()) {
                sinhvien sv = new sinhvien();
                sv.setMasv(rs.getString("MASV"));
                sv.setHoten(rs.getString("HOTEN"));
                sv.setGioitinh(rs.getString("GIOITINH"));
                sv.setKhoahoc(rs.getString("khoahoc"));
                sv.setNganh(rs.getString("MAK"));
                sv.setNgaysinh(rs.getDate("NGAYSINH"));
                sv.setTBCHT(rs.getFloat("TBCHT"));
                sv.setXeploai(rs.getString("XEPLOAI"));
                sv.setAnhsv(rs.getString("anhsv"));
                lsv.add(sv);
            }
            dbht.dis();
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lsv;
    }
}

