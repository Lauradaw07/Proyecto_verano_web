package utilidades;

import java.util.UUID;

public class GenerarClave {
    public static String generaClave() {
        String clave = UUID.randomUUID().toString().substring(0,6).toUpperCase();
        return clave;
    }
}
