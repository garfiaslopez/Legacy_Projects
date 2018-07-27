package keybox

class Especifico {

    String nombre
    String tipo

    static belongsTo = [idCategoria:Categoria]
    static hasMany = [idValor: Valor]

    static constraints = {

        nombre (nullable: false, blank: false, minSize: 1, maxSize: 145)

    }

    static mapping = {

        version false

    }

}
