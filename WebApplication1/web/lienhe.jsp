<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.Class.lienhe" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>LienHe</title>
    <style>
        .error {
          color: red;
          font-size: 0.8em;
        }
    </style>
    <link rel="stylesheet" href="phaohoa.css">
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
        <h1 class="text-center">-------------------------------Liên Hệ-------------------------------</h1>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Comments</th>
                    <th>Ngày gửi</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        lienhe lh = new lienhe();
                        List<lienhe> llh = lh.hienthi();
                        for(int i =0; i < llh.size();i++){
                    %>
                        <tr>
                            <th>
                                <%=llh.get(i).name %>
                            </th>
                            <th>
                                <%=llh.get(i).email %>
                            </th>
                            <th>
                                <%=llh.get(i).comment %>
                            </th>
                            <th>
                                <%=llh.get(i).ngaygui %>
                            </th>                           
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>  
        </div>  

    </main> 
           
</body>
</html>



