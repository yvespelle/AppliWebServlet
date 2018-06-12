<%-- 
    Document   : DetailEmploye
    Created on : 1 juin 2018, 13:28:05
    Author     : esic
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.solutec.EmployeeBean"%>
<%@page import="com.solutec.EmployeeBean"%>
<%@page import="com.solutec.UtilBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>

        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <form class="form-horizontal" action="Controleur" >
                    <fieldset>
                        <legend>Détails de ${cleEmp.prenom} ${cleEmp.nom}</legend>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Nom</label>
                            <div class="col-sm-10">
                                <input type="text" name="nom" value="${cleEmp.nom}"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Prénom</label>
                            <div class="col-sm-10">
                                <input type="text" name="prenom"  value="${cleEmp.prenom}" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Tél dom</label>
                            <div class="col-sm-10">
                                <input type="text" name="teldom" value="${cleEmp.teldom}"  class="form-control">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Tél pro</label>
                            <div class="col-sm-10">
                                <input type="text" name="telpro" value="${cleEmp.telpro}" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Adresse</label>
                            <div class="col-sm-4">
                                <input type="text" name="adresse" value="${cleEmp.adresse}" class="form-control">
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">Code postal</label>
                            <div class="col-sm-4">
                                <input type="text" name="codepostal" value="${cleEmp.codepostal}" class="form-control">
                            </div>
                        </div>

                        <label class="col-sm-2 control-label" for="textinput">Ville</label>
                        <div class="col-sm-4">
                            <input type="text" name="ville" value="${cleEmp.ville}" class="form-control">
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Adresse e-mail</label>
                            <div class="col-sm-4">
                                <input type="text" name="email" value="${cleEmp.email}" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="pull-right">
                                    <input type="submit" name="bouton" value="Modifier" class="btn btn-primary">
                                    <button type="submit" name="bouton" value="Voir liste" class="btn btn-default" >Voir liste</button>
                                    <button type='submit' name="bouton" value="Quitter" class="btn btn-danger"  >Quitter</button>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</body>
</html>















