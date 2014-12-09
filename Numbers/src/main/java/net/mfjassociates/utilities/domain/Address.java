package net.mfjassociates.utilities.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import com.rcaloras.roo.addon.timestamp.RooTimestamp;
import javax.validation.constraints.NotNull;
import javax.persistence.Enumerated;
import net.mfjassociates.utilities.reference.Province;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooTimestamp
public class Address {

    /**
     */
    @NotNull
    private String line1;

    /**
     */
    private String line2;

    /**
     */
    @NotNull
    private String city;

    /**
     */
    @NotNull
    @Enumerated
    private Province province;

    /**
     */
    @NotNull
    private String postalCode;
}
