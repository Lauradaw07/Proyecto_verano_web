<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Estilos CSS-->
    <link rel="stylesheet" href="../CSS/EstilosRegistro.css">
    <!--JS-->
    <script src="../JS/jsRegistro.js"></script>
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <title>Página de registro</title>
</head>
<body>

<div class="bgcontainer">

    <div class="container-fluid alto100 d-flex justify-content-around">

        <div class="row mt-4">

            <a href="../index.jsp"><img src="../Assets/Icons/iconoVolver.png" alt="Icono no disponible"></a>

        </div>

        <div class="container-fluid d-flex justify-content-center">

            <div class="row justify-content-around align-items-center">

                <div class="col-12 col-lg-10">

                    <!--Tarjeta-->
                    <div class="card p-3">

                        <!--Cuerpo de la tarjeta-->
                        <div class="card-body">

                            <!--Texto tarjeta-->
                            <div class="row">

                                <h1 class="card-title">Registro de usuarios</h1>

                                <h4 class="card-subtitle mt-1 text-muted">Rellene todos los campos para registrar su cuenta</h4>

                            </div>

                            <div class="row">

                                <!--ALERTAS-->
                                <!--Alerta contraseñas distintas-->
                                <div id="errorClaves" class="alert alert-danger ocultar" role="alert">

                                    Las contraseñas no coinciden

                                </div>

                                <!--Alerta para errores-->
                                <%
                                    String comprobacionError = (String) session.getAttribute("error");
                                    if (comprobacionError != null && comprobacionError.equals("true")) { %>

                                <div id="error" class="alert alert-danger mostrar" role="alert">

                                    <%=session.getAttribute("mensajeDeError")%>

                                </div>
                                <% }
                                    session.removeAttribute("error");
                                    session.removeAttribute("mensajeDeError");%>

                                <!--Formulario-->
                                <form action="${pageContext.request.contextPath}/Registro" method="post">

                                    <!--Nombre-->
                                    <div class="mt-4 mb-3">

                                        <label for="nombreUsuario">Introduzca su nombre</label>

                                        <input type="text" class="form-control form-control-md mt-2" name="nombre" id="nombreUsuario" placeholder="Nombre" required>

                                    </div>

                                    <!--Apellido-->
                                    <div class="mt-3 mb-3">

                                        <label for="apellidoUsuario">Introduzca su primer apellido</label>

                                        <input type="text" class="form-control form-control-md mt-2" name="apellido" id="apellidoUsuario" placeholder="Primer apellido" required>

                                    </div>

                                    <!--Correo-->
                                    <div class="mt-3 mb-3">

                                        <label for="correoUsuario">Introduzca su correo electrónico</label>

                                        <input type="email" class="form-control form-control-md mt-2" name="email" id="correoUsuario" placeholder="Correo electrónico" required>

                                    </div>

                                    <!--Contraseña-->
                                    <div class="mt-3 mb-3">

                                        <label for="clave1">Introduzca su contraseña</label>

                                        <input type="password" class="form-control form-control-md mt-2" name="password" id="clave1" placeholder="Contraseña" required>

                                    </div>

                                    <!--Comprobación contraseña-->
                                    <div class="mt-3 mb-3">

                                        <label for="clave2">Introduzca de nuevo su contraseña</label>

                                        <input type="password" class="form-control form-control-md mt-2" name="password2" id="clave2" placeholder="Contraseña" required>

                                    </div>

                                    <!--Botón registro-->
                                    <div class="row-lg-3 d-flex justify-content-center">

                                        <button type="submit" id="registro" class="btn btn-primary btn-lg mt-3" onclick="comprobarClave()">Registrarme</button>

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
<script>
    //Alerta Correo registrado
    let formulario = document.querySelector("form");

    function desactivarAlerta() {
        formulario.addEventListener("keypress", function () {
            let alerta = document.getElementById("error");

            if (alerta != null) {
                alerta.classList.remove("mostrar");
                alerta.classList.add("ocultar");
            }

        });
    }

    desactivarAlerta();

    //Sweet-alert Error registrar usuario
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

</script>
</body>
</html>

