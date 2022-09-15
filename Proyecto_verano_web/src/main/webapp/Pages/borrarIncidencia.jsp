<%@ page import="java.util.ArrayList" %>
<%@ page import="modelos.Incidencia" %>
<%@ page import="modelos.GestionApp" %>
<%@ page import="modelos.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Akame
  Date: 08/09/2022
  Time: 19:31
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
    <link rel="stylesheet" href="../CSS/EstilosBorrarIncidencia.css">
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <!--JS Sweet Alert-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Document</title>
</head>
<body>
<div class="bgcontainer">

    <div class="container-fluid alto100 d-flex justify-content-around">

        <div class="row">

            <!--Botón de regreso al menú de usuario-->
            <div class="col-12 col-lg-2 mt-3">

                <a href="../Pages/homeUsuario.jsp" class=""><img src="../Assets/Icons/iconoVolver.png" alt="Icono no disponible"></a>

            </div>

        </div>

        <div class="container-fluid d-flex justify-content-center">

            <div class="row justify-content-around align-items-center">

                <div class="col-12 col-lg-10">

                    <div class="card p-4">

                        <div class="card-body">

                            <div class="row">

                                <!--Título-->
                                <h1 class="card-title">Borrar incidencia</h1>

                                <!--Subtítulo-->
                                <h4 class="card-subtitle text-muted mt-3">Seleccione la incidencia que quiere borrar</h4>

                            </div>

                            <div class="row">

                                <div class="col-12 col-lg-12">

                                    <form action="">

                                        <!--Descripción-->
                                        <div class="row">

                                            <div class="col-12 col-lg-12 d-flex justify-content-center">

                                                <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">

                                                    <div class="carousel-inner">

                                                        <%
                                                            GestionApp gestor = null;

                                                            try {
                                                                gestor = new GestionApp();
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }

                                                            Usuario usuarioLogeado = (Usuario) session.getAttribute("Usuario");

                                                            if (usuarioLogeado != null) {
                                                                ArrayList<Incidencia> incidenciasSinResolver = GestionApp.obtenerIncidenciasSinResolver(usuarioLogeado.getId());

                                                                if (!incidenciasSinResolver.isEmpty()) {
                                                                    for (int i = 0; i < incidenciasSinResolver.size(); i++) {
                                                                        if (i == 0) {%>
                                                                            <div class="carousel-item active">

                                                                                <form method="post" action="${pageContext.request.contextPath}/BorrarIncidencia">

                                                                                    <div class="card p-5 mt-5 mb-4">

                                                                                        <div class="card-body">

                                                                                            <div class="row">

                                                                                                <h1 class="fechaInicioIncidencia">

                                                                                                    <%=incidenciasSinResolver.get(i).getFechaInicio()%>

                                                                                                </h1>

                                                                                                <h4>

                                                                                                    <%=incidenciasSinResolver.get(i).getDescripcion()%>

                                                                                                </h4>

                                                                                            </div>

                                                                                            <div class="row">

                                                                                                <div class="col-12 col-lg-12 d-flex justify-content-evenly align-items-center izquierda mt-3">

                                                                                                    <div class="row">

                                                                                                        <button type="submit" id="botonBorrar" class="btn btn-primary btn-lg mt-3">Borrar</button>
                                                                                                        <input type="hidden" name="idIncidencia" value="<%=incidenciasSinResolver.get(i).getId()%>">

                                                                                                    </div>

                                                                                                </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </form>

                                                                            </div>
                                                                        <%}%>

                                                                        <div class="carousel-item">

                                                                            <form method="post" action="${pageContext.request.contextPath}/BorrarIncidencia">

                                                                                <div class="card p-5 mt-5 mb-4">

                                                                                    <div class="card-body">

                                                                                        <div class="row">

                                                                                            <h1 class="fechaInicioIncidencia">

                                                                                                <%=incidenciasSinResolver.get(i).getFechaInicio()%>

                                                                                            </h1>

                                                                                            <h4>

                                                                                                <%=incidenciasSinResolver.get(i).getDescripcion()%>

                                                                                            </h4>

                                                                                        </div>

                                                                                        <div class="row">

                                                                                            <div class="col-12 col-lg-12 d-flex justify-content-evenly align-items-center izquierda mt-3">

                                                                                                <div class="row">

                                                                                                    <button type="submit" id="botonBorrar2" class="btn btn-primary btn-lg mt-3">Borrar</button>
                                                                                                    <input type="hidden" name="idIncidencia" value="<%=incidenciasSinResolver.get(i).getId()%>">

                                                                                                </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </form>

                                                                        </div>

                                                                    <%}
                                                                } else {%>

                                                                    <div class="card">

                                                                        <div class="card-body">

                                                                            <div class="card-title">

                                                                                <h1>No existen incidencias registradas</h1>

                                                                            </div>

                                                                        </div>

                                                                    </div>

                                                                <%}
                                                            }%>

                                                    </div>

                                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">

                                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                                                        <span class="visually-hidden">Previous</span>

                                                    </button>

                                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">

                                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>

                                                        <span class="visually-hidden">Next</span>

                                                    </button>

                                                </div>

                                            </div>

                                        </div>

                                    </form>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>
<script>

    <!--Sweet-alert Incidencia Borrada-->
    <%
        String borrada = (String) session.getAttribute("estaBorrada");

        if (borrada != null && borrada.equals("true")) {
    %>
    Swal.fire(
        '¡Indicencia borrada!',
        'Registre una incidencia ante cualquier tipo de duda',
        'success'
    )
    <% }
    session.removeAttribute("estaBorrada");%>

    //Sweet-alert Error crear incidencia
    <%
        String borrada2 = (String) session.getAttribute("estaBorrada");

        if (borrada2 != null && borrada2.equals("false")) {
    %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se ha podido borrar la incidencia'
    });
    <% }
    session.removeAttribute("estaBorrada");%>

</script>
</body>
</html>