package appMarcos;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.sql.Connection;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SpinnerDateModel;
import javax.swing.border.TitledBorder;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableModel;

import com.itextpdf.text.DocumentException;

public class viewHistorial extends JFrame {
	
	private JPanel p;
	private Font titulos = new Font("Arial", 0, 20);
	
	private JLabel marcoVendido;
	private JLabel medidaVendida;
	private JLabel marcoPreguntado;
	private JLabel medidaPreguntada;
	
	private JTable registro;
	
	private Connection conn = null;
	private Data Datos = new Data();
	private DefaultTableModel model;
	
	private JTextField s1;
	private JTextField s2;
	
	private void RellenarTabla(String ini, String fin){
	       
        model =new DefaultTableModel();
        
       	//parsear INI y FIN
    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    	String iniFormat = "0";
    	String finFormat = "0";
    
    	try {
     
        	//anadir un dia al FIN
        	Calendar c = Calendar.getInstance();
        	c.setTime(formatter.parse(fin));
        	//c.add(Calendar.DATE, 1);  // number of days to add
        	

    		Date dateini = formatter.parse(ini);
    		
    		System.out.println(formatter.format(dateini));         
    		System.out.println(formatter.format(c.getTime()));
    		
        	iniFormat = formatter.format(dateini);
        	finFormat = formatter.format(c.getTime());

        	
    	} catch (ParseException e) {
    		e.printStackTrace();
    	}
    	
    	
    	

        //rellenar el modelo
        model = Datos.fechaBusqueda(iniFormat,finFormat);
        
        //asignar el modelo
        registro.setModel(model);
        
        
        String m = Datos.modeloVendido(iniFormat,finFormat);
        String me = Datos.medidaVendida(iniFormat,finFormat);
        String pM = Datos.modeloPreguntado(iniFormat,finFormat);
        String pMe = Datos.medidaPreguntada(iniFormat,finFormat);
        
        marcoVendido.setText("Marco mas vendido: ");
        medidaVendida.setText("Medida mas vendida: ");
        marcoPreguntado.setText("Marco mas preguntado: ");
        medidaPreguntada.setText("Medida mas preguntada: ");
        
        
        marcoVendido.setText(marcoVendido.getText()+m);
        medidaVendida.setText(medidaVendida.getText()+me);
        marcoPreguntado.setText(marcoPreguntado.getText()+pM);
        medidaPreguntada.setText(medidaPreguntada.getText()+pMe);
        
    }
	
	ActionListener find = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	RellenarTabla(s1.getText(), s2.getText());
        	
        }
        
    };
    
    ActionListener pdf = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	GenerarPDF n = new GenerarPDF();
        	
        	try {
				n.generarFactura(model);
			} catch (IOException | DocumentException e) {
				e.printStackTrace();
			}
        	
        }
        
    };
    
    ActionListener imprimirPDF = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	GenerarPDF n = new GenerarPDF();
        	
        	n.imprimirFactura("historial.pdf");
        	
        }
        
    };
	
	public viewHistorial(JPanel p){
		
		this.p=p;
		
		//Titulo del panel historial
		JLabel titHisto = new JLabel("Historial");
		titHisto.setFont(titulos);
		titHisto.setBounds(490, 20, 300, 40);
		p.add(titHisto);
		
		//Inicio menu parametros
		JPanel d = new JPanel();
		d.setLayout(null);
		d.setBounds(520, 70, 520, 60);
		d.setBorder(new TitledBorder("Parametros "));
		p.add(d);
		
		//Creamos el inicio de la busqueda
		JLabel x1 = new JLabel("Del ");
		x1.setBounds(20, 20, 50, 20);
		d.add(x1);
		
		Calendar fecha = Calendar.getInstance();
    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    	String dateToday = formatter.format(fecha.getTime());

		
		s1 = new JTextField(dateToday);
		s1.setBounds(70, 20, 100, 20);
		d.add(s1);
		
		//creamos el fin de la busqueda
		JLabel x2 = new JLabel("al ");
		x2.setBounds(190, 20, 50, 20);
		d.add(x2);
		
		s2 = new JTextField(dateToday);
		s2.setBounds(240, 20, 100, 20);
		d.add(s2);
		
		//buscar
		JButton buscar = new JButton("Buscar");
		buscar.setBounds(380, 20, 100, 20);
		buscar.addActionListener(find);
		d.add(buscar);
		
		//Fin menu parametros
		
		//Inicio menu tabla
		JPanel t = new JPanel();
		t.setLayout(new BorderLayout());
		t.setBounds(40, 140, 1000, 300);
		t.setBorder(new TitledBorder("Informaci�n "));
		p.add(t);
		
		String columnas[]={"folio","fecha","hora","medida","modeloMarco", "total"};
		String datos[][]= new String[0][6];
		
		registro = new JTable(datos,columnas);
		JScrollPane scroll = new JScrollPane(registro);
		t.add(scroll,BorderLayout.CENTER);
		
		//Fin menu tabla
		
		//Inicio menu datos mejores
		JPanel v = new JPanel();
		v.setLayout(null);
		v.setBounds(40, 450, 1000, 200);
		v.setBorder(new TitledBorder("Resultados"));
		p.add(v);
		
		JButton exportar = new JButton("Exportar");
		exportar.setBounds(880, 20, 100, 20);
		exportar.addActionListener(pdf);
		v.add(exportar);
			
		//Hey puto si tu JOSE para probar imprimir quita estos inches comentarios
		JButton imprimir = new JButton("Imprimir");
		imprimir.setBounds(760, 20, 100, 20);
		imprimir.addActionListener(imprimirPDF);
		v.add(imprimir);
		
		marcoVendido = new JLabel("Marco mas vendido: ");
		marcoVendido.setBounds(20, 80, 250, 20);
		v.add(marcoVendido);
		
		medidaVendida = new JLabel("Medida mas vendida: ");
		medidaVendida.setBounds(20, 110, 250, 20);
		v.add(medidaVendida);
		
		marcoPreguntado = new JLabel("Marco mas preguntado: ");
		marcoPreguntado.setBounds(500, 80, 250, 20);
		v.add(marcoPreguntado);
		
		medidaPreguntada = new JLabel("Medida mas preguntada: ");
		medidaPreguntada.setBounds(500, 110, 250, 20);
		v.add(medidaPreguntada);
		
		//Fin menu datos mejores
		
	}

}
