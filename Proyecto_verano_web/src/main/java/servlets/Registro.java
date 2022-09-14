package servlets;

import modelos.GestionApp;
import modelos.Usuario;
import utilidades.Correo;
import utilidades.GenerarClave;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "Registro", value = "/Registro")
public class Registro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionApp gestor = null;

        try {
            gestor = new GestionApp();
        } catch (Exception e) {
            e.printStackTrace();
        }

        //Obtenemos los parámetros del fomulario de registro en la web
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String correo = request.getParameter("email").trim();
        String clave = request.getParameter("password").trim();
        HttpSession session = request.getSession();

        // Patrón para validar el email
        Pattern pattern = Pattern
                .compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

        //Pasamos el email al comprobador
        Matcher mather = pattern.matcher(correo);

        if (mather.find() == true) {
            //Comprobamos si el correo está registrado en la BD
            Usuario usuario = GestionApp.obtenerUsuarioPorCorreo(correo);

            if (usuario == null) {
                if ((!nombre.isEmpty()) && (!apellido.isEmpty()) && (!correo.isEmpty()) && (!clave.isEmpty())) {
                    //Creamos un usuario al que pasamos los datos obtenidos del formulario
                    Usuario nuevoUsuario = new Usuario(nombre, apellido, correo, clave);

                    //Crear token
                    String token = GenerarClave.generaClave();

                    //Seteamos el token al usuario que vamos a registrar
                    nuevoUsuario.setToken(token);

                    //Registramos al usuario en la BD
                    if (GestionApp.registroUsuario(nuevoUsuario)) {
                        //Mandamos un correo con el token al usuario
                        String asunto = "Bienvenido al Sistema de Gestión de Incidencias";
                        String cuerpo = "<p>Su código de validación es: <b>" + token + "</b> " +
                                "<br>" +
                                "Ingrese este código en la web para poder acceder a su cuenta.</p>";
                        Correo.enviarCorreo(nuevoUsuario.getEmail(), asunto, cuerpo);

                        //Almacenamos un booleano en la sesión, que activa la Sweet-alert para usuarios registrados con éxito
                        session.setAttribute("estaRegistrado","true");

                        //Redirigimos al usuario a la página de Log-in para que pueda iniciar sesión en su cuenta
                        response.sendRedirect("./index.jsp");
                    } else {
                        //Almacenamos un booleano en la sesión, que activa la Sweet-alert para usuarios que no se pueden registrar
                        session.setAttribute("estaRegistrado","false");

                        //Redirigimos al usuario a la página de registro para que pueda intentar registrarse de nuevo
                        response.sendRedirect("./Pages/registro.jsp");
                    }

                } else {
                    //Almacenamos un booleano en la sesión, que activa la alerta para datos inválidos del formulario
                    session.setAttribute("error","true");
                    //Almacenamos el mensaje que aparecerá en la alerta
                    session.setAttribute("mensajeDeError","Introduzca datos válidos");

                    //Redirigimos al usuario a la página de registro para que pueda intentar registrarse de nuevo
                    response.sendRedirect("./Pages/registro.jsp");
                }
            } else {
                //Almacenamos un booleano en la sesión, que activa la alerta para correos que ya están registrados en la BD
                session.setAttribute("error","true");
                //Almacenamos el mensaje que aparecerá en la alerta
                session.setAttribute("mensajeDeError", "El correo indicado ya está asociado a una cuenta");

                //Redirigimos al usuario a la página de registro para que pueda intentar registrarse de nuevo
                response.sendRedirect("./Pages/registro.jsp");
            }
        }

    }
}