package servlets;

import modelos.GestionApp;
import modelos.Incidencia;
import modelos.Usuario;
import utilidades.ObtenerFechaActual;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@WebServlet(name = "CrearIncidencia", value = "/CrearIncidencia")
public class CrearIncidencia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionApp gestor = null;

        try {
            gestor = new GestionApp();
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();

        //Creamos un usuario en el que almacenamos los datos del usuario guardado en la sesión de log-in
        Usuario usuarioSesion = (Usuario)request.getSession().getAttribute("Usuario");

        //Obtenemos la descripción de la incidencia del formulario
        String descripcion = request.getParameter("descripcion").trim();

        if (!descripcion.isEmpty()) {
            //Obtenemos la fecha actual
            String fechaInicio = ObtenerFechaActual.obtenerFechaActual();

            Incidencia nuevaIncidencia = new Incidencia(descripcion, fechaInicio,usuarioSesion.getId());

            if (GestionApp.crearIncidencia(nuevaIncidencia)) {
                session.setAttribute("estaCreada", "true");
                response.sendRedirect("./Pages/homeUsuario.jsp");
            } else {
                session.setAttribute("estaCreada", "false");
                response.sendRedirect("./Pages/homeUsuario.jsp");
            }
        } else {
            session.setAttribute("error", "true");
            session.setAttribute("mensajeDeError", "Debe introducir una descripción");
            response.sendRedirect("./Pages/registrarIncidencia.jsp");
        }



    }
}
