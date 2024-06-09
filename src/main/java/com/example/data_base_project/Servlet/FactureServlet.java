package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Client;
import com.example.data_base_project.Dao.DAO_Produit;
import com.example.data_base_project.Dao.Dao_Appartient;
import com.example.data_base_project.Dao.Dao_Facture;
import com.example.data_base_project.bean.Appartient;
import com.example.data_base_project.bean.Client;
import com.example.data_base_project.bean.Facture;
import com.example.data_base_project.bean.Prodct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "factureServlet", value = "/factureServlet")
public class FactureServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de l'ID du client
        String clientIdStr = request.getParameter("client");
        int clientId = Integer.parseInt(clientIdStr);

        // Récupération de la date de la facture
        String dateFacture = request.getParameter("datefacture");
       ////////////////////////////////////////////////////
        Facture facture=new Facture(dateFacture,clientId);
        Dao_Facture daoFacture=new Dao_Facture();
       int id_fact = daoFacture.store(facture);
       ////////////////////////////////////////////////////


        // Récupération des produits sélectionnés
        String[] productsArray = request.getParameterValues("cbx");
        List<String> products = productsArray != null ? Arrays.asList(productsArray) : null;

        // Utilisation des informations récupérées selon vos besoins
        DAO_Client daoClient = new DAO_Client();
        Client client = daoClient.getClientById(clientId);

        // Récupération des objets Produit à partir de leurs IDs
        DAO_Produit daoProduit = new DAO_Produit();
        List<Prodct> selectedProducts = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();
        //-------------------------------------------
        Appartient appartient;
        Dao_Appartient daoAppartient=new Dao_Appartient();
        //----------------------------------------
        //----------------------------------------

        //----------------------------------------
        if (products != null) {
            for (String productIdStr : products) {
                int productId = Integer.parseInt(productIdStr);
                Prodct produit = daoProduit.getProductById(productId);
                if (produit != null) {
                    selectedProducts.add(produit);
                    // Récupération de la quantité associée au produit
                    String quantityStr = request.getParameter("quantite_" + productId); // Assurez-vous d'avoir le bon nom pour chaque input
                    int quantity = Integer.parseInt(quantityStr);
                    quantities.add(quantity);
                    //-------------------------------
                    daoProduit.updateQte(quantity,productId);
                    //-------------------------------
                    //-------------------------------
                    System.out.println("id_fact: " + id_fact);
                    System.out.println("productId : " + productId);
                    System.out.println("quantity : " + quantity);
                     appartient=new Appartient(id_fact,productId,quantity);
                    daoAppartient.store(appartient);
                    //--------------------------
                }
            }
        }

        // Affichage des valeurs dans la console pour le test
        System.out.println("Client ID: " + clientId);
        System.out.println("Date Facture: " + dateFacture);
        if (selectedProducts != null && !selectedProducts.isEmpty()) {
            System.out.println("Produits sélectionnés: ");
            for (int i = 0; i < selectedProducts.size(); i++) {
                Prodct produit = selectedProducts.get(i);
                int quantite = quantities.get(i);
                System.out.println("- Produit: " + produit.getDESIGNATION()+ ", Quantité: " + quantite);
            }
        } else {
            System.out.println("Aucun produit sélectionné.");
        }

        // Stockage des informations dans la session
        HttpSession session = request.getSession();
        session.setAttribute("client", client);
        session.setAttribute("dateFacture", dateFacture);
        session.setAttribute("selectedProducts", selectedProducts);
        session.setAttribute("quantities", quantities);

        // Redirection vers une autre page JSP pour afficher ou poursuivre le traitement
        response.sendRedirect("factt.jsp");
    }
   /* protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de l'ID du client
        String clientIdStr = request.getParameter("client");
        int clientId = Integer.parseInt(clientIdStr);

        // Récupération de la date de la facture




        // Récupération des produits sélectionnés
        String[] productsArray = request.getParameterValues("products");
        List<String> products = productsArray != null ? Arrays.asList(productsArray) : null;

        // Utilisez les informations récupérées selon vos besoins
        String dateFacture = request.getParameter("datefacture");

        DAO_Client daoClient=new DAO_Client();
        Client client=daoClient.getClientById(clientId);

        // Récupération des objets Produit à partir de leurs IDs
        DAO_Produit daoProduit = new DAO_Produit();
        List<Prodct> selectedProducts = new ArrayList<>();
        for (String productIdStr : products) {
            int productId = Integer.parseInt(productIdStr);
            Prodct produit = daoProduit.getProductById(productId);
            if (produit != null) {
                selectedProducts.add(produit);
            }
        }
        // Par exemple, enregistrer dans une base de données, etc.





        // Pour tester, on peut afficher les valeurs dans la console
        System.out.println("Client ID: " + clientId);
        System.out.println("Date Facture: " + dateFacture);
        if (products != null) {
            System.out.println("Produits sélectionnés: " + String.join(", ", products));
        } else {
            System.out.println("Aucun produit sélectionné.");
        }
        // Stockage des informations dans la session
        HttpSession session = request.getSession();
        session.setAttribute("client", client);
        session.setAttribute("dateFacture", dateFacture);
        session.setAttribute("selectedProducts", selectedProducts);

        // Redirection ou réponse appropriée
        response.sendRedirect("factt.jsp");
    }*/
}
 
