// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.shri.conference.domain;

import com.shri.conference.domain.Speaker;
import com.shri.conference.domain.SpeakerDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect SpeakerDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SpeakerDataOnDemand: @Component;
    
    private Random SpeakerDataOnDemand.rnd = new SecureRandom();
    
    private List<Speaker> SpeakerDataOnDemand.data;
    
    public Speaker SpeakerDataOnDemand.getNewTransientSpeaker(int index) {
        Speaker obj = new Speaker();
        setEmail(obj, index);
        setName(obj, index);
        setOrganizationName(obj, index);
        setPassword(obj, index);
        return obj;
    }
    
    public void SpeakerDataOnDemand.setEmail(Speaker obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void SpeakerDataOnDemand.setName(Speaker obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void SpeakerDataOnDemand.setOrganizationName(Speaker obj, int index) {
        String organizationName = "organizationName_" + index;
        obj.setOrganizationName(organizationName);
    }
    
    public void SpeakerDataOnDemand.setPassword(Speaker obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public Speaker SpeakerDataOnDemand.getSpecificSpeaker(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Speaker obj = data.get(index);
        Long id = obj.getId();
        return Speaker.findSpeaker(id);
    }
    
    public Speaker SpeakerDataOnDemand.getRandomSpeaker() {
        init();
        Speaker obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Speaker.findSpeaker(id);
    }
    
    public boolean SpeakerDataOnDemand.modifySpeaker(Speaker obj) {
        return false;
    }
    
    public void SpeakerDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Speaker.findSpeakerEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Speaker' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Speaker>();
        for (int i = 0; i < 10; i++) {
            Speaker obj = getNewTransientSpeaker(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
