<%@ page import="com.example.data_base_project.bean.Client" %>
<%@ page import="com.example.data_base_project.bean.Prodct" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ATLAS PRO ELECTRO
  Date: 02/06/2024
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        *,
        *::after,
        *::before {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        :root {
            --blue-color: #0c2f54;
            --dark-color: #535b61;
            --white-color: #fff;
        }

        ul {
            list-style-type: none;
        }

        ul li {
            margin: 2px 0;
        }

        /* text colors */
        .text-dark {
            color: var(--dark-color);
        }

        .text-blue {
            color: var(--blue-color);
        }

        .text-end {
            text-align: right;
        }

        .text-center {
            text-align: center;
        }

        .text-start {
            text-align: left;
        }

        .text-bold {
            font-weight: 700;
        }

        /* hr line */
        .hr {
            height: 1px;
            background-color: rgba(0, 0, 0, 0.1);
        }

        /* border-bottom */
        .border-bottom {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark-color);
            font-size: 14px;
        }

        .invoice-wrapper {
            min-height: 100vh;
            background-color: rgba(0, 0, 0, 0.1);
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .invoice {
            max-width: 850px;
            margin-right: auto;
            margin-left: auto;
            background-color: var(--white-color);
            padding: 70px;
            border: 1px solid rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            min-height: 920px;
        }

        .invoice-head-top-left img {
            width: 130px;
        }

        .invoice-head-top-right h3 {
            font-weight: 500;
            font-size: 27px;
            color: var(--blue-color);
        }

        .invoice-head-middle,
        .invoice-head-bottom {
            padding: 16px 0;
        }

        .invoice-body {
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            overflow: hidden;
        }

        .invoice-body table {
            border-collapse: collapse;
            border-radius: 4px;
            width: 100%;
        }

        .invoice-body table td,
        .invoice-body table th {
            padding: 12px;
        }

        .invoice-body table tr {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .invoice-body table thead {
            background-color: rgba(0, 0, 0, 0.02);
        }

        .invoice-body-info-item {
            display: grid;
            grid-template-columns: 80% 20%;
        }

        .invoice-body-info-item .info-item-td {
            padding: 12px;
            background-color: rgba(0, 0, 0, 0.02);
        }

        .invoice-foot {
            padding: 30px 0;
        }

        .invoice-foot p {
            font-size: 12px;
        }

        .invoice-btns {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .invoice-btn {
            padding: 3px 9px;
            color: var(--dark-color);
            font-family: inherit;
            border: 1px solid rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }

        .invoice-head-top,
        .invoice-head-middle,
        .invoice-head-bottom {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            padding-bottom: 10px;
        }

        @media screen and (max-width: 992px) {
            .invoice {
                padding: 40px;
            }
        }

        @media screen and (max-width: 576px) {

            .invoice-head-top,
            .invoice-head-middle,
            .invoice-head-bottom {
                grid-template-columns: repeat(1, 1fr);
            }

            .invoice-head-bottom-right {
                margin-top: 12px;
                margin-bottom: 12px;
            }

            .invoice * {
                text-align: left;
            }

            .invoice {
                padding: 28px;
            }
        }

        .overflow-view {
            overflow-x: scroll;
        }

        .invoice-body {
            min-width: 600px;
        }

        @media print {
            .print-area {
                visibility: visible;
                width: 100%;
                position: absolute;
                left: 0;
                top: 0;
                overflow: hidden;
            }

            .overflow-view {
                overflow-x: hidden;
            }

            .invoice-btns {
                display: none;
            }
        }
    </style>
</head>

<body>
<%
    Client client = (Client) session.getAttribute("client");
    String dateFacture = (String) session.getAttribute("dateFacture");
    List<Prodct> selectedProducts = (List<Prodct>) session.getAttribute("selectedProducts");
    List<Integer> quantities = (List<Integer>) session.getAttribute("quantities");
%>

<!---->
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

        <!---->
        <div class="container" id="print-area">
            <div class="row">
                <div class="invoice-wrapper"  id="facture">
                    <div class="invoice">
                        <div class="invoice-container">
                            <div class="invoice-head">
                                <div class="invoice-head-top">
                                    <div class="invoice-head-top-left text-start">
                                        <img src="images/MediaTek.jpg">
                                    </div>
                                    <div class="invoice-head-top-right text-end">
                                        <h3>Invoice</h3>
                                    </div>
                                </div>
                                <div class="hr"></div>
                                <div class="invoice-head-middle">
                                    <div class="invoice-head-middle-left text-start">
                                        <p><span class="text-bold">Date</span>: <%=dateFacture%></p>
                                    </div>

                                </div>
                                <div class="hr"></div>
                                <div class="invoice-head-bottom">
                                    <div class="invoice-head-bottom-left">
                                        <ul>
                                            <li class='text-bold'>Invoiced To:</li>
                                            <li><%= client.getNom() %></li>
                                            <li><%= client.getPrenom() %></li>
                                            <li><%= client.getTel() %></li>
                                        </ul>
                                    </div>
                                    <div class="invoice-head-bottom-right">
                                        <ul class="text-end">
                                            <li class='text-bold'>Pay To:</li>
                                            <li>MediaTek</li>
                                            <li>2705 N. Enterprise</li>
                                            <li>Marrakech</li>
                                            <li>omar.boudaden@gmail.com</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="overflow-view">
                                <div class="invoice-body">
                                    <table>
                                        <thead>
                                        <tr>
                                            <td class="text-bold">Produit</td>
                                            <td class="text-bold">Quantité en stock</td>
                                            <td class="text-bold">Unit price</td>
                                            <td class="text-bold">QTY requested</td>
                                            <td class="text-bold">Total</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            int total =0;
                                            for (int i = 0; i < selectedProducts.size(); i++) {
                                                Prodct produit = selectedProducts.get(i);
                                                int qtyRequested = quantities.get(i); // Récupération de la quantité demandée
                                        %>
                                        <tr>
                                            <td><%= produit.getDESIGNATION() %></td>
                                            <td><%= produit.getQTE_STOCK() %></td>
                                            <td><%= produit.getPRIX() %></td>
                                            <td><%=qtyRequested%></td>
                                            <td class="text-end">$<%= produit.getPRIX() * qtyRequested %>.00</td>
                                            <% total+= produit.getPRIX() * qtyRequested ;%>
                                        </tr>
                                        <% } %>


                                        <!-- <tr>
                                                <td colspan="4">10</td>
                                                <td>$500.00</td>
                                            </tr> -->
                                        </tbody>
                                    </table>
                                    <div class="invoice-body-bottom">
                                        <div class="invoice-body-info-item border-bottom">
                                            <div class="info-item-td text-end text-bold">Sub Total:</div>
                                            <div class="info-item-td text-end">$<%=total%></div>
                                        </div>
                                        <div class="invoice-body-info-item border-bottom">
                                            <div class="info-item-td text-end text-bold">TVA(20%):</div>
                                            <div class="info-item-td text-end">$<%=0.2*total%></div>
                                        </div>
                                        <div class="invoice-body-info-item">
                                            <div class="info-item-td text-end text-bold">Total:</div>
                                            <div class="info-item-td text-end">$<%=total+ 0.2*total%></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="invoice-foot text-center">
                                <p><span class="text-bold text-center">NOTE:&nbsp;</span>This is computer generated
                                    Facture
                                    and
                                    does
                                    not require physical signature.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div>
                <button type="button" class="invoice-btn" onclick="printInvoice()">
                                <span>
                                    <i class="fa-solid fa-print"></i>
                                </span>
                    <span>Print</span>
                </button>
                <button type="button" class="invoice-btn" id="download" name="download">
                                <span>
                                    <i class="fa-solid fa-download"></i>
                                </span>
                    <span>Download</span>
                </button>
            </div>
            <iframe id="printFrame" name="printFrame" style="display:none;"></iframe>
        </div>
    </div>
</div>

<script>
    function printInvoice() {
        // Récupérer le contenu du div à imprimer
        var divToPrint = document.getElementById('facture').innerHTML;

        // Obtenir l'iframe
        var printFrame = document.getElementById('printFrame');

        // Obtenir le document de l'iframe
        var printDocument = printFrame.contentDocument || printFrame.contentWindow.document;

        // Écrire le contenu à imprimer dans l'iframe
        printDocument.open();
        printDocument.write('<html><head><title>Facture</title>');
        printDocument.write('</head><body>');
        printDocument.write(divToPrint);
        printDocument.write('</body></html>');
        printDocument.close();

        // Lancer la commande d'impression dans l'iframe
        printFrame.contentWindow.focus();
        printFrame.contentWindow.print();
    }

    // Optionnel: Mettre à jour la date de la facture
    document.getElementById('invoice-date').innerText = new Date().toLocaleDateString();

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qr.js/1.0.0/qr.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
<script>

    window.onload = function () {
        document.getElementById("download").addEventListener("click", () => {
            const invoice = document.getElementById("facture");
            var opt = {
                filename: 'Facture.pdf',
                image: {type: 'jpeg', quality: 0.98},
                html2canvas: {scale: 2},
                jsPDF: {unit: 'in', format: 'letter', orientation: 'portrait'}
            };
            html2pdf().from(invoice).set(opt).save();
        });

        document.forms[0].oninput = function () {
            updateQRCode();
        };
    };
</script>
</body>

</html>
