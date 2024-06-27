<%@page import="com.Class.ptrdiem"%>
<%@page import="com.Class.khoa"%>
<%@page import="java.util.List"%>
<%@page import="com.Class.sinhvien"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="headers.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
      xmlns:c="http://xmlns.jcp.org/jsp/jstl/core">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>QLPHANTRAMDIEM</title>
    <style>
        .error {
          color: red;
          font-size: 0.8em;
        }
    </style>
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <main class="mt-3 ms-3">
        <h1 class="text-center">Quản lý phần trăm điểm</h1>  
        <div class="table-responsive">
            <h:form>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                        <th>Phần trăm điểm chuyên cần</th>
                        <th>Phần trăm điểm giữa kỳ</th>
                        <th>Phần trăm điểm thi</th>
                        <th>Cập nhập</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ptrdiem ptrd = new ptrdiem();
                            ptrd = ptrd.hienthi();
                        %>
                        <form action='slphantramd' method='post' id="myForm">
                        <tr>
                        <th>
                            <input class='form-control' type='number' name='dcc' id="dcc" value='<%=ptrd.getDcc()%>'>
                        </th>
                        <th>
                            <input class='form-control' type='number' name='dgk' id="dgk" value='<%=ptrd.getDgk()%>'>
                        </th>
                        <th>
                            <input class='form-control' type='number' name='dt' id="dt" value='<%=ptrd.getDt()%>'>
                        </th>
                        <th> 
                        <span class="error"></span>
                        <input class='btn btn-success ms-3 me-3' type='submit' name='action' id='submitBtn' value='Sửa'>                       
                        </th>
                        </tr>
                        </form>
                        <%
                            
                        %>
                        <script>
                            document.getElementById("submitBtn").addEventListener("click", function(event) {
                                var num1 = parseInt(document.getElementById('dcc').value) || 0;
                                var num2 = parseInt(document.getElementById('dgk').value) || 0;
                                var num3 = parseInt(document.getElementById('dt').value) || 0;
                                let errors = document.getElementsByClassName("error");
                                var total = num1 + num2 + num3;

                                if (total !== 100) {
                                    errors[0].innerText = "----tổng không đủ 100";
                                    event.preventDefault();
                                } else {
                                    
                                }
                            });
                        </script>
                    </tbody>
                </table> 
            </h:form>
        </div>  
      <%@include file="chuyentrang.jsp"%>    
    </main>
                    
</body>
</html>




