package modelos;

import java.util.ArrayList;

public class Usuario extends UsuarioBase{
    //Atributos
    private String token;

    private boolean verificado;

    //Getters y setters
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public boolean isVerificado() {
        return verificado;
    }

    public void setVerificado(boolean verificado) {
        this.verificado = verificado;
    }

    //Constructor
    public Usuario(String nombre, String apellido, String email, String clave) {
        super(nombre, apellido, email, clave);
        this.token = null;
        this.verificado = false;
    }

    @Override
    public String toString() {
        return "\n╔═════════════════════════════════════════════════════════════════════╗" + "\n" +
                " ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡   USUARIO   ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡  " + "\n" +
                "    Usuario con id: " + getId() + "\n" +
                "    Nombre: " + getNombre() + "\n" +
                "    Apellido: " + getApellido() + "\n" +
                "    Email: " + getEmail() + "\n" +
                "    TOKEN: " + getToken() + "\n" +
                "    Validado: " + isVerificado() + "\n" +
                "╚═════════════════════════════════════════════════════════════════════╝";
    }
}
