<%-- 
    Document   : index
    Created on : 31 mai 2018, 09:42:31
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Login - Gestion Employés</title>
    </head>
    <body>      



        <div class="container" style="margin-top:100px">
            <div class="col-md-4">

                <span style="color:red">          
                     <%
                Integer i = (Integer) request.getAttribute("cleI");
                if (i != null) {
                    if (i.equals(1)) {
                        out.println("Vous devez remplir tous les champs !");
                    } else if (i.equals(2)) {
                        out.println("il y a une erreur, Veuillez réessayer");
                    }
                }

            %>
                    
                </span>

                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Controleur" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Login" name="login" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mot de passe" name="mdp" type="password">
                                </div>

                                <input type="submit" name="action" value="Login" class="btn btn-primary"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
