package DAO;

import modelos.Usuario;

import java.util.ArrayList;

public interface DAOUsuario {
    public boolean insert(Usuario usuario, DAOManager dao);

    public boolean updateClave(String clave, int id, DAOManager dao);

    public boolean updateToken(int id, DAOManager dao);

    public boolean deleteUsuario(int id, DAOManager dao);

    public Usuario readUsuarioPorCorreo(String email, DAOManager dao);

    public Usuario readUsuarioPorCorreoYClave(String email, String password, DAOManager dao);

    public ArrayList<Usuario> readALLUsuarios(DAOManager dao);
}
