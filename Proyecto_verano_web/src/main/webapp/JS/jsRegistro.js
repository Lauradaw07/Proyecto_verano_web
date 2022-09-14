<!--Función alerta claves distintas-->
function comprobarClave() {
    let clave1 = document.getElementById("clave1").value;
    let clave2 = document.getElementById("clave2").value;
    const formulario = document.querySelector("form");

    if ((clave1 !== "") && (clave2 !== "")) {
        if (clave1 !== clave2) {
            document.getElementById("errorClaves").classList.remove("ocultar");
            document.getElementById("errorClaves").classList.add("mostrar");
            setTimeout(function() {
                document.getElementById("errorClaves").classList.remove("mostrar");
                document.getElementById("errorClaves").classList.add("ocultar");
            }, 3000);

            formulario.reset();
            return false;
        } else {
            document.getElementById("errorClaves").classList.remove("mostrar");
            document.getElementById("errorClaves").classList.add("ocultar");
            return true;
        }
    }
}