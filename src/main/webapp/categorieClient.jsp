<%@ page import="com.example.data_base_project.Dao.Dao_ChaiffreDaffaire" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.data_base_project.bean.ChaiffreDaffaire" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolluxUI Admin</title>
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
<body>
<div class="container-scroller">
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
    <div class="container-fluid page-body-wrapper">
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
                <h3>Liste des clients selon la catégorie</h3>
                <br>
                <br>
                <%
                    Dao_ChaiffreDaffaire daoChaiffreDaffaire = new Dao_ChaiffreDaffaire();
                    List<ChaiffreDaffaire> chaiffreDaffaireList = daoChaiffreDaffaire.getClients();
                %>
                <div class="container">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-example-modal-lg">
                        VIP
                    </button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-clientordinaire-modal-lg">Client Ordinaire
                    </button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-clientpotentiel-modal-lg">
                        Client à Potentiel
                    </button>
                </div>


                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">VIP</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <hr>
                            <div class="table-responsive pt-3">
                                <table class="table table-striped project-orders-table">
                                    <thead>
                                    <tr>
                                        <th>ID Client</th>
                                        <th>ID Facture</th>
                                        <th>Nom</th>
                                        <th>Prénom</th>
                                        <th>Désignation Produit</th>
                                        <th>Prix</th>
                                        <th>Quantité Achetee</th>
                                        <th>Chiffre d'Affaire</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (ChaiffreDaffaire chaiffreDaffaire : chaiffreDaffaireList) {
                                            String categorie = chaiffreDaffaire.getCATEGORIE_CLIENT();
                                            if ("VIP".equals(categorie)) {
                                    %>
                                    <tr>
                                        <td><%= chaiffreDaffaire.getID_CLT() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getID_FACT() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getNOM() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getPRENOM() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getDESIGNATION() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getPRIX() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getQTE_ACHETEE() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getCHIFFRE_AFFAIRE() %>
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
                <div class="modal fade bd-clientordinaire-modal-lg" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Client Ordinaire</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <hr>
                            <div class="table-responsive pt-3">
                                <table class="table table-striped project-orders-table">
                                    <thead>
                                    <tr>
                                        <th>ID Client</th>
                                        <th>ID Facture</th>
                                        <th>Nom</th>
                                        <th>Prénom</th>
                                        <th>Désignation Produit</th>
                                        <th>Prix</th>
                                        <th>Quantité Achetee</th>
                                        <th>Chiffre d'Affaire</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (ChaiffreDaffaire chaiffreDaffaire : chaiffreDaffaireList) {
                                            String categorie = chaiffreDaffaire.getCATEGORIE_CLIENT();
                                            System.out.println(categorie);
                                            if ("client ordinaire".equals(categorie)) {
                                    %>
                                    <tr>
                                        <td><%= chaiffreDaffaire.getID_CLT() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getID_FACT() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getNOM() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getPRENOM() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getDESIGNATION() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getPRIX() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getQTE_ACHETEE() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getCHIFFRE_AFFAIRE() %>
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
                <div class="modal fade bd-clientpotentiel-modal-lg" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Client à Potentiel</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <hr>
                            <div class="table-responsive pt-3">
                                <table class="table table-striped project-orders-table">
                                    <thead>
                                    <tr>
                                        <th>ID Client</th>
                                        <th>ID Facture</th>
                                        <th>Nom</th>
                                        <th>Prénom</th>
                                        <th>Désignation Produit</th>
                                        <th>Prix</th>
                                        <th>Quantité Achetee</th>
                                        <th>Chiffre d'Affaire</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (ChaiffreDaffaire chaiffreDaffaire : chaiffreDaffaireList) {
                                            String categorie = chaiffreDaffaire.getCATEGORIE_CLIENT();
                                            if ("client … potentiel".equals(categorie)) {
                                    %>
                                    <tr>
                                        <td><%= chaiffreDaffaire.getID_CLT() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getID_FACT() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getNOM() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getPRENOM() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getDESIGNATION() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getPRIX() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getQTE_ACHETEE() %>
                                        </td>
                                        <td><%= chaiffreDaffaire.getCHIFFRE_AFFAIRE() %>
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

            </div>
        </div>
    </div>
</div>
</body>
</html>
