package keybox

class Comentario {

    String descripcion
    Date fecha

    static belongsTo = [idDato: Dato, idEmpleado: Empleado]

    static constraints = {

        descripcion (nullable: false, blank: false, minSize: 1, maxSize: 140)

    }

    static mapping = {

        version false

    }

}
