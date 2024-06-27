

<%@page import="com.Class.vaitro"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.Class.taikhoan" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@include file="headers.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>QLTAIKHOAN</title>
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
    
        <h1 class="text-center">-----------------------QUẢN LÝ TÀI KHOẢN-----------------------</h1>
        <div class="py-2">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
            THÊM TÀI KHOẢN
            </button>
        </div>
        <div class="modal" id="myModal">
            <div class="modal-dialog" >
                <div class="modal-content w-200">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Thêm tài khoản</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body w-200 ">
                    <div class="d-flex align-items-center ">
                        <div class="form-signin w-200 m-auto bg-body-tertiary py-4 px-4 " >
                            <form action="sltaikhoan" method="post">
                                <div class="">
                                        <label class="form-label align-items-center" for="mamh">Tài khoản: <span class="error"></span></label>
                                        <input class="form-control" type="text" name="taikhoan" id="mamh">
                                </div>
                                <div class="">
                                        <label class="control-label" for="monhoc">Mật khẩu: <span class="error"></span></label>
                                        <input class="form-control" type="password" name="matkhau" id="monhoc">
                                </div>
                                <div class="">
                                        <label class="control-label" for="vaitro">Vai trò:</label>
                                        <select class='form-select' name='vaitro' id='vaitro'>
                                            <% 
                                            vaitro vt = new vaitro();
                                            List<vaitro> lvt = vt.hienthi();
                                            for(int i = 0; i < lvt.size(); i++){
                                             %>                                                    
                                                    <option value='<%=lvt.get(i).getMavt()%>'><%=lvt.get(i).getTenvt()%></option>
                                            <%                                                
                                            }
                                            %>
                                        </select>                                           
                                </div>
                                <div class="">
                                    <label class="control-label">Duyệt:</label><br>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="duyet" id="gt1" value="on">
                                        <label class="form-check-label me-2" for="gt1">
                                            On
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="duyet" id="gt2" value="off" checked>
                                        <label class="form-check-label" for="gt2">
                                            Off
                                        </label>
                                    </div>
                                </div>
                                <div class="pt-3">
                                    <input class="btn btn-success" type="submit" name="action" id="submitBtn" value="Them">
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
                    <th>Tài khoản</th>
                    <th>Mật khẩu</th>
                    <th>Vai trò</th>
                    <th>Duyệt</th>
                    <th>Cập nhập</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        taikhoan tk = new taikhoan();
                        List<taikhoan> ltk = tk.hienthi();
                        String ck = "checked";
                        for(int i =0;i < ltk.size();i++){
                        if("off".equals(ltk.get(i).getDuyet())){
                            ck = "checked";
                        }
                        else{
                            ck = "";
                        }
                    %>
                    <form action='sltaikhoan' method='post'>
                        <input type='hidden' name='taikhoan' value='<%=ltk.get(i).getTaikhoan()%>'>
                        <tr>
                        <th>
                        <%=ltk.get(i).getTaikhoan()%>
                        </th>
                        <th>
                        <input class='form-control' type='text' name='matkhau' value='<%=ltk.get(i).getMatkhau()%>'";
                        </th>
                        <th>
                            <div class="">
                                <select class='form-select' name='vaitro' id='mySelect'>
                                    <%
                                    for(int j = 0; j < lvt.size();j++){
                                     if( ltk.get(i).getMavt() == (lvt.get(j).getMavt()) ){
                                            %>
                                            <option value='<%=lvt.get(j).getMavt()%>' selected><%=lvt.get(j).getTenvt()%></option>
                                    <%
                                        }
                                        else{
                                            %>
                                            <option value='<%=lvt.get(j).getMavt()%>'><%=lvt.get(j).getTenvt()%></option>
                                    <%
                                        }                                               
                                    }
                                    %>
                                </select>                                           
                            </div>
                        </th>
                        <th>
                            <div class='input-group'> 
                                <div class='form-check'>
                                    <input class='form-check-input' type='radio' name='duyet' id='gt1' value='on' checked >
                                    <label class='form-check-label me-2' for='gt1'>   
                                    on                        
                                    </label>                    
                                </div>
                            
                                <div class='form-check'>                
                                    <input class='form-check-input' type='radio' name='duyet' id='gt2' value='off' <%=ck%>>                    
                                    <label class='form-check-label' for='gt2'>           
                                    off               
                                    </label>         
                                </div> 
                            </div>
                        </th>                           
                        <th> 
                            <input class='btn btn-success ms-3 me-3' type='submit' name='action' value='Sua'>
                            <input class='btn btn-success' type='submit' name='action' value='Xoa'>                         
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

