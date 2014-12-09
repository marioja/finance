// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import java.util.Date;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import net.mfjassociates.utilities.domain.Client;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Client_Roo_Timestamp {
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date Client.created;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date Client.updated;
    
    @PrePersist
    @PreUpdate
    public void Client.onUpdate() {
        if (this.created == null) {
            this.created = new java.util.Date();
        }
        this.updated = new java.util.Date();
    }
    
    public Date Client.getCreated() {
        return this.created;
    }
    
    public void Client.setCreated(Date created) {
        this.created = created;
    }
    
    public Date Client.getUpdated() {
        return this.updated;
    }
    
    public void Client.setUpdated(Date updated) {
        this.updated = updated;
    }
    
}
