

<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBconnect"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int paget = 1;
    try {
            paget = Integer.parseInt(request.getParameter("paget")) ;
        } catch (Exception e) {
        }
    int pagetrai = paget-1;
    int pagephai = paget+1;
    if(paget<=1){
        pagetrai = paget;
    }    
    String bang = request.getParameter("bang");
%>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form action="" method="get">
                <!-- Nút "Sang trái" -->
                <input type="hidden" name="bang" value="<%=bang%>">
                <input type="hidden" name="paget" value="<%=pagetrai%>">
                <button class="btn btn-primary" type="submit"><</button>
            </form>
        </div>
        <div class="col-md-6 text-end">
            <form action="" method="get">
                <!-- Nút "Sang phải" -->
                <input type="hidden" name="bang" value="<%=bang%>">
                <input type="hidden" name="paget" value="<%=pagephai%>">
                <button class="btn btn-primary">></button>
            </form>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
      <form action="" method="get"> 
          <input type="hidden" name="bang" value="<%=bang%>">
<%
    DBconnect db = new DBconnect();
    if(bang != null){
        String sql = "SELECT COUNT(*) FROM " + bang;
        db = db.getrs(sql);
        ResultSet rs = db.getRs();
        int trang = 0;
        if(rs.next()){
            trang = rs.getInt(1);
        }
        int dem=0;
        for (int i = 1; i <= trang; i = i + 8) {
            dem++;
                %>
                
                
                <input class="btn btn-dark" type="submit" name="paget" value="<%=dem%>">
                
                <%
            }   
                %>
         </form>       
            </div>
        </div>
    </div>
   <%}%>
                
                
