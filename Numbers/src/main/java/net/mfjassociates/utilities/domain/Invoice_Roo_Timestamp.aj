// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import java.util.Date;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import net.mfjassociates.utilities.domain.Invoice;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Invoice_Roo_Timestamp {
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date Invoice.created;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date Invoice.updated;
    
    @PrePersist
    @PreUpdate
    public void Invoice.onUpdate() {
        if (this.created == null) {
            this.created = new java.util.Date();
        }
        this.updated = new java.util.Date();
    }
    
    public Date Invoice.getCreated() {
        return this.created;
    }
    
    public void Invoice.setCreated(Date created) {
        this.created = created;
    }
    
    public Date Invoice.getUpdated() {
        return this.updated;
    }
    
    public void Invoice.setUpdated(Date updated) {
        this.updated = updated;
    }
    
}