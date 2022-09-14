<%@ page import="modelos.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Akame
  Date: 24/08/2022
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Admin admin = (Admin) session.getAttribute("SuperAdmin");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Estilos CSS-->
    <link rel="stylesheet" href="../CSS/EstilosMenuSuperAdmin.css">
    <!--JS-->
    <script src="../JS/jsMenuSuperAdmin.js"></script>
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!--Librería gráficos-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Menú Super-Admin</title>
</head>

<body>

<div class="bgcontainer">

    <div class="container-fluid alto100 ">

        <div class="contenedor alto100 d-flex flex-column">

            <div class="row">

                <div class="col-12 col-lg-12">

                    <!--Cabecera con cambio a modo oscuro-->
                    <header class="d-flex align-items-center justify-content-between">

                        <div class="logo"></div>

                        <div class="switch d-flex">

                            <span class="btn-toggle"></span>

                        </div>

                    </header>

                </div>

            </div>

            <div class="row">

                <div class="col-12 col-lg-1">

                    <main class="d-flex">

                        <svg class="toggle-menu" viewBox="0 0 100 100" width="80">

                            <path d="m 30,33 h 40 c 0,0 9.044436,-0.654587 9.044436,-8.508902 0,-7.854315 -8.024349,-11.958003 -14.89975,-10.85914 -6.875401,1.098863 -13.637059,4.171617 -13.637059,16.368042 v 40" />

                            <path d="m 30,50 h 40" />

                            <path
                                    d="m 30,67 h 40 c 12.796276,0 15.357889,-11.717785 15.357889,-26.851538 0,-15.133752 -4.786586,-27.274118 -16.667516,-27.274118 -11.88093,0 -18.499247,6.994427 -18.435284,17.125656 l 0.252538,40" />

                        </svg>

                        <aside class="d-flex align-items-center justify-content-between">

                            <ul class="menu">

                                <li>

                                    <a class="main-menu d-flex align-items-center justify-content-between" href="#">

                                        <div>

                                            <span>Home</span>

                                        </div>

                                        <div>

                                            <img src="../Assets/Icons/iconoHome.png" alt="">

                                        </div>

                                    </a>

                                </li>

                                <li>

                                    <div class="main-menu d-flex align-items-center justify-content-between">

                                        <div>

                                            <span>Incidencias</span>

                                        </div>

                                        <svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                             viewBox="0 0 24 24">

                                            <path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z" />

                                        </svg>

                                    </div>

                                    <ul class="sub-menu">

                                        <li><a href="">Incidencias abiertas</a></li>

                                        <li><a href="">Incidencias cerradas</a></li>

                                        <li><a href="">Incidencias por término</a></li>

                                    </ul>

                                </li>

                                <li>

                                    <div class="main-menu d-flex align-items-center justify-content-between">

                                        <div>

                                            <span>Usuarios</span>

                                        </div>

                                        <svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                             viewBox="0 0 24 24">

                                            <path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z" />

                                        </svg>

                                    </div>

                                    <ul class="sub-menu">

                                        <li><a href="">Usuarios registrados</a></li>

                                        <li><a href="">Borrar usuario</a></li>

                                    </ul>

                                </li>

                                <li>

                                    <div class="main-menu d-flex align-items-center justify-content-between">

                                        <div>

                                            <span>Técnicos</span>

                                        </div>

                                        <svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                             viewBox="0 0 24 24">

                                            <path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z" />

                                        </svg>

                                    </div>

                                    <ul class="sub-menu">

                                        <li><a href="">Técnicos registrados</a></li>

                                        <li><a href="">Asignar incidencia</a></li>

                                        <li><a href="">Registrar técnico</a></li>

                                        <li><a href="">Borrar técnico</a></li>

                                    </ul>

                                </li>

                                <li>

                                    <div class="main-menu d-flex align-items-center justify-content-between">

                                        <div>

                                            <span>Administradores</span>

                                        </div>

                                        <svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                             viewBox="0 0 24 24">

                                            <path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z" />

                                        </svg>

                                    </div>

                                    <ul class="sub-menu">

                                        <li><a href="">Administradores registrados</a></li>

                                        <li><a href="">Registrar administrador</a></li>

                                        <li><a href="">Borrar administrador</a></li>

                                    </ul>

                                </li>

                                <li>

                                    <a class="main-menu d-flex align-items-center justify-content-between"
                                       href="../index.jsp">

                                        <div>

                                            <span>Cerrar sesión</span>

                                        </div>

                                        <div>

                                            <img src="../Assets/Icons/iconoCerrarSesion.png" alt="">

                                        </div>

                                    </a>

                                </li>

                            </ul>

                        </aside>

                    </main>

                </div>

                <div class="col-12 col-lg-11">

                    <div class="row">

                        <div class="grafico col-12 col-lg-11 d-flex justify-content-center">

                            <div>

                                <canvas id="grafico1"></canvas>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>
</body>

</html>
