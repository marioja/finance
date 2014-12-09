package net.mfjassociates.utilities.domain;
import static net.mfjassociates.utilities.util.GeneratorUtils.NUMERICAL_NUMBER_FORMAT;
import static net.mfjassociates.utilities.util.GeneratorUtils.NUMERICAL_NUMBER_OF_DIGITS;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import net.mfjassociates.utilities.shared.domain.DocumentType;
import net.mfjassociates.utilities.util.Generatable;
import net.mfjassociates.utilities.util.Generatable.Generatable2;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import com.rcaloras.roo.addon.timestamp.RooTimestamp;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "DOC_SEQ", finders = { "findDocumentsByInUse" })
@RooJson
@RooTimestamp
public class Document implements Generatable<Integer>, Generatable2<Prefix> {

    /**
     * Added id field declaration so it may appear in the fieldNames4OrderClauseFilter and
     * be used in order clauses.
     */
    @Id
    @SequenceGenerator(name = "documentGen", sequenceName = "DOC_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "documentGen")
    @Column(name = "id")
    private Long id;

    /**
     */
    @NotNull
    private Boolean inUse = false;

    /**
     */
    @NotNull
    @ManyToOne
    private Prefix prefix;

    /**
     */
    @NotNull
    @Min(0L)
    private Integer numerical;

    @Override
    public List<Integer> createShuffledList() {
        int count = (int) Math.pow(10, NUMERICAL_NUMBER_OF_DIGITS);
        List<Integer> list = new ArrayList<Integer>(count);
        for (int i = 1; i < count; i++) {
            list.add(i);
        }
        Collections.shuffle(list);
        return list;
    }

    @Override
    public void initialize(Integer initializer) {
        this.numerical = initializer;
    }

    @Override
    public void initialize2(Prefix extra) {
        this.prefix = extra;
    }

    public String getDocNo() {
        return prefix.getCode() + NUMERICAL_NUMBER_FORMAT.format(getNumerical());
    }

    public static void main(String[] args) {
        DecimalFormat f = new DecimalFormat("00");
        for (int i = 95; i < 101; i++) {
            System.out.println(f.format(i));
        }
    }

    @Override
    public EntityManager getStaticEntityManager() {
        return entityManager();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Document> findAll() {
        return findAllDocuments();
    }

    @SuppressWarnings("unchecked")
    @Override
    public Document mergeIt() {
        return merge();
    }

    @SuppressWarnings("unchecked")
    public Document findFreeEntry() {
        try {
            return findDocumentsByInUse(Boolean.FALSE, "id", "asc").setMaxResults(1).getSingleResult();
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    /**
     */
    @Enumerated
    private DocumentType docType;

    /**
     */
    @Size(max = 80)
    private String description;
}
