// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import java.util.Date;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import net.mfjassociates.utilities.domain.MyCompany;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect MyCompany_Roo_Timestamp {
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date MyCompany.created;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date MyCompany.updated;
    
    @PrePersist
    @PreUpdate
    public void MyCompany.onUpdate() {
        if (this.created == null) {
            this.created = new java.util.Date();
        }
        this.updated = new java.util.Date();
    }
    
    public Date MyCompany.getCreated() {
        return this.created;
    }
    
    public void MyCompany.setCreated(Date created) {
        this.created = created;
    }
    
    public Date MyCompany.getUpdated() {
        return this.updated;
    }
    
    public void MyCompany.setUpdated(Date updated) {
        this.updated = updated;
    }
    
}
