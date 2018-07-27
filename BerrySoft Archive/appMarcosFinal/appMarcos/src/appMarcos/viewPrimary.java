package appMarcos;

import java.awt.BorderLayout;
import java.io.IOException;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.WindowConstants;

public class viewPrimary extends JFrame {
	
	
	private JTabbedPane tabPanel;
	private JPanel[] panel = new JPanel[3];
	
	public viewPrimary() throws IOException, ArchivoInexistenteException{
		
		super("App Marcos");
		
		String[] nameTabs = {"Cobro","Historial","Precios"};
		tabPanel = new JTabbedPane();
		tabPanel.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);
		
		for(int i=0; i<3; i++){
			panel[i] = new JPanel(null);
			tabPanel.add(nameTabs[i], panel[i]);
		}
		
		super.getContentPane().add(tabPanel, null);
		super.setSize(1080, 720);
		super.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		super.setLocationRelativeTo(null);
		
		viewCobro c = new viewCobro(panel[0], this);
		new viewHistorial(panel[1]);
		new viewPrecios(panel[2],c,this);
		
		super.setVisible(true);
		
	}
	
	public static void main(String[] args) {
		
		try {
			
			new viewPrimary();
			
		} catch (IOException | ArchivoInexistenteException e) {
			e.printStackTrace();
		}
		
	}

}