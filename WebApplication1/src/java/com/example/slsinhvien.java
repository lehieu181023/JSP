/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example;

import com.Class.sinhvien;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author lehie
 */
@MultipartConfig
public class slsinhvien extends HttpServlet {

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
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String hoten = request.getParameter("hoten");
        String masv = request.getParameter("masv");
        String khoahoc = request.getParameter("khoahoc");
        
        
        Date ngaysinh = new Date(2000, 01, 01);
        try {
            ngaysinh = formatter.parse(request.getParameter("date"));
        } catch (Exception e) {
        }
        String gioitinh = request.getParameter("gt");
        String nganh = request.getParameter("kkhoa");
        String btnthem = request.getParameter("btnthem");
        String btnupdate = request.getParameter("action");
        if(btnthem != null){
            try {
                Part part = request.getPart("photo");
                if(part != null&& part.getSize() > 0){ 
                    String realpart = request.getServletContext().getRealPath("/anhsv");
                    String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
                    if(!Files.exists(Path.of(realpart))){
                        Files.createDirectories(Path.of(realpart));
                    }
                    part.write(realpart + "/" +masv +".png");
                    sinhvien sv = new sinhvien(hoten, masv, khoahoc, ngaysinh, gioitinh, nganh,masv+".png");
                    sv.them();
                }
                else{                  
                    sinhvien sv = new sinhvien(hoten, masv, khoahoc, ngaysinh, gioitinh, nganh,"default.png");
                    sv.them();
                }
                response.sendRedirect(request.getHeader("referer"));
            } catch (Exception e) {
            }     
        }
        else if (btnupdate != null){
            if("Xóa".equals(btnupdate)){
                sinhvien sv = new sinhvien(hoten, masv, khoahoc, ngaysinh, gioitinh, nganh, masv+".png");
                sv.xoa();
                String realpart = request.getServletContext().getRealPath("/anhsv");
                Path fileToDelete = Paths.get(realpart, masv+".png");
                if (Files.exists(fileToDelete)) {
                    Files.delete(fileToDelete);
                }
                response.sendRedirect(request.getHeader("referer"));
            }
            else{
                Part part = request.getPart("photo");
                if(part != null&& part.getSize() > 0){
                    String realpart = request.getServletContext().getRealPath("/anhsv");
                    String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
                    if(!Files.exists(Path.of(realpart))){
                        Files.createDirectories(Path.of(realpart));
                    }
                    Path fileToDelete = Paths.get(realpart, masv+".png");
                    if (Files.exists(fileToDelete)) {
                        Files.delete(fileToDelete);
                    }
                    part.write(realpart + "/" +masv +".png");
                }
                sinhvien sv = new sinhvien(hoten, masv, khoahoc, ngaysinh, gioitinh, nganh, masv+".png");
                sv.sua();
                response.sendRedirect(request.getHeader("referer"));
            }
        }
        else{
            if(session.getAttribute("username")!=null){
                    request.getRequestDispatcher("web/qlsinhvien.jsp").forward(request, response);
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
