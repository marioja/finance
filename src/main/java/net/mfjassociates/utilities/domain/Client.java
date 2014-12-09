package net.mfjassociates.utilities.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.math.BigDecimal;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import com.rcaloras.roo.addon.timestamp.RooTimestamp;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooTimestamp
public class Client extends AbstractCompany {

    /**
     */
    @NotNull
    private String invoiceEmail;
}
