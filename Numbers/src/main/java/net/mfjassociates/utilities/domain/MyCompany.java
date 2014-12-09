package net.mfjassociates.utilities.domain;
import java.math.BigInteger;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.rcaloras.roo.addon.timestamp.RooTimestamp;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooTimestamp
public class MyCompany extends AbstractCompany {

    /**
     */
    @NotNull
    @DecimalMin("100000000")
    @DecimalMax("999999999")
    @Digits(integer = 9, fraction = 0)
    private BigInteger gstNumber;
}
