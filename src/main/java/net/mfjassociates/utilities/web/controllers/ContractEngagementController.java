package net.mfjassociates.utilities.web.controllers;
import net.mfjassociates.utilities.domain.ContractEngagement;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/contractengagements")
@Controller
@RooWebScaffold(path = "contractengagements", formBackingObject = ContractEngagement.class)
public class ContractEngagementController {
}
