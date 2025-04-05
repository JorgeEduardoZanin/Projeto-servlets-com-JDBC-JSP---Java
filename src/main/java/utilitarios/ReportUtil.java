package utilitarios;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRXlsExporter;

@SuppressWarnings("rawtypes")
public class ReportUtil implements Serializable {
	
	private static final long serialVersionUID = 1L;

	public byte[] geraRelatorioPDF(List listaDados, String nomeRelatorio, ServletContext servletContext) throws JRException {
		
		//cria a lista de dados que vem do sql 
		JRBeanCollectionDataSource jrbCollection = new JRBeanCollectionDataSource(listaDados);
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, new HashMap<>(), jrbCollection);
		
		return JasperExportManager.exportReportToPdf(impressoraJasper);
	}
	
	public byte[] geraRelatorioPDF (List listaDados, String nomeRelatorio, HashMap<String, Object> hashParametros, ServletContext servletContext) throws JRException {
		
		//a diferenca desse pro de cima e que ele gera sub relatorio com a lista de telefones do usuario
		JRBeanCollectionDataSource jrbCollection = new JRBeanCollectionDataSource(listaDados);
        
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, hashParametros, jrbCollection);
		
		
		
		
		return JasperExportManager.exportReportToPdf(impressoraJasper);
		
	}
	
public byte[] geraRelatorioExcel(List listaDados, String nomeRelatorio, HashMap<String, Object> hashParametros, ServletContext servletContext) throws JRException {
		
		//cria a lista de dados que vem do sql 
		JRBeanCollectionDataSource jrbCollection = new JRBeanCollectionDataSource(listaDados);
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, new HashMap<>(), jrbCollection);
		
		JRExporter exporter = new JRXlsExporter();
		
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, impressoraJasper);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
		
		exporter.exportReport();
		
		return baos.toByteArray();
	}
	
	
}

