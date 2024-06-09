<%@ page import="com.example.data_base_project.Dao.DAO_Produit" %>
<%@ page import="com.example.data_base_project.bean.ProduitAvecDemande" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: dELL
  Date: 02/06/2024
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Demmande de Produit</title>
        <!-- base:css -->
        <link rel="stylesheet" href="vendors/typicons/typicons.css">
        <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png"/>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            button {
                margin-right: 10px;
                padding: 10px 20px;
                background-color: #B00FF1;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #D4BADE;
            }

            .button-container {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Style pour les boutons */
            .button-container button {
                margin: 0 10px;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: #B00FF1;
                color: #fff;
                cursor: pointer;
            }

            /* Style pour les boutons au survol */
            .button-container button:hover {
                background-color: #D4BADE;
            }

            /* Style pour le container des tableaux */
            .table-container {
                margin-top: 10px;
                text-align: center;
                margin-left: 10px;
                max-width: 100%;

            }
        </style>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
    </head>
</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex justify-content-center" style="background-color: #D7BDE2">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="typcn typcn-th-menu"></span>
                </button>
            </div>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end"
             style="background-color: #D7BDE2">
            <ul class="navbar-nav mr-lg-2">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link" href="#" data-toggle="dropdown" id="profileDropdown">
                        <img src="images/admin.webp" alt="profile"/>
                        <span class="nav-profile-name">DR.Raja Hanbali</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item">
                            <i class="typcn typcn-cog-outline text-primary"></i>
                            Settings
                        </a>
                        <a class="dropdown-item">
                            <i class="typcn typcn-eject text-primary"></i>
                            Logout
                        </a>
                    </div>
                </li>
                <li class="nav-item nav-user-status dropdown">
                    <p class="mb-0">Admin de MediaTeK</p>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                <span class="typcn typcn-th-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->

    <div class="container-fluid page-body-wrapper">
        <!-- partial -->
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color: #D7BDE2;">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="dachbord.jsp">
                        <i class="typcn typcn-device-desktop menu-icon"></i>
                        <span class="menu-title">Dachbord</span>
                        <div class="badge badge-danger">new</div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="typcn typcn-device-desktop menu-icon"></i>
                        <span class="menu-title">Produit</span>
                        <div class="badge badge-danger">new</div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ListeClient.jsp">
                        <i class="typcn typcn-user menu-icon"></i>
                        <span class="menu-title">Client</span>
                        <div class="badge badge-danger">new</div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="fact.jsp">
                        <i class="typcn typcn-document-text menu-icon"></i>
                        <span class="menu-title">Facture</span>
                        <div class="badge badge-danger">new</div>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="main-panel">
            <div class="content-wrapper">
                <br>
                <br>
                <h3>Liste des produits selon la demande</h3>
                <br>
                <br>

                <%
                    DAO_Produit daoProduit = new DAO_Produit();
                    List<ProduitAvecDemande> produitAvecDemande = daoProduit.getProduitsWithDemande();
                %>
                <div class="container">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-example-modal-lg">
                        Forte
                    </button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-Moyenne-modal-lg">Moyenne
                    </button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-Faibe-modal-lg">
                        Faibe
                    </button>
                </div>


                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Demande Forte</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <hr>
                            <div class="table-responsive pt-3">
                                <table class="table table-striped project-orders-table">
                                    <thead>
                                    <tr>
                                        <th>ID Produit</th>
                                        <th>Designation</th>
                                        <th>Qte stock</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (ProduitAvecDemande chaiffreDaffaire : produitAvecDemande) {
                                            String categorie = chaiffreDaffaire.getDemande();
                                            System.out.println(categorie);
                                            if ("demande forte".equals(categorie)) {
                                    %>
                                    <tr>
                                        <td><%= chaiffreDaffaire.getId_prod() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getDesignation() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getQte_stock() %>
                                        </td>

                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


                <!---->
                <div class="modal fade bd-Moyenne-modal-lg" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Demande Moyenne</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <hr>
                                <div class="table-responsive pt-3">
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                        <tr>
                                            <th>ID Produit</th>
                                            <th>Designation</th>
                                            <th>Qte stock</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            for (ProduitAvecDemande chaiffreDaffaire : produitAvecDemande) {
                                                String categorie = chaiffreDaffaire.getDemande();
                                                if ("demande moyenne".equals(categorie)) {
                                        %>
                                        <tr>
                                            <
                                            <td><%= chaiffreDaffaire.getId_prod() %>
                                            </td>
                                            <td><%= chaiffreDaffaire.getDesignation() %>
                                            </td>
                                            <td><%= chaiffreDaffaire.getQte_stock() %>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!---->
                <div class="modal fade bd-Faibe-modal-lg" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Demande Faible</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <hr>
                                <div class="table-responsive pt-3">
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                        <tr>
                                            <th>ID Produit</th>
                                            <th>Designation</th>
                                            <th>Qte stock</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            for (ProduitAvecDemande chaiffreDaffaire : produitAvecDemande) {
                                                String categorie = chaiffreDaffaire.getDemande();
                                                if ("demande faible".equals(categorie)) {
                                        %>
                                        <tr>
                                            <
                                            <td><%= chaiffreDaffaire.getId_prod() %>
                                            </td>
                                            <td><%= chaiffreDaffaire.getDesignation() %>
                                            </td>
                                            <td><%= chaiffreDaffaire.getQte_stock() %>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---->
            </div>


        </div>
    </div>
</div>


</div>
</div>

</body>
</html>