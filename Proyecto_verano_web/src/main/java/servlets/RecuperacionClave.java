package servlets;

import modelos.GestionApp;
import modelos.Usuario;
import utilidades.Correo;
import utilidades.GenerarClave;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RecuperacionClave", value = "/RecuperacionClave")
public class RecuperacionClave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtenemos el correo del formulario
        GestionApp gestor = null;

        try {
            gestor = new GestionApp();
        } catch (Exception e) {
            e.printStackTrace();
        }

        //Obtenemos el correo del formulario
        String correo = request.getParameter("correo");
        HttpSession session = request.getSession();

        //Comprobamos que el correo del usuario esté registrado en la BD
        Usuario usuario = GestionApp.obtenerUsuarioPorCorreo(correo);

        if (usuario != null) {
            //Generamos una nueva clave
            String nuevaClave = GenerarClave.generaClave();

            //Modificamos la clave del usuario en la BD
            if (GestionApp.cambiarClave(usuario, nuevaClave)) {
                response.sendRedirect("./index.jsp");
            }

            //Mandamos un correo al usuario con su nueva contraseña
            String asunto = "Cambio de contraseña";
            String cuerpo = "<p>Se ha solicitado un cambio de contraseña desde su cuenta. Su nueva clave es: <b>" + nuevaClave + "</b> " +
                    "<br>" +
                    "Le recomendamos que vuelva a cambiar la clave desde el menú de usuario, una vez haya iniciado sesión con esta clave.</p>";
            Correo.enviarCorreo(usuario.getEmail(), asunto, cuerpo);

            //Cambiamos la contraseña del usuario en la BD
            usuario.setClave(nuevaClave);
        } else {
            session.setAttribute("falloRecuperacionClave","true");
            response.sendRedirect("./Pages/recuperarClave.jsp");
        }
    }
}
