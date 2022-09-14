package modelos;

import DAO.*;

public class GestionApp {
    static final DAOManager dao = DAOManager.getSinglentonInstance();;

    //Atributos
    private static DAOUsuarioSQL daoUsuarioSQL;
    private static DAOTecnicoSQL daoTecnicoSQL;
    private static DAOAdminSQL daoAdminSQL;
    private static DAOIncidenciaSQL daoIncidenciaSQL;

    //Getters y setters


    //Constructor
    public GestionApp() {
        if (dao == null) System.out.println("El singlenton funciona");
        try {
            dao.open();
            System.out.println("Conexión establecida");
        } catch (Exception e) {
            System.out.println("Error de conexión en la BBDD");
        }
        daoUsuarioSQL = new DAOUsuarioSQL();
        daoTecnicoSQL =  new DAOTecnicoSQL();
        daoAdminSQL = new DAOAdminSQL();
        daoIncidenciaSQL = new DAOIncidenciaSQL();
    }

    //LOG IN
    //Log in Usuarios
    public static Usuario logInUsuario(String correo, String clave) {
        return daoUsuarioSQL.readUsuarioPorCorreoYClave(correo, clave, dao);
    }

    //Log in Técnicos
    public static Tecnico logInTecnico(String correo, String clave) {
        return daoTecnicoSQL.readTecnicoPorCorreoYClave(correo, clave, dao);
    }

    //Log in Administradores
    public static Admin logInAdmin(String correo, String clave) {
        return daoAdminSQL.readAdminPorCorreoYClave(correo, clave, dao);
    }

    //REGISTRO
    //Registro usuarios
    public static boolean registroUsuario(Usuario usuario) {

        return daoUsuarioSQL.insert(usuario, dao);
    }

    //RECUPERAR CLAVE USUARIO
    //Obtener usuario por su correo
    public static Usuario obtenerUsuarioPorCorreo(String email) {
        return daoUsuarioSQL.readUsuarioPorCorreo(email, dao);
    }

    //Obtener usuario por su correo y su contraseña
    public static Usuario obtenerUsuarioPorCorreoYClave(String email, String clave) {
        return daoUsuarioSQL.readUsuarioPorCorreoYClave(email, clave, dao);
    }

    //CAMBIAR CLAVE USUARIO
    public static Boolean cambiarClave(Usuario usuario, String clave) {
        return daoUsuarioSQL.updateClave(clave, usuario.getId(), dao);
    }

    //VALIDAR TOKEN
    public static boolean validarToken(int id) {
        return daoUsuarioSQL.updateToken(id, dao);
    }

    //CREAR INCIDENCIA
    public static boolean crearIncidencia(Incidencia incidencia) {
        return daoIncidenciaSQL.insert(incidencia, dao);
    }

}