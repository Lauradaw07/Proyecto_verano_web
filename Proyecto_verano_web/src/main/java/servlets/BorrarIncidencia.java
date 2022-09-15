package servlets;

import modelos.GestionApp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BorrarIncidencia", value = "/BorrarIncidencia")
public class BorrarIncidencia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GestionApp gestor = null;

        try {
            gestor = new GestionApp();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
        System.out.println(idIncidencia);

        if (idIncidencia > 0) {
            if (GestionApp.borrarIncidencia(idIncidencia)) {
                session.setAttribute("estaBorrada","true");
                response.sendRedirect("./Pages/borrarIncidencia.jsp");
            } else {
                session.setAttribute("estaBorrada", "false");
                response.sendRedirect("./Pages/borrarIncidencia.jsp");
            }

        }


    }
}
