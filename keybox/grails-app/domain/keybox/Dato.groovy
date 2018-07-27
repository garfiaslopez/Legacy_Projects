package keybox

class Dato {

    String nombre
    String descripcion
    String tipoPropuesta
    String elaborado
    Date fecha
    String tags
    String archivoDropbox

    static hasMany = [idValor: Valor, idComentario: Comentario, idFavorito: Favorito]
    static belongsTo = [idCategoria: Categoria]

    static constraints = {

        nombre (nullable: false, blank: false, minSize: 1, maxSize: 145)
        descripcion (nullable: false, blank: false, minSize: 1, maxSize: 140)
        tipoPropuesta (nullable: false, blank: false, minSize: 1, maxSize: 145)
        elaborado (nullable: false, blank: false, minSize: 1, maxSize: 135)
        tags (nullable: false, blank: false, minSize: 1, maxSize: 128)
        archivoDropbox (nullable: true, blank: true, minSize: 1, maxSize: 245)

    }

    static mapping = {

        version false

    }

}
