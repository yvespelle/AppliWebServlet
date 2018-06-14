<%-- 
    Document   : tableau
    Created on : 31 mai 2018, 15:59:36
    Author     : esic
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <form method="post" action="Controleur" name="suppression">
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
                    
                        <table>

                            <c:forEach items="${cleListe}" var="unePersonne">
                                <tr>
                                    <td>  <INPUT TYPE="radio" NAME='idClient' VALUE="${unePersonne.id}" CHECKED ></td>
                                    <td> <span style="color: blueviolet"> ${unePersonne.nom} </span></td>
                                    <td> ${unePersonne.nom} </td>
                                    <td> ${unePersonne.prenom} </td>
                                    <td> ${unePersonne.teldom} </td> 
                                    <td> ${unePersonne.telpro} </td>
                                    <td> ${unePersonne.adresse} </td>                            
                                    <td> ${unePersonne.codepostal} </td>
                                    <td> ${unePersonne.ville} </td>
                                    <td> ${unePersonne.email} </td>
                                </tr>

                            </c:forEach>
                        </table>

                        <input type='submit' name="bouton" value="Quitter" onclick="twFermer()" />
                        <input type='submit' name="bouton" value="Supprimer"/>                                     
                        <input type='submit' name="bouton" value="Details"/>
                        <input type='submit' name="bouton" value="Ajouter"/>
                </form>
            </div>
        </div>         
    </body>
</html>











