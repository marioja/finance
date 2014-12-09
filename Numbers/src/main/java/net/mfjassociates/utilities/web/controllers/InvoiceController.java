package net.mfjassociates.utilities.web.controllers;
import static net.mfjassociates.utilities.util.PdfItextUtil.generatePdF;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletResponse;

import net.mfjassociates.utilities.domain.Invoice;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.DocumentException;

@RequestMapping("/invoices")
@Controller
@RooWebScaffold(path = "invoices", formBackingObject = Invoice.class)
public class InvoiceController {

    private static final String INVOICE_PDF = "/Invoice.pdf";
    private static final String APPLICATION_PDF = "application/pdf";

    @RequestMapping(value = "/renderPdf/{handle}", produces = APPLICATION_PDF)
    private void renderPdfDocument(@PathVariable("handle") String handle, HttpServletResponse response) throws IOException, DocumentException {
        
        Invoice invoice = Invoice.findInvoicesByHandleEquals(handle).getSingleResult();
        OutputStream generatedPdf = response.getOutputStream();
        InputStream template = this.getClass().getResourceAsStream(INVOICE_PDF);
        response.setContentType(APPLICATION_PDF);
        generatePdF(template, generatedPdf, invoice);
        return;
    }
}
