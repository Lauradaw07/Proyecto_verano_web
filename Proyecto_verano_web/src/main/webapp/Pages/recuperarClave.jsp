<%--
  Created by IntelliJ IDEA.
  User: Akame
  Date: 04/09/2022
  Time: 15:25
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
    <link rel="stylesheet" href="../CSS/EstilosRecuperarClave.css">
    <!--CSS Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Recuperación clave</title>
</head>
<body>

<div class="bgcontainer">

    <div class="container-fluid alto100 d-flex justify-content-around">

        <div class="row">

            <div class="col-12 col-lg-1 mt-4">

                <!--Icono para regresar al Inicio-->
                <a href="../index.jsp"><img src="../Assets/Icons/iconoVolver.png" alt="Icono no disponible"></a>

            </div>

        </div>

        <div class="container-fluid d-flex justify-content-center">

            <div class="row justify-content-center align-items-center">

                <div class="col-12 col-lg-6">

                    <div class="card">

                        <div class="card-body">

                            <div class="row d-flex justify-content-center">

                                <div class="row align-items-center">

                                    <div class="col-10">

                                        <h1 class="card-title mb-4">¿Ha olvidado su contraseña?</h1>

                                    </div>

                                    <div class="col-2">

                                        <img id="imagenClave" src="../Assets/Icons/clave.png" alt="Imagen no disponible">

                                    </div>

                                </div>

                                <h4 class="card-subtitle text-muted mb-4 mt-4">Introduzca el email asociado a su cuenta. Le enviaremos un correo con una nueva contraseña.</h4>

                            </div>

                            <div class="row">

                                <%
                                    String comprobacionRegistro = (String) session.getAttribute("falloRecuperacionClave");
                                    if (comprobacionRegistro != null && comprobacionRegistro.equals("true")) { %>
                                <!--Mensaje de verificación-->
                                <div id="falloRecuperacionClave" class="alert alert-danger mostrar" role="alert">

                                    El correo indicado no está asociado a ninguna cuenta

                                </div>
                                <% }
                                    session.removeAttribute("falloRecuperacionClave"); %>

                                <form action="${pageContext.request.contextPath}/RecuperacionClave" method="post">

                                    <div>

                                        <input type="email" class="form-control form-control-md mt-2" name="correo" id="email" placeholder="Email" required>

                                    </div>

                                    <!--Botón Enviar-->
                                    <div class="row-lg-3 d-flex mt-4 justify-content-center">

                                        <button type="submit" class="btn btn-primary btn-lg mt-2">Enviar</button>

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
    <!--Función Alerta Correo registrado-->
    let correo = document.getElementById("email");
    function comprobarEmailYclave() {
        correo.addEventListener("keypress", function () {
            let alerta = document.getElementById("falloRecuperacionClave");

            if (alerta != null) {
                alerta.classList.remove("mostrar");
                alerta.classList.add("ocultar");
            }

        });
    }

    comprobarEmailYclave();
</script>
</body>
</html>