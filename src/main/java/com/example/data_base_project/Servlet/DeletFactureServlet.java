package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.Dao_Facture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "deletFactureServlet", value = "/deletFactureServlet")
public class DeletFactureServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("factureId"));
        Dao_Facture daoFacture=new Dao_Facture();
        boolean test = daoFacture.deleteFactureById(id);
        if(test){
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Facture supprimé avec succès");
            response.sendRedirect("fact.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
    }
}
 
