package appMarcos;

import java.awt.HeadlessException;
import java.sql.*;
import javax.swing.JOptionPane;

//la base de datos se encuentra en raiz se llama "Database.sqlite"
//esa la cree con una herramienta para firefox llamada "sqliteManager", puedes usar algun otro creador de sqlite como sqliteshell o algo asi
//lo que hace la clase conexion es regresar un objeto de tipo conexion pero ya con la direccion de la base y todo lo que necesitas para poder
//manipularla, tienes que incluir en la libreria el archivo "sqlite-jdbc-3.8,7" es como que la libreria para manejar SQlite.
//ya esta incluida en el proyecto el archivo sqlite de la DB y la libreria, por lo que deberia de correr sin pedos :D... >.<

//Database.sqlite:

// tabla : marco

// row1  : modelp        tipo: VARCHAR
// row2  : desperdicio   tipo: DOUBLE
// row3  : precio        tipo: DOUBLE
// row4  : codigoBarra   tipo: VARCHAR



public class Conexion {
    
    Connection conn = null;
   
    public static Connection ConectarDB(){
        
        try{
            //manejador de java para sqlite que viene en la libreria que incluyes:
            Class.forName("org.sqlite.JDBC");
            //direccion de la base de datos que quieres manejar:
            Connection conn = DriverManager.getConnection("jdbc:sqlite:marcos.sqlite");
            
            //regresas el objeto de tipo connection:
            return conn;
        }
        catch(HeadlessException | ClassNotFoundException | SQLException e){
            JOptionPane.showMessageDialog(null,e);
        }
        return null;
     
    }
}
