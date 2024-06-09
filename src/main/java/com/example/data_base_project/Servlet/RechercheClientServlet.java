package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Client;
import com.example.data_base_project.bean.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "rechercheClientServlet", value = "/rechercheClientServlet")
public class RechercheClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer le mot-clé de la requête
        String keyword = request.getParameter("keyword");

        // Appeler la méthode de recherche de produits
        DAO_Client daoClient=new DAO_Client();
        List<Client> resultList=daoClient.searchClient(keyword);

        // Stocker les résultats dans la requête
       // request.setAttribute("clients", resultList);
        HttpSession session = request.getSession();
        session.setAttribute("clients", resultList);
        response.sendRedirect("ResultatsRechercheClient.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 
