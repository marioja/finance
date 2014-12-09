package net.mfjassociates.utilities.web.controllers;
import static net.mfjassociates.utilities.util.GeneratorUtils.getRandomGeneratable;
import net.mfjassociates.utilities.domain.Document;
import net.mfjassociates.utilities.shared.domain.DocumentType;
import net.mfjassociates.utilities.shared.domain.DocumentTypeWrapper;
import org.springframework.http.MediaType;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Document.class)
@Controller
@RequestMapping("/documents")
@RooWebScaffold(path = "documents", formBackingObject = Document.class)
public class DocumentController {

    @RequestMapping(value = "/create", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    private String createNewDocument(@RequestParam DocumentTypeWrapper docType, @RequestParam String description) throws InstantiationException, IllegalAccessException {
        return getRandomGeneratable(Document.class, docType.getDocType(), description).getDocNo();
    }

    public static void main(String[] args) {
        DocumentType d = new DocumentTypeWrapper("GENERCIC").getDocType();
        System.out.println("Document type " + d);
    }
}
