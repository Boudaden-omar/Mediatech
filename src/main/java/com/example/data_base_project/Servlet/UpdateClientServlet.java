package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Client;
import com.example.data_base_project.bean.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "updateClientServlet", value = "/updateClientServlet")
public class UpdateClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            // Récupérer les paramètres du formulaire
            String Nom = request.getParameter("nom");
            String Prenom =request.getParameter("prenom");
            int Telephone = Integer.parseInt(request.getParameter("tel"));
            int idclt = Integer.parseInt(request.getParameter("idclt"));


                // Créer un objet Client avec les nouvelles valeurs

            Client updatedClient=new Client(idclt,Nom,Prenom,Telephone);
                // Mettre à jour le Client dans la base de données
            DAO_Client daoClient=new DAO_Client();
            daoClient.updateClient(updatedClient);

                // Rediriger vers index.jsp
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Erreur de conversion de nombre : " + e.getMessage());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur serveur : " + e.getMessage());
        }
    }
}
 
