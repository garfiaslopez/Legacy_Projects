import keybox.Role
import keybox.Usuario

class BootStrap {

    def init = {

        def adminRole = new keybox.Role(authority:'ROLE_ADMIN').save()


        def testUser = new keybox.Usuario(username: 'admin', password: 'admin', enabled: true).save()
        keybox.UsuarioRole.create testUser, adminRole, true

        if(keybox.Empleado.count == 0){
          new keybox.Empleado(nombre: "Administrador", correo: "default", usuario: "admin").save()
        }


    }
    def destroy = {
    }
}
