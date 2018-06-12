/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solutec;

/**
 *
 * @author esic
 */
public class EmployesConstantes {

    public static final String URL = "jdbc:derby://localhost:1527/BaseTP";
    public static final String USER = "jee";
    public static final String MDP = "jee";
    public static final String requete = "SELECT * from IDENTIFIANTS";

    public static final String REQ_SELECT_TOUS = "SELECT * from EMPLOYES";
    public static final String URL2 = "jdbc:derby://localhost:1527/solutec";
    public static final String USER2 = "test";
    public static final String MDP2 = "test";

    public static final String REQ_SUPPRIMER = "DELETE from EMPLOYES where ID=?";
    public static final String REQ_4 = "INSERT INTO EMPLOYES (NOM, PRENOM, ADRESSE) VALUES '?','?','?','?'";
    public static final String REQ_SELECT_EMPLOYE = "SELECT * from EMPLOYES where ID=?";
    public static final String REQ_MODIF_EMPLOYE = "UPDATE EMPLOYES SET NOM=?, PRENOM=?, ADRESSE=?, EMAIL=? where ID =?";
    public static final String REQ_ADD_EMPLOYE = "INSERT INTO EMPLOYES(NOM, PRENOM, TELDOM, TELPORT, TELPRO, ADRESSE, CODEPOSTAL, VILLE, EMAIL) VALUES (?,?,?,?,?,?,?,?,?)";
    
    public static final String ACTION = "action";
    public static final String ACTION_SUPPRIMER = "Supprimer";
    public static final String ACTION_DETAILS = "Details";
    public static final String ACTION_MODIFIER = "Modifier";
    public static final String ACTION_VOIR_LISTE = "Voir liste";
    public static final String ACTION_LOGIN = "Login";
    public static final String ACTION_QUITTER = "Quitter";

    public static final String PAGE_INDEX = "accueil.jsp";
    public static final String PAGE_CONTROLEUR = "controleur.jsp";
    public static final String PAGE_TABLEAU = "tableau.jsp";
    public static final String PAGE_DETAIL_EMPLOYE = "DetailEmploye.jsp";
}
