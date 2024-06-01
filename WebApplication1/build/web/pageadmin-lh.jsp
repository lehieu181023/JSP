<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title>Adminstrator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>

<style>
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
  .full-width {
            width: 100%;
            /* Chi?u cao b?ng 100% chi?u cao viewport */
        }
</style>


<!-- Custom styles for this template -->
<link href="pageadmin.css" rel="stylesheet">
</head>
<body>
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="bootstrap" viewBox="0 0 118 94">
          <title>Bootstrap</title>
          <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
        </symbol>
        <symbol id="home" viewBox="0 0 16 16">
          <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>
        <symbol id="speedometer2" viewBox="0 0 16 16">
          <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
          <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
        </symbol>
        <symbol id="table" viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
        </symbol>
        <symbol id="people-circle" viewBox="0 0 16 16">
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
          <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
        </symbol>
        <symbol id="grid" viewBox="0 0 16 16">
          <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
        </symbol>
      </svg>
<main class="d-flex flex-nowrap">
<h1 class="visually-hidden">Sidebars examples</h1>
<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">
  <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
    <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
    <span class="fs-4">Administrator</span>
  </a>
<hr>
  <ul class="nav nav-pills flex-column mb-auto">
    <li class="nav-item">
      <a href="#" class="nav-link text-white btn btn-primary text-start w-100">
        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
        home      
      </a>
    </li>
    <li>
      <a href="adminqltk" class="nav-link text-white btn btn-primary text-start w-100">
        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
        Quản lý tài khoản
      </a>
    </li>
    <li>
      <a href="adminlh" class="nav-link text-white btn btn-primary text-start w-100">
        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
        Liên hệ
      </a>
    </li>
  </ul>
<hr>
  <div class="dropdown">
    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      <img src="data:image/png;base64,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" alt="" width="32" height="32" class="rounded-circle me-2">
      <strong>Admin</strong>
    </a>
    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
      <li><a class="dropdown-item" href="lienhe">Page web</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="dangxuat">Sign out</a></li>
    </ul>
  </div>
</div>
<div class="b-example-divider b-example-vr"></div>
<div>
 <%@ include file="lienhe.jsp" %>
</div>
</main>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="sidebars.js"></script>
</body>
</html>



