/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solutec;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author esic
 */
public class Controleur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

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

            String action;

            Persistance p;

            String cleNom;
            String clePrenom;
            String cleAdresse;
            String cleEmail;
            String cleTeldom;
            String cleTelport;
            String cleTelpro;
            String cleCodepostal;
            String cleVille;

            while (rs.next()) {
                user1.setLogin(rs.getString("login"));
                user1.setMdp(rs.getString("mdp"));
            }

            String loginSaisie = request.getParameter("login");
            String mdpSaisie = request.getParameter("mdp");

            int i = 0;
            if (loginSaisie != null && mdpSaisie != null) {

                if (loginSaisie.equals(user1.getLogin()) && mdpSaisie.equals(user1.getMdp())) {
                    p = new Persistance();
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
            
            if (btn == null) {
                request.getRequestDispatcher(EmployesConstantes.PAGE_INDEX).forward(request, response);
            }
            if (btn != null) {

                switch (btn) {

                    case (EmployesConstantes.ACTION_SUPPRIMER):
                        p = new Persistance();
                        p.supprimer(EmployesConstantes.REQ_SUPPRIMER, cleId);
                        rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                        request.setAttribute("cleListe", p.getEmployes(rs2));
                        request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_AJOUTER):
                        request.getRequestDispatcher("test.jsp").forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_ANNULER):
                        p = new Persistance();
                        rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                        request.setAttribute("cleListe", p.getEmployes(rs2));
                        request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_INSERER):
                        p = new Persistance();
                        //cleId = (String) session.getAttribute("cleEmpSession");
                        cleNom = request.getParameter("nom");
                        clePrenom = request.getParameter("prenom");
                        cleTeldom = request.getParameter("teldom");
                        cleTelport = request.getParameter("telport");
                        cleTelpro = request.getParameter("telpro");
                        cleAdresse = request.getParameter("adresse");
                        cleCodepostal = request.getParameter("codepostal");
                        cleVille = request.getParameter("ville");
                        cleEmail = request.getParameter("email");

                        p.inserer(EmployesConstantes.REQ_ADD_EMPLOYE, cleEmail, clePrenom, cleAdresse, cleNom, cleTeldom, cleTelport, cleTelpro, cleCodepostal, cleVille);

                        rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                        request.setAttribute("cleListe", p.getEmployes(rs2));
                        request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_DETAILS):
                        p = new Persistance();
                        String cleEmp = request.getParameter("idClient");
                        session.setAttribute("cleEmpSession", cleEmp);
                        rs2 = p.getDetail(EmployesConstantes.REQ_SELECT_EMPLOYE, cleEmp);
                        request.setAttribute("cleEmp", p.getEmp(rs2));
                        request.getRequestDispatcher(EmployesConstantes.PAGE_DETAIL_EMPLOYE).forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_VOIR_LISTE):
                        p = new Persistance();
                        rs2 = p.getConnexion(EmployesConstantes.REQ_SELECT_TOUS);
                        request.setAttribute("cleListe", p.getEmployes(rs2));
                        request.getRequestDispatcher(EmployesConstantes.PAGE_TABLEAU).forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_MODIFIER):
                        p = new Persistance();
                        cleId = (String) session.getAttribute("cleEmpSession");
                        cleNom = request.getParameter("nom");
                        clePrenom = request.getParameter("prenom");
                        cleAdresse = request.getParameter("adresse");
                        cleEmail = request.getParameter("email");
                        p.modifier(EmployesConstantes.REQ_MODIF_EMPLOYE, cleEmail, clePrenom, cleAdresse, cleNom, cleId);

                        rs2 = p.getDetail(EmployesConstantes.REQ_SELECT_EMPLOYE, cleId);
                        request.setAttribute("cleEmp", p.getEmp(rs2));
                        request.getRequestDispatcher(EmployesConstantes.PAGE_DETAIL_EMPLOYE).forward(request, response);
                        break;

                    case (EmployesConstantes.ACTION_QUITTER):
                        response.sendRedirect(EmployesConstantes.PAGE_INDEX);
                        break;

                }
            }
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(Controleur.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(Controleur.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
  
        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(Controleur.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
        
        
            () {
        return "Short description";
        }// </editor-fold>

     
}
