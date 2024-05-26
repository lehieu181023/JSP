<%-- 
    Document   : page2
    Created on : May 25, 2024, 1:47:43 PM
    Author     : lehie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml"
   xmlns:h = "http://java.sun.com/jsf/html">
   
   <h:body>
      <h2>This is Page2</h2>
      <h:form>
         <h:commandButton action = "home?faces-redirect = true"
            value = "Back To Home Page" />
      </h:form>
   </h:body>
</html>
