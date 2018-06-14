package com.solutec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author esic
 */
public class Persistance {

    Connection conn2;
    Statement stmt2;
    ResultSet rs2;
    PreparedStatement pstmt2;
    EmployeeBean eb2;
    
   

    public ResultSet getConnexion(String requete2) throws ClassNotFoundException {
        try {
            conn2 = DriverManager.getConnection(EmployesConstantes.URL2, EmployesConstantes.USER2, EmployesConstantes.MDP2);
            stmt2 = conn2.createStatement();
            rs2 = stmt2.executeQuery(requete2);
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (SQLException sqle) {
            System.out.println("ERREUR : " + sqle.getMessage());
        }
        return rs2;
    }

    ArrayList<EmployeeBean> listEmployes = null;

    public ArrayList getEmployes(ResultSet rs2) {
        listEmployes = new ArrayList<EmployeeBean>();
        try {

            while (rs2.next()) {
                EmployeeBean eb2 = new EmployeeBean();
                eb2.setId(rs2.getString("ID"));
                eb2.setNom(rs2.getString("NOM"));
                eb2.setAdresse(rs2.getString("ADRESSE"));
                eb2.setCodepostal(rs2.getString("CODEPOSTAL"));
                eb2.setEmail(rs2.getString("EMAIL"));
                eb2.setPrenom(rs2.getString("PRENOM"));
                eb2.setTeldom(rs2.getString("TELDOM"));
                eb2.setTelport(rs2.getString("TELPORT"));
                eb2.setTelpro(rs2.getString("TELPRO"));
                eb2.setVille(rs2.getString("VILLE"));

                listEmployes.add(eb2);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }
        return listEmployes;
    }

//            eb2.setNom(request.getParameter("NOM"));
//            eb2.setNom(request.getParameter("NOM"));
//    request.setAttribute("cleListe", listEmployes);
//    request.getRequestDispatcher ("Bienvenue.jsp").forward(request, response);
    public void supprimer(String requete, String cleId) throws SQLException {
        try {
            conn2 = DriverManager.getConnection(EmployesConstantes.URL2, EmployesConstantes.USER2, EmployesConstantes.MDP2);
            pstmt2 = conn2.prepareStatement(EmployesConstantes.REQ_SUPPRIMER);
            pstmt2.setString(1, cleId);
            pstmt2.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void inserer(String requete, String cleEmail, String clePrenom, String cleAdresse, String cleNom, String cleTeldom, String cleTelport, String cleTelpro, String cleCodepostal, String cleVille) throws SQLException {
        try {
            conn2 = DriverManager.getConnection(EmployesConstantes.URL2, EmployesConstantes.USER2, EmployesConstantes.MDP2);
            pstmt2 = conn2.prepareStatement(requete);
            pstmt2.setString(1, cleNom);
            pstmt2.setString(2, clePrenom);
            pstmt2.setString(3, cleTeldom);
            pstmt2.setString(4, cleTelport);
            pstmt2.setString(5, cleTelpro);
            pstmt2.setString(6, cleAdresse);
            pstmt2.setString(7, cleCodepostal);
            pstmt2.setString(8, cleVille);
            pstmt2.setString(9, cleEmail);
            pstmt2.executeUpdate();
            System.out.println("");
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public EmployeeBean getEmp(ResultSet rs2) {
        try {

            while (rs2.next()) {
                eb2 = new EmployeeBean();
                eb2.setId(rs2.getString("ID"));
                eb2.setNom(rs2.getString("NOM"));
                eb2.setAdresse(rs2.getString("ADRESSE"));
                eb2.setCodepostal(rs2.getString("CODEPOSTAL"));
                eb2.setEmail(rs2.getString("EMAIL"));
                eb2.setPrenom(rs2.getString("PRENOM"));
                eb2.setTeldom(rs2.getString("TELDOM"));
                eb2.setTelport(rs2.getString("TELPORT"));
                eb2.setTelpro(rs2.getString("TELPRO"));
                eb2.setVille(rs2.getString("VILLE"));

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }
        return eb2;
    }

    public ResultSet getDetail(String requete, String cleId) throws SQLException {
        try {
            conn2 = DriverManager.getConnection(EmployesConstantes.URL2, EmployesConstantes.USER2, EmployesConstantes.MDP2);
            pstmt2 = conn2.prepareStatement(EmployesConstantes.REQ_SELECT_EMPLOYE);
            pstmt2.setString(1, cleId);
            rs2 = pstmt2.executeQuery();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rs2;

    }

    public void modifier(String requete, String cleEmail, String clePrenom, String cleAdresse, String cleNom, String cleId) throws SQLException {
        try {
            conn2 = DriverManager.getConnection(EmployesConstantes.URL2, EmployesConstantes.USER2, EmployesConstantes.MDP2);
            pstmt2 = conn2.prepareStatement(EmployesConstantes.REQ_MODIF_EMPLOYE);
            pstmt2.setString(5, cleId);
            pstmt2.setString(1, cleNom);
            pstmt2.setString(2, clePrenom);
            pstmt2.setString(3, cleAdresse);
            pstmt2.setString(4, cleEmail);
            int i = pstmt2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
