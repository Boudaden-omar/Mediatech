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

@WebServlet(name = "updateProduitServlet", value = "/updateProduitServlet")
public class UpdateProduitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            // Récupérer les paramètres du formulaire
            String idProdParam = request.getParameter("prodId");
            String designation = request.getParameter("designation");
            String quantityParam = request.getParameter("quantity");
            String prixParam = request.getParameter("prix");

            // Journaliser les paramètres pour le débogage
            System.out.println("IdProd: " + idProdParam);
            System.out.println("Designation: " + designation);
            System.out.println("Quantity: " + quantityParam);
            System.out.println("Prix: " + prixParam);

            if (idProdParam != null && designation != null && quantityParam != null && prixParam != null) {
                int idProd = Integer.parseInt(idProdParam);
                int quantity = Integer.parseInt(quantityParam);
                float prix = Float.parseFloat(prixParam);

                // Créer un objet Prodct avec les nouvelles valeurs
                Prodct updatedProduct = new Prodct(idProd, designation, prix, quantity);

                // Mettre à jour le produit dans la base de données
                DAO_Produit daoProduit = new DAO_Produit();
                daoProduit.updateProduct(updatedProduct);

                // Rediriger vers index.jsp
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Paramètres du formulaire manquants ou invalides.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Erreur de conversion de nombre : " + e.getMessage());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur serveur : " + e.getMessage());
        }

    }
}
 
