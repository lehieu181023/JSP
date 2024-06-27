/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lehie
 */
public class vaitro implements chucnang{
    private int mavt;
    private String tenvt;
    private int qltaikhoan;
    private int qldiem;
    private int qlmonhoc;
    private int qlsinhvien;
    private int qllienhe;
    private int qlphantramdiem;

    public vaitro(){}
    public vaitro(int mavt, String tenvt, int qltaikhoan, int qldiem, int qlmonhoc, int qlsinhvien, int qllienhe, int qlphantramdiem) {
        this.mavt = mavt;
        this.tenvt = tenvt;
        this.qltaikhoan = qltaikhoan;
        this.qldiem = qldiem;
        this.qlmonhoc = qlmonhoc;
        this.qlsinhvien = qlsinhvien;
        this.qllienhe = qllienhe;
        this.qlphantramdiem = qlphantramdiem;
    }

    public int getMavt() {
        return mavt;
    }

    public void setMavt(int mavt) {
        this.mavt = mavt;
    }

    public String getTenvt() {
        return tenvt;
    }

    public void setTenvt(String tenvt) {
        this.tenvt = tenvt;
    }

    public int getQltaikhoan() {
        return qltaikhoan;
    }

    public void setQltaikhoan(int qltaikhoan) {
        this.qltaikhoan = qltaikhoan;
    }

    public int getQldiem() {
        return qldiem;
    }

    public void setQldiem(int qldiem) {
        this.qldiem = qldiem;
    }

    public int getQlmonhoc() {
        return qlmonhoc;
    }

    public void setQlmonhoc(int qlmonhoc) {
        this.qlmonhoc = qlmonhoc;
    }

    public int getQlsinhvien() {
        return qlsinhvien;
    }

    public void setQlsinhvien(int qlsinhvien) {
        this.qlsinhvien = qlsinhvien;
    }

    public int getQllienhe() {
        return qllienhe;
    }

    public void setQllienhe(int qllienhe) {
        this.qllienhe = qllienhe;
    }

    public int getQlphantramdiem() {
        return qlphantramdiem;
    }

    public void setQlphantramdiem(int qlphantramdiem) {
        this.qlphantramdiem = qlphantramdiem;
    }
    
    DBconnect db = new DBconnect();
    @Override
    public void them() {
        String sql = "INSERT INTO `qlvaitro`(`mavt`, `tenvt`, `qltaikhoan`, `qldiem`, `qlmonhoc`, `qlsinhvien`, `qllienhe`, `qlphantramd`) VALUES ("+mavt+",'"+tenvt+"',"+qltaikhoan+","+qldiem+","+qlmonhoc+","+qlsinhvien+","+qllienhe+","+qlphantramdiem+")";
        db.chucnang(sql);
    }

    @Override
    public void sua() {
        String sql = "UPDATE `qlvaitro` SET `tenvt`='"+tenvt+"',`qltaikhoan`= "+qltaikhoan+",`qldiem`= "+qldiem+",`qlmonhoc`= "+qlmonhoc+",`qlsinhvien`= "+qlsinhvien+",`qllienhe`= "+qllienhe+",`qlphantramd`= "+qlphantramdiem+" WHERE mavt = "+mavt+"";
        db.chucnang(sql);
    }

    @Override
    public void xoa() {
        String sql = "DELETE FROM `qlvaitro` WHERE mavt = "+mavt+"";
        db.chucnang(sql);
    }
    
    public List<vaitro> hienthi(){
        List<vaitro> lvt = new ArrayList<>();
        String sql = "SELECT * FROM `qlvaitro`";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while(rs.next()){
                vaitro vt = new vaitro();
                vt.setMavt(rs.getInt("mavt"));
                vt.setTenvt(rs.getString("tenvt"));
                vt.setQldiem(rs.getInt("qldiem"));
                vt.setQllienhe(rs.getInt("qllienhe"));
                vt.setQlmonhoc(rs.getInt("qlmonhoc"));
                vt.setQlphantramdiem(rs.getInt("qlphantramd"));
                vt.setQlsinhvien(rs.getInt("qlsinhvien"));
                vt.setQltaikhoan(rs.getInt("qltaikhoan")); 
                lvt.add(vt);
            }
        } catch (Exception e) {
        }
        return lvt;
    }
    public vaitro hienthi(int mavt){
        vaitro vt = new vaitro();
        String sql = "SELECT * FROM `qlvaitro` WHERE mavt = "+mavt+"";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while(rs.next()){
                vt.setMavt(rs.getInt("mavt"));
                vt.setTenvt(rs.getString("tenvt"));
                vt.setQldiem(rs.getInt("qldiem"));
                vt.setQllienhe(rs.getInt("qllienhe"));
                vt.setQlmonhoc(rs.getInt("qlmonhoc"));
                vt.setQlphantramdiem(rs.getInt("qlphantramd"));
                vt.setQlsinhvien(rs.getInt("qlsinhvien"));
                vt.setQltaikhoan(rs.getInt("qltaikhoan")); 
            }
        } catch (Exception e) {
        }
        return vt;
    }
    public static void main(String[] args) {
        vaitro vt = new vaitro();
        List<vaitro> lvt = vt.hienthi();
        for(int i=0;i<lvt.size();i++){
            System.out.println("vai tro : "+lvt.get(i).getTenvt());
        }
    }
    
}
