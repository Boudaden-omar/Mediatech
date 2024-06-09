<%--
  Created by IntelliJ IDEA.
  User: ATLAS PRO ELECTRO
  Date: 12/05/2024
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: ATLAS PRO ELECTRO
  Date: 11/05/2024
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Class.Produit" %>
<%@ page import="Class.DAO_Product" %>
<%@ page import="com.example.data_base_project.Dao.DAO_Client" %>
<%@ page import="com.example.data_base_project.bean.Client" %>
<%@ page import="com.example.data_base_project.Dao.Dao_Facture" %>
<%@ page import="com.example.data_base_project.bean.Facture" %>
<%@ page import="com.example.data_base_project.Dao.DAO_Produit" %>
<!DOCTYPE html>
<html lang="en">

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

    <!-- Scripts -->

</head>
<body>
<%
    Dao_Facture daoFacture = new Dao_Facture();
    List<Facture> factureList = daoFacture.getFacture();
%>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">

        <div class="navbar-brand-wrapper d-flex justify-content-center" style="background-color:#D7BDE2">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <a class="navbar-brand brand-logo" href="index.jsp"><img
                        src="images/MediaTek-removebg-preview.png" style="height:170px"
                        alt="logo"/></a>
                <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/MediaTek-removebg-preview.png"
                                                                              style="height:170px"
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
        <% String successMessage = (String) session.getAttribute("successMessage"); %>
        <% if (successMessage != null) { %>
        <script>
            Swal.fire({
                icon: "success",
                title: "<%= successMessage %>",
                timer: 2000
            });
        </script>
        <%
                // Une fois affiché, supprimer le message de la session pour ne pas l'afficher à nouveau lors du prochain chargement de la page
                session.removeAttribute("successMessage");
            }%>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-4 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                    <div>
                                        <p class="mb-2 text-md-center text-lg-left">Nombre de Facture</p>
                                        <h1 class="mb-0"><%=factureList.size()%></h1>
                                    </div>
                                    <i class="typcn typcn-clipboard icon-xl text-secondary"></i>
                                </div>
                                <canvas id="expense-chart" height="80"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="facture.jsp" style="margin-bottom: 10px">
                    <button type="submit" class="btn btn-success btn-sm typcn typcn-user-add btn-sm btn-icon-text">
                        Create New
                    </button>
                </a>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="table-responsive pt-3">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Date Facture</th>
                                        <th>Client</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                       DAO_Client daoClient=new DAO_Client();

                                        for (Facture facture : factureList) {
                                            Client client=daoClient.getClientById(facture.getId_clt());
                                    %>
                                    <tr>
                                        <td><%=facture.getId_fact()%>
                                        </td>
                                        <td><%=facture.getDate_fact()%>
                                        </td>
                                        <td><%=client.getNom()%> <%=client.getPrenom()%>
                                        </td>

                                        <td class="d-flex align-items-center">
                                            <a data-toggle="modal" data-target="#logoutModal"
                                               href="{{url('logout')}}">
                                                <button type="submit" class="btn btn-danger btn-sm btn-icon-text"
                                                        style="height: 100%">
                                                    Delete
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </a>
                                            <!-- <form method="post" action="deleteClientServlet">
                                                 <input type="hidden" name="clientId" value="">
                                                 <button type="submit" class="btn btn-danger btn-sm btn-icon-text" style="height: 100%">
                                                     Delete
                                                     <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                 </button>
                                             </form>-->
                                        </td>
                                    </tr>
                                    <!-- Logout Modal-->
                                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Ready to Delet?</h5>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">Select "Delet" below if you wante to delet this
                                                    Facture.
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button"
                                                            data-dismiss="modal">
                                                        Cancel
                                                    </button>
                                                    <form method="post" action="deletFactureServlet">
                                                        <input type="hidden" name="factureId"
                                                               value="<%=facture.getId_fact()%>">
                                                        <button type="submit"
                                                                class="btn btn-danger btn-sm btn-icon-text"
                                                                style="height: 100%">
                                                            Delete
                                                            <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <% } %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- content-wrapper ends -->

            <!-- partial:partials/_footer.html -->
            <footer class="footer">
                <div class="card">
                    <div class="card-body">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2020 <a
                                    href="https://www.bootstrapdash.com/" class="text-muted" target="_blank">Bootstrapdash</a>. All rights reserved.</span>
                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center text-muted">Free <a
                                    href="https://www.bootstrapdash.com/" class="text-muted" target="_blank">Bootstrap dashboard</a> templates from Bootstrapdash.com</span>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

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