/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example;

import com.Class.diem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lehie
 */
public class sldiem extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        String khoa = request.getParameter("kkhoa");
        String khoahoc = request.getParameter("khoahoc");
        String monhoc = request.getParameter("mmonhoc");
        String btnthem = request.getParameter("btnthem");
        String btnupdate = request.getParameter("action");
        String iddiem = request.getParameter("iddiem");
        String diemcc = request.getParameter("diemcc");
        String diemgk = request.getParameter("diemgk");
        String lanhoc = request.getParameter("lanhoc");
        String lanthi = request.getParameter("lanthi");
        String diemthi = request.getParameter("dthi");
        String note = request.getParameter("note");
        double diemccd = 0;
        double diemgkd = 0;
        int lanhocd = 0;
        int lanthid = 0;
        double diemthid = 0;
        try {
            diemccd = Double.parseDouble(diemcc);
            diemgkd = Double.parseDouble(diemgk);
            lanhocd = Integer.parseInt(lanhoc);
            lanthid = Integer.parseInt(lanthi);
            diemthid = Double.parseDouble(diemthi);        
        } catch (Exception e) {
        }
        if(btnthem != null){
            diem d = new diem();
            d.them(khoa,khoahoc,monhoc);
            response.sendRedirect(request.getHeader("referer"));
        }
        else if(btnupdate != null){
            diem d = new diem(iddiem,diemccd,diemgkd,lanhocd,lanthid,diemthid,note);
            if("Xóa".equals(btnupdate)){
                d.xoa();
            }
            else{
                d.sua();
            }
            response.sendRedirect(request.getHeader("referer"));
        }
        else{
            if(session.getAttribute("username")!=null){
                    request.getRequestDispatcher("web/qldiem.jsp").forward(request, response);
                }
            else{
                request.getRequestDispatcher("web/index.jsp").forward(request, response);
            }
            
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
