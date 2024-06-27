

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.Class.vaitro" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@include file="headers.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>QLVAITRO</title>
    <style>
        .error {
          color: red;
          font-size: 0.8em;
        }
        .full-width {
            width: 100%;
            height: 100vh; /* Chiều cao bằng 100% chiều cao viewport */
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
    
        <h1 class="text-center">Quản lý vai trò</h1>
        <div class="py-2">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
            THÊM VAI TRÒ
            </button>
        </div>
        <div class="modal" id="myModal">
            <div class="modal-dialog" >
                <div class="modal-content w-200">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Thêm vai trò</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body w-200 ">
                    <div class="d-flex align-items-center ">
                        <div class="form-signin w-200 m-auto bg-body-tertiary py-4 px-4 " >
                            <form action="slvaitro" method="post">
                                <div class="">
                                        <label class="control-label" for="vaitro">Vai trò: <span class="error"></span></label>
                                        <input class="form-control" type="text" name="tenvt" id="vaitro">
                                </div>
                                <div class="">
                                    <label class="control-label">Quyền :</label><br>
                                     <div class='form-check'>
                                        <input class='form-check-input' type='checkbox' name='qltaikhoan' id='qltaikhoan' value='1'>
                                        <input class='form-check-input' type='hidden' name='qltaikhoan' value='0'>
                                        <label class='form-check-label me-2' for='qltaikhoan'>   
                                        Quản lý tài khoản                    
                                        </label>                    
                                    </div>
                                    <div class='form-check'>
                                        <input class='form-check-input' type='checkbox' name='qldiem' id='qldiem' value='1'>
                                        <input class='form-check-input' type='hidden' name='qldiem'value='0'>
                                        <label class='form-check-label me-2' for='qldiem'>   
                                        Quản lý điểm                  
                                        </label>                    
                                    </div>
                                    <div class='form-check'>
                                        <input class='form-check-input' type='checkbox' name='qlmonhoc' id='qlmonhoc' value='1'>
                                        <input class='form-check-input' type='hidden' name='qlmonhoc'value='0'>
                                        <label class='form-check-label me-2' for='qlmonhoc'>   
                                        Quản lý môn học                   
                                        </label>                    
                                    </div>
                                    <div class='form-check'>
                                        <input class='form-check-input' type='checkbox' name='qlsinhvien' id='qlsinhvien' value='1'>
                                        <input class='form-check-input' type='hidden' name='qlsinhvien'value='0'>
                                        <label class='form-check-label me-2' for='qlsinhvien'>   
                                        Quản lý sinh viên                  
                                        </label>                    
                                    </div>
                                    <div class='form-check'>
                                        <input class='form-check-input' type='checkbox' name='qllienhe' id='qllienhe' value='1'>
                                        <input class='form-check-input' type='hidden' name='qllienhe'value='0'>
                                        <label class='form-check-label me-2' for='qllienhe'>   
                                        Quản lý liên hệ                   
                                        </label>                    
                                    </div>
                                    <div class='form-check'>
                                        <input class='form-check-input' type='checkbox' name='qlphantramd' id='qlphantramd' value='1'>
                                        <input class='form-check-input' type='hidden' name='qlphantramd'value='0'>
                                        <label class='form-check-label me-2' for='qlphantramd'>   
                                        Quản lý phần trăm điểm                  
                                        </label>                    
                                    </div>
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
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                    <th>Vai trò</th>
                    <th>Quyền</th>
                    <th>Cập nhập</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        vaitro vt = new vaitro();
                        List<vaitro> lvt = vt.hienthi();
                        String ckqldiem ="";
                        String ckqltaikhoan ="";
                        String ckqlmonhoc ="";
                        String ckqlsinhvien ="";
                        String ckqllienhe ="";
                        String ckqlphantramd ="";
                        for(int i =0;i < lvt.size();i++){
                        if(lvt.get(i).getQldiem()==1){
                            ckqldiem ="checked";
                        }
                        else{
                            ckqldiem = "";
                        }
                        if(lvt.get(i).getQltaikhoan()==1){
                            ckqltaikhoan ="checked";
                        }
                        else{
                            ckqltaikhoan = "";
                        }
                        if(lvt.get(i).getQlmonhoc()==1){
                            ckqlmonhoc ="checked";
                        }
                        else{
                            ckqlmonhoc = "";
                        }
                        if(lvt.get(i).getQlsinhvien()==1){
                            ckqlsinhvien ="checked";
                        }
                        else{
                            ckqlsinhvien= "";
                        }
                        if(lvt.get(i).getQlphantramdiem()==1){
                            ckqlphantramd ="checked";
                        }
                        else{
                            ckqlphantramd = "";
                        }
                        if(lvt.get(i).getQllienhe()==1){
                            ckqllienhe ="checked";
                        }
                        else{
                            ckqllienhe= "";
                        }
                    %>
                    <form action='slvaitro' method='post'>
                        <input type='hidden' name='mavt' value='<%=lvt.get(i).getMavt()%>'>
                        <tr>
                        <th>
                        <input class='form-control' type='text' name='tenvt' value='<%=lvt.get(i).getTenvt()%>'";
                        </th>
                        <th>
                            <div class='form-check'>
                                <input class='form-check-input' type='checkbox' name='qltaikhoan' id='qltaikhoan<%=i%>' value='1' <%=ckqltaikhoan%>>
                                <input class='form-check-input' type='hidden' name='qltaikhoan'value='0'>
                                <label class='form-check-label me-2' for='qltaikhoan<%=i%>'>   
                                Quản lý tài khoản                    
                                </label>                    
                            </div>
                            <div class='form-check'>
                                <input class='form-check-input' type='checkbox' name='qldiem' id='qldiem<%=i%>' value='1' <%=ckqldiem%>>
                                <input class='form-check-input' type='hidden' name='qldiem'value='0'>
                                <label class='form-check-label me-2' for='qldiem<%=i%>'>   
                                Quản lý điểm                  
                                </label>                    
                            </div>
                            <div class='form-check'>
                                <input class='form-check-input' type='checkbox' name='qlmonhoc' id='qlmonhoc<%=i%>' value='1' <%=ckqlmonhoc%>>
                                <input class='form-check-input' type='hidden' name='qlmonhoc'value='0'>
                                <label class='form-check-label me-2' for='qlmonhoc<%=i%>'>   
                                Quản lý môn học                   
                                </label>                    
                            </div>
                            <div class='form-check'>
                                <input class='form-check-input' type='checkbox' name='qlsinhvien' id='qlsinhvien<%=i%>' value='1' <%=ckqlsinhvien%>>
                                <input class='form-check-input' type='hidden' name='qlsinhvien'value='0'>
                                <label class='form-check-label me-2' for='qlsinhvien<%=i%>'>   
                                Quản lý sinh viên                  
                                </label>                    
                            </div>
                            <div class='form-check'>
                                <input class='form-check-input' type='checkbox' name='qllienhe' id='qllienhe<%=i%>' value='1' <%=ckqllienhe%>>
                                <input class='form-check-input' type='hidden' name='qllienhe'value='0'>
                                <label class='form-check-label me-2' for='qllienhe<%=i%>'>   
                                Quản lý liên hệ                   
                                </label>                    
                            </div>
                            <div class='form-check'>
                                <input class='form-check-input' type='checkbox' name='qlphantramd' id='qlphantramd<%=i%>' value='1' <%=ckqlphantramd%>>
                                <input class='form-check-input' type='hidden' name='qlphantramd'value='0'>
                                <label class='form-check-label me-2' for='qlphantramd<%=i%>'>   
                                Quản lý phần trăm điểm                  
                                </label>                    
                            </div>

                        </th>
                        <th> 
                            <input class='btn btn-success ms-3 me-3' type='submit' name='action' value='Sửa'>
                            <input class='btn btn-success' type='submit' name='action' value='Xóa'>                         
                        </th>
                        </tr>
                    </form>    
                    <% 
                        
                        }
                        
                    %>
                </tbody>
            </table>
        </div>
    </main>
    
</body>
</html>
<%
    
%>

