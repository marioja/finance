// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.mfjassociates.utilities.domain.Document;

privileged aspect Document_Roo_Json {
    
    public String Document.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Document.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Document Document.fromJsonToDocument(String json) {
        return new JSONDeserializer<Document>()
        .use(null, Document.class).deserialize(json);
    }
    
    public static String Document.toJsonArray(Collection<Document> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Document.toJsonArray(Collection<Document> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Document> Document.fromJsonArrayToDocuments(String json) {
        return new JSONDeserializer<List<Document>>()
        .use("values", Document.class).deserialize(json);
    }
    
}
