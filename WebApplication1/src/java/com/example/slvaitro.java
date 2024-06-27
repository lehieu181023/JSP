/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example;

import com.Class.vaitro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lehie
 */
public class slvaitro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int mavt = 0;
        String tenvt = request.getParameter("tenvt");
        int qltaikhoan = 0;
        int qldiem = 0;
        int qlmonhoc = 0 ;
        int qlsinhvien = 0;
        int qllienhe = 0;
        int qlphantramdiem = 0;
        try {
            qltaikhoan = Integer.parseInt(request.getParameter("qltaikhoan"));
            qldiem = Integer.parseInt(request.getParameter("qldiem"));
            qlmonhoc = Integer.parseInt(request.getParameter("qlmonhoc"));
            qlsinhvien = Integer.parseInt(request.getParameter("qlsinhvien"));
            qllienhe = Integer.parseInt(request.getParameter("qllienhe"));
            qlphantramdiem = Integer.parseInt(request.getParameter("qlphantramd"));
            System.out.println("try sus");
        } catch (Exception e) {
        }
        try {
            mavt = Integer.parseInt(request.getParameter("mavt"));
        } catch (Exception e) {
        }
        String btnthem = request.getParameter("btnthem");
        String btnupdate = request.getParameter("action");
        System.out.println("btn: "+btnupdate);
        
        if(btnthem != null){
            vaitro vt = new vaitro(mavt, tenvt, qltaikhoan, qldiem, qlmonhoc, qlsinhvien, qllienhe, qlphantramdiem);
            vt.them();
            response.sendRedirect(request.getHeader("referer"));
        }else if(btnupdate != null){
            if("Xóa".equals(btnupdate)){
                System.out.println("updatesus");
                vaitro vt = new vaitro(mavt, tenvt, qltaikhoan, qldiem, qlmonhoc, qlsinhvien, qllienhe, qlphantramdiem);
                vt.xoa();
                response.sendRedirect(request.getHeader("referer"));
            }
            else{
                vaitro vt = new vaitro(mavt, tenvt, qltaikhoan, qldiem, qlmonhoc, qlsinhvien, qllienhe, qlphantramdiem);
                vt.sua();
                response.sendRedirect(request.getHeader("referer"));
            }
        }
        else{
            request.getRequestDispatcher("web/qlvaitro.jsp").forward(request, response);
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
