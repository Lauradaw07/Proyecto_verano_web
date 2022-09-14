package servlets;

import modelos.Admin;
import modelos.GestionApp;
import modelos.Tecnico;
import modelos.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogIn", value = "/LogIn")
public class LogIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtenemos el correo y la contraseña del formulario
        String correo = request.getParameter("email");
        String clave = request.getParameter("password");

        GestionApp gestor = null;

        try {
            gestor = new GestionApp();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (gestor != null) {
            //Buscamos en la BD si el correo y la clave pertenecen a un usuario, técnico o administrador
            Usuario usuario = GestionApp.logInUsuario(correo, clave);
            Tecnico tecnico = GestionApp.logInTecnico(correo, clave);
            Admin administrador = GestionApp.logInAdmin(correo,clave);
            HttpSession session = request.getSession();

            if(usuario != null) {
                if (!usuario.isVerificado()) {
                    session.setAttribute("Usuario", usuario);
                    response.sendRedirect("./Pages/token.jsp");
                } else {
                    session.setAttribute("Usuario", usuario);
                    response.sendRedirect("./Pages/homeUsuario.jsp");
                }
            } else if (tecnico != null) {
                System.out.println(tecnico.getNombre());
            } else if (administrador != null){
                if(administrador.isEsSuperAdmin()){
                    session.setAttribute("SuperAdmin",administrador);
                    response.sendRedirect("./Pages/homeSuperAdmin.jsp");
                }
                System.out.println(administrador.getNombre());
            } else {
                session.setAttribute("falloLogIn","true");
                response.sendRedirect("./index.jsp");
            }
        }
    }
}
