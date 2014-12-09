// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.mfjassociates.utilities.domain.Document;
import net.mfjassociates.utilities.domain.DocumentDataOnDemand;
import net.mfjassociates.utilities.domain.DocumentIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DocumentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: DocumentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: DocumentIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: DocumentIntegrationTest: @Transactional;
    
    @Autowired
    DocumentDataOnDemand DocumentIntegrationTest.dod;
    
    @Test
    public void DocumentIntegrationTest.testCountDocuments() {
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", dod.getRandomDocument());
        long count = Document.countDocuments();
        Assert.assertTrue("Counter for 'Document' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void DocumentIntegrationTest.testFindDocument() {
        Document obj = dod.getRandomDocument();
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Document' failed to provide an identifier", id);
        obj = Document.findDocument(id);
        Assert.assertNotNull("Find method for 'Document' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Document' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void DocumentIntegrationTest.testFindDocumentEntries() {
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", dod.getRandomDocument());
        long count = Document.countDocuments();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Document> result = Document.findDocumentEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Document' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Document' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void DocumentIntegrationTest.testFlush() {
        Document obj = dod.getRandomDocument();
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Document' failed to provide an identifier", id);
        obj = Document.findDocument(id);
        Assert.assertNotNull("Find method for 'Document' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyDocument(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Document' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void DocumentIntegrationTest.testMergeUpdate() {
        Document obj = dod.getRandomDocument();
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Document' failed to provide an identifier", id);
        obj = Document.findDocument(id);
        boolean modified =  dod.modifyDocument(obj);
        Integer currentVersion = obj.getVersion();
        Document merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Document' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void DocumentIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", dod.getRandomDocument());
        Document obj = dod.getNewTransientDocument(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Document' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Document' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Document' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void DocumentIntegrationTest.testRemove() {
        Document obj = dod.getRandomDocument();
        Assert.assertNotNull("Data on demand for 'Document' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Document' failed to provide an identifier", id);
        obj = Document.findDocument(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Document' with identifier '" + id + "'", Document.findDocument(id));
    }
    
}