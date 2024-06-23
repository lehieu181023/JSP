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
    <title>QLDIEM</title>
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
        <h1 class="text-center">Quản lý sinh viên</h1>
        <div class="py-2">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
            Thêm sinh viên
            </button>
        </div>
        <div class="modal" id="myModal">
            <div class="modal-dialog" >
                <div class="modal-content w-200">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Thêm sinh viên</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body w-200 ">
                    <div class="d-flex align-items-center ">
                        <div class="form-signin w-200 m-auto bg-body-tertiary py-4 px-4 " >
                            <form action="slsinhvien" method="post">
                                <div class="">
                                    <label class="form-label " for="masv">Mã sinh viên:<span class="error"></span> </label><br>
                                    <input class="form-control" type="text" name="masv" id="masv">   
                                </div>
                                <div class="">
                                        <label class="form-label align-items-center" for="khoa">Khoa: </label>
                                        <select class='form-select' name='kkhoa' id='mySelect'>
                                        <% 
                                            khoa k = new khoa();
                                            List<khoa> lk = k.hienthi();
                                            for(int j = 0; j < lk.size(); j++){
                                                    %> 
                                                    <option value='<%=lk.get(j).mak%>'><%=lk.get(j).tenk%></option>
                                        <%
                                            }
                                        %>
                                            </select>
                                </div>
                                <div class="">
                                        <label class="control-label" for="khoahoc">Khóa học:<span class="error"> </label></span><br>
                                        <input class="form-control" type="text" name="khoahoc" placeholder="">
                                </div>
                                <div class="">
                                        <label class="control-label" for="hoten">Họ và tên: <span class="error"></span></label><br>
                                        <input class="form-control" type="text" name="hoten" placeholder="">
                                </div>
                                <div class="">
                                        <label class="control-label">Ngày sinh : <span class="error"></span></label> <br>
                                        <input name= "date" type="date" class="form-control" style="width:auto" />
                                </div>
                                <div class="">
                                    <label class="control-label">Giới tính:</label><br>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gt" id="gt1" value="nam">
                                        <label class="form-check-label me-2" for="gt1">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gt" id="gt2" value="Nữ" checked>
                                        <label class="form-check-label" for="gt2">
                                            Nữ
                                        </label>
                                    </div>
                                </div>
                                <div class="me-5">
                                    <input class="btn btn-success" type="submit" name="btnthem" id="submitBtn" value="Thêm">
                                </div>
                            </form>
                        </div>
                    </div>                    
                    <script>
                        document.getElementById("submitBtn").addEventListener("click", function(event) {
                        let inputs = document.getElementsByTagName("input");
                        let errors = document.getElementsByClassName("error");
                        var currentDate = new Date();
                        var day = currentDate.getDate();
                        var month = currentDate.getMonth() + 1; // Thêm 1 vì getMonth() trả về từ 0 đến 11
                        var year = currentDate.getFullYear();
                        // Đảm bảo rằng các giá trị có hai chữ số bằng cách thêm '0' trước nếu cần
                        day = (day < 10) ? '0' + day : day;
                        month = (month < 10) ? '0' + month : month;
                        var formattedDate = year + '-' + month + '-' + day;
                            for (let i = 0; i < inputs.length; i++) {
                                if ((inputs[i].type !== "radio" && inputs[i].type !== "checkbox") && inputs[i].value === "") {
                                errors[i].innerText = "----Vui lòng điền thông tin";
                                event.preventDefault();
                                } 
                                else if (inputs[i].type === "date" && new Date(inputs[i].value.toString()) > new Date(formattedDate.toString())) {
                                errors[i].innerText = "----Ngày sinh không hợp lệ";
                                event.preventDefault();
                                }
                                else if(inputs[i].id === "masv" && isNaN(inputs[i].value) ){
                                    errors[i].innerText = "----Mã sinh viên phải là số";
                                    event.preventDefault();
                                } 
                                else {
                                    errors[i].innerText = "";
                                }
                            }
                        });
                    </script>
                    
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

                </div>
            </div>
        </div>
        
        <div class="table-responsive">
            <h:form>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                        <th>MASV</th>
                        <th>Khoa</th>
                        <th>Khóa học</th>
                        <th>Họ và tên</th>
                        <th>Ngày sinh</th>
                        <th>Giới tính</th>
                        <th>Cập nhập</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            sinhvien sv = new sinhvien();
                            String htt = request.getParameter("paget");
                            List<sinhvien> lsv;
                            if(htt !=null){
                                lsv = sv.hienthi(htt);
                            }
                            else{
                                htt = "1";
                                lsv = sv.hienthi(htt);
                            }                          
                            for(int i =0;i < lsv.size();i++){
                        %>
                        <form action='slsinhvien' method='post'>
                        <input type='hidden' name='masv' value='<%=lsv.get(i).getMasv()%>'>
                        <tr>
                        <th>
                        <%=lsv.get(i).getMasv()%>
                        </th>
                        <th>
                            <select class='form-select' name='kkhoa' id='mySelect'>
                        <% 
                            for(int j = 0; j < lk.size(); j++){
                                if(lsv.get(i).getNganh().equals(lk.get(j).mak) ){
                                    %>
                                    <option value='<%=lk.get(j).mak%>' selected><%=lk.get(j).tenk%></option>
                            <%
                                }
                                else{
                                    %>
                                    <option value='<%=lk.get(j).mak%>'><%=lk.get(j).tenk%></option>
                            <%
                                }
                            }
                        %>
                            </select>
                        </th>
                        <th>
                            <input class='form-control' type='text' name='khoahoc' value='<%=lsv.get(i).getKhoahoc()%>'>
                        </th>
                        <th>
                            <input class='form-control' type='text' name='hoten' value='<%=lsv.get(i).getHoten()%>'>
                        </th>
                        <th>
                        <span class'error'></span>
                        <input class='form-control' type='date' name='ngaysinh' value='<%=lsv.get(i).getNgaysinh()%>'>
                        </th>                           
                        <th>
                        <div class='input-group'> 
                        <div class='form-check'>
                            <input class='form-check-input' type='radio' name='gt' id='gt1' value='nam' checked>
                            <label class='form-check-label me-2' for='gt1'>   
                            Nam                        
                            </label>                    
                            </div>                
                            <div class='form-check'>                
                            <input class='form-check-input' type='radio' name='gt' id='gt2' value='Nữ' <%=lsv.get(i).ckgioitinh()%>>                    
                            <label class='form-check-label' for='gt2'>           
                            Nữ               
                            </label>         
                        </div> 
                        </div> 
                        </th>
                        <th> 
                        <input class='btn btn-success ms-3 me-3' type='submit' name='action' id='submitBtn' value='Sửa'>
                        <input class='btn btn-success' type='submit' name='action' value='Xóa'>                        
                        </th>
                        </tr>
                        </form>
                        <%
                            }
                        %>
                    </tbody>
                </table> 
            </h:form>
        </div>  
      <%@include file="chuyentrang.jsp"%>    
    </main>
                    
</body>
</html>



