package net.mfjassociates.utilities.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public abstract class Person {

    /**
     */
    private String firstName;

    /**
     */
    @NotNull
    private String lastName;

    /**
     */
    private String email;
}
