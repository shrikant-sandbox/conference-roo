// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.shri.conference.domain;

import com.shri.conference.domain.Talk;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Talk_Roo_Jpa_Entity {
    
    declare @type: Talk: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Talk.id;
    
    @Version
    @Column(name = "version")
    private Integer Talk.version;
    
    public Long Talk.getId() {
        return this.id;
    }
    
    public void Talk.setId(Long id) {
        this.id = id;
    }
    
    public Integer Talk.getVersion() {
        return this.version;
    }
    
    public void Talk.setVersion(Integer version) {
        this.version = version;
    }
    
}