/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example;

import com.Class.monhoc;
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
public class slmonhoc extends HttpServlet {

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
        String mamh = request.getParameter("mamh");
        String tenmh = request.getParameter("monhoc");
        int sotinchi = 0;
        try {
            sotinchi = Integer.parseInt(request.getParameter("sotinchi"));
        } catch (Exception e) {
        }
        String btnthem = request.getParameter("btnthem");
        String btnupdate = request.getParameter("action");
        if(btnthem != null){
            monhoc mh = new monhoc(mamh, tenmh, sotinchi);
            mh.them();
            response.sendRedirect(request.getHeader("referer"));
        }
        else if (btnupdate != null){
            if("Xóa".equals(btnupdate)){
                monhoc mh = new monhoc(mamh, tenmh, sotinchi);
                mh.xoa();
                response.sendRedirect(request.getHeader("referer"));
            }
            else{
                monhoc mh = new monhoc(mamh, tenmh, sotinchi);
                mh.sua();
                response.sendRedirect(request.getHeader("referer"));
            }
        }
        else{
            if(session.getAttribute("username")!=null){
                    request.getRequestDispatcher("web/qlmonhoc.jsp").forward(request, response);
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
