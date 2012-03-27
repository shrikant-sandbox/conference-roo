// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.shri.conference.domain;

import com.shri.conference.domain.Talk;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Talk_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Talk.entityManager;
    
    public static final EntityManager Talk.entityManager() {
        EntityManager em = new Talk().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Talk.countTalks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Talk o", Long.class).getSingleResult();
    }
    
    public static List<Talk> Talk.findAllTalks() {
        return entityManager().createQuery("SELECT o FROM Talk o", Talk.class).getResultList();
    }
    
    public static Talk Talk.findTalk(Long id) {
        if (id == null) return null;
        return entityManager().find(Talk.class, id);
    }
    
    public static List<Talk> Talk.findTalkEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Talk o", Talk.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Talk.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Talk.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Talk attached = Talk.findTalk(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Talk.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Talk.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Talk Talk.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Talk merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
