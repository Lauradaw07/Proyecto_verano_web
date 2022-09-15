<%@ page import="modelos.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Akame
  Date: 04/09/2022
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Estilos CSS-->
    <link rel="stylesheet" href="../CSS/EstilosMenuUsuario.css">
    <!--JS-->
    <script src="../JS/menuUsuario.js"></script>
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!--JS Sweet Alert-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--Fuente enlaces-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Antonio:wght@200&display=swap" rel="stylesheet">
    <!--Fuente títulos-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
    <!--Fuente autor-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">
    <title>Menú usuario</title>
</head>
<body>
<div class="bgcontainer">

    <div class="container-fluid alto100 contenedor">

        <!--FILA CABECERA-->
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

        <main>

            <!--1º fila main-->
            <div class="row d-flex justify-content-around">

                <!--Card 1ª fila - izquierda (Bienvenida) -->
                <div class="col-11 col-lg-7 col-md-11 col-sm-7 justify-content-between ">

                    <div class="card p-2 mt-5">

                        <div class="card-body">

                            <div class="row d-flex justify-content-between">

                                <div class="col-12 col-lg-7 d-flex justify-content-start align-items-center">

                                    <div class="row">

                                        <%
                                            Usuario usuarioLogeado = (Usuario) session.getAttribute("Usuario");
                                        %>
                                        <!--Saludo usuario-->
                                        <h3 class="tituloBienvenida mb-2">Bienvenidx <%=usuarioLogeado.getNombre()%></h3>

                                        <!--Descripción card-->
                                        <h5 class="subtitulo text-muted mt-3">
                                            Nuestro servicio técnico está encantado de poder ayudarle a resolver cualquier tipo
                                            de duda.
                                            <br> <br>
                                            Registre una incidencia y se le atenderá lo antes posible.
                                        </h5>

                                    </div>

                                </div>

                                <div class="col-12 col-lg-5 size p-4 d-flex justify-content-center align-items-center">

                                    <div class="row">

                                        <!--Imagen principal home-usuarios-->
                                        <img id="imagenPrincipalUsuarios" src="../Assets/Images/homeUsuarios.png" alt="Imagen no disponible">

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <!--Cards 1ª fila - derecha-->
                <div class="col-10 col-lg-3 col-md-10">

                    <!--Card Registrar Incidencia-->
                    <div class="row">

                        <a href="registrarIncidencia.jsp" class="enlacesCards">

                            <div class="card p-3 mt-5">

                                <div class="card-body">

                                    <div class="row d-flex justify-content-between align-items-center">

                                        <div class="col-4 col-lg-3 col-md-2 justify-content-center align-items-center">

                                            <div class="row">

                                                <!--Imagen crear incidencia-->
                                                <img id="iconoCrearIncidencia" class="ajusteSm" src="../Assets/Icons/iconoCrearIncidencia.png" alt="Imagen no
                                                    disponible">

                                            </div>

                                        </div>

                                        <div class="col-7 col-lg-9 col-md-10">

                                            <div class="row">

                                                <!--Título crear incidencia-->
                                                <h4 class="titulo ">Registrar una incidencia</h4>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </a>

                    </div>

                    <!--Card Borrar Incidencia-->
                    <div class="row">

                        <a href="../Pages/borrarIncidencia.jsp" class="enlacesCards">

                            <div class="card p-3 mt-5">

                                <div class="card-body">

                                    <div class="row d-flex justify-content-between align-items-center">

                                        <div class="col-4 col-lg-3 col-md-2 d-flex justify-content-around align-items-center izquierda">

                                            <div class="row">

                                                <!--Imagen crear incidencia-->
                                                <img id="iconoBorrarIncidencia" class="ajusteSm" src="../Assets/Icons/iconoBorrarIncidencia.png" alt="Imagen no
                                                    disponible">

                                            </div>

                                        </div>

                                        <div class="col-7 col-lg-9 col-md-10">
                                            <div class="row">

                                                <!--Título crear incidencia-->
                                                <h4 class="titulo">Borrar una incidencia</h4>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </a>

                    </div>

                </div>

            </div>

            <!--2º fila main-->
            <div class="row d-flex justify-content-around">

                <!--2ª fila - Card 1-->
                <div class="col-10 col-lg-3 col-md-10">

                    <a href="../Pages/consultarIncidenciasAbiertas.jsp" class="enlacesCards">

                        <!--Card Consultar Incidencias Abiertas-->
                        <div class="card p-3 mt-5">

                            <div class="card-body">

                                <div class="row justify-content-center">

                                    <!--Imagen Consultar Incidencias abiertas-->
                                    <img id="iconoIncidenciasAbiertas" class="ajusteSm" src="../Assets/Icons/iconoIncidenciasAbiertas.png" alt="Imagen no
                                    disponible">

                                </div>

                                <div class="row">

                                    <!--Título Consultar Incidencias Abiertas-->
                                    <h4 class="titulo mt-5">Consultar incidencias abiertas</h4>

                                </div>

                            </div>

                        </div>

                    </a>



                </div>

                <!--2ª fila - Card 2-->
                <div class="col-10 col-lg-3 col-md-10">

                    <a href="../Pages/consultarIncidenciasCerradas.jsp" class="enlacesCards">

                        <div class="card p-3 mt-5">

                            <div class="card-body">

                                <div class="row justify-content-center">

                                    <!--Imagen Consultar Incidencias Cerradas-->
                                    <img id="iconoIncidenciasCerradas" class="mb-1" src="../Assets/Icons/iconoIncidenciasCerradas.png" alt="Imagen no disponible">

                                </div>

                                <div class="row">

                                    <!--Título Consultar Incidencias Cerradas-->
                                    <h4 class="titulo mt-5">Consultar incidencias cerradas</h4>

                                </div>

                            </div>

                        </div>

                    </a>

                </div>

                <!--2ª fila - Card 3-->
                <div class="col-10 col-lg-3 col-md-10">

                    <div class="card p-3 mt-5">

                        <div class="card-body">

                            <div class="row justify-content-center">

                                <!--Imagen Perfil-->
                                <img id="iconoPerfil" src="../Assets/Icons/iconoPerfil.png" alt="Imagen no disponible">

                            </div>

                            <div class="row">

                                <!--Título Perfil-->
                                <h4 class="titulo mt-5">Consultar mi perfil</h4>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </main>

        <footer class="bd-footer">

            <div class="container">

                <div class="row d-flex justify-content-evenly">

                    <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center columna1">

                        <a class="enlace" href="https://github.com/Lauradaw07?tab=repositories" target="_blank">SOBRE NOSOTROS</a>

                    </div>

                    <div class="col-12 col-lg-4 columna2">

                        <div class="row d-flex justify-content-center">

                            <img id="logoDev" src="../Assets/Icons/logoValki.png" alt="Imagen no disponible">

                        </div>

                        <div class="row">

                            <p id="autor">Valki_dev</p>

                        </div>

                    </div>

                    <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center columna3">

                        <a class="enlace" href="" target="_blank">AYUDA</a>

                    </div>

                </div>

            </div>

        </footer>

    </div>

</div>
<script>
    //Sweet-alert Error incidencia registrada
    <%
        String registrado = (String) session.getAttribute("estaRegistrado");

        if (registrado != null && registrado.equals("false")) {
    %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se ha podido registrar al usuario'
    });
    <% }
    session.removeAttribute("estaRegistrado");%>

    //Sweet-alert Incidencia registrada
    <%
        String creada = (String) session.getAttribute("estaCreada");

        if (creada != null && creada.equals("true")) {
    %>
    Swal.fire(
        '¡Incidencia registrada!',
        'Revise su correo para obtener más información',
        'success'
    )
    <% }
    session.removeAttribute("estaCreada");%>

    //Sweet-alert Error crear incidencia
    <%
        String creada2 = (String) session.getAttribute("estaCreada");

        if (creada2 != null && creada2.equals("false")) {
    %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se ha podido registrar la incidencia'
    });
    <% }
    session.removeAttribute("estaCreada");%>

</script>
</body>
</html>