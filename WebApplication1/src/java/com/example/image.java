/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import javax.servlet.annotation.WebServlet;


/**
 *
 * @author lehie
 */
public class image extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/jpeg");
        OutputStream out = response.getOutputStream();

        // Lấy tham số từ URL
        String imageId = request.getParameter("id");

        // Xác định đường dẫn tới tệp hình ảnh dựa trên tham số
        String imagePath;
        if ("1".equals(imageId)) {
            imagePath = "/path/to/image1.jpg";
        } else if ("2".equals(imageId)) {
            imagePath = "/path/to/image2.jpg";
        } else {
            // Hình ảnh mặc định hoặc xử lý trường hợp không tìm thấy
            imagePath = "/path/to/default.jpg";
        }

        // Đọc tệp hình ảnh và ghi nó vào luồng phản hồi
        try (InputStream in = new FileInputStream(imagePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
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
