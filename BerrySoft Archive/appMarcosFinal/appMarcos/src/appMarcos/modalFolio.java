package appMarcos;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class modalFolio extends JDialog {
	
	private JTextField caja;
	
	public JTextField getCaja() {
		return caja;
	}

	public void setCaja(JTextField caja) {
		this.caja = caja;
	}



	ActionListener aceptar = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	setVisible(false);
        	
        }
        
    };
	
    
    
	public modalFolio(JFrame F){
		
		super(F,"Ingresar Folio", true);
		super.setLayout(null);
		super.setSize(300, 200);
		super.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
		super.setLocationRelativeTo(null);
		
		JLabel txt = new JLabel("No. de Folio:");
		txt.setBounds(50,50,100,20);
		super.add(txt);
		
		caja = new JTextField();
		caja.setBounds(150, 50, 80, 20);
		super.add(caja);
		
		JButton ok = new JButton("Aceptar");
		ok.setBounds(100, 100, 100, 20);
		ok.addActionListener(aceptar);
		super.add(ok);
		
		super.setVisible(true);
		
	}
	
}
