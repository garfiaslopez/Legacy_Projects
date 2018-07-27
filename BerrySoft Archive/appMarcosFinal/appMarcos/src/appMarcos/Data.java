package appMarcos;

import java.awt.HeadlessException;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import java.util.*;

/**
 *
 * @author JoseGarfiasLopez
 */
public class Data {
	
	static Connection conn;
    static Statement sentencia;
    static ResultSet resultado;
    private ResultSet lol;
    
    public void conectar() throws SQLException{
    	//Se hace una variable del tipo "Connection" que es igual a lo que regresa la funcion "ConectarDB()" desde mi clase conexion.
        //igual regresa un objeto de tipo connection pero ya con los parametros de la DB de SQLite
        conn = Conexion.ConectarDB();
        //Se crea un objeto de tipo Statement para que puedas ejecutar tus consultas o querys
        sentencia = conn.createStatement();
    }

    
    //FUNCION PARA CARGAR LOS DATOS DE LA DB PARA LA FUCKING TABLA:
    
    public DefaultTableModel lista(){
        
        DefaultTableModel modelo= new DefaultTableModel();

        try{
        	
        	//Se hace una variable del tipo "Connection" que es igual a lo que regresa la funcion "ConectarDB()" desde mi clase conexion.
            //igual regresa un objeto de tipo connection pero ya con los parametros de la DB de SQLite
            conn = Conexion.ConectarDB();
            //Se crea un objeto de tipo Statement para que puedas ejecutar tus consultas o querys
            sentencia = conn.createStatement();
        
            //consuta a mostrar [query]
            String query = "select * from marco";
            
            //Ejecutar consulta y guardar el resultado de la misma en resultado del tipo resultset
            resultado = sentencia.executeQuery(query);
            ResultSetMetaData rsmd=resultado.getMetaData();
            
            //obtenemos numero de columnas 
            int CanColumns = rsmd.getColumnCount();
            
            //Recorremos las columnas 
            for(int i=1;i<=CanColumns;i++){
                //cargamos columnas en modelo
                modelo.addColumn(rsmd.getColumnLabel(i));
            }
            while (resultado.next()){
                //creamos array 
                Object[] fila=new Object[CanColumns];
                //cargamos datos a modelo
                for(int i=0;i<CanColumns;i++){
                    fila[i] = resultado.getObject(i+1);
                }
                modelo.addRow(fila);
            }
	        sentencia.close();
	        conn.close();

        }catch(SQLException e){
            
            JOptionPane.showMessageDialog(null, e);
        }
        //retornamos modelo para jtable
        return modelo;
    }
    
    public DefaultTableModel fechaBusqueda(String ini, String fin){
        
        DefaultTableModel modelo= new DefaultTableModel();

        try{
        
        	//Se hace una variable del tipo "Connection" que es igual a lo que regresa la funcion "ConectarDB()" desde mi clase conexion.
            //igual regresa un objeto de tipo connection pero ya con los parametros de la DB de SQLite
            conn = Conexion.ConectarDB();
            //Se crea un objeto de tipo Statement para que puedas ejecutar tus consultas o querys
            sentencia = conn.createStatement();
            
            //consuta a mostrar [query]
            String query = "SELECT folio,fecha,hora,medida,modeloMarco,total FROM registro WHERE fecha BETWEEN '"+ini+"' AND '"+fin+"'";
            
            //Ejecutar consulta y guardar el resultado de la misma en resultado del tipo resultset
            resultado = sentencia.executeQuery(query);
            ResultSetMetaData rsmd=resultado.getMetaData();
            
            //obtenemos numero de columnas 
            int CanColumns = rsmd.getColumnCount();
            
            //Recorremos las columnas 
            for(int i=1;i<=CanColumns;i++){
                //cargamos columnas en modelo
                modelo.addColumn(rsmd.getColumnLabel(i));
            }
            while (resultado.next()){
                //creamos array 
                Object[] fila=new Object[CanColumns];
                //cargamos datos a modelo
                for(int i=0;i<CanColumns;i++){
                    fila[i] = resultado.getObject(i+1);
                }
                modelo.addRow(fila);
            }
	        sentencia.close();
	        conn.close();
        }catch(SQLException e){
            
            JOptionPane.showMessageDialog(null, e);
        }
        //retornamos modelo para jtable
        return modelo;
    }
    
    public String modeloVendido(String ini, String fin){
    	

    	String m="";
    	try {
    		conn = Conexion.ConectarDB(); 		
    		sentencia=conn.createStatement();
			String query = "SELECT modeloMarco,COUNT(*) as repetidos FROM registro WHERE fecha BETWEEN '"+ini+"' AND '"+fin+"' AND folio!='cancelado' GROUP BY modeloMarco ORDER BY repetidos DESC";
		    resultado = sentencia.executeQuery(query);
		    
    		m=resultado.getString(1);
		    
            
		    /*p = resultado.getInt(1);
		    for (int j = 0; j < p; j++) {
		    	String pos = "" + j;
		    	String est = "cancelado";
				String query2 = "SELECT modeloMarco FROM registro WHERE (fecha BETWEEN '"+ini+"' AND '"+fin+"')";
				resultado = sentencia.executeQuery(query2);
				String mo = resultado.getString(1);
				String query3 = "SELECT COUNT(*) FROM registro WHERE (modeloMarco='"+mo+"' AND folio!='"+est+"')";
				resultado = sentencia.executeQuery(query3);
				cont = resultado.getInt(1);
				if(cont>mayor){
					mayor=cont;
					m=mo;
				}
		    }*/
	        sentencia.close();
	        conn.close();

    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return m;
       
    }
    
    public String modeloPreguntado(String ini, String fin){
    	
    	String m="";
    	try {
    		conn = Conexion.ConectarDB();
			sentencia=conn.createStatement();
			String query = "SELECT modeloMarco,COUNT(*) as repetidos FROM registro WHERE fecha BETWEEN '"+ini+"' AND '"+fin+"' AND folio='cancelado' GROUP BY modeloMarco ORDER BY repetidos DESC";
		    resultado = sentencia.executeQuery(query);

    		m=resultado.getString(1);
    		
	        sentencia.close();
	        conn.close();

    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return m;
       
    }
    
    public String medidaVendida(String ini, String fin){
    	
    	String m="";
    	try {
    		conn = Conexion.ConectarDB();
			sentencia=conn.createStatement();
			String query = "SELECT medida,COUNT(*) as repetidos FROM registro WHERE fecha BETWEEN '"+ini+"' AND '"+fin+"' AND folio!='cancelado' GROUP BY medida ORDER BY repetidos DESC";
		    resultado = sentencia.executeQuery(query);
		    
    		m=resultado.getString(1);
    		
    		
	        sentencia.close();
	        conn.close();

    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return m;
       
    }
    
    public String medidaPreguntada(String ini, String fin){
    	
  
    	String m="";
    	try {
    		conn = Conexion.ConectarDB();
			sentencia=conn.createStatement();
			String query = "SELECT medida,COUNT(*) as repetidos FROM registro WHERE fecha BETWEEN '"+ini+"' AND '"+fin+"' AND folio='cancelado' GROUP BY medida ORDER BY repetidos DESC";
		    resultado = sentencia.executeQuery(query);
		 
    		m=resultado.getString(1);
    		
	        sentencia.close();
	        conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return m;
       
    }
    
    public void agregar(String mod, Double des, Double pre){
        
        try{
        	conn = Conexion.ConectarDB();
            sentencia=conn.createStatement();
            String query = "INSERT INTO marco(modelo,desperdicio,precio)values ('"+mod+"',"+des+","+pre+")";
            sentencia.executeUpdate(query);
	        sentencia.close();
	        conn.close();

        }catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null,"No se pudo agregar");
        }
    }
    
    public ArrayList<String> barras(){
    	
    	ArrayList<String> n = new ArrayList<String>();
        
        try{
        	conn = Conexion.ConectarDB();
            sentencia=conn.createStatement();
            String query = "SELECT modelo FROM marco";
            resultado = sentencia.executeQuery(query);
            while (resultado.next()){
                n.add(resultado.getString(1));
            }
	        sentencia.close();
	        conn.close();

        }catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null,"lol");
        }
        return n;
    }
    
    //guardar compra
    public void guardarCompra(String fo, String fe, String h, String m, String mM, Double t){
        String f;
        try{
        	conn = Conexion.ConectarDB();
            sentencia=conn.createStatement();	
	        String tam = "SELECT COUNT(*) FROM registro";
	        resultado = sentencia.executeQuery(tam);
	        Integer p = resultado.getInt(1);
	        f="" + p;
	        String query = "INSERT INTO registro(idRegistro,folio,fecha,hora,medida,modeloMarco,total)values ('"+f+"', '"+fo+"','"+fe+"','"+h+"','"+m+"','"+mM+"',"+t+")";
	        sentencia.executeUpdate(query);
	          
    		sentencia.close();
	        conn.close();
        }catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null,"Error al guardar");
        }
    }
    
    public Double buscar(Integer t, String n){
        
    	Double p=0.0;
    	
        try{
        	conn = Conexion.ConectarDB();
            sentencia=conn.createStatement();
            if(t==1){
            	String query = "SELECT precio FROM marco WHERE modelo='"+n+"'";
            	resultado = sentencia.executeQuery(query);
            }else if(t==2){
            	String query = "SELECT desperdicio FROM marco WHERE modelo='"+n+"'";
            	resultado = sentencia.executeQuery(query);
            }
            
            p = resultado.getDouble(1);

            
            sentencia.close();
	        conn.close();
        }catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null,"Modelo Incorrecto");
        }
        
        return p;
    }
    
    //BORRAR EL PRODUCTO DE LA DB
    public void eliminar(String p){
    	
        try{
        	conn = Conexion.ConectarDB();
            sentencia=conn.createStatement();
            String query="DELETE FROM marco WHERE modelo='"+p+"'";
            sentencia.executeUpdate(query);
            sentencia.close();
            conn.close();

        }catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null,"No se puede eliminar");
        }        

    }
    
    public void editar(String m, Double d, Double pe, String p){
    	
    	try {
    		conn = Conexion.ConectarDB();
			sentencia=conn.createStatement();
			String query="UPDATE marco SET modelo='"+m+"', desperdicio="+d+", precio="+pe+"  WHERE modelo='"+p+"'";
	        sentencia.executeUpdate(query);
	        sentencia.close();
	        conn.close();
	        
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,"Datos Incorrectos");
		}
        
    }
    

}
