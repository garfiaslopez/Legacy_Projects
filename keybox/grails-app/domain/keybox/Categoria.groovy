package keybox

class Categoria {

    String nombre
    Integer maxFiltro
    Integer maxDato

    static hasMany = [idEspecifico: Especifico, idFiltro: Filtro, idDato: Dato]

    static constraints = {

        nombre (nullable: false, blank: false, minSize: 1, maxSize: 145)

    }

    static mapping = {

        version false

    }

}
