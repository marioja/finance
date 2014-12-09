package net.mfjassociates.utilities.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.math.BigDecimal;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ContractEngagement {

    /**
     */
    @DecimalMin("1.00")
    @DecimalMax("10000.00")
    @Digits(integer = 5, fraction = 2)
    private BigDecimal rate;

    /**
     */
    @NotNull
    @ManyToOne
    private Employee employee;

    /**
     */
    @NotNull
    @ManyToOne
    private Client client;

    /**
     */
    @NotNull
    @ManyToOne
    private MyCompany myCompany;
}
