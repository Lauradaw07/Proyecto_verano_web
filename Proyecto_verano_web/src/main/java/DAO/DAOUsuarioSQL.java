package DAO;

import modelos.Usuario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DAOUsuarioSQL implements DAOUsuario {

    //INSERT-----------------------------------------------------------------------------------------------------------------------
    @Override
    public boolean insert(Usuario usuario, DAOManager dao) {
        String sentencia;
        //INSERT INTO usuarios VALUES('Laura', 'Cabezas', 'laura@gmail.com', '1234', 'jhksdn', false)
        //sentencia = "INSERT INTO usuarios VALUES ('" + usuario.getNombre() + "', '" + usuario.getApellido() + "', '" + usuario.getEmail() + "', '" + usuario.getClave() + "', '" + usuario.getToken() + "', " + false + " )";
        //sentencia = "INSERT INTO usuarios VALUES(" + usuario.getNombre() + "', '" + usuario.getApellido() + "', '" + usuario.getEmail() + "', '" + usuario.getClave() + "','"+ false + "');'";

        sentencia = "INSERT INTO usuarios (nombre,apellido,email,clave,token,tokenValidado) values (?,?,?,?,?,?);";

        try  {
            PreparedStatement stmt = dao.getConn().prepareStatement(sentencia);
            stmt.setString(1,usuario.getNombre());
            stmt.setString(2,usuario.getApellido());
            stmt.setString(3,usuario.getEmail());
            stmt.setString(4,usuario.getClave());
            stmt.setString(5,usuario.getToken());
            stmt.setBoolean(6,false);
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }

    //UPDATE-----------------------------------------------------------------------------------------------------------------------
    @Override
    public boolean updateClave(String clave, int id, DAOManager dao) {
        String sentencia;
        sentencia = "UPDATE usuarios SET clave = '" + clave + "' WHERE id = " + id + ";";
        try (Statement stmt = dao.getConn().createStatement()) {
            stmt.executeUpdate(sentencia);
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateToken(int id, DAOManager dao) {
        String sentencia;
        sentencia = "UPDATE usuarios SET tokenValidado = true WHERE id = " + id + ";";
        try (Statement stmt = dao.getConn().createStatement()) {
            stmt.executeUpdate(sentencia);
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //DELETE-----------------------------------------------------------------------------------------------------------------------
    @Override
    public boolean deleteUsuario(int id, DAOManager dao) {
        String sentencia;
        sentencia = "DELETE FROM usuarios WHERE id = " + id + ";";
        try (Statement stmt = dao.getConn().createStatement()) {
            // enviar el commando insert
            stmt.executeUpdate(sentencia);
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //READ-----------------------------------------------------------------------------------------------------------------------
    @Override
    public Usuario readUsuarioPorCorreo(String email, DAOManager dao) {
        Usuario usuario = null;
        String sentencia;
        sentencia = "SELECT * FROM usuarios WHERE email = ?";
        try {
            PreparedStatement ps = dao.getConn().prepareStatement(sentencia);
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // obtener cada una de la columnas y mapearlas a la clase Alumno
                    usuario = new Usuario(
                            rs.getString("nombre"),
                            rs.getString("apellido"),
                            rs.getString("email"),
                            rs.getString("clave")
                    );
                    usuario.setId(rs.getInt("id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    @Override
    public Usuario readUsuarioPorCorreoYClave(String email, String password, DAOManager dao) {
        Usuario usuario = null;
        String sentencia;
        sentencia = "SELECT * FROM usuarios WHERE email = ? AND clave = ?";
        try {
            PreparedStatement ps = dao.getConn().prepareStatement(sentencia);
            ps.setString(1, email);
            ps.setString(2,password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // obtener cada una de la columnas y mapearlas a la clase Usuario
                    usuario = new Usuario(
                            rs.getString("nombre"),
                            rs.getString("apellido"),
                            rs.getString("email"),
                            rs.getString("clave")
                    );
                    usuario.setId(rs.getInt("id"));
                    usuario.setToken(rs.getString("token"));
                    usuario.setVerificado(rs.getBoolean("tokenValidado"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    //READ ALL-----------------------------------------------------------------------------------------------------------------------
    @Override
    public ArrayList<Usuario> readALLUsuarios(DAOManager dao) {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        String sentencia;
        sentencia = "SELECT * FROM usuarios;";
        try {
            PreparedStatement ps = dao.getConn().prepareStatement(sentencia);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Usuario usuario = new Usuario(
                            rs.getString("nombre"),
                            rs.getString("apellido"),
                            rs.getString("email"),
                            rs.getString("clave")
                    );
                    usuario.setId(rs.getInt("id"));
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }
}