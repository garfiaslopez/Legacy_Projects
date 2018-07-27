package keybox

class Valor {

    String valor

    static belongsTo = [idDato: Dato, idEspecifico: Especifico]

    static constraints = {

        valor (nullable: false, blank: false, minSize: 1, maxSize: 145)

    }

    static mapping = {

        version false

    }

}
