<%--
  Created by IntelliJ IDEA.
  User: Akame
  Date: 08/09/2022
  Time: 19:26
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
  <link rel="stylesheet" href="../CSS/EstilosRegistroIncidencia.css">
  <!--CSS Bootstrap-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <!--JS Bootstrap-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  <title>Registro Incidencia</title>
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

        <div class="col-12 col-lg-8">

          <div class="card ">

            <div class="card-body">

              <div class="row">

                <!--Título-->
                <h1 class="card-title">Registro de incidencia</h1>

                <!--Subtítulo-->
                <h4 class="card-subtitle text-muted mt-3">Describa detalladamente su problema, duda o consulta.</h4>

              </div>

              <div class="row">

                <div class="col-12 col-lg-12">

                  <form action="${pageContext.request.contextPath}/CrearIncidencia" method="post">

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

                    <!--Descripción-->
                    <div class="row">

                      <div class="col-12 col-lg-11 d-flex justify-content-center">

                        <!--Descripción incidencia-->
                        <textarea name="descripcion" id="descripcionIncidencia" class="form-control form-control-md mt-4 text-muted" cols="10" rows="7" placeholder="Introduzca una descripción..."></textarea>

                      </div>

                    </div>

                    <div class="row ">

                      <div class="col-12 col-lg-12 d-flex justify-content-evenly align-items-center izquierda mt-3">

                        <div class="row">

                          <button type="reset" id="botonBorrar" class="btn btn-primary btn-lg mt-3">Borrar</button>

                        </div>

                        <div class="row">

                          <button type="submit" id="botonRegistro" class="btn btn-primary btn-lg mt-3">Enviar</button>

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
  <!--Función Alerta Correo registrado-->
  let casilla = document.getElementById("descripcionIncidencia");

  function desactivarAlerta() {
    casilla.addEventListener("keypress", function () {
      let alerta = document.getElementById("error");

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