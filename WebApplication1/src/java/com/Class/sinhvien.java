/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import java.util.Date;

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

    public sinhvien(){}

    public sinhvien(String hoten, String masv, String khoahoc, Date ngaysinh, String gioitinh, float TBCHT, String xeploai, String nganh) {
        this.hoten = hoten;
        this.masv = masv;
        this.khoahoc = khoahoc;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.TBCHT = TBCHT;
        this.xeploai = xeploai;
        this.nganh = nganh;
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

    
    
    @Override
    public void them() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
