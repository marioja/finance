// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.web.controllers;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import net.mfjassociates.utilities.domain.Document;
import net.mfjassociates.utilities.domain.Prefix;
import net.mfjassociates.utilities.shared.domain.DocumentType;
import net.mfjassociates.utilities.web.controllers.DocumentController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DocumentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DocumentController.create(@Valid Document document, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, document);
            return "documents/create";
        }
        uiModel.asMap().clear();
        document.persist();
        return "redirect:/documents/" + encodeUrlPathSegment(document.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DocumentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Document());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Prefix.countPrefixes() == 0) {
            dependencies.add(new String[] { "prefix", "prefixes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "documents/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DocumentController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("document", Document.findDocument(id));
        uiModel.addAttribute("itemId", id);
        return "documents/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DocumentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("documents", Document.findDocumentEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Document.countDocuments() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("documents", Document.findAllDocuments(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "documents/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DocumentController.update(@Valid Document document, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, document);
            return "documents/update";
        }
        uiModel.asMap().clear();
        document.merge();
        return "redirect:/documents/" + encodeUrlPathSegment(document.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DocumentController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Document.findDocument(id));
        return "documents/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DocumentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Document document = Document.findDocument(id);
        document.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/documents";
    }
    
    void DocumentController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("document_created_date_format", "yyyy-MM-dd HH:mm:ss");
        uiModel.addAttribute("document_updated_date_format", "yyyy-MM-dd HH:mm:ss");
    }
    
    void DocumentController.populateEditForm(Model uiModel, Document document) {
        uiModel.addAttribute("document", document);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("prefixes", Prefix.findAllPrefixes());
        uiModel.addAttribute("documenttypes", Arrays.asList(DocumentType.values()));
    }
    
    String DocumentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
