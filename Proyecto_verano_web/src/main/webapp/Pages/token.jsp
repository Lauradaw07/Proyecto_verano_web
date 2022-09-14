<%--
  Created by IntelliJ IDEA.
  User: Akame
  Date: 04/09/2022
  Time: 13:17
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--JS Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Activación cuenta</title>
</head>
<body>
<div class="bgcontainer">

    <div class="container-fluid alto100 d-flex justify-content-around">

        <div class="row">

            <div class="col-12 col-lg-1 mt-4">

                <!--Icono para regresar al Home-->
                <a href="../index.jsp"><img src="../Assets/Icons/iconoVolver.png" alt="Icono no disponible"></a>

            </div>

        </div>

        <div class="container-fluid d-flex justify-content-center">

            <div class="row justify-content-center align-items-center">

                <div class="col-12 col-lg-10 col-md-10 col-sm-2">

                    <div class="card">

                        <div class="card-body">

                            <div class="row">

                                <h1 class="card-title mb-3">Código de validación</h1>

                                <h4 class="card-subtitle mt-1 mb-3 text-muted">Ingrese el código de validación que ha recibido en su correo</h4>

                            </div>

                            <div class="row">

                                <!--Formulario-->

                                <form action="${pageContext.request.contextPath}/Token" method="post">

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

                                    <div class="mt-4 mb-4">

                                        <input type="text" class="form-control form-control-md mt-2" name="token" id="codigo" placeholder="Código de validación" required>

                                    </div>

                                    <!--Botón Enviar-->
                                    <div class="row-lg-3 d-flex justify-content-center">

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
    let casilla = document.getElementById("codigo");
    console.log(casilla)

    function desactivarAlerta() {
        casilla.addEventListener("keypress", function () {

            let alerta = document.getElementById("error");
            console.log(alerta)

            if (alerta != null) {
                alerta.classList.remove("mostrar");
                alerta.classList.add("ocultar");
            }

        });
    }

    desactivarAlerta();

</script>

</body>
</html>
