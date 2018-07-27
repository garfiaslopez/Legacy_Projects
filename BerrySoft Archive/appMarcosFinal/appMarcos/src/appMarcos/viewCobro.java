package appMarcos;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

public class viewCobro {
	
	private JPanel p;
	private JFrame F;
	//panel del desgloce
	private JPanel des;
	private JPanel t;
	//Estilo de fuente para titulos
	private Font titulos = new Font("Arial", 0, 20);
	private String[] nombresComp = {"Marco","Vidrio","Colgante","Respaldo","Maria Luisa", "Grapas","Bisagra", "Cinta","Empaque"};
	private String[] totales = {"Precio produccion", "Precio normal","Precio cliente"};
	private JRadioButton[] btnComple = new JRadioButton[9];
	private JTextField[] cajasComple = new JTextField[9];
	private Integer k=0;
	
	private JTextField ancho;
	private JTextField alto;
	private JTextField boxTipo;
	
	private JLabel pPro;
	private JLabel pNor;
	private JLabel pCli;
	private JLabel pIva;
	private JLabel pIva2;
	
	private JButton cancel;
	private JButton comprar;
	
	private ArrayList<Integer> precios = new ArrayList<Integer>();
	private ArrayList<Double> total = new ArrayList<Double>();
	private ArrayList<String> modeloV = new ArrayList<String>();
	private ArrayList<String> medidaV = new ArrayList<String>();
	
	private DecimalFormat df = new DecimalFormat("0.00"); 
	
	private Data dato = new Data();

	public ArrayList<Integer> getPrecios() {
		return precios;
	}

	public void setPrecios(ArrayList<Integer> precios) {
		this.precios = precios;
	}
	
	public void reEstablecer(){
		
		
		
		des.removeAll();
    	t.removeAll();
    	
    	for(int i=0; i<3; i++){
			
			JLabel txt = new JLabel(totales[i]);
			txt.setBounds(65+(i*175), 40, 150, 20);
			t.add(txt);
			
		}
    	
    	k=0;
    	
    	JLabel tit = new JLabel("Titulo");
		tit.setBounds(20, 20, 200, 20);
		des.add(tit);
		
		JLabel tot = new JLabel("Precio");
		tot.setBounds(450, 20, 120, 20);
		des.add(tot);
		
		pPro = new JLabel();
		pPro.setBounds(95, 80, 100, 20);
		t.add(pPro);
		
		pNor = new JLabel();
		pNor.setBounds(260, 80, 100, 20);
		t.add(pNor);
		
		pCli = new JLabel();
		pCli.setBounds(430, 80, 100, 20);
		t.add(pCli);
		
		JLabel pTxt = new JLabel("+ iva");
		pTxt.setBounds(270, 120, 100, 20);
		t.add(pTxt);
		
		pIva = new JLabel();
		pIva.setBounds(260, 160, 100, 20);
		t.add(pIva);
		
		JLabel pTxt2 = new JLabel("+ iva");
		pTxt2.setBounds(440, 120, 100, 20);
		t.add(pTxt2);
		
		pIva2 = new JLabel();
		pIva2.setBounds(440, 160, 100, 20);
		t.add(pIva2);
		
		cancel = new JButton("Cancelar");
		cancel.setBounds(20, 190, 100, 20);
		cancel.addActionListener(cancelar);
		t.add(cancel);
		cancel.setVisible(false);
		
		comprar = new JButton("Comprar");
		comprar.setBounds(470, 190, 100, 20);
		comprar.addActionListener(acept);
		t.add(comprar);
		comprar.setVisible(false);
		
		total.clear();
		modeloV.clear();
		medidaV.clear();
		
		ancho.setText("");
		alto.setText("");
		boxTipo.setText("");
    	
    	des.repaint();
    	t.repaint();
		
	}
	
	
	ActionListener cancelar = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	Calendar fecha = Calendar.getInstance();
        	
        	//FORMAT FOR dd/MM/yyyy
        	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        	String fe = formatter.format(fecha.getTime());

        	//String fe= "" + fecha.get(Calendar.DATE) + "/" + (fecha.get(Calendar.MONTH)+1) + "/" + fecha.get(Calendar.YEAR);
        	
        	String h = "" + fecha.get(Calendar.HOUR_OF_DAY) + ":" + fecha.get(Calendar.MINUTE) + ":" + fecha.get(Calendar.SECOND);
        	
        	String m = "";
        	
        	String mM= "";
        	
        	Double t= 0.0;
        	for (int i = 0; i < total.size(); i++) {
        		
        		m=medidaV.get(i);
        		
        		mM=modeloV.get(i);
        		
        		t=total.get(i);
        		
        		dato.guardarCompra("cancelado",fe, h, m, mM, t);
        		
			}
        	
        	reEstablecer();
        	
        }
        
    };
    
    ActionListener acept = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
        	
        	Calendar fecha = Calendar.getInstance();
        	
        	//FORMAT FOR dd/MM/yyyy
        	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        	String fe = formatter.format(fecha.getTime());

        	//String fe= "" + fecha.get(Calendar.DATE) + "/" + (fecha.get(Calendar.MONTH)+1) + "/" + fecha.get(Calendar.YEAR);
        	
        	String h = "" + fecha.get(Calendar.HOUR_OF_DAY) + ":" + fecha.get(Calendar.MINUTE) + ":" + fecha.get(Calendar.SECOND);
        	
        	String m = "";
        	
        	String mM= "";
        	
        	Double t= 0.0;
        	modalFolio v = new modalFolio(F);
    		String fo = v.getCaja().getText();
        	
        	for (int i = 0; i < total.size(); i++) {
        		
        		m=medidaV.get(i);
        		
        		mM=modeloV.get(i);
        		
        		t=total.get(i);
        		
        		dato.guardarCompra(fo,fe, h, m, mM, t);
			}
        	
        	
        	reEstablecer();
        	
        }
        
    };
	
	ActionListener ok = new ActionListener(){
        
        public void actionPerformed(ActionEvent evt){
            
        	Double suma=0.0;
        	Double vMarco=0.0;
        	Double vVidrio=0.0;
        	Double vAn=0.0;
        	Double vAl=0.0;
        	Boolean error=false;
        	
        	vAn = Double.parseDouble(ancho.getText());
			
			vAl = Double.parseDouble(alto.getText());
			
			if(btnComple[4].isSelected()){
    			vAn+=8;
    			vAl+=8;
    		}
			
			
        	if(btnComple[0].isSelected()){
	
				Double p = dato.buscar(1,boxTipo.getText());
				
				
				if(p!=0){
				
					Double d = dato.buscar(2,boxTipo.getText());
					
					
					//formula de marcos
					//vMarco = ((((((vAn/100)+(vAl/100))*2)+d)*p)/10);
					vMarco = ((((vAn/100)*(vAl/100))*2)+d)*p ;
					
				}else{
					error=true;
				}
				
				
				
        	}
        	
        	if(btnComple[1].isSelected()){
    			
        		//y aqui la de vidrio
        		//vVidrio = (((vAn*vAl)*precios.get(0))/1000);
        		vVidrio = (vAn*vAl*precios.get(0))/10000;
        		
    		}
        	
        	for (int i = 2; i <= 8; i++) {
				
        		if(btnComple[i].isSelected()){
        			if(i!=4){
        				suma+=(precios.get(i-1)*Integer.parseInt(cajasComple[i].getText()));
        			}
        		}
        		
			}
        	
        	if(!error){
	        	if(!btnComple[0].isSelected()){
		        	JLabel glo = new JLabel("Complementos");
		        	glo.setBounds(20, 50+(k*30), 200, 20);
		        	des.add(glo);
		        	
		        	JLabel pre = new JLabel("$" + df.format((suma+vVidrio)));
		        	pre.setBounds(450, 50+(k*30), 80, 20);
		        	des.add(pre);
		        	
		        	if(k==0){
		        		
		        		cancel.setVisible(true);
		        		comprar.setVisible(true);
		        		
		        	}
		        	
		        	modeloV.add("solo/complementos");
		        	medidaV.add("solo/complementos");
		        	total.add(suma+vVidrio);
		        	
		        	k++;
	        	}else if(btnComple[0].isSelected()){
	        		JLabel glo = new JLabel("Marco con complementos");
		        	glo.setBounds(20, 50+(k*30), 200, 20);
		        	des.add(glo);
		        	
		        	JLabel pre = new JLabel("$" + df.format((suma+vMarco+vVidrio)));
		        	pre.setBounds(450, 50+(k*30), 80, 20);
		        	des.add(pre);
		        	
		        	if(k==0){
		        		
		        		cancel.setVisible(true);
		        		comprar.setVisible(true);
		        		
		        	}
		        	
		        	modeloV.add(boxTipo.getText());
		        	medidaV.add(vAn + "*" + vAl);
		        			        	
		        	String a = df.format((suma+vVidrio+vMarco));
		        	
		        	total.add(Double.valueOf(a));
		        	
		        	k++;
	        	}
        	}
        	
        	Double tTotal=0.0;
        	for (int j = 0; j < total.size(); j++) {
				tTotal+=total.get(j);
			}
        	
        	pPro.setText("" + df.format(tTotal));
        	pNor.setText("" + df.format((tTotal*2)));
        	pCli.setText("" + df.format((tTotal*1.8)));
        	pIva.setText("" + df.format((((tTotal*2)*.16)+(tTotal*2))));
        	pIva2.setText("" + df.format((((tTotal*1.8)*.16)+(tTotal*2))));
        	
        	des.repaint();
        	t.repaint();
            
        }
    };

	public viewCobro(JPanel p, JFrame F){
		
		this.p=p;	
		this.F=F;

		
		//Titulo del panel cobro
		JLabel titCobro = new JLabel("Calculadora de Marcos");
		titCobro.setFont(titulos);
		titCobro.setBounds(400, 20, 300, 40);
		p.add(titCobro);
		
		//Inicio menu datos
		JPanel d = new JPanel();
		d.setLayout(null);
        d.setBounds(40, 70, 400, 200);
		d.setBorder(new TitledBorder("Datos"));
		p.add(d);
		
		JLabel tamano = new JLabel("Tama�o:");
		tamano.setBounds(50, 40, 80, 20);
		d.add(tamano);
		
		ancho = new JTextField();
		ancho.setBounds(150, 40, 50, 20);
		d.add(ancho);
		
		JLabel x = new JLabel("X");
		x.setBounds(210, 40, 10, 20);
		d.add(x);
		
		alto = new JTextField();
		alto.setBounds(230, 40, 50, 20);
		d.add(alto);
		
		JLabel tipo = new JLabel("Tipo de Modelo:");
		tipo.setBounds(50, 80, 120, 20);
		d.add(tipo);
		
		boxTipo = new JTextField();
		boxTipo.setBounds(180, 80, 100, 20);
		d.add(boxTipo);
		
		final JButton aceptar = new JButton("Aceptar");
		aceptar.setBounds(260, 150, 100, 20);
		aceptar.addActionListener(ok);
		d.add(aceptar);
	
		
		boxTipo.setFocusable(true);
		boxTipo.addKeyListener(new java.awt.event.KeyAdapter() {
	
	
		        @Override
		        public void keyTyped(KeyEvent e) {
		            System.out.println("you typed a key");
		            
		            if (e.getKeyChar() == '\n' ){
		            				            
			            //llmar a la funcion de OK o el boton? 
			            
			            aceptar.doClick();
			            
		            }
		        }

		    });
	    
		//EVENTOLISTENER FOR ENTER KEY::::
		

	    
	    
		//Fin menu datos
		
		//Inicio menu complementos
		JPanel c = new JPanel();
		c.setLayout(null);
        c.setBounds(40, 280, 400, 380);
		c.setBorder(new TitledBorder("Complementos "));
		p.add(c);
		
		JLabel cant = new JLabel("Cant");
		cant.setBounds(180, 20, 40, 20);
		c.add(cant);
		
		for(int i=0; i<9; i++){
			
			btnComple[i] = new JRadioButton();
			btnComple[i].setBounds(40, 50+(i*35), 120, 30);
			btnComple[i].setMnemonic(KeyEvent.VK_B);
			btnComple[i].setSelected(true);
			btnComple[i].setText(nombresComp[i]);
			c.add(btnComple[i]);
			
			/*JLabel txt = new JLabel(nombresComp[i]);
			txt.setBounds(80, 50+(i*35), 100, 20);
			c.add(txt);*/
			
			cajasComple[i] = new JTextField("1");
			cajasComple[i].setBounds(180, 55+(i*35), 40, 20);
			c.add(cajasComple[i]);
			
			
		}
		//Fin menu complementos
		
		//Inicio menu desgloce
		des = new JPanel();
		des.setLayout(null);
		des.setBounds(450, 70, 590, 350);
		des.setBorder(new TitledBorder("Desgloce de Precios "));
		p.add(des);
		
		JLabel tit = new JLabel("Titulo");
		tit.setBounds(20, 20, 200, 20);
		des.add(tit);
		
		JLabel tot = new JLabel("Precio");
		tot.setBounds(450, 20, 120, 20);
		des.add(tot);
		
		//Fin menu desgloce
		
		//Inicio menu total
		t = new JPanel();
		t.setLayout(null);
		t.setBounds(450, 430, 590, 230);
		t.setBorder(new TitledBorder("Totales "));
		p.add(t);
		
		for(int i=0; i<3; i++){
			
			JLabel txt = new JLabel(totales[i]);
			txt.setBounds(65+(i*175), 40, 150, 20);
			t.add(txt);
			
		}
		
		pPro = new JLabel();
		pPro.setBounds(95, 80, 100, 20);
		t.add(pPro);
		
		pNor = new JLabel();
		pNor.setBounds(260, 80, 100, 20);
		t.add(pNor);
		
		pCli = new JLabel();
		pCli.setBounds(430, 80, 100, 20);
		t.add(pCli);
		
		JLabel pTxt = new JLabel("+ iva");
		pTxt.setBounds(270, 120, 100, 20);
		t.add(pTxt);
		
		pIva = new JLabel();
		pIva.setBounds(260, 160, 100, 20);
		t.add(pIva);
		
		JLabel pTxt2 = new JLabel("+ iva");
		pTxt2.setBounds(440, 120, 100, 20);
		t.add(pTxt2);
		
		pIva2 = new JLabel();
		pIva2.setBounds(440, 160, 100, 20);
		t.add(pIva2);
		
		cancel = new JButton("Cancelar");
		cancel.setBounds(20, 190, 100, 20);
		cancel.addActionListener(cancelar);
		t.add(cancel);
		cancel.setVisible(false);
		
		comprar = new JButton("Comprar");
		comprar.setBounds(470, 190, 100, 20);
		comprar.addActionListener(acept);
		t.add(comprar);
		comprar.setVisible(false);
		
		try {
			cargarPrecios();
		} catch (IOException | ArchivoInexistenteException e1) {
			e1.printStackTrace();
		}
		
		//Fin menu total
		
		//Conectar a la DB
		try {
			dato.conectar();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void cargarPrecios() throws IOException, ArchivoInexistenteException{
		
		TextFile r = new TextFile("dtP.sys", Apertura.READ, false);
		
		for (int i = 0; i < 8; i++) {
			precios.add(Integer.parseInt(r.readLn()));
		}
		
	}

}
