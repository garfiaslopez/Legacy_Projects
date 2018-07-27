package appMarcos;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class modalAgregar extends JDialog {
	
	private JTextField tModelo;
	private JTextField tDesperdicio;
	private JTextField tPrecio;
	
	private Data dato;
	
	ActionListener cancel = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
            
        	setVisible(false);
        	
        }
        
    };
    
    ActionListener ok = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	dato.agregar(tModelo.getText(), Double.parseDouble(tDesperdicio.getText()), Double.parseDouble(tPrecio.getText()));
        	
        	setVisible(false);
        	
        }
        
    };

	public modalAgregar(JFrame f, Data dato){
		
		super(f, "Agregar Marco",true);
		super.setLayout(null);
		super.setSize(400, 250);
		super.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
		super.setLocationRelativeTo(null);
		
		this.dato=dato;
		
		JLabel modelo = new JLabel("Modelo: ");
		modelo.setBounds(20, 20, 150, 20);
		super.add(modelo);
		
		JLabel desperdicio = new JLabel("Desperdicio: ");
		desperdicio.setBounds(20, 50, 150, 20);
		super.add(desperdicio);
		
		JLabel precio = new JLabel("Precio: ");
		precio.setBounds(20, 80, 150, 20);
		super.add(precio);
		
		tModelo = new JTextField();
		tModelo.setBounds(180, 20, 100, 20);
		super.add(tModelo);
		
		tDesperdicio = new JTextField();
		tDesperdicio.setBounds(180, 50, 100, 20);
		super.add(tDesperdicio);
		
		tPrecio = new JTextField();
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
