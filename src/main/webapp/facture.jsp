<%@ page import="com.example.data_base_project.Dao.DAO_Client" %>
<%@ page import="com.example.data_base_project.bean.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="Class.Produit" %>
<%@ page import="Class.DAO_Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ATLAS PRO ELECTRO
  Date: 01/06/2024
  Time: 09:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>MediaTech</title>
    <!-- Fonts -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
          rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="{{asset('css/style5.css')}}">
    <style>
        hr {
            width: 100%;
            height: 2px;
            background-color: #1de9b6;
        }
    </style>
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
    <!-- Styles -->
    <!-- checkbox -->
    <style>
        .checkbox-wrapper .cbx {
            -webkit-user-select: none;
            user-select: none;
            -webkit-tap-highlight-color: transparent;
            cursor: pointer;
        }
        .checkbox-wrapper .cbx span {
            display: inline-block;
            vertical-align: middle;
            transform: translate3d(0, 0, 0);
        }
        .checkbox-wrapper .cbx span:first-child {
            position: relative;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            transform: scale(1);
            vertical-align: middle;
            border: 1px solid #b9b8c3;
            transition: all 0.2s ease;
        }
        .checkbox-wrapper .cbx span:first-child svg {
            position: absolute;
            z-index: 1;
            top: 8px;
            left: 6px;
            fill: none;
            stroke: white;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
            stroke-dasharray: 16px;
            stroke-dashoffset: 16px;
            transition: all 0.3s ease;
            transition-delay: 0.1s;
            transform: translate3d(0, 0, 0);
        }
        .checkbox-wrapper .cbx span:first-child:before {
            content: "";
            width: 100%;
            height: 100%;
            background: #506eec;
            display: block;
            transform: scale(0);
            opacity: 1;
            border-radius: 50%;
            transition-delay: 0.2s;
        }
        .checkbox-wrapper .cbx span:last-child {
            margin-left: 8px;
        }
        .checkbox-wrapper .cbx span:last-child:after {
            content: "";
            position: absolute;
            top: 8px;
            left: 0;
            height: 1px;
            width: 100%;
            background: #b9b8c3;
            transform-origin: 0 0;
            transform: scaleX(0);
        }
        .checkbox-wrapper .cbx:hover span:first-child {
            border-color: #3c53c7;
        }

        .checkbox-wrapper .inp-cbx:checked + .cbx span:first-child {
            border-color: #3c53c7;
            background: #3c53c7;
            animation: check-15 0.6s ease;
        }
        .checkbox-wrapper .inp-cbx:checked + .cbx span:first-child svg {
            stroke-dashoffset: 0;
        }
        .checkbox-wrapper .inp-cbx:checked + .cbx span:first-child:before {
            transform: scale(2.2);
            opacity: 0;
            transition: all 0.6s ease;
        }
        .checkbox-wrapper .inp-cbx:checked + .cbx span:last-child {
            color: #b9b8c3;
            transition: all 0.3s ease;
        }
        .checkbox-wrapper .inp-cbx:checked + .cbx span:last-child:after {
            transform: scaleX(1);
            transition: all 0.3s ease;
        }

        @keyframes check-15 {
            50% {
                transform: scale(1.2);
            }
        }

    </style>
    <!-- checkbox -->
</head>

<body>

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
        <div class="col-md-12">
            <div class="card" style="box-shadow: none;">
                <div class="card-header bg-primary text-white">
                    Create new facture
                </div>
                <div class="card-body">
                    <form id="form_facture" method="post" action="factureServlet">
                        <div class="row">
                            <div class="col-md-6">
                                <span class="font-weight-bold">Client</span>
                                <hr>
                                <%
                                    DAO_Client dao = new DAO_Client();
                                    List<Client> clients = dao.getClients();
                                %>
                                <div class="form-group">
                                    <label for="client">Select client</label>
                                    <select name="client" id="client" class="form-control">
                                        <option value="0">---</option>
                                        <%for (Client client : clients) {%>
                                        <option value="<%= client.getId_clt()%>"><%= client.getNom()%> <%= client.getPrenom() %>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Date facture</label>
                                    <input type="date" class="form-control" name="datefacture" id="datefacture">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <span class="font-weight-bold">Product</span>
                                <hr>
                                <div class="form-group">
                                    <div id="alert_message" style="display: none;" class="alert alert-warning"
                                         role="alert"></div>
                                    <label>Select products</label><br>
                                    <%
                                        DAO_Product daoprod = new DAO_Product();
                                        List<Produit> products = daoprod.getProducts();

                                    %>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Produit</th>
                                            <th scope="col">Qte Demmander</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%  for (Produit product : products) {%>
                                        <tr>
                                            <th scope="row"> <input  type="checkbox" id="cbx" name="cbx" class="inp-cbx" value="<%= product.getID_PROD() %>" /></th>
                                            <td><span><%= product.getDESIGNATION()%></span></td>
                                            <td>  <input type="number" min="1" max="<%=product.getQTE_STOCK()%>" name="quantite_<%= product.getID_PROD() %>"  value="1"> <br></td>
                                        </tr>
                                            <% } %>
                                    </table>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary float-right" value="Submit">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<script>
    // Fonction pour valider les quantités avant la soumission du formulaire
    $('#form_facture').submit(function(event) {
        // Parcourir chaque champ de quantité
        $('input[type="number"]').each(function() {
            var quantite = parseInt($(this).val());
            var qteMax = parseInt($(this).attr('max'));
            if (quantite < 1 || quantite > qteMax) {
                alert('La quantité doit être comprise entre 1 et ' + qteMax);
                event.preventDefault(); // Empêche l'envoi du formulaire
                return false; // Arrête la boucle each
            }
        });
    });
</script>
<!-- base:js -->
<script src="vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="vendors/chart.js/Chart.min.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="js/off-canvas.js"></script>
<script src="js/hoverable-collapse.js"></script>
<script src="js/template.js"></script>
<script src="js/settings.js"></script>
<script src="js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="js/dashboard.js"></script>
<!-- End custom js for this page-->
</body>
</html>
