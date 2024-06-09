package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Client;
import com.example.data_base_project.bean.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AddClientServlet", value = "/AddClientServlet")
public class AddClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Nom = request.getParameter("nom");
        String Prenom =request.getParameter("prenom");
        int Telephone = Integer.parseInt(request.getParameter("tel"));
       // int idclt = Integer.parseInt(request.getParameter("idclt"));


        Client client = new Client(Nom,Prenom,Telephone);

        DAO_Client  clientdao = new DAO_Client();
        clientdao.addClient(client);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Client Ajouté avec succès");
        RequestDispatcher rd =request.getRequestDispatcher("ListeClient.jsp");
        rd.forward(request, response);

    }
}
 
