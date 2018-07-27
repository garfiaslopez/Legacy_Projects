package appMarcos;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableModel;

import com.itextpdf.text.DocumentException;

public class viewPrecios extends JFrame {
	
	private JPanel p;
	private viewCobro vC;
	private JFrame F;
	private JTable registro;
	private Font titulos = new Font("Arial", 0, 20);
	private String[][] complementos = {{"Vidrio","Colgante"},{"Respaldo","Maria Luisa"},{"Grapas","Bisagra"},{"Cinta","Empaque"}};
	private JTextField[][] cajas = new JTextField[4][2];
	
	private Connection conn = null;
	private Data Datos = new Data();
	private DefaultTableModel model;
	
	private ArrayList<Integer> comple = new ArrayList<Integer>();
	
	ActionListener verBarras = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
           
        	ArrayList<String> n = Datos.barras();
            
            GenerarPDF G = new GenerarPDF();
            
            try {
				G.generarCodigoBarras(n);
			} catch (FileNotFoundException | DocumentException e) {
				System.out.println("lol");
			}
            
        }
        
    };
	
	ActionListener guardar = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
            try {
				TextFile t = new TextFile("dtP.sys", Apertura.REWRITE, true);
				
				for (int i = 0; i < 4; i++) {
					for (int j = 0; j < 2; j++) {
						t.writeLn(cajas[i][j].getText());
						comple.add(Integer.parseInt(cajas[i][j].getText()));
					}
				}
				
				vC.setPrecios(comple);
				
			} catch (IOException | ArchivoInexistenteException e) {
				e.printStackTrace();
			}
        }
        
    };
    
    ActionListener agregarM = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	Integer p = model.getRowCount();
            
        	new modalAgregar(F, Datos);
        	
        	RellenarTabla();
        	
        }
        
    };
    
    ActionListener eliminarM = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
            
        	Integer pos = registro.getSelectedRow();
        	
        	if(model.getRowCount()==0){
        		JOptionPane.showMessageDialog(null,"No existen elementos a eliminar");
        	}else{
        	
        		if(pos>=0){
		        	String p = (String) model.getValueAt(pos, 0);
		        	
		        	Datos.eliminar(p);
		        	
		        	RellenarTabla();
        		}else{
        			JOptionPane.showMessageDialog(null,"Seleccionar elemento a eliminar");
        		}
        	}
        	
        }
        
    };
    
    ActionListener editarM = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	Integer pos = registro.getSelectedRow();
        	
        	if(model.getRowCount()==0){
        		JOptionPane.showMessageDialog(null,"No existen elementos a editar");
        	}else{
        	
	            if(pos>=0){
	            	
	            	new modalEditar(F, Datos, model, pos);
	            	RellenarTabla();
	            	
	            }else{
	            	JOptionPane.showMessageDialog(null, "Seleccionar elemento a editar");
	            }
        	}
        	
        	
        }
        
    };

    private void RellenarTabla(){
       
        model =new DefaultTableModel();

        //rellenar el modelo
        model = Datos.lista();
        
        //asignar el modelo
        registro.setModel(model);
    }
	
	public viewPrecios(JPanel p, viewCobro vC, JFrame F){
		
		this.p=p;
		this.vC=vC;
		this.F=F;
		
		//Titulo del panel historial
		JLabel titPre = new JLabel("Precios");
		titPre.setFont(titulos);
		titPre.setBounds(490, 20, 300, 40);
		p.add(titPre);
		
		//Inicio menu tabla
		JPanel t = new JPanel();
		t.setLayout(null);
		t.setBounds(40, 80, 1000, 400);
		t.setBorder(new TitledBorder("Marcos "));
		p.add(t);
		
		String columnas[]={"Modelo","Desperdicio","Precio","Codigo de Barras"};
		String datos[][]= new String[6][6];
		
		registro = new JTable(datos,columnas);
		JScrollPane scroll = new JScrollPane(registro);
		scroll.setBounds(20, 20, 960, 300);
		t.add(scroll);
		
		JPanel v = new JPanel();
		v.setLayout(null);
		v.setBounds(20, 310, 960, 70);
		t.add(v);
		
		JButton imprimir = new JButton("Exportar");
		imprimir.setBounds(0, 40, 100, 20);
		imprimir.addActionListener(verBarras);
		v.add(imprimir);
		
		JButton eliminar = new JButton("Eliminar");
		eliminar.setBounds(860, 40, 100, 20);
		eliminar.addActionListener(eliminarM);
		v.add(eliminar);
		
		JButton editar = new JButton("Editar");
		editar.setBounds(740, 40, 100, 20);
		editar.addActionListener(editarM);
		v.add(editar);
		
		JButton agregar = new JButton("Agregar");
		agregar.setBounds(620, 40, 100, 20);
		agregar.addActionListener(agregarM);
		v.add(agregar);
		
		//Fin menu tabla
		
		//Inicio Menu Complementos
		JPanel c = new JPanel();
		c.setLayout(null);
		c.setBounds(40, 480, 1000, 180);
		c.setBorder(new TitledBorder("Complementos "));
		p.add(c);
		
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 2; j++) {
				JLabel txt = new JLabel(complementos[i][j]);
				txt.setBounds(j*200+20, i*40+20, 100, 20);
				c.add(txt);
				
				cajas[i][j] = new JTextField();
				cajas[i][j].setBounds(j*200+140, i*40+20, 50, 20);
				c.add(cajas[i][j]);
			}
		}
		
		cajas[0][0].setText(vC.getPrecios().get(0).toString());
		cajas[0][1].setText(vC.getPrecios().get(1).toString());
		cajas[1][0].setText(vC.getPrecios().get(2).toString());
		cajas[1][1].setText(vC.getPrecios().get(3).toString());
		cajas[2][0].setText(vC.getPrecios().get(4).toString());
		cajas[2][1].setText(vC.getPrecios().get(5).toString());
		cajas[3][0].setText(vC.getPrecios().get(6).toString());
		cajas[3][1].setText(vC.getPrecios().get(7).toString());
		
		JButton guardarCom = new JButton("Guardar");
		guardarCom.setBounds(880, 140, 100, 20);
		guardarCom.addActionListener(guardar);
		c.add(guardarCom);
		
		RellenarTabla();
		
	}

}
