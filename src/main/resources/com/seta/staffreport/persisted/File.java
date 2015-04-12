package com.seta.staffreport.persisted;

// Generated Mar 2, 2015 10:31:43 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * File generated by hbm2java
 */
public class File implements java.io.Serializable {

    private Integer id;
    private String fileName;
    private byte[] content;
    private String type;
    private Set images = new HashSet(0);

    public File() {
    }

    public File(String fileName) {
        this.fileName = fileName;
    }

    public File(String fileName, byte[] content, String type, Set images) {
        this.fileName = fileName;
        this.content = content;
        this.type = type;
        this.images = images;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileName() {
        return this.fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public byte[] getContent() {
        return this.content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Set getImages() {
        return this.images;
    }

    public void setImages(Set images) {
        this.images = images;
    }

}
