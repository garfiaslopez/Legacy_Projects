package appMarcos;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class modalEditar extends JDialog {
	
	private JTextField tModelo;
	private JTextField tDesperdicio;
	private JTextField tPrecio;
	
	private DefaultTableModel model;
	private Integer pos;
	
	private Data dato;
	
	ActionListener cancel = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
            
        	setVisible(false);
        	
        }
        
    };
    
    ActionListener ok = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	dato.editar(tModelo.getText(), Double.parseDouble(tDesperdicio.getText()), Double.parseDouble(tPrecio.getText()),(String) model.getValueAt(pos, 0));
        	
        	setVisible(false);
        	
        }
        
    };

	public modalEditar(JFrame F, Data dato, DefaultTableModel model, Integer pos){
		
		super(F,"Editar Marco", true);
		super.setLayout(null);
		super.setSize(400, 250);
		super.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
		super.setLocationRelativeTo(null);
		
		this.dato=dato;
		this.model=model;
		this.pos=pos;
		
		JLabel modelo = new JLabel("Modelo: ");
		modelo.setBounds(20, 20, 150, 20);
		super.add(modelo);
		
		JLabel desperdicio = new JLabel("Desperdicio: ");
		desperdicio.setBounds(20, 50, 150, 20);
		super.add(desperdicio);
		
		JLabel precio = new JLabel("Precio: ");
		precio.setBounds(20, 80, 150, 20);
		super.add(precio);
		
		tModelo = new JTextField((String) model.getValueAt(pos, 0));
		tModelo.setBounds(180, 20, 100, 20);
		super.add(tModelo);
		
		tDesperdicio = new JTextField(""+(Double) model.getValueAt(pos, 1));
		tDesperdicio.setBounds(180, 50, 100, 20);
		super.add(tDesperdicio);
		
		tPrecio = new JTextField(""+(Double) model.getValueAt(pos, 2));
		tPrecio.setBounds(180, 80, 100, 20);
		super.add(tPrecio);
		
		JButton cancelar = new JButton("Cancelar");
		cancelar.setBounds(20, 150, 100, 20);
		cancelar.addActionListener(cancel);
		super.add(cancelar);
		
		JButton aceptar = new JButton("Aceptar");
		aceptar.setBounds(280, 150, 100, 20);
		aceptar.addActionListener(ok);
		super.add(aceptar);
	
		super.setVisible(true);
		
	}
	
}
