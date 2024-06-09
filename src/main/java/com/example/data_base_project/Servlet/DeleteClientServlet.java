package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "deleteClientServlet", value = "/deleteClientServlet")
public class DeleteClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("clientId"));
        DAO_Client client = new DAO_Client();
        boolean test = client.removeClient(id);
        if(test){
            response.sendRedirect("ListeClient.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }


    }
}
 
