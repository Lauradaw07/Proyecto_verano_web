package servlets;

import modelos.GestionApp;
import modelos.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Token", value = "/Token")
public class Token extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtenemos el token del formulario
        String token = request.getParameter("token");
        HttpSession session = request.getSession();

        GestionApp gestor = null;

        try {
            gestor = new GestionApp();
        } catch (Exception e) {
            e.printStackTrace();
        }

        //Creamos un usuario en el que almacenamos los datos del usuario guardado en la sesión de log-in
        Usuario usuarioSesion = (Usuario)request.getSession().getAttribute("Usuario");

        //Comprobamos si el token obtenido en el formulario y el registrado en la BD son el mismo
        if (token.equals(usuarioSesion.getToken())) {
            //Validamos el token en la BD
            if (GestionApp.validarToken(usuarioSesion.getId())) {
                response.sendRedirect("./Pages/homeUsuario.jsp");
            }
        } else {
            session.setAttribute("error", "true");
            session.setAttribute("mensajeDeError", "Código incorrecto. Revise de nuevo su correo.");
            response.sendRedirect("./Pages/token.jsp");
        }
    }
}