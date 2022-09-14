<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Estilos CSS-->
    <link rel="stylesheet" href="CSS/EstilosIndex.css">
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <!--JS Sweet Alert-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--Fuente título-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <title>Sistema de gestión de incidencias / Log in</title>
</head>
<body>

<div class="bgcontainer">

    <div class="container-fluid alto100 d-flex justify-content-around">

        <div class="row justify-content-around align-items-center">

            <div class="titulo d-flex col-12 col-lg-5  col-sm-8 col-xs-4 m-3 mr-5">

                <!--Título-->
                <h1 class="align-self-center display-3">SISTEMA DE GESTIÓN DE INCIDENCIAS</h1>

            </div>

            <div class="col-12 col-lg-5 col-md-10">

                <!--Tarjeta-->
                <div class="card p-5">

                    <div class="card-body">

                        <!--Cuerpo de la tarjeta-->
                        <div class="row">

                            <!--Texto tarjeta-->
                            <h1 class="card-title">¡Bienvenido!</h1>

                            <h3 class="card-subtitle mt-2 text-muted">Inicie sesión en su cuenta</h3>

                        </div>

                        <div class="row">

                            <%
                                String comprobacionLogIn = (String) session.getAttribute("falloLogIn");
                                if (comprobacionLogIn != null && comprobacionLogIn.equals("true")) { %>
                            <!--Mensaje de verificación-->
                            <div id="errorLogIn" class="alert alert-danger mostrar" role="alert">

                                Correo o contraseña incorrectos

                            </div>
                            <% }
                                session.removeAttribute("falloLogIn"); %>
                            <!--Formulario-->
                            <form action="${pageContext.request.contextPath}/LogIn" method="post">

                                <!--Correo -->
                                <div class="mb-2 mt-3">

                                    <label for="email" class="form-label mt-3">Introduzca su correo electrónico</label>

                                    <input type="email" class="form-control form-control-md" name="email" id="email" placeholder="Tu correo">

                                </div>

                                <!--Contraseña-->
                                <div class="mb-3">

                                    <label for="passwordUsuario" class="form-label mt-3">Contraseña</label>

                                    <input type="password" class="form-control form.control-md mb-4" name="password" id="passwordUsuario" placeholder="Tu contraseña">

                                </div>

                                <!--Links-->
                                <div class="mb-3 d-flex justify-content-evenly">

                                    <a href="./Pages/recuperarClave.jsp" class="card-link">He olvidado mi contraseña</a>

                                    <a href="./Pages/registro.jsp" class="card-link">Registrarme</a>

                                </div>

                                <!--Botón inicio de sesión-->
                                <div class="row">

                                    <button type="submit" class="btn btn-primary btn-lg mt-3">Iniciar sesión</button>

                                </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


</div>

<script>

    let casilla = document.getElementById("email");
    function descativarAlerta() {
        casilla.addEventListener("keypress", function () {
             let alerta = document.getElementById("errorLogIn");
             if (alerta != null) {
                 alerta.classList.remove("mostrar");
                 alerta.classList.add("ocultar");
             }

        });
    }

    descativarAlerta();

    <!--Sweet-alert Usuario registrado-->
    <%
        String registrado = (String) session.getAttribute("estaRegistrado");

        if (registrado != null && registrado.equals("true")) {
    %>
        Swal.fire(
            '¡Usuario registrado!',
            'Bienvenido al Sistema de Gestión de Incidencias',
            'success'
        )
    <% }
    session.removeAttribute("estaRegistrado");%>

</script>
</body>
</html>