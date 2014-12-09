// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import java.util.Date;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import net.mfjassociates.utilities.domain.Address;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Address_Roo_Timestamp {
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date Address.created;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date Address.updated;
    
    @PrePersist
    @PreUpdate
    public void Address.onUpdate() {
        if (this.created == null) {
            this.created = new java.util.Date();
        }
        this.updated = new java.util.Date();
    }
    
    public Date Address.getCreated() {
        return this.created;
    }
    
    public void Address.setCreated(Date created) {
        this.created = created;
    }
    
    public Date Address.getUpdated() {
        return this.updated;
    }
    
    public void Address.setUpdated(Date updated) {
        this.updated = updated;
    }
    
}
