package com.example.data_base_project.Servlet;

import com.example.data_base_project.Dao.DAO_Produit;
import com.example.data_base_project.bean.Prodct;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ajouterProduit", value = "/ajouterProduit")
@MultipartConfig
public class AjouterProduit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Designation = request.getParameter("Designation");
        float prix = Float.parseFloat(request.getParameter("prix"));
        int quantity =Integer.parseInt(request.getParameter("quantity"));
       // int IdProd =Integer.parseInt(request.getParameter("IdProd"));
        Prodct p=new Prodct(Designation,prix,quantity);

        DAO_Produit daoProduit=new DAO_Produit();
        daoProduit.addProduct(p);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Produit Ajouté avec succès");
        RequestDispatcher rd =request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
}
 
