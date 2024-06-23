<%@page import="java.util.List"%>
<%@page import="com.Class.monhoc"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="headers.jsp"%>
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
        <h1 class="text-center">Quản lý môn học</h1>
        <div class="py-2">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
            Thêm môn học
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
                            <form action="slmonhoc" method="post">
                                <div class="">
                                        <label class="form-label align-items-center" for="mamh">Mã môn học: <span class="error"></span></label>
                                        <input class="form-control" type="text" name="mamh" id="mamh">
                                </div>
                                <div class="">
                                        <label class="control-label" for="monhoc">Môn học: <span class="error"></span></label>
                                        <input class="form-control" type="text" name="monhoc" id="monhoc">
                                </div>
                                <div class="">
                                        <label class="control-label" for="tinchi">Số tín chỉ: <span class="error"></span></label>
                                        <input class="form-control" type="text" name="sotinchi" id="tinchi">
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
                    <th>Mã môn học</th>
                    <th>Môn học</th></th>
                    <th>Số tín chỉ</th>
                    <th>Cập nhập</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        monhoc mh = new monhoc();
                        String htt = request.getParameter("paget");
                        List<monhoc> lmh ;
                        if(htt !=null){
                                lmh = mh.hienthi(htt);
                            }
                            else{
                                htt = "1";
                                lmh = mh.hienthi(htt);
                            }  
                        for(int i =0 ; i<lmh.size();i++){
                    %>
                   <form action='slmonhoc' method='post'>
                   <input type='hidden' name='mamh' value='<%=lmh.get(i).getMamh()%>'>
                   <tr>
                   <th>
                   <%=lmh.get(i).getMamh()%>
                   </th>
                   <th>
                       <input class='form-control' type='text' name='monhoc' value='<%=lmh.get(i).getTenmh()%>'>
                   </th>
                   <th>
                       <input class='form-control' type='text' name='sotinchi' value='<%=lmh.get(i).getSotinchi()%>'>
                   </th>                           
                   <th> 

                   <input class='btn btn-success ms-3 me-3' type='submit' name='action' value='Sửa'>
                   <input class='btn btn-success' type='submit' name='action' value='Xóa'>                         
                   </th>
                   </tr>
                   </form>
                   <%}%>
                </tbody>
            </table>
        </div>
        <%@include file="chuyentrang.jsp"%>  
    </main>
    
</body>
</html>
