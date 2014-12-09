package net.mfjassociates.utilities.web.controllers;
import net.mfjassociates.utilities.domain.Prefix;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Prefix.class)
@Controller
@RequestMapping("/prefixes")
@RooWebScaffold(path = "prefixes", formBackingObject = Prefix.class)
public class PrefixController {
}
