package keybox

class Filtro {

    String nombre
    String icono
    String color

    static belongsTo = [idCategoria: Categoria]

    static constraints = {

        nombre (nullable: false, blank: false, minSize: 1, maxSize: 145)
        icono (nullable: false, blank: false, minSize: 2, maxSize: 145)
        color (nullable: false, blank: false, minSize: 2, maxSize: 145)

    }

    static mapping = {

        version false

    }

}
