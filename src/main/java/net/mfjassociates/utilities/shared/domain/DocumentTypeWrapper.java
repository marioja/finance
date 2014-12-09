package net.mfjassociates.utilities.shared.domain;

public class DocumentTypeWrapper {
	private DocumentType docType;
	public DocumentTypeWrapper(String sDocType) {
		docType=DocumentType.valueOf(sDocType);
	}
	public DocumentType getDocType() {
		return docType;
	}

}
