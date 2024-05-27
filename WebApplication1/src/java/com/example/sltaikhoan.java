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
        String taikhoan = request.getParameter("taikhoan");
        String matkhau = request.getParameter("matkhau");
        String duyet = request.getParameter("duyet");
        String btn = request.getParameter("action");
        
        if("Them".equals(btn)) {
            taikhoan tk = new taikhoan(taikhoan, matkhau, duyet);
            tk.them();
            request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
        }
        else if("Sua".equals(btn)) {
            taikhoan tk = new taikhoan(taikhoan, matkhau, duyet);
            tk.sua();
            request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
        }
        else if("Xoa".equals(btn)) {
            taikhoan tk = new taikhoan(taikhoan, matkhau, duyet);
            tk.xoa();
            request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
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
