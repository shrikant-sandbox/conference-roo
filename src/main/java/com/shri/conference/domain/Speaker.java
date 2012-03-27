package com.shri.conference.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findSpeakersByEmailAndPasswordEquals" })
public class Speaker {

    @NotNull
    private String name;

    @NotNull
    private String email;

    private String organizationName;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Talk> talks = new HashSet<Talk>();

    @NotNull
    @Size(min = 6)
    private String password;
}
