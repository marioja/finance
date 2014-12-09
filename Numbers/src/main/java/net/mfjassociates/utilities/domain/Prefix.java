package net.mfjassociates.utilities.domain;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import net.mfjassociates.utilities.util.Generatable;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import com.rcaloras.roo.addon.timestamp.RooTimestamp;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PREF_SEQ", finders = { "findPrefixesByInUse" })
@RooJson
@RooTimestamp
public class Prefix implements Generatable<String> {

    /**
     * Added id field declaration so it may appear in the fieldNames4OrderClauseFilter and
     * be used in order clauses.
     */
    @Id
    @SequenceGenerator(name = "prefixGen", sequenceName = "PREF_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "prefixGen")
    private Long id;

    /**
     */
    @NotNull
    private Boolean inUse = false;

    /**
     */
    @NotNull
    @Size(min = 2, max = 2)
    private String code;

    @Transient
    private static final char[] LETTERS = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

    //
    //    public Long getIdMine() {
    //		return idMine;
    //	}
    //
    //	public void setIdMine(Long idMine) {
    //		this.idMine = idMine;
    //	}
    @Transient
    @Override
    public List<String> createShuffledList() {
        List<String> list = new ArrayList<String>(LETTERS.length * LETTERS.length);
        for (int i = 0; i < LETTERS.length; i++) {
            for (int j = 0; j < LETTERS.length; j++) {
                list.add(new String(new char[] { LETTERS[i], LETTERS[j] }));
            }
        }
        Collections.shuffle(list);
        return list;
    }

    @Transient
    @Override
    public void initialize(String initializer) {
        this.code = initializer;
    }

    @Transient
    @Override
    public EntityManager getStaticEntityManager() {
        return entityManager();
    }

    @Transient
    @SuppressWarnings("unchecked")
    @Override
    public List<Prefix> findAll() {
        // TODO Auto-generated method stub
        return findAllPrefixes();
    }

    @SuppressWarnings("unchecked")
    @Override
    public Prefix mergeIt() {
        return merge();
    }

    @SuppressWarnings("unchecked")
    public Prefix findFreeEntry() {
        try {
            return findPrefixesByInUse(Boolean.FALSE, "id", "asc").setMaxResults(1).getSingleResult();
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
}
