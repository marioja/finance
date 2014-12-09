package net.mfjassociates.utilities.domain;

import static net.mfjassociates.utilities.shared.domain.DocumentType.GENERIC;
import static net.mfjassociates.utilities.util.GeneratorUtils.getRandomGeneratable;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Ignore("This should only be invoke from a blank database when hibernate hibernate.hbm2ddl.auto is set to create or create-drop")
public class DomainIntegrationTest {
	
	private static ClassPathXmlApplicationContext context;
	private static final Logger logger=Logger.getLogger(DomainIntegrationTest.class);
	
	@BeforeClass
	public static void createContext() {
		context = new ClassPathXmlApplicationContext("/META-INF/spring/applicationContext*.xml");
		context.refresh();
		
	}
	
	@Test
	public void testDomain() throws InstantiationException, IllegalAccessException {
		Document previous=null;
		Set<String> docnos=new HashSet<String>();
		Set<String> prefixes=new HashSet<String>();
		for (int j = 0; j < 676; j++) {
			previous=checkNewDocSet(previous, docnos, prefixes, false);
		}
		// Run second set of prefixes
		docnos=new HashSet<String>();
		previous=null; // we do not want to compare to previous set because it may match and this is OK
		for (int j = 0; j < 676; j++) {
			previous=checkNewDocSet(previous, docnos, prefixes, true);
		}
	}
	
	private Document checkNewDocSet(Document previous, Set<String> docnos, Set<String> prefixes, boolean existingPrefix) throws InstantiationException, IllegalAccessException {
		Document document=null;
		for (int i = 1; i < 10; i++) {
			document=getRandomGeneratable(Document.class, GENERIC, "document "+i);
			String docno=document.getDocNo();
			String prefix=document.getPrefix().getCode();
			String previousPrefixCode=null;
			if (previous!=null) previousPrefixCode=previous.getPrefix().getCode();
			logger.error("Loop "+(i)+" got document code="+docno);
			if (i==1) {
				assertTrue("prefix code "+prefix+(existingPrefix?" does not exist already and should (second prefix series)":" exists already and should not (first prefix series)"), existingPrefix!=prefixes.add(prefix));
				if (previous!=null) {
					assertTrue(" prefix code "+prefix+" should be different from previous prefix code "+previousPrefixCode, !prefix.equals(previousPrefixCode));
				}
			}
			assertTrue("document number "+docno+" exists already", docnos.add(docno));
		}
		return document;
	}

}
