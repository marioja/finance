package net.mfjassociates.utilities.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public abstract class AbstractCompany {

    /**
     */
    @NotNull
    @ManyToOne
    private Address businessAddress;

    /**
     */
    @NotNull
    private String companyName;

    /**
     */
    @NotNull
    private String mainTelephoneNumber;
}
