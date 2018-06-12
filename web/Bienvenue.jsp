<%-- 
    Document   : Bienvenue
    Created on : 31 mai 2018, 10:50:24
    Author     : esic
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.solutec.EmployeeBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<EmployeeBean> listUser2 = (ArrayList<EmployeeBean>) request.getAttribute("cleListe");
            int i;       
            for (i = 0; i < listUser2.size(); i++){
            out.println("Votre nom est " + listUser2.get(i).getNom());
            }


        %>
    </body>
</html>
