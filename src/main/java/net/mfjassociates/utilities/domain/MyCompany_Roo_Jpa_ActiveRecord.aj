// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import java.util.List;
import net.mfjassociates.utilities.domain.MyCompany;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MyCompany_Roo_Jpa_ActiveRecord {
    
    public static final List<String> MyCompany.fieldNames4OrderClauseFilter = java.util.Arrays.asList("gstNumber");
    
    public static long MyCompany.countMyCompanys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MyCompany o", Long.class).getSingleResult();
    }
    
    public static List<MyCompany> MyCompany.findAllMyCompanys() {
        return entityManager().createQuery("SELECT o FROM MyCompany o", MyCompany.class).getResultList();
    }
    
    public static List<MyCompany> MyCompany.findAllMyCompanys(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM MyCompany o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, MyCompany.class).getResultList();
    }
    
    public static MyCompany MyCompany.findMyCompany(Long id) {
        if (id == null) return null;
        return entityManager().find(MyCompany.class, id);
    }
    
    public static List<MyCompany> MyCompany.findMyCompanyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MyCompany o", MyCompany.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<MyCompany> MyCompany.findMyCompanyEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM MyCompany o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, MyCompany.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public MyCompany MyCompany.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MyCompany merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
