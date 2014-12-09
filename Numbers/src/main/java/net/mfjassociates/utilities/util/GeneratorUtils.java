package net.mfjassociates.utilities.util;

import static net.mfjassociates.utilities.shared.domain.DocumentType.GENERIC;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.List;

import net.mfjassociates.utilities.domain.Document;
import net.mfjassociates.utilities.domain.Prefix;
import net.mfjassociates.utilities.shared.domain.DocumentType;
import net.mfjassociates.utilities.util.Generatable.Generatable2;

import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * This class provides utility methods process {@link Generatable} objects.
 * 
 * If you set the hibernate.hbm2ddl.auto to create or create-drop, the data will be
 * cleared before your run.  If you set to update then it will leave the data in the
 * state it is before the run.  Please note this affects what happens BEFORE the first
 * DB operation and not the state when the DB is closed.
 * 
 * @author mario
 *
 */
public class GeneratorUtils {
	
	private static final Logger logger=Logger.getLogger(GeneratorUtils.class);
	public static final int NUMERICAL_NUMBER_OF_DIGITS=2;
	private static final char[] zeros;
	static {
		char[] t=new char[NUMERICAL_NUMBER_OF_DIGITS];
		Arrays.fill(t, '0');
		zeros=t;
	}
	public static final DecimalFormat NUMERICAL_NUMBER_FORMAT=new DecimalFormat(new String(zeros));

	/**
	 * Method that will create and persist a sequence of {@link Generatable} objects.  The generic type E of the
	 * {@link Generatable2} interface is an instance
	 * of an extra object to be passed to the {@link Generatable2#initialize2(E)} method if the {@link Generatable} object
	 * implements that interface.  The generic type T is the type of the initializers passed to the {@link Generatable#initialize(T)} method.
	 * The generic type O is the type of the {@link Generatable} objects that will be created.
	 * 
	 * @param clazz The class instance of the {@link Generatable} objects that will be created.
	 * @param extra
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	private static <T, O extends Generatable<T>> void generate(Class<O> clazz) throws InstantiationException, IllegalAccessException {
		O object=clazz.newInstance();
		logger.info("Generating new sequence of generatable object of type "+clazz.getCanonicalName());
		boolean extraAndDocument=object instanceof Generatable2 && object instanceof Document;
		List<T> list=object.createShuffledList();
		Prefix prefix=null;
		if (extraAndDocument) {
			prefix=getRandomGeneratable(Prefix.class); // use same prefix for whole series of document
		}
//		removeAll(clazz);  Keep them for historical
		for (T t : list) {
			object.initialize(t);
			if (extraAndDocument) {
				@SuppressWarnings("unchecked")
				Generatable2<Prefix> object2=(Generatable2<Prefix>)object;
				object2.initialize2(prefix);
			}
			object.persist();
			object=clazz.newInstance(); // new object for next iteration
		}
		object.flush();
		return;
	}
	
//	private static <T, O extends Generatable<T>> void removeAll(Class<O> clazz) throws InstantiationException, IllegalAccessException {
//		List<O> list=clazz.newInstance().findAll();
//		logger.info("Removing all rows("+list.size()+") for "+clazz.getCanonicalName());
//		for (O o : list) {
//			o.remove();
//		}
//		clazz.newInstance().flush();
//	}
	public static <E, T, O extends Generatable<T>> O getRandomGeneratable(Class<O> clazz) throws InstantiationException, IllegalAccessException {
		return getRandomGeneratable(clazz, GENERIC, null);
	}
	/**
	 * This method will return a {@link Generatable} object with an code from a random sequence of initializer.  The
	 * random sequence of initializer is regenerated whenever required.  
	 * @param clazz
	 * @param docType TODO
	 * @param description TODO
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	public static <T, O extends Generatable<T>> O getRandomGeneratable(Class<O> clazz, DocumentType docType, String description) throws InstantiationException, IllegalAccessException {
		O object=null;
		object = clazz.newInstance().findFreeEntry();
		if (object!=null) {
			object = markInUse(object, docType, description);
		} else {
			generate(clazz);
			object = clazz.newInstance().findFreeEntry();
			if (object!=null) {
				object = markInUse(object, docType, description);
			} else {
				throw new java.lang.IllegalStateException("Zero object returned after trying to generate a new sequence of generatable object of type "+clazz.getCanonicalName());
			}
		}
		return object;
	}

	private static <T, O extends Generatable<T>> O markInUse(O object, DocumentType aDocType, String aDescription) {
		object.setInUse(true);
		if (object instanceof Generatable2) {
			Generatable2<?> object2=(Generatable2<?>) object;
			object2.setDescription(aDescription);
			object2.setDocType(aDocType);
		}
		object=object.mergeIt();
		return object;
	}
	public static void main(String[] args) throws InstantiationException, IllegalAccessException {
		@SuppressWarnings("resource")
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("/META-INF/spring/applicationContext*.xml");
		context.refresh();
		Prefix prefix=null;
		Document document=null;
		for (int i = 0; i < 676; i++) {
			prefix=getRandomGeneratable(Prefix.class);
			logger.info((i+1)+" got prefix code="+prefix.getCode());
		}
		for (int i = 0; i < 11; i++) {
			document=getRandomGeneratable(Document.class);
			logger.error((i+1)+" got document code="+document.getDocNo());
		}
	}
//	public static <I, T extends Generatable<I>> T findFreeEntry(Class<T> clazz) throws InstantiationException, IllegalAccessException {
//        String jpaQuery = "SELECT o FROM "+clazz.getSimpleName()+" o";
//        jpaQuery = jpaQuery + " WHERE IN_USE=:inuse ORDER BY ID ASC";
//        T object=null;
//        EntityManager em=clazz.newInstance().getStaticEntityManager();
//        List<T> list = (List<T>) em.createQuery(jpaQuery, clazz).setParameter("inuse", Boolean.FALSE).setMaxResults(1).getResultList();
//		if (list.size()==1) object=list.get(0);
//		return object;
//	}
}
