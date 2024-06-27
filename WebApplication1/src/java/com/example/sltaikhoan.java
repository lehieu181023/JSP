/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example;

import com.Class.taikhoan;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "sltaikhoan", urlPatterns = {"/sltaikhoan"})
public class sltaikhoan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String taikhoan = request.getParameter("taikhoan");
        String matkhau = request.getParameter("matkhau");
        String duyet = request.getParameter("duyet");
        int vaitro = 1;
        String btn = request.getParameter("action");
        try {
            vaitro = Integer.parseInt(request.getParameter("vaitro"));
        } catch (Exception e) {
        }
        
        if("Them".equals(btn)) {
            taikhoan tk = new taikhoan(taikhoan, matkhau, duyet, vaitro);
            tk.them();
            response.sendRedirect(request.getHeader("referer"));
        }
        else if("Sua".equals(btn)) {
            taikhoan tk = new taikhoan(taikhoan, matkhau, duyet,vaitro);
            tk.sua();
            response.sendRedirect(request.getHeader("referer"));
        }
        else if("Xoa".equals(btn)) {
            taikhoan tk = new taikhoan(taikhoan, matkhau, duyet,vaitro);
            tk.xoa();
            response.sendRedirect(request.getHeader("referer"));
        }
        else{
            request.getRequestDispatcher("web/taikhoan.jsp").forward(request, response);
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
