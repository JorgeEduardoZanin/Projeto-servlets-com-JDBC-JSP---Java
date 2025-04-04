package utilitarios;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

import entities.ModelLogin;

public class DecimalFormats {

	
	public String formataSalario(ModelLogin modelLogin) {
		
		
		DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.of("pt", "BR"));
        symbols.setDecimalSeparator('.');
        symbols.setGroupingSeparator('.');
        DecimalFormat df = new DecimalFormat("#,##0.00", symbols);
        
        return df.format(modelLogin.getSalarioMensal());
		
	}
	
}
