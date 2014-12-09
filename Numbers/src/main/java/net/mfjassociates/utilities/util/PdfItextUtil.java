package net.mfjassociates.utilities.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import net.mfjassociates.utilities.domain.AbstractCompany;
import net.mfjassociates.utilities.domain.Address;
import net.mfjassociates.utilities.domain.Invoice;
import net.mfjassociates.utilities.domain.MyCompany;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.AcroFields.Item;
import com.itextpdf.text.pdf.PdfDictionary;
import com.itextpdf.text.pdf.PdfFormField;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfNumber;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
// TODO Add security to the PDF to lock it.
public class PdfItextUtil {
	private static final DateFormat df=new SimpleDateFormat("MMMM d, yyyy");
	private static final MessageFormat mf=new MessageFormat("{0,date,MMMM yyyy} for {1} {2}");
	private static final NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
	private static final DecimalFormat gstFormat=new DecimalFormat("000000000");
	private static final MessageFormat gstMf=new MessageFormat("GST Registration: {0} {1} RT0001");

	
	public static void generatePdF(InputStream template, OutputStream generatedPdf, Invoice invoice) throws DocumentException, IOException {
		PdfReader reader=new PdfReader(template);
		PdfStamper stamper = new PdfStamper(reader, generatedPdf);
		stamper.setEncryption(true, null, null, PdfWriter.ALLOW_PRINTING | PdfWriter.ALLOW_SCREENREADERS);
		
		AcroFields fields=stamper.getAcroFields();
		String billedTo=generateCompany(invoice.getEngagement().getClient());
		MyCompany myCompany=invoice.getEngagement().getMyCompany();
		setupField(fields, "My Company Name", myCompany.getCompanyName(), PdfFormField.Q_LEFT, 24);
		setupField(fields, "Billed to", billedTo);
		setupField(fields, "Shipped to", billedTo);
		setupField(fields, "Invoice Number", invoice.getDocNo().getDocNo(), PdfFormField.Q_LEFT, 10);
		Date invoiceDate = invoice.getInvDate();
		setupField(fields, "Invoice Date", df.format(invoiceDate), PdfFormField.Q_LEFT, 10);
		setupField(fields, "Terms", "Net 30 days", PdfFormField.Q_LEFT, 10);
		setupField(fields, "Payable To", generateCompany(myCompany));
		String gstString=gstFormat.format(invoice.getEngagement().getMyCompany().getGstNumber());
		setupField(fields, "HST Message", gstMf.format(new Object[]{gstString.substring(0, 5), gstString.substring(5)}));
		setupField(fields, "Question Telephone Number", invoice.getEngagement().getMyCompany().getMainTelephoneNumber());
		setupField(fields, "Days1", invoice.getDays().toString(), PdfFormField.Q_RIGHT, 12);
		Calendar cal=Calendar.getInstance();
		cal.setTime(invoiceDate);
		cal.add(Calendar.MONTH, -1);
		setupField(fields, "Description1", mf.format(new Object[]{cal.getTime(), invoice.getEngagement().getEmployee().getFirstName(), invoice.getEngagement().getEmployee().getLastName()}));
		setupField(fields, "Per Diem1", currencyFormatter.format(invoice.getEngagement().getRate()), PdfFormField.Q_RIGHT, 12);
		setupField(fields, "Amount1", currencyFormatter.format(invoice.getEngagement().getRate().multiply(invoice.getDays())), PdfFormField.Q_RIGHT, 12);
		stamper.close();
		reader.close();
	}
	private static String generateCompany(AbstractCompany company) {
		StringBuffer sb=new StringBuffer();
		sb.append(company.getCompanyName()).append("\n");
		generateAddress(sb, company.getBusinessAddress());
		return sb.toString();
	}
	
	private static void generateAddress(StringBuffer sb, Address address) {
		sb.append(address.getLine1()).append("\n");
		String line2=address.getLine2();
		if (line2!=null && line2.length()>0) sb.append(line2).append("\n");
		sb.append(address.getCity()).append(", ").append(address.getProvince()).append(", ").append(address.getPostalCode());
	}

	private static void setupField(AcroFields fields, String name, String value) throws IOException, DocumentException {
		setupField(fields, name, value, PdfFormField.Q_LEFT, 12);
	}
	private static void setupField(AcroFields fields, String name, String value, int fieldAlignment, float textSize) throws IOException, DocumentException {
		int idx=0;
		Item f=fields.getFieldItem(name);
		PdfDictionary widget = (PdfDictionary) f.getWidget(idx);
		PdfDictionary merged = (PdfDictionary) f.getMerged(idx);
		PdfNumber align = new PdfNumber(fieldAlignment);
		widget.put(PdfName.Q, align);
		merged.put(PdfName.Q, align);
		fields.setFieldProperty(name, "textsize", textSize, null);
//		fields.setFieldProperty(name,	"textfont", "Surname".equals(name)?HELVETICA_BOLD:HELVETICA, null);
		fields.setField(name, value);
	}
}
