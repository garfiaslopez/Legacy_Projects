package appMarcos;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.table.DefaultTableModel;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class GenerarPDF {
	
	private static Font fontBold = new Font(Font.FontFamily.COURIER, 12, Font.BOLD);
    private static Font fontNormal = new Font(Font.FontFamily.COURIER, 11, Font.NORMAL);
    
    public void generarCodigoBarras(ArrayList<String> nombre) throws FileNotFoundException, DocumentException{
    	Document document = getDocument();
     	PdfWriter pw=PdfWriter.getInstance(document, new FileOutputStream("codigoBarras.pdf"));
     	document.open();
     	
     	document.add(getHeader("Codigos de Barras Marcos "));
     	document.add(getInformation("--------------------------------------"));
     	

     	
     	for (int j = 0; j < nombre.size(); j++) {
     		
     		document.add(getBarcode(document, pw, nombre.get(j)));
     		
     		document.add(getInformation("--------------------------------------"));
     		
     	}
     	
     	document.close();
     	
     	//Estas pinches siguientes lineas abren el pdf, quitar en caso de mandar a imprimir
     	try {
     	     File path = new File ("codigoBarras.pdf");
     	     Desktop.getDesktop().open(path);
     	}catch (IOException ex) {
     	     ex.printStackTrace();
     	}
     	
     	//imprimirFactura(codigoBarras.pdf);
     	
    }
    
    public void PdfContentReaderTool(){
    	
    }
    
    
    public void generarFactura(DefaultTableModel datos) throws IOException, DocumentException {
    	
     	Document document = getDocument();
     	PdfWriter pw=PdfWriter.getInstance(document, new FileOutputStream("historial.pdf"));
     	document.open();
     	
     	PdfPTable table = getTable();
  		
  		document.add(getHeader("Hitorial "));
  		document.add(getInformation(" "));
  		
  		table.addCell(getCell("Folio"));
        table.addCell(getCell("Fecha"));
        table.addCell(getCell("Hora"));
        table.addCell(getCell("Medida"));
        table.addCell(getCell("Modelo"));
        table.addCell(getCell("Total"));
        
        for(int i=0;i<datos.getRowCount();i++){
        	for(int j=0;j<datos.getColumnCount();j++){
        			table.addCell(getCell(datos.getValueAt(i, j) + " "));
        	}
        }
        
        table.addCell(getCell(" "));
        table.addCell(getCell(" "));
        table.addCell(getCell(" "));
         
        document.add(table);
        
        document.close();
        
        //Estas pinches siguientes lineas abren el pdf
        try {
            File path2 = new File ("historial.pdf");
            Desktop.getDesktop().open(path2);
        }catch (IOException ex) {
            ex.printStackTrace();
        }
        
     	
     	
     }
     
     private Document getDocument(){
    	Document document = new Document(new Rectangle( getConvertCmsToPoints(21), getConvertCmsToPoints(30)));
      	document.setMargins(10, 10, 10, 10);
      	return document;
     }
     
     private Paragraph getHeader(String header) {
    	Paragraph paragraph = new Paragraph();
  		Chunk chunk = new Chunk();
		paragraph.setAlignment(Element.ALIGN_CENTER);
  		chunk.append( header + getCurrentDateTime() + "\n");
  		chunk.setFont(fontBold);
  		paragraph.add(chunk);
  		return paragraph;
     }
     
     private Paragraph getInformation(String informacion) {
    	Paragraph paragraph = new Paragraph();
    	Chunk chunk = new Chunk();
  		paragraph.setAlignment(Element.ALIGN_CENTER);
  		chunk.append(informacion);
  		chunk.setFont(fontNormal);
  		paragraph.add(chunk);
   		return paragraph;
      }
     
     private Paragraph getInformationFooter(String informacion) {
     	Paragraph paragraph = new Paragraph();
     	Chunk chunk = new Chunk();
   		paragraph.setAlignment(Element.ALIGN_CENTER);
   		chunk.append(informacion);
   		chunk.setFont(new Font(Font.FontFamily.COURIER, 8, Font.NORMAL));
   		paragraph.add(chunk);
    		return paragraph;
       }
  
     private PdfPTable getTable() throws DocumentException {
     	PdfPTable table = new PdfPTable(6);
     	table.setWidths(new int[]{17, 17, 17, 17, 17, 17});
		return table;
     }
     
     private PdfPCell getCell(String text) throws DocumentException, IOException {
     	Chunk chunk = new Chunk();
     	chunk.append(text);
     	chunk.setFont(fontNormal);
     	PdfPCell cell = new PdfPCell(new Paragraph(chunk));
 		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
 		cell.setBorder(Rectangle.BOX);
 		return cell;
     }
     
     private float getConvertCmsToPoints(float cm) {
     	return cm * 28.4527559067f;
     }
     
     private String getCurrentDateTime() {
     	Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yy '-' hh:mm");
     	return ft.format(dNow);
    }
     
    private static Image getBarcode(Document document,  PdfWriter pdfWriter, String servicio){
	 	PdfContentByte cimg = pdfWriter.getDirectContent();
	   	Barcode128 code128 = new Barcode128();
	   	code128.setCode(servicio);
	   	code128.setCodeType(Barcode128.CODE128);
		code128.setTextAlignment(Element.ALIGN_CENTER);
		Image image = code128.createImageWithBarcode(cimg, null, null);
		float scaler = ((document.getPageSize().getWidth() - document.leftMargin()  - document.rightMargin() - 0) / image.getWidth()) * 15;
		image.scalePercent(scaler);
		image.setAlignment(Element.ALIGN_CENTER);
		return image;
	}
    
    private static String addZeroLeft(String num) {
    	NumberFormat formatter = new DecimalFormat("0000000");
     	return formatter.format((num != null) ? Integer.parseInt(num) : 0000000);
	}

	public void imprimirFactura(String name){
    	
    	Desktop d=Desktop.getDesktop();
    	try {
    		if(Desktop.isDesktopSupported()){
    			d.print(new File(name));
    		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
    
}
