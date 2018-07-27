package keybox

class Favorito {

    static belongsTo = [idEmpleado: Empleado, idDato: Dato]

    static mapping = {

        version false

    }
}
