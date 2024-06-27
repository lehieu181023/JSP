
<%@page import="com.Class.monhoc"%>
<%@page import="com.Class.khoa"%>
<%@page import="java.util.List"%>
<%@page import="com.Class.diem"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="headers.jsp"%>
<%
    String khoa = request.getParameter("kkhoa");
    String khoahoc = request.getParameter("kkhoahoc");
    String monhoc = request.getParameter("mmonhoc");
%>
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>
    
    <main class="mt-3 ms-3">
        <h1 class="text-center">Quản lý điểm</h1>
        <div class="d-flex py-2" >
            <div class="mt-3">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                Thêm danh sách điểm
                </button>
            </div>
            <div class="modal" id="myModal">
                <div class="modal-dialog" >
                    <div class="modal-content w-200">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm danh sách điểm</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body w-200 ">
                        <div class="d-flex align-items-center ">
                            <div class="form-signin w-200 m-auto bg-body-tertiary py-4 px-4 " >
                                <form action="sldiem" method="post">
                                    <div class="">
                                            <label class="form-label align-items-center" for="khoa">Khoa:</label>
                                            <select class='form-select' name='kkhoa' id='mySelect'>
                                            <% 
                                                khoa k = new khoa();
                                                List<khoa> lk = k.hienthi();
                                                for(int i = 0; i < lk.size(); i++){
                                                    if(khoa != null && khoa.equals(lk.get(i).mak) ){
                                                        %>
                                                        <option value='<%=lk.get(i).mak%>' selected><%=lk.get(i).tenk%></option>
                                                <%
                                                    }
                                                    else{
                                                        %>
                                                <option value='<%=lk.get(i).mak%>'><%=lk.get(i).tenk%></option>
                                                <%
                                                    }
                                                }
                                            %>
                                            </select>
                                    </div>
                                    <div class="">
                                            <label class="control-label" for="khoahoc">Khóa học: <span class="error"></span></label>
                                            <input class="form-control" type="text" name="khoahoc" id="khoahoc">
                                    </div>
                                    <div class="">
                                            <label class="control-label" for="monh">Môn học:</label>
                                            <select class='form-select' name='mmonhoc' id='mySelect'>
                                                <% 
                                                monhoc mh = new monhoc();
                                                List<monhoc> lmh = mh.hienthi();
                                                for(int i = 0; i < lmh.size(); i++){
                                                    if(monhoc != null && monhoc.equals(lmh.get(i).getMamh()) ){
                                                        %>
                                                        <option value='<%=lmh.get(i).getMamh()%>' selected><%=lmh.get(i).getTenmh()%></option>
                                                <%
                                                    }
                                                    else{
                                                        %>
                                                        <option value='<%=lmh.get(i).getMamh()%>'><%=lmh.get(i).getTenmh()%></option>
                                                <%
                                                    }
                                                }
                                            %>
                                            </select>                                           
                                    </div>
                                    <div class="pt-3">
                                        <input class="btn btn-success" type="submit" name="btnthem" id="submitBtn" value="Thêm">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <script>
                            document.getElementById("submitBtn").addEventListener("click", function(event) {
                            let inputs = document.getElementsByTagName("input");
                            let errors = document.getElementsByClassName("error");
                                for (let i = 0; i < inputs.length; i++) {
                                    if ((inputs[i].type !== "radio" && inputs[i].type !== "checkbox") && inputs[i].value === "") {
                                    errors[i].innerText = "----Vui lòng điền thông tin *";
                                    event.preventDefault();
                                    } else {
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
            <form action="" method="get">
            <div class="d-flex ">
                    <div class="mx-4">
                        <label class="control-label me-3 " for="kkhoa">Khoa:</label>
                        <select class='form-select' name='kkhoa' id='mySelect'>
                        <% 
                            for(int i = 0; i < lk.size(); i++){
                                if(khoa != null && khoa.equals(lk.get(i).mak) ){
                                    %>
                                    <option value='<%=lk.get(i).mak%>' selected><%=lk.get(i).tenk%></option>
                            <%
                                }
                                else{
                                    %>
                            <option value='<%=lk.get(i).mak%>'><%=lk.get(i).tenk%></option>
                            <%
                                }
                            }
                        %>
                        </select>
                    </div>
                    <div class="mx-4">
                        <label class="control-label" for="">Khóa học :</label>
                        <%
                            if(khoahoc != null){
                            %>
                            <input class="form-control" type="text" name="kkhoahoc" value="<%=khoahoc%>">
                        <%
                            }
                            else{
                                %>
                                   <input class="form-control" type="text" name="kkhoahoc" > 
                                <%
                            }
                        %>
                        
                    </div>
                    <div class="mx-4">
                        <label class="control-label" for="mmonhoc">Môn học :</label>
                        <select class='form-select' name='mmonhoc' id='mySelect'>
                            <% 
                            for(int i = 0; i < lmh.size(); i++){
                                if(monhoc != null && monhoc.equals(lmh.get(i).getMamh()) ){
                                    %>
                                    <option value='<%=lmh.get(i).getMamh()%>' selected><%=lmh.get(i).getTenmh()%></option>
                            <%
                                }
                                else{
                                    %>
                                    <option value='<%=lmh.get(i).getMamh()%>'><%=lmh.get(i).getTenmh()%></option>
                            <%
                                }
                            }
                        %>
                        </select>
                    </div>
                    <div class="mt-4">
                        <input class="btn btn-success" type="submit" name="btnhienthi" value="Hiển thị">
                    </div>
            </div>
            </form>
        </div>
        
        
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                    <th>Mã sinh viên</th>
                    <th>Họ và tên</th>
                    <th>Môn học</th></th>
                    <th>Điểm chuyên cần</th>
                    <th>Điểm giữa kỳ</th>
                    <th>Lần học</th>
                    <th>Lần thi</th>
                    <th>Điểm thi</th>
                    <th>Thang điểm 10</th>
                    <th>Điểm chữ</th>
                    <th>Ghi chú</th>
                    <th>Cập nhâp</th>
                    </tr>
                </thead>
                <tbody>
                    <%   
                        if(khoa != null && khoahoc != null && monhoc != null){
                            diem d = new diem();
                            List<diem> ld = d.hienthi(khoa, khoahoc, monhoc);
                            for(int i = 0; i< ld.size();i ++){
                    %>
                        <form action='sldiem' method='post'>
                            <input type='hidden' name='iddiem' value='<%=ld.get(i).getIddiem()%>'>
                            <tr>
                            <th>
                                <%=ld.get(i).getMasv()%>
                            </th>
                            <th>
                             <%=ld.get(i).getHoten()%>
                            </th>
                            <th>
                                <%=d.tenmonhoc(ld.get(i).getMamh()) %>
                            </th>
                            <th>
                                <input class= "form-control"  type="number"  name="diemcc" value="<%=ld.get(i).getDiemcc()%>">
                            </th>
                            <th>
                            <input class= "form-control"  type="number"  name="diemgk" value="<%=ld.get(i).getDiemgk()%>">
                            </th>
                            <th>
                                <input class= "form-control"  type="number"  name="lanhoc" value="<%=ld.get(i).getLanhoc()%>">
                            </th>                           
                            <th>
                            <input class= "form-control"  type="number"  name="lanthi" value="<%=ld.get(i).getLanthi()%>">
                            </th>
                            <th>
                            <input class= "form-control"  type="number"  name="dthi" value="<%=ld.get(i).getDthi()%>"> 
                            </th>
                            <th>
                            <div class="text-center">
                             <%=ld.get(i).getTbchp()%>
                            </div>
                            </th>
                            <th>
                            <div class="text-center">
                             <%=ld.get(i).getDchu()%>
                            </div>
                            </th>
                            <th>
                                <input class= "form-control"  type="text"  name="note" value="<%=ld.get(i).getNote()%>">
                            </th>
                            <th>
                            <div class="d-flex">
                            <input class='btn btn-success ms-3 me-3' type='submit' name='action' value='Sửa'>
                            <input class='btn btn-success' type='submit' name='action' value='Xóa'>
                            </div>                         
                            </th>
                            </tr>
                        </form>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>
    
</body>
</html>

