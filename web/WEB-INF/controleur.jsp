<%-- 
    Document   : controleur
    Created on : 31 mai 2018, 09:43:07
    Author     : esic
--%>

<%@page import="com.solutec.EmployesConstantes"%>
<%@page import="com.solutec.Persistance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.solutec.EmployeeBean"%>
<%@page import="com.solutec.UtilBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            Connection conn;
            Statement stmt;
            ResultSet rs;

            Connection conn2;
            Statement stmt2;
            ResultSet rs2;

            conn = DriverManager.getConnection(EmployesConstantes.URL, EmployesConstantes.USER, EmployesConstantes.MDP);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(EmployesConstantes.requete);

            UtilBean user1 = new UtilBean();

            while (rs.next()) {
                user1.setLogin(rs.getString("login"));
                user1.setMdp(rs.getString("mdp"));
            }

            String loginSaisie = request.getParameter("login");
            String mdpSaisie = request.getParameter("mdp");

            int i = 0;
            if (loginSaisie != null && mdpSaisie != null) {

                if (loginSaisie.equals(user1.getLogin()) && mdpSaisie.equals(user1.getMdp())) {
                    Persistance p = new Persistance();
                    rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                    request.setAttribute("cleListe", p.getEmployes(rs2));
                    request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
//                String employe = p.getEmployes(requete2,nom.getNom());

                } else if (loginSaisie.equals("") || mdpSaisie.equals("")) {
                    i = 1;
                    request.setAttribute("cleI", i);
                    request.getRequestDispatcher(EmployesConstantes.PAGE_INDEX).forward(request, response);

                } else {
                    i = 2;
                    request.setAttribute("cleI", i);
                    request.getRequestDispatcher(EmployesConstantes.PAGE_INDEX).forward(request, response);

                }
            }

            String btn = request.getParameter("bouton");
            String cleId = request.getParameter("idClient");

            if (btn != null) {
                if (btn.equals(EmployesConstantes.ACTION_SUPPRIMER)) {
                    Persistance p = new Persistance();
                    //ResultSet rs3 = stmt.executeQuery(EmployesContantes.REQ_SUPPRIMER);
                    p.supprimer(EmployesConstantes.REQ_SUPPRIMER, cleId);

                    rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                    request.setAttribute("cleListe", p.getEmployes(rs2));

                    request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
                }
//                if (btn.equals("Inserer")) {
//                    Persistance p = new Persistance();
//                    String Nom = getAttribute(Persistance.cleNom);
//
//                    p.inserer(EmployesContantes.REQ_4, Nom, clePrenom, cleAdresse, cleEmail);
//
//                    rs2 = p.getConnexion(EmployesContantes.REQ_SELECT_TOUS);
//                    request.setAttribute("cleListe", p.getEmployes(rs2));
//
//                    request.getRequestDispatcher("tableau.jsp").forward(request, response);
//                }

                if (btn.equals(EmployesConstantes.ACTION_DETAILS)) {
                    Persistance p = new Persistance();
                    String cleEmp = request.getParameter("idClient");
                    session.setAttribute("cleEmpSession", cleEmp);
                    rs2 = p.getDetail(EmployesConstantes.REQ_SELECT_EMPLOYE, cleEmp);
                    request.setAttribute("cleEmp", p.getEmp(rs2));
                    request.getRequestDispatcher(EmployesConstantes.PAGE_DETAIL_EMPLOYE).forward(request, response);

                }

                if (btn.equals(EmployesConstantes.ACTION_VOIR_LISTE)) {
                    Persistance p = new Persistance();
                    rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                    request.setAttribute("cleListe", p.getEmployes(rs2));
                    request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
                }

                if (btn.equals(EmployesConstantes.ACTION_MODIFIER)) {
                    Persistance p = new Persistance();
                    cleId = (String) session.getAttribute("cleEmpSession");
                    String cleNom = request.getParameter("nom");
                    String clePrenom = request.getParameter("prenom");
                    String cleAdresse = request.getParameter("adresse");
                    String cleEmail = request.getParameter("email");
                    p.modifier(EmployesConstantes.REQ_MODIF_EMPLOYE, cleEmail, clePrenom, cleAdresse, cleNom, cleId);

                    rs2 = p.getDetail(EmployesConstantes.REQ_SELECT_EMPLOYE, cleId);
                    request.setAttribute("cleEmp", p.getEmp(rs2));
                    request.getRequestDispatcher(EmployesConstantes.PAGE_DETAIL_EMPLOYE).forward(request, response);
                }

                if (btn.equals(EmployesConstantes.ACTION_QUITTER)) {
                    response.sendRedirect(EmployesConstantes.PAGE_INDEX);
                }
            }
        %>
    </body>
</html>
