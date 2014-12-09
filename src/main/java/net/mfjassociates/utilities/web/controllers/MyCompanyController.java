package net.mfjassociates.utilities.web.controllers;
import net.mfjassociates.utilities.domain.MyCompany;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mycompanys")
@Controller
@RooWebScaffold(path = "mycompanys", formBackingObject = MyCompany.class)
public class MyCompanyController {
}
