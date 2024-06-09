<%--
  Created by IntelliJ IDEA.
  User: dELL
  Date: 01/06/2024
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<%@ page import="com.example.data_base_project.Dao.DAO_Produit" %>
<%@ page import="Class.Produit" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.example.data_base_project.bean.Prodct" %>
<%@ page import="com.example.data_base_project.Dao.DAO_Client" %>
<%@ page import="com.example.data_base_project.bean.Client" %>
<%@ page import="com.example.data_base_project.bean.Facture" %>
<%@ page import="com.example.data_base_project.Dao.Dao_Facture" %>
<%@ page import="net.minidev.json.JSONArray" %>
<%@ page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Admin</title>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
        .search-form {
            display: inline-block;
            background-color: #f2f2f2;
            border-radius: 4px;
            padding: 8px;
        }

        .search-input {
            width: 200px;
            height: 30px;
            padding: 4px;
            margin-right: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-button {
            height: 38px;
            padding: 4px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .icon-xl {
            font-size: 2rem; /* Ajustez cette taille selon vos besoins */
        }
        .text-secondary {
            color: #6c757d; /* Couleur secondaire Bootstrap */
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<html>
<body cz-shortcut-listen="true">
<%
    DAO_Client daoclient = new DAO_Client();
    List<Client> clients = daoclient.getClients();

    Dao_Facture daoFacture = new Dao_Facture();
    List<Facture> factureList = daoFacture.getFacture();

    DAO_Produit dao = new DAO_Produit();
    List<Prodct> products = dao.getProducts();




    // Initialiser les tableaux pour les désignations et les quantités en stock
    String[] designations = new String[products.size()];
    int[] qteStock = new int[products.size()];

    // Remplir les tableaux avec les données des produits
    for (int i = 0; i < products.size(); i++) {
        designations[i] = products.get(i).getDESIGNATION();  // Suppose que la méthode getName() renvoie la désignation du produit
        qteStock[i] = products.get(i).getQTE_STOCK();  // Suppose que la méthode getQuantity() renvoie la quantité en stock du produit
    }

    Gson gson = new Gson();
    String designationsJson = gson.toJson(designations);
    String qteStockJson = gson.toJson(qteStock);
%>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex justify-content-center" style="background-color:#D7BDE2">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <a class="navbar-brand brand-logo" href="index.jsp"><img
                        src="images/MediaTek-removebg-preview.png" style="height:170px"
                        alt="logo"/></a>
                <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/MediaTek-removebg-preview.png" style="height:170px"
                                                                              alt="logo"/></a>
                <button class="navbar-toggler navbar-toggler align-self-center" type="button"
                        data-toggle="minimize">
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
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-4 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                    <div>
                                        <p class="mb-2 text-md-center text-lg-left">Total Produit</p>
                                        <h1 class="mb-0"><%=
                                        products.size() %>
                                        </h1>
                                    </div>
                                    <i class="fas fa-box icon-xl text-secondary"></i>
                                </div>
                                <canvas id="expense-chart" height="80"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                    <div>
                                        <p class="mb-2 text-md-center text-lg-left">Total Client</p>
                                        <h1 class="mb-0"><%= clients.size()%></h1>
                                    </div>
                                    <i class="fas fa-user icon-xl text-secondary"></i>
                                </div>
                                <canvas id="budget-chart" height="80"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                    <div>
                                        <p class="mb-2 text-md-center text-lg-left">Total Facture</p>
                                        <h1 class="mb-0"><%=factureList.size()%></h1>
                                    </div>
                                    <i class="typcn typcn-clipboard icon-xl text-secondary"></i>
                                </div>
                                <canvas id="balance-chart" height="80"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="chartjs-size-monitor">
                                <div class="chartjs-size-monitor-expand">
                                    <div class=""></div>
                                </div>
                                <div class="chartjs-size-monitor-shrink">
                                    <div class=""></div>
                                </div>
                            </div>
                            <h4 class="card-title">Produit en Fonction Quantité Stock</h4>
                            <div class="card-body">
                                <div>
                                    <canvas id="myChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- partial -->
    </div>
    <!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<script>
    const labels = <%= designationsJson %>;
    const data = {
        labels: labels,
        datasets: [{
            label: 'Quantité en Stock',
            data: <%= qteStockJson %>,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 205, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(201, 203, 207, 0.2)'
            ],
            borderColor: [
                'rgb(255, 99, 132)',
                'rgb(255, 159, 64)',
                'rgb(255, 205, 86)',
                'rgb(75, 192, 192)',
                'rgb(54, 162, 235)',
                'rgb(153, 102, 255)',
                'rgb(201, 203, 207)'
            ],
            borderWidth: 1
        }]
    };
    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
    };


    var myChart = new Chart(
        document.getElementById('myChart'),
        config
    );
</script>
<!-- base:js -->
<script src="vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<!--<script src="js/off-canvas.js"></script>-->
<script src="js/hoverable-collapse.js"></script>
<script src="js/template.js"></script>
<script src="js/settings.js"></script>
<script src="js/todolist.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<script src="vendors/chart.js/Chart.min.js"></script>
<!-- End plugin js for this page -->
<!-- Custom js for this page-->
<script src="js/chart.js"></script>
<!-- End custom js for this page-->


</body>
</html>