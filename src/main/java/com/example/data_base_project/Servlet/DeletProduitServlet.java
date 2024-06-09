package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Produit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "deletProduitServlet", value = "/deletProduitServlet")
public class DeletProduitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prodIdParam = request.getParameter("idproduit");
        if (prodIdParam != null && !prodIdParam.isEmpty()) { // Vérification si le paramètre n'est pas null ou vide
            int prodId = Integer.parseInt(prodIdParam);
            DAO_Produit produit = new DAO_Produit();
            produit.deleteProduct(prodId);

            // Stocker le message de succès dans la session
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Produit supprimé avec succès");
            // Redirection vers la page
            response.sendRedirect("index.jsp");
        } else {
            // Si le paramètre est null ou vide, vous pouvez également afficher un message d'erreur ou simplement rediriger sans l'alerte de succès
            response.sendRedirect("dachbord.jsp");
        }


    }
}
 
