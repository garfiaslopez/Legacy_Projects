package keybox

import grails.converters.JSON
import grails.plugins.springsecurity.SpringSecurityService
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.security.access.annotation.Secured


@Secured(['ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_USER'])
class EmpleadoController {


    def springSecurityService

    def agregarEmpleado() {
    }

    def editarEmpleado(){
        JSONArray r = JSON.parse(params.idd)
        JSONObject map
        map = r.getJSONObject(0)

        def usuario = Usuario.find("from Usuario  where id = ?", [Long.parseLong(map.identificador)])
        def empleado = Empleado.find("from Empleado where usuario = ?", [usuario.username])
        def rolee

        if(usuario.authorities.equals('ROLE_ADMIN')) {
            rolee = "Administrador"
        } else if(usuario.authorities.equals('ROLE_STAFF')) {
            rolee = "Editor"
        } else if(usuario.authorities.equals('ROLE_USER')) {
            rolee = "Consultor"
        }
        [usuario: usuario, empleado: empleado, rol: rolee]
    }

    def guardarEmpleado(PhotoUploadCommand puc) {
        def us = Usuario.find("from Usuario where username = ?", [params.usuario])
        if (us == null) {
            String rolee
            def rol
            if(params.rol.equals("Administrador")) {
                rolee = 'ROLE_ADMIN'
            } else if(params.rol.equals("Editor")) {
                rolee = 'ROLE_STAFF'
            } else if(params.rol.equals("Consultor")) {
                rolee = 'ROLE_USER'
            }

            rol = Role.find("from Role where authority = ?", [rolee])
            if (rol == null)
                rol = new Role(authority: rolee).save(flush: true)
            String pass = params.pass
            String passC = params.passC

            if (!pass.equals(passC)) {
                flash.error = "Las contraseñas que ingresaste no coinciden"
            }else {
                def usuario = new keybox.Usuario(username: params.usuario, password: params.pass, enabled: true).save(flush: true)
                UsuarioRole.create usuario, rol, true
                byte[] av = params.avatar.getBytes()
                def empleado = new Empleado(nombre: params.nombre, correo: params.email, avatar: puc.avatar,
                        usuario: usuario.username).save()
                flash.message = "Usuario agregado correctamente"
            }

        } else
            flash.error = "El usuario que elegiste ya existe"
        redirect(controller: "categoria", action: "indice", id: -1)
    }

    def busUsuario() {

        JSONArray r = JSON.parse(params.idU)
        JSONObject map
        map = r.getJSONObject(0)
        Long idt = Long.parseLong(map.identificador)
        def usu
        if(idt == 0){

             usu = Usuario.executeQuery("Select u.username , r.authority, u.id  from Usuario u,UsuarioRole  ur, Role r where u.id=ur.usuario.id AND r.id=ur.role.id")

        }else if(idt == 1) {

           usu= Usuario.executeQuery("select u.username , r.authority ,u.id from  Usuario u, Role r, UsuarioRole ur where r.authority='ROLE_ADMIN' and r.id=ur.role.id and u.id=ur.usuario.id")

        }else if(idt == 2) {

            usu= Usuario.executeQuery("select u.username , r.authority,u.id from  Usuario u, Role r, UsuarioRole ur where r.authority='ROLE_STAFF' and r.id=ur.role.id and u.id=ur.usuario.id")

        }else if(idt == 3) {

            usu= Usuario.executeQuery("select u.username , r.authority,u.id from  Usuario u, Role r, UsuarioRole ur where r.authority='ROLE_USER' and r.id=ur.role.id and u.id=ur.usuario.id")

        }

        List<String> listaRoles = new LinkedList<>()

        for (int i = 0; i < usu.size(); i++) {

            if (usu.getAt(i).getAt(1).equals("ROLE_ADMIN"))
                listaRoles.add("Administrador")
            else if (usu.getAt(i).getAt(1).equals("ROLE_STAFF"))
                listaRoles.add("Editor")
            else if (usu.getAt(i).getAt(1).equals("ROLE_USER"))
                listaRoles.add("Consultor")
        }


        Integer i=0;
        [usuarios: usu, roles : listaRoles, entera:i]



    }

    def perfil() {



        def user = springSecurityService.currentUser;
        String usuario = user.username
        println user
        def empleado = Empleado.find("from Empleado where usuario = ?", [user.username])
        def datos = Empleado.executeQuery("select e.nombre, e.usuario, e.avatar,e.correo ,r.authority from Empleado e , Role r , UsuarioRole us, Usuario u where e.usuario='"+usuario+"' and us.usuario=u.id and r.id=us.role and u.username ='"+usuario+"' group by e.id")


        List<String> lista = new LinkedList<>()

        for (int i = 0; i < datos.size(); i++) {
            System.out.println(usuario)
            if (datos.getAt(i).getAt(4).equals("ROLE_ADMIN"))
                lista.add("Administrador")
            else if (datos.getAt(i).getAt(4).equals("ROLE_STAFF"))
                lista.add("Editor")
            else if (datos.getAt(i).getAt(4).equals("ROLE_USER"))
                lista.add("Consultor")
        }
        println usuario
        Integer i = 0
        [datos:datos , rol: lista,cont: i,empleado:empleado,usuario: user]
    }

    def usuario() {

        def usu = Usuario.executeQuery("Select u.username , r.authority, u.id  from Usuario u,UsuarioRole  ur, Role r where u.id=ur.usuario.id AND r.id=ur.role.id")

        List<String> listaRoles = new LinkedList<>()

        for (int i = 0; i < usu.size(); i++) {
            println usu.getAt(i).getAt(1)
            if (usu.getAt(i).getAt(1).equals("ROLE_ADMIN"))
                listaRoles.add("Administrador")
            else if (usu.getAt(i).getAt(1).equals("ROLE_STAFF"))
                listaRoles.add("Editor")
            else if (usu.getAt(i).getAt(1).equals("ROLE_USER"))
                listaRoles.add("Consultor")
        }

        for(String s: listaRoles)
            println s

        Integer i=0;
        [usuarios: usu, roles : listaRoles, entera:i]


    }

    def eliminarEmpleado() {
        JSONArray r = JSON.parse(params.id)
        JSONObject map
        map = r.getJSONObject(0)

        def usuario = Usuario.find("from Usuario where  id = ?", [Long.parseLong(map.id)])
        def empleado = Empleado.find("from Empleado where usuario = ?", [usuario.username])
        UsuarioRole.removeAll(usuario)
        empleado.delete()
        usuario.delete()

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

    def actualizarEmpleado(PhotoUploadCommand puc) {
        println "actualizar empleado"
        def usuario = springSecurityService.currentUser
        def empleado = Empleado.find("from Empleado where usuario = ?", [usuario.username])
        String pass = params.pass1
        String passC = params.passComprobar1
        if (!empleado.nombre.equals(params.nombre1))
            empleado.nombre = params.nombre1
        if (!usuario.username.equals(params.user1)) {
            usuario.username = params.user1
            empleado.usuario = params.user1
        }
        if (!empleado.correo.equals(params.email1))
            empleado.correo = params.email1
        if ((! pass.equals("")) && (! passC.equals(""))) {
            if (pass.equals(passC)) {
                usuario.password = params.pass1
            }
            else
                flash.warning = "La contraseña no se actualizó porque los campos de contraseña que ingresaste no coinciden"
        }
        if (puc.avatar != null && puc.avatar.length != 0)
            empleado.avatar = puc.avatar

        usuario.save(flush: true)
        empleado.save(flush: true)

        if (! flash.warning)
            flash.message = "Empleado actualizado correctamente"
        redirect(controller: "categoria", action: "indice")
    }

    def guardarEdicionEmpleado(PhotoUploadCommand puc) {
        def usuario = Usuario.find("from Usuario where id = ?", [Long.parseLong(params.idU)])
        def empleado = Empleado.find("from Empleado where id = ?", [Long.parseLong(params.idE)])
        String pass = params.pass
        String passC = params.passComprobar
        if (!empleado.nombre.equals(params.nombre))
            empleado.nombre = params.nombre
        if (!usuario.username.equals(params.usuario)) {
            usuario.username = params.usuario
            empleado.usuario = params.usuario
        }
        if (!empleado.correo.equals(params.email))
            empleado.correo = params.email
        if ((! pass.equals("")) && (! passC.equals(""))) {
            if (pass.equals(passC)) {
                usuario.password = params.pass
            }
            else
                flash.warning = "La contraseña no se actualizó porque los campos de contraseña que ingresaste no coinciden"
        }
        if (puc.avatar != null && puc.avatar.length != 0)
            empleado.avatar = puc.avatar

        usuario.save(flush: true)
        empleado.save(flush: true)
        if (! flash.warning)
            flash.message = "Empleado actualizado correctamente"
        redirect(controller: "categoria", action: "indice", id: -1)
    }

}

class PhotoUploadCommand {
    byte[] avatar
}