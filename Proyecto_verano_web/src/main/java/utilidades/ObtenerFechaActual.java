package utilidades;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ObtenerFechaActual {
    public static String obtenerFechaActual() {
        Calendar fecha = Calendar.getInstance();

        String fechaActual = new SimpleDateFormat("dd/MM/yyyy").format(fecha.getTime());

        return fechaActual;
    }
}
