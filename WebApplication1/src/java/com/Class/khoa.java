/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Class;

import database.DBconnect;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lehie
 */
public class khoa {
    public String mak;
    public String tenk;
    
    DBconnect db = new DBconnect();
    
    public List<khoa> hienthi(){
        List<khoa> lk = new ArrayList<>();
        String sql = "SELECT * FROM `khoa`";
        DBconnect dbht = db.getrs(sql);
        ResultSet rs = dbht.getRs();
        try {
            while (rs.next()) {  
                khoa k = new khoa();
                k.mak = rs.getString("MAK");
                k.tenk = rs.getString("TENK");
                lk.add(k);
            }           
        } catch (Exception ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lk;
    }
    public static void main(String[] args) {
        khoa k = new khoa();
        List<khoa> lk = new ArrayList<>();
        lk = k.hienthi();
        for(int i=0;i<lk.size();i++){
            System.out.println("mak: "+lk.get(i).mak);
            System.out.println("ten k:"+lk.get(i).tenk);
        }
    }
}
