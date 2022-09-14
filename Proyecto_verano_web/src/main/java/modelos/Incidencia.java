package modelos;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Incidencia {
    //Atributos
    private int id;
    private String descripcion;
    private String solucion;
    private int prioridad;
    private boolean estaResuelta;
    private String fechaInicio;
    private String fechaFin;
    private int idUsuario;
    private boolean estaAsignada;
    private int idTecnico = -1;

    //Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSolucion() {
        return solucion;
    }

    public void setSolucion(String solucion) {
        this.solucion = solucion;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public boolean isEstaResuelta() {
        return estaResuelta;
    }

    public void setEstaResuelta(boolean estaResuelta) {
        this.estaResuelta = estaResuelta;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public boolean isEstaAsignada() {
        return estaAsignada;
    }

    public void setEstaAsignada(boolean estaAsignada) {
        this.estaAsignada = estaAsignada;
    }

    public int getIdTecnico() {
        return idTecnico;
    }

    public void setIdTecnico(int idTecnico) {
        this.idTecnico = idTecnico;
    }

    @Override
    public String toString() {
        return "\n╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════╗" + "\n" +
                " ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡   INCIDENCIA   ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡  " + "\n" +
                "    Incidencia con id: " + id + "\n" +
                "    Comentarios del usuario: " + descripcion + "\n" +
                "    Prioridad: " + prioridad + "\n" +
                "    Fecha de creación: " + fechaInicio + "\n" +
                "    Solución del técnico: " + ((solucion == null) ? "No existe solución aún" : solucion) + "\n" +
                "    Fecha en la que se cerró: " +((estaResuelta) ? fechaFin : "Aún no se ha cerrado") + "\n" +
                "╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════╝";
    }

    Calendar fechaComienzo = Calendar.getInstance();

    private String getFechaFormateada() {
        return new SimpleDateFormat("dd/MM/yyyy").format(this.fechaComienzo.getTime());
    }

    //Constuctor
    public Incidencia(){}

    public Incidencia(String descripcion, String fechaInicio,int idUsuario) {
        this.descripcion = descripcion;
        this.prioridad = 0;
        this.fechaInicio = fechaInicio;
        this.fechaFin = null;
        this.idUsuario = idUsuario;
    }

}