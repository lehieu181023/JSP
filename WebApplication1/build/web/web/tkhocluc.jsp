<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.Class.sinhvien"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.Class.khoa"%>
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
    <link rel="stylesheet" href="config/phaohoa.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .error {
          color: red;
          font-size: 0.8em;
        }
    </style>
</head>
<body>
    <main class="mt-3 ms-3">
        <h1 class="text-center">Điểm tích lũy</h1>
        <div class="d-flex"> 
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                    Công bố
        </button>
        <form action="" method="get">
            <div class="py-2 d-flex">                
                <div class="mx-4">
                    <label class="control-label me-3" for="kkhoa">Khoa:</label>
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
                <div class="mx-4">
                    <label class="control-label" for="">Khóa học : <span class="error"></span></label>       
                    <input class="form-control" type="text" name="kkhoahoc">
                </div>
                <div class="mx-4">
                    <label class="control-label" for="">Số lượng : <span class="error"></span></label>       
                    <input class="form-control" type="text" name="soluong">
                </div>
                <input type="submit" class="btn btn-success" name="btnhb" value="Gửi">
            </div> 
        </form>
        </div>

        <div class="modal" id="myModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Danh sách sinh viên đạt yêu cầu</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>MASV</th>
                                        <th>Họ và tên</th>
                                        <th>Ngày sinh</th>
                                        <th>Giới tính</th>
                                        <th>Điểm TBCHT</th>
                                        <th>Học lực</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String mak = request.getParameter("kkhoa");
                                        String khoahoc = request.getParameter("kkhoahoc");
                                        String soluong = request.getParameter("soluong");
                                        if(mak != null && khoahoc != null && soluong != null){
                                        sinhvien sv = new sinhvien();
                                        List<sinhvien> lsv = sv.hienthi(mak,khoahoc,soluong);
                                        for(int i =0; i<lsv.size();i++){
                                            float num = lsv.get(i).getTBCHT();
                                            BigDecimal bd = new BigDecimal(Float.toString(num));
                                            bd = bd.setScale(2, RoundingMode.HALF_UP);
                                            float tbchp = bd.floatValue();
                                    %>
                                        <tr>
                                        <th>
                                        <%=lsv.get(i).getMasv()%>
                                        </th>
                                        <th>
                                        <%=lsv.get(i).getHoten()%>
                                        </th>
                                        <th>
                                        <%=lsv.get(i).getNgaysinh()%>
                                        </th>
                                        <th>
                                        <%=lsv.get(i).getGioitinh()%>
                                        </th>                           
                                        <th>
                                        <%=tbchp%>
                                        </th>
                                        <th>
                                        <%=lsv.get(i).getXeploai()%>                        
                                        </th>
                                        </tr>
                                    <%
                                        }}
                                    %>
                                </tbody>
                            </table>  
                        </div>
                    </div>

                    <!-- Modal Footer -->
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
                    <th>MASV</th>
                    <th>Họ và tên</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>Điểm TBCHT</th>
                    <th>Học lực</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        sinhvien sv2 = new sinhvien();
                        String htt = request.getParameter("paget");
                        List<sinhvien> lsv2;
                        if(htt !=null){
                            lsv2 = sv2.hienthi(htt);
                        }
                        else{
                            htt = "1";
                            lsv2 = sv2.hienthi(htt);
                        }
                        for(int i =0; i<lsv2.size();i++){
                            float num = lsv2.get(i).getTBCHT();
                            BigDecimal bd = new BigDecimal(Float.toString(num));
                            bd = bd.setScale(2, RoundingMode.HALF_UP);
                            float tbchp = bd.floatValue();
                    %>
                        <tr>
                        <th>
                        <%=lsv2.get(i).getMasv()%>
                        </th>
                        <th>
                        <%=lsv2.get(i).getHoten()%>
                        </th>
                        <th>
                        <%=lsv2.get(i).getNgaysinh()%>
                        </th>
                        <th>
                        <%=lsv2.get(i).getGioitinh()%>
                        </th>                           
                        <th>
                        <%=tbchp%>
                        </th>
                        <th>
                        <%=lsv2.get(i).getXeploai()%>                        
                        </th>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>  
        </div>  
<%@include file="chuyentrang.jsp"%>  
    </main> 
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>      
</body>
</html>


