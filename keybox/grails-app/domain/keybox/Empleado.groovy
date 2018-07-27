package keybox

class Empleado {

    String nombre
    String correo
    byte[] avatar
    String usuario

    static hasMany = [idComentario: Comentario, idFavorito: Favorito]

    static constraints = {

        nombre (nullable: false, blank: false, minSize: 1, maxSize: 235)
        correo (nullable: false, blank: false, minSize: 1, maxSize: 180)
        avatar (nullable: true, blank: true, maxSize: 2 * 1024 * 1024)

    }

    static mapping = {

        version false

    }

}
