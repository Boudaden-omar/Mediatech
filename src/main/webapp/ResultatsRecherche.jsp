<%@ page import="com.example.data_base_project.bean.Prodct" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ATLAS PRO ELECTRO
  Date: 11/05/2024
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
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
    <link rel="shortcut icon" href="images/favicon.png" />
    <style>
        .no-results-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .no-results {
            font-size: 1.2em;
            color: #ff0000;
            opacity: 0;
            transition: opacity 2s;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .no-results.show {
            opacity: 1;
        }
    </style>
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
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false"
                       aria-controls="charts">
                        <i class="typcn typcn-chart-pie-outline menu-icon"></i>
                        <span class="menu-title">Charts</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="charts">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>

        <!-- partial -->
        <div class="main-panel"  >
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="table-responsive pt-3">
                                <table class="table table-striped project-orders-table">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Désignation</th>
                                        <th>Prix</th>
                                        <th>Quantité en stock</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% List<Prodct> resultList = (List<Prodct>)request.getAttribute("resultList");
                                        if (resultList != null && !resultList.isEmpty()) { %>

                                    <% for (Prodct produit : resultList) { %>
                                    <tr>
                                        <td><%=produit.getID_PROD()%></td>
                                        <td><%=produit.getDESIGNATION()%></td>
                                        <td><%=produit.getPRIX()%></td>
                                        <td><%=produit.getQTE_STOCK()%></td>
                                    </tr>

                                    <% } %>
                                    </tbody>
                                </table>
                                    <% } else { %>
                                <br>
                                <p id="no-results-message" class="no-results">Aucun résultat trouvé pour ce mot-clé.</p>
                                <script>
                                    document.addEventListener('DOMContentLoaded', function() {
                                        var noResultsMessage = document.getElementById('no-results-message');
                                        setTimeout(function() {
                                            noResultsMessage.classList.add('show');
                                        }, 500); // Delay to trigger the fade-in effect
                                    });
                                </script>
                                    <% } %>
</body>
</html>