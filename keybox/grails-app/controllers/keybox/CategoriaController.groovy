package keybox

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.security.access.annotation.Secured


@Secured(['ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_USER'])
class CategoriaController {

    def springSecurityService
    Long vari=0;



    def agregarFiltro(){

        JSONArray r = JSON.parse(params.nombre)
        JSONObject map

        map = r.getJSONObject(0)

        def dato = Categoria.findAll("from Categoria C where C.nombre=?", [map.valor])[0]
        def filtros = Filtro.findAll("from Filtro where idCategoria = " + dato.id)
        int n = dato.maxFiltro - filtros.size()
        [dato: map.valor, categoria: dato, filtros: n, maximo: dato.maxFiltro]

    }

    def editarFiltro(){

        JSONArray r = JSON.parse(params.values)
        JSONObject map

        map = r.getJSONObject(0)

        def actualFilter = Filtro.find("from Filtro where id = ?", [Long.parseLong(map.filterId)])
        def dato = Categoria.findAll("from Categoria C where C.nombre=?", [map.catName])[0]
        def filtros = Filtro.findAll("from Filtro where idCategoria = " + dato.id)
        int n = dato.maxFiltro - filtros.size()
        [dato: map.catName, categoria: dato, filtros: n, maximo: dato.maxFiltro, actualFiltro:actualFilter]

    }

    def editarDato(){

        JSONArray r = JSON.parse(params.idd)
        JSONObject map

        map = r.getJSONObject(0)

        def dato = Dato.find("from Dato where id = ?", [Long.parseLong(map.identificador)])
        def especificos = Especifico.find("from Especifico where idCategoria = ?", [dato.idCategoria] )
        def filtros = Filtro.findAll("from Filtro where idCategoria = ?", [dato.idCategoria])
        def empleados = Empleado.findAll("from Empleado")

        [dato: dato,  especificos: especificos, filtros: filtros, empleados: empleados]


    }


    def campo(){



    }

    def indice(Long id){

        def user = springSecurityService.currentUser;
        String usuario = user.username

        println user

        def empleado = Empleado.find("from Empleado where usuario = ?", [user.username])


        println "pos = " + id


        def categorias = Categoria.executeQuery("select C.nombre, C.id from Categoria C")
        def fav = Empleado.executeQuery(" select d.nombre,d.id from Favorito f, Empleado e , Dato d, Role r,UsuarioRole us, Usuario u where u.username ='"+usuario+"' and e.usuario='"+usuario+"' and f.idDato=d.id and e.id=f.idEmpleado and us.usuario=u.id and r.id=us.role group by d.id")
        def datUs = Empleado.executeQuery("select e.nombre, e.avatar from Empleado e , Role r , UsuarioRole us, Usuario u where e.usuario='"+usuario+"' and us.usuario=u.id and r.id=us.role group by e.id")
        def min = Categoria.executeQuery("select min(C.id) from Categoria C")

        if(min[0] == null) {
            min[0] = 0
        }


        println usuario

        [categorias: categorias, favoritos:fav, dats: datUs, usuario: user, empleado: empleado, min: min, pos: id]

    }


    def favoritoUS() {

        def user = springSecurityService.currentUser;
        String usuario = user.username
        def fav = Empleado.executeQuery(" select d.nombre,d.id from Favorito f, Empleado e , Dato d, Role r,UsuarioRole us, Usuario u where u.username ='"+usuario+"' and e.usuario='"+usuario+"' and f.idDato=d.id and e.id=f.idEmpleado and us.usuario=u.id and r.id=us.role group by d.id")
        [favoritos:fav]
    }

    def agregarContenido() {

        JSONArray r = JSON.parse(params.nombre)
        JSONObject map

        map = r.getJSONObject(0)

        def dato = Categoria.findAll("from Categoria C where C.nombre=?", [map.valor])[0]
        def filtros = Filtro.findAll("from Filtro F where F.idCategoria="+dato.id+"")

        def empleados = Empleado.findAll("from Empleado F")
        def especificos = Especifico.findAll("from Especifico where idCategoria = " + dato.id)

        def datos = Dato.findAll("from Dato where idCategoria = " + dato.id)

        int n = dato.maxDato - datos.size()

        [dato: map.valor, filtros: filtros, empleados: empleados, categoria: dato,
            especificos: especificos, datos: n, maximo: dato.maxDato]

    }

    def guardarContenido(){
        def categoria = Categoria.find("from Categoria where id = ?", [Long.parseLong(params.idt)])
        String fecha = params.fechaD
        def nuevaFecha = new Date().parse("d/M/yyyy", fecha)
        def nuevoDato = new Dato(nombre: params.nombreD, descripcion: params.descripcionD,
                tipoPropuesta: params.filtroD, elaborado: params.empleadoD, fecha: nuevaFecha,
                tags: params.tagsD, archivoDropbox: params.fileD)
        categoria.addToIdDato(nuevoDato)
        categoria.save(flush: true)

        def especificos = params.list('especifico')
        def ids = params.list('idEspecifico')

        if (especificos.size() > 0) {
            for (int i = 0; i < especificos.size(); i++) {
                def especifico = Especifico.find("from Especifico where id = " + ids.get(i))
                def nuevoValor = new Valor(valor: especificos.get(i))
                especifico.addToIdValor(nuevoValor)
                nuevoDato.addToIdValor(nuevoValor)
                        .save()
            }

        }
        flash.message = "Dato agregado correctamente"
        redirect(controller: "categoria", action: "indice", id: categoria.id)
    }

    def guardarFiltro() {
        def categoria = Categoria.find("from Categoria where id = " + params.idCategoria)
        def nuevoFiltro = new Filtro(nombre: params.nombreF, icono: params.iconoF, color: params.colorF)
        categoria.addToIdFiltro(nuevoFiltro)
                .save(flush: true)
        flash.message = "Filtro agregado correctamente"
        redirect(controller: "categoria", action: "indice", id: categoria.id)
    }



    def show() {


        JSONArray r = JSON.parse(params.idd)
        JSONArray r2 = JSON.parse(params.idF)

        JSONObject map,map2

        map = r.getJSONObject(0)
        map2 = r2.getJSONObject(0)

        Long idt =  Long.parseLong(map.identificador)


        Integer idt2 = Integer.parseInt(map.identificador)



        if(map.identificador.equals("0")) {

            def query = Categoria.executeQuery("select min(C.id) from Categoria C")

            idt = query[0]

            idt2 = query[0]

        }



        def filtros = Filtro.executeQuery("select F.nombre, F.id, F.icono, F.color from Filtro F where F.idCategoria="+idt2+"")
        def menu = Categoria.executeQuery("select C.nombre from Categoria C where C.id=?", [idt])

        String d = menu.get(0)



        [filtros: filtros, d: d]



    }

    def editarCategoria(){

        JSONArray r = JSON.parse(params.valor)
        JSONObject map

        map = r.getJSONObject(0)

        def query = Especifico.executeQuery("select E.nombre, E.id from Especifico E, Categoria C where E.idCategoria="+map.identificador+" and C.id=E.idCategoria")

        def query2 = Categoria.executeQuery("select C.maxDato, C.maxFiltro, C.nombre from Categoria C where id="+map.identificador+"")
        def categoria = Categoria.find("from Categoria where id = ?", [Long.parseLong(map.identificador)])
        render(view: 'editarCategoria', model: [datos: query, maximos: query2, categoria: categoria])

    }



    def mostrar() {



        JSONArray r = JSON.parse(params.idt)
        JSONObject map
        map = r.getJSONObject(0)


        Long idn =  Long.parseLong(map.identificador)

        def descripcion = Dato.executeQuery("select d.descripcion,d.nombre ,d.elaborado,d.fecha,d.tipoPropuesta,d.tags,d.archivoDropbox, d.id, f.icono, f.color from  Dato d, Filtro f where d.tipoPropuesta=f.nombre and d.idCategoria=f.idCategoria and d.id="+idn+"")


        println descripcion

        if(descripcion.size()<=0){
            descripcion = Dato.executeQuery("select d.descripcion,d.nombre ,d.elaborado,d.fecha,d.tipoPropuesta,d.tags,d.archivoDropbox, d.id, 'fa-circle', '#000000' from  Dato d where d.tipoPropuesta='Sin filtro' and d.id="+idn+"")
        }

        println descripcion


        [des: descripcion]

    }


    def resultado(){

        def user = springSecurityService.currentUser;
        String usuario = user.username

        JSONArray r = JSON.parse(params.texto)
        JSONObject map
        map = r.getJSONObject(0)

        def datos
        def fav = Empleado.executeQuery(" select d.nombre,d.id from Favorito f, Empleado e , Dato d, Role r,UsuarioRole us, Usuario u where u.username ='"+usuario+"' and e.usuario='"+usuario+"' and f.idDato=d.id and e.id=f.idEmpleado and us.usuario=u.id and r.id=us.role group by d.id")
            datos= Dato.executeQuery("select d.id, d.nombre, d.fecha, f.icono, f.color from Dato  d, Especifico e,Valor v, Filtro f where d.idCategoria=f.idCategoria and d.tipoPropuesta=f.nombre and d.id = v.idDato and (e.id = v.idEspecifico) and (e.nombre ='"+map.valor+"' or d.nombre='"+map.valor+"' or d.elaborado like '%"+map.valor+"%' or d.tags like '%"+map.valor+"%') group by d.id")
            datos+= Dato.executeQuery("select d.id, d.nombre, d.fecha, 'fa-circle', '#000000' from Dato  d, Especifico e,Valor v where d.tipoPropuesta='Sin filtro' and d.id = v.idDato and (e.id = v.idEspecifico) and (e.nombre ='"+map.valor+"' or d.nombre='"+map.valor+"' or d.elaborado like '%"+map.valor+"%' or d.tags like '%"+map.valor+"%') group by d.id")


        String cad=""
        for (int i = 0; i <datos.size() ; i++) {
                cad+="d.nombre != '"+datos.get(i).getAt(1)+"' and "

        }


        if(datos.size()==0){
            datos= Dato.executeQuery("select d.id, d.nombre, d.fecha, f.icono, f.color from Dato  d, Filtro f where d.idCategoria=f.idCategoria and d.tipoPropuesta=f.nombre and (d.nombre='"+map.valor+"' or d.elaborado like '%"+map.valor+"%' or d.tags like '%"+map.valor+"%') group by d.id")
            datos+= Dato.executeQuery("select d.id, d.nombre, d.fecha, 'fa-circle', '#000000' from Dato  d where d.tipoPropuesta='Sin filtro' and (d.nombre='"+map.valor+"' or d.elaborado like '%"+map.valor+"%' or d.tags like '%"+map.valor+"%') group by d.id")
        }else{
            datos+= Dato.executeQuery("select d.id, d.nombre, d.fecha, f.icono, f.color from Dato  d, Filtro f where d.idCategoria=f.idCategoria and d.tipoPropuesta=f.nombre and "+cad+" (d.elaborado like '%"+map.valor+"%' or d.tags like '%"+map.valor+"%') group by d.id")
            datos+= Dato.executeQuery("select d.id, d.nombre, d.fecha, 'fa-circle', '#000000' from Dato  d where d.tipoPropuesta='Sin filtro' and "+cad+" (d.elaborado like '%"+map.valor+"%' or d.tags like '%"+map.valor+"%') group by d.id")
        }

        //println "Este es el icono: " + datos[0].getAt(3)

        Integer cont =0 , cont2=0;
        for (int i = 0; i < fav.size() ; i++) {

            cont++;
        }

        if(datos.size()==0) {

            flash.errorBus = "No se encontraron coincidencias"
        }

        [dato:datos,favoritos:fav,contador: cont,contador2: cont2]

    }








    def comenUsuario() {

        def user = springSecurityService.currentUser;
        String usuario = user.username

        JSONArray r = JSON.parse(params.idt)
        JSONObject map
        map = r.getJSONObject(0)


        Long idn =  Long.parseLong(map.identificador)
        def nombre = Comentario.executeQuery("SELECT e.nombre , c.descripcion, c.fecha,u.id FROM Empleado e, Comentario c , Usuario u WHERE e.id=c.idEmpleado AND c.idDato="+idn+" AND u.username=e.usuario")
        def descripcion = Dato.executeQuery("select d.descripcion,d.nombre ,d.elaborado,d.fecha,d.tipoPropuesta,d.tags,d.archivoDropbox, d.id from  Dato d where d.id="+idn+"")



        [comentarios: nombre,des:descripcion]

    }
    def agregar() {

        def categorias = Categoria.executeQuery("select C.nombre, C.id from Categoria C")

        [categorias: categorias]

    }

    def agregarCategoria() {

        println "max dato " + params.maxDato
        def listaCampos = params.list('nombreCampo')
        def listaValores = params.list('valor')
        def nuevaCategoria = new Categoria(nombre: params.titulo, maxDato: Integer.parseInt(params.maxDato),
                maxFiltro: Integer.parseInt(params.maxFiltro))
        for (int i = 0; i < listaCampos.size(); i++) {
            def nuevoEspecifico = new Especifico(nombre: listaCampos.get(i), tipo: listaValores.get(i))
            nuevaCategoria.addToIdEspecifico(nuevoEspecifico)
        }
        nuevaCategoria.save(flush: true)
        flash.message = "Categoria agregada exitosamente"
        redirect(controller: "categoria", action: "indice")
    }

    def guardarComentario() {
        JSONArray comentario = JSON.parse(params.comentario)
        JSONObject map
        map = comentario.getJSONObject(0)
        if (! map.comentario.equals("")) {
            def usuario = springSecurityService.currentUser;
            def empleado = Empleado.find("from Empleado where usuario  = ?", [usuario.username])
            def dato = Dato.find("from Dato where id = " + map.id)
            def fecha = new Date().format("d/M/yyyy hh:mm:ss")
            def fechaActual = new Date().parse("d/M/yyyy hh:mm:ss", fecha)
            def nuevoComentario = new Comentario(descripcion: map.comentario, fecha: fechaActual)

            println empleado

            dato.addToIdComentario(nuevoComentario)
            empleado.addToIdComentario(nuevoComentario)
                    .save()
            flash.message = "Dato agregado correctamente"
        } else {
            flash.error = "El comentario no puede ser vacío, inténtalo de nuevo"
        }
    }

    def guardarFavorito() {
        JSONArray comentario = JSON.parse(params.id)
        JSONObject map
        map = comentario.getJSONObject(0)
        def usuario = springSecurityService.currentUser;
        def empleado = Empleado.find("from Empleado where usuario  = ?", [usuario.username])
        def dato = Dato.find("from Dato where id = " + map.id)

        def query = Favorito.where {
            idDato == dato && idEmpleado == empleado
        }
        def favorito = query.find()
        if (favorito) {
            println "Existe"
            favorito.delete()
            dato.save(flush: true)
            empleado.save(flush: true)
        } else {
            favorito = new Favorito()
            dato.addToIdFavorito(favorito)
            empleado.addToIdFavorito(favorito)
                    .save(flush: true)
        }



    }





    def busquedaFiltro() {

        JSONArray r = JSON.parse(params.idt)
        JSONArray r2 = JSON.parse(params.idC)
        JSONObject map , map2
        map = r.getJSONObject(0)
        map2 = r2.getJSONObject(0)


        Long idn =  Long.parseLong(map.identificador)
        Long idnC =  Long.parseLong(map2.iden)

        def filtro = Dato.executeQuery("select d.nombre from Dato d , Filtro  f , Categoria c where d.idCategoria=f.idCategoria and d.tipoPropuesta=f.nombre and c.id=f.idCategoria and d.idCategoria ="+idnC+" and f.id="+idn+" group by d.id")

        [filtros: filtro]

    }

    def getImagen(Long id) {
        def usuario = Usuario.find("from Usuario where id = ?", [id])
        def empleado = Empleado.find("from Empleado where usuario = ?", [usuario.username])

        if (empleado) {
            response.setContentLength(empleado.avatar.size())
            response.outputStream.write(empleado.avatar)
        } else {
            def baseFolder = grailsAttributes.getApplicationContext().getResource("/").getFile().toString()
            def defa = new File(baseFolder + "/images/ui-rodolfo.png")
            byte [] d = defa.getBytes()
            response.setContentLength(d.size())
            response.outputStream.write(d)
        }
    }

    def eliminarDato() {
        JSONArray r = JSON.parse(params.id)
        JSONObject map
        map = r.getJSONObject(0)

        def dato = Dato.find("from Dato where id = ?", [Long.parseLong(map.id)])
        dato.delete()
        redirect(controller: "categoria", action: "indice", id: dato.idCategoria.id)
    }

    def eliminarFiltro() {
        JSONArray r = JSON.parse(params.id)
        JSONObject map
        map = r.getJSONObject(0)

        def filtro = Filtro.find("from Filtro where id = ?", [Long.parseLong(map.id)])

        def actualizarTP = Dato.findAll("from Dato D where D.tipoPropuesta=?", [filtro.nombre])

        for(def a: actualizarTP){

          a.tipoPropuesta = "Sin Filtro"
          a.save()

        }

        filtro.delete()
        redirect(controller: "categoria", action: "indice", id: filtro.idCategoria.id)
    }

    def busFil() {

        def user = springSecurityService.currentUser;
        String usuario = user.username


        JSONArray r = JSON.parse(params.idd)
        JSONArray r2 = JSON.parse(params.nombre)
        JSONArray r3 = JSON.parse(params.idd2)

        JSONObject map,map2,map3


        map = r.getJSONObject(0)
        map2 =  r2.getJSONObject(0)
        map3 = r3.getJSONObject(0)
        String nom = map2.nombre

        Long idt = Long.parseLong(map.identificador)

        Long id2 = Long.parseLong(map3.identificador)


        //TODO: RECUPERAR DE AQUI EL ICONO PARA PODER MOSTRAR EN TABLA

        def resultados

        if(nom.equals("categoria")){

            resultados = Dato.executeQuery("select D.nombre, D.id, D.fecha, D.elaborado, f.icono, f.color,D.archivoDropbox from Dato D, Filtro f where D.idCategoria=f.idCategoria and D.tipoPropuesta=f.nombre and D.idCategoria="+idt+"")

            def resultados2 = Dato.executeQuery("select D.nombre, D.id, D.fecha, D.elaborado, 'fa fa-circle', '#000000',D.archivoDropbox from Dato D where D.tipoPropuesta='Sin Filtro' and D.idCategoria="+idt+"")

            resultados += resultados2


        }else {

            if(idt==0){

                resultados = Dato.executeQuery("select D.nombre, D.id, D.fecha, D.elaborado, f.icono, f.color,D.archivoDropbox from Dato D, Filtro f where D.idCategoria=f.idCategoria and D.tipoPropuesta=f.nombre and D.idCategoria="+id2+"")

                def resultados2 = Dato.executeQuery("select D.nombre, D.id, D.fecha, D.elaborado, 'fa fa-circle', '#000000',D.archivoDropbox from Dato D where D.tipoPropuesta='Sin Filtro' and D.idCategoria="+id2+"")

                resultados += resultados2


            }else{

                resultados = Dato.executeQuery("select d.nombre,d.id, d.fecha, d.elaborado, f.icono, f.color,d.archivoDropbox from Dato d , Filtro f where d.idCategoria=f.idCategoria and d.tipoPropuesta=f.nombre  and f.id=" +idt + " group by d.id")

            }


        }

        def fav = Empleado.executeQuery(" select d.nombre,d.id from Favorito f, Empleado e , Dato d, Role r,UsuarioRole us, Usuario u where u.username ='"+usuario+"' and e.usuario='"+usuario+"' and f.idDato=d.id and e.id=f.idEmpleado and us.usuario=u.id and r.id=us.role group by d.id")
        def menu = Categoria.executeQuery("select C.nombre from Categoria C where C.id=?", [id2])


        String d = menu.get(0)
        Integer cont =0 , cont2=0;
        for (int i = 0; i < fav.size() ; i++) {

            cont++;
        }

       [resultados: resultados, d:d,favoritos: fav, contador:cont,contador2:cont2]

    }

    def actualizarCategoria() {
        def categoria = Categoria.find("from Categoria where id = ?", [Long.parseLong(params.categoria)])
        categoria.nombre = params.nombreCategoria
        categoria.maxDato = Integer.parseInt(params.maxContenido)
        categoria.maxFiltro = Integer.parseInt(params.maxFiltro)
        categoria.save(flush: true)
        def e = params.list('dato')
        if (e.size() > 0) {
            def especificos = Especifico.findAll("from Especifico where idCategoria = " + params.categoria)
            for (int i = 0; i < e.size(); i++) {
                especificos[i].nombre = e.get(i)
                especificos[i].save(flush: true)
            }
        }
        flash.message = "Categoría actualizada correctamente"
        redirect(controller: "categoria", action: "indice")
    }

    def actualizarDato() {
        def dato = Dato.find("from Dato where id = ?", [Long.parseLong(params.idDato)])
        dato.nombre = params.nombreC
        dato.descripcion = params.descripcionC
        dato.tipoPropuesta = params.filtroC
        dato.elaborado = params.empleadoC
        String fecha = params.fechaC
        fecha  = fecha.substring(0, 10)
        def nuevaFecha = new Date().parse("yyyy-M-d", fecha)
        dato.fecha = nuevaFecha
        dato.tags = params.tagsC
        if (! params.fileC.equals(""))
            dato.archivoDropbox = params.fileC
        dato.save(flush: true)
        def especificos = params.list('especificoC')
        def ids = params.list('idEspecificoC')
        for (int i = 0; i < especificos.size(); i++) {
            def e = Especifico.find("from Especifico where id = ?", [Long.parseLong(ids.get(i))])
            def query = Valor.where {
                idDato == dato && idEspecifico == e
            }
            //def valor = Valor.find("from Valor where idDato = " + ids.get(i) +  " AND idEspecifico = " + e.id)
            def valor = query.find()
            valor.valor = especificos.get(i)
            valor.save(flush: true)
        }
        flash.message = "Dato actualizado correctamente"

        redirect(controller: "categoria", action: "indice", id: dato.idCategoria.id)

    }

    def actualizarFiltro(){

        def filtro = Filtro.find("from Filtro where id = ?", [Long.parseLong(params.filterId)])
        def categoria = Categoria.find("from Categoria where id = ?" , [Long.parseLong(params.idCategoria)])

        def actualizarTP = Dato.findAll("from Dato D where D.tipoPropuesta=?", [filtro.nombre])

        filtro.nombre = params.nombreF
        filtro.color = params.colorF
        filtro.icono = params.iconoF

        for(def a: actualizarTP){

          a.tipoPropuesta = params.nombreF
          a.save()

        }

        filtro.save(flush: true)

        flash.message = "Filtro editado correctamente"
        redirect(controller: "categoria", action: "indice", id: categoria.id)
    }
}
