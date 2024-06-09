package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Produit;
import com.example.data_base_project.bean.Prodct;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RechercheProduitServlet", value = "/RechercheProduitServlet")
public class RechercheProduitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer le mot-clé de la requête
        String keyword = request.getParameter("keyword");

        // Appeler la méthode de recherche de produits
        DAO_Produit daoProduit=new DAO_Produit();
        List<Prodct> resultList=daoProduit.searchProduct(keyword);

        // Stocker les résultats dans la requête
        request.setAttribute("resultList", resultList);

        // Rediriger vers la page de résultats de recherche
        RequestDispatcher dispatcher = request.getRequestDispatcher("ResultatsRecherche.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 
