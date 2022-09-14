<%--
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
    <link rel="stylesheet" href="../CSS/EstilosCards.css">
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
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

                <div class="col-12 col-lg-12">

                    <div class="card ">

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

                                                        <div class="carousel-item active">

                                                            <div class="card">


                                                            </div>

                                                        </div>

                                                        <div class="carousel-item">

                                                            <img src="..." class="d-block w-100" alt="...">

                                                        </div>

                                                        <div class="carousel-item">

                                                            <img src="..." class="d-block w-100" alt="...">

                                                        </div>

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

                                        <div class="row ">

                                            <div class="col-12 col-lg-12 d-flex justify-content-evenly align-items-center izquierda mt-3">

                                                <div class="row">

                                                    <button type="reset" id="botonBorrar" class="btn btn-primary btn-lg mt-3">Borrar</button>

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
</body>
</html>