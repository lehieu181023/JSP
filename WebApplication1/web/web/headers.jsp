<%@page import="com.Class.vaitro"%>
<%@page import="java.util.List"%>
<%@page import="com.Class.taikhoan"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpSession" %>

<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
  <script src="../assets/js/color-modes.js"></script>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.118.2">
  <title>Quản lý điểm</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

  <style>
    .main {
      background-image: url('./image/header23.png');
    }
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      width: 100%;
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }

    .btn-bd-primary {
      --bd-violet-bg: #712cf9;
      --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

      --bs-btn-font-weight: 600;
      --bs-btn-color: var(--bs-white);
      --bs-btn-bg: var(--bd-violet-bg);
      --bs-btn-border-color: var(--bd-violet-bg);
      --bs-btn-hover-color: var(--bs-white);
      --bs-btn-hover-bg: #6528e0;
      --bs-btn-hover-border-color: #6528e0;
      --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
      --bs-btn-active-color: var(--bs-btn-hover-color);
      --bs-btn-active-bg: #5a23c8;
      --bs-btn-active-border-color: #5a23c8;
    }

    .bd-mode-toggle {
      z-index: 1500;
    }

    .bd-mode-toggle .dropdown-menu .active .bi {
      display: block !important;
    }
  </style>


  <!-- Custom styles for this template -->
  <link href="web/headers.css" rel="stylesheet">
</head>

<body>

  <main class="main">
    <div class="container">
      <header
        class="d-flex align-items-center py-3 mb-4 border-bottom justify-content-center">
        <div class="col-md-3">
          <a href="index.php" class="d-inline-flex link-body-emphasis text-decoration-none">
            <img width="70" height="70"
              src="https://upload.wikimedia.org/wikipedia/commons/e/e8/Logo_Tr%C6%B0%E1%BB%9Dng_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_C%C3%B4ng_ngh%E1%BB%87_%C4%90%C3%B4ng_%C3%81_2015.png">
          </a>
        </div>
        <div>
          <ul class="nav">    
            <li class="nav-item mx-3"><a href="lienhe?bang=lienhe" class="nav-link px-2">TRANG CHỦ</a></li>
            <%  
                String username = (String) session.getAttribute("username");
                if(username != null){
                    taikhoan tk = new taikhoan();
                    tk = tk.hienthi(username);    
                    vaitro vt = new vaitro();
                    vt = vt.hienthi(tk.getMavt()); 
                    if(vt.getQldiem() == 1){
            %>
            <li class="nav-item mx-3"><a href="sldiem" class="nav-link px-2">ĐIỂM</a></li>
            <%
                    }
                    if(vt.getQlmonhoc()== 1){
            %>
            <li class="nav-item mx-3"><a href="slmonhoc?bang=qlmonhoc" class="nav-link px-2">MÔN HỌC</a></li>
            <%        
                    }
                    if(vt.getQlsinhvien()== 1){
            %>
            <li class="nav-item mx-3"><a href="slsinhvien?bang=qlsinhvien" class="nav-link px-2">SINH VIÊN</a></li>
            <%        
                    }
                    if(vt.getQllienhe()== 1){
            %>
            <li class="nav-item mx-3"><a href="adminlh" class="nav-link px-2">LIÊN HỆ</a></li>
            <%        
                    }
                    if(vt.getQltaikhoan()== 1){
            %>
            <li class="nav-item mx-3"><a href="sltaikhoan" class="nav-link px-2">TÀI KHOẢN</a></li>
            <%        
                    }
                    if(vt.getQlphantramdiem()== 1){
            %>
            <li class="nav-item mx-3"><a href="slphantramd" class="nav-link px-2">PHẦN TRĂM DIỂM</a></li>
            <%        
                    }
                } 
            %>
            <li class="nav-item mx-3"><a href="slhocluc?bang=qlsinhvien" class="nav-link px-2">HỌC LỰC</a></li>
            
            <%
                if(username != null){
                    if("admin".equals(username)){
                    %>
            <li class="nav-item mx-3"><a href="slvaitro" class="nav-link px-2">VAI TRÒ</a></li>
            <%
                    }
                }
            %>
          </ul>
        </div>
          <div>
              <% 
                    if (session != null) {
                        // Lấy giá trị của thuộc tính session
                        if (username != null) {
                            out.println("<a href='dangxuat'><button type='button' class='btn btn-primary'>ĐĂNG XUẤT</button></a>");
                        } else {
                            out.println("<a href='dangnhap'><button type='button' class='btn btn-primary'>ĐĂNG NHẬP</button></a>");
                        }
                    } else {
                        out.println("");
                    }
                %>
          </div>
      </header>
    </div>
  </main>
  <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
