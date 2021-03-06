package net.mfjassociates.utilities.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import com.rcaloras.roo.addon.timestamp.RooTimestamp;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;

@RooJavaBean
@RooToString
@RooTimestamp
@RooJpaActiveRecord(finders = { "findInvoicesByHandleEquals" })
public class Invoice {

    /**
     */
    @NotNull
    @Value("#{new java.util.Date()}")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MMM-yyyy")
    private Date invDate;

    /**
     */
    @NotNull
    @ManyToOne
    private ContractEngagement engagement;

    /**
     */
    @NotNull
    @DecimalMin("0.00")
    @DecimalMax("32.00")
    @Digits(integer = 2, fraction = 2)
    private BigDecimal days;

    /**
     */
    @NotNull
    @ManyToOne
    @Value("#{T(net.mfjassociates.utilities.util.GeneratorUtils).getRandomGeneratable(T(net.mfjassociates.utilities.domain.Document), T(net.mfjassociates.utilities.shared.domain.DocumentType).INVOICE, \"Generated by Numbers web application\")}")
    private Document docNo;

    /**
     */
    @NotNull
    @Value("#{T(java.util.UUID).randomUUID().toString()}")
    private String handle;
}
