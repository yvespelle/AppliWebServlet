<%-- 
    Document   : tableau
    Created on : 31 mai 2018, 15:59:36
    Author     : esic
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.solutec.EmployeeBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Liste des Employés</title>
    </head>
    <body>

        <div class="container" >
            <div class="row col-md-6 col-md-offset-0 custyle">

                <form method="post" action="controleur.jsp" name="suppression">
                    <table class="table table-striped custab">

                        <thead>
                        <h1>Liste des employés</h1>
                        <tr class="text-center">
                            <th>Sél</th>
                            <th>NOM</th>
                            <th>PRENOM</th>
                            <th>TEL DOMICILE</th>
                            <th>TEL PORTABLE</th>
                            <th>TEL PRO</th>
                            <th>ADRESSE</th>
                            <th>CODE POSTAL</th>
                            <th>VILLE</th>
                            <th>EMAIL</th>
                        </tr>
                        </thead>

                        </tr>
                        <%
                    ArrayList<EmployeeBean> listUser2 = (ArrayList<EmployeeBean>) request.getAttribute("cleListe");
                    int i;
                    for (i = 0; i < listUser2.size(); i++) {
                %>
                <tr> 
                    <td>  <INPUT TYPE="radio" NAME='idClient' VALUE="<%out.println(listUser2.get(i).getId());%>" CHECKED ></td>
                    <td> <span style="color: blueviolet"> <% out.println(listUser2.get(i).getNom());%></span></td>
                    <td>  <% out.println(listUser2.get(i).getPrenom());%>    </td>
                    <td>  <% out.println(listUser2.get(i).getTeldom());%>    </td>
                    <td>      </td>
                    <td>  <% out.println(listUser2.get(i).getTelpro());%>    </td>
                    <td>  <% out.println(listUser2.get(i).getAdresse());%>    </td>
                    <td>  <% out.println(listUser2.get(i).getCodepostal());%>    </td>
                    <td>  <% out.println(listUser2.get(i).getVille());%>    </td>
                    <td>  <% out.println(listUser2.get(i).getEmail());%>    </td>

                    <% } %>
                </tr>    
                    <input type='submit' name="bouton" value="Quitter" onclick="twFermer()" />
                    <input type='submit' name="bouton" value="Supprimer"/>                                     
                    <input type='submit' name="bouton" value="Details"/>
                    
                </form>
            </div>
        </div>         
    </body>
</html>











