package net.mfjassociates.utilities.util;

import java.util.List;

import javax.persistence.EntityManager;

import net.mfjassociates.utilities.shared.domain.DocumentType;

/**
 * @author mario
 *
 * @param <I> the initializer that will be randomized.
 */
public interface Generatable<I> {
	public void persist();
	public void remove();
	public void flush();
	public <O extends Generatable<I>> O mergeIt();
	public <T extends Generatable<I>> List<T> findAll();
	public <T extends Generatable<I>> T findFreeEntry();
	public EntityManager getStaticEntityManager();
	public List<I> createShuffledList();
	public void setInUse(Boolean inUseToSet);
	public void initialize(I initializer);
	public static interface Generatable2<E> {
		public void initialize2(E extra);
		public void setDocType(DocumentType aDocType);
		public void setDescription(String aDescription);
	}
}
