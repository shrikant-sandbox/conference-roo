package com.shri.conference.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import com.shri.conference.domain.Speaker;

public class ConferenceSecurityProvider extends
		AbstractUserDetailsAuthenticationProvider {
	
	@Override
	protected void additionalAuthenticationChecks(UserDetails arg0,
			UsernamePasswordAuthenticationToken arg1)
			throws AuthenticationException {
		// TODO Auto-generated method stub

	}

	@Override
	protected UserDetails retrieveUser(String userName,
			UsernamePasswordAuthenticationToken authenticationToken)
			throws AuthenticationException {
		String password = (String)authenticationToken.getCredentials();
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Speaker speaker = Speaker.findSpeakersByEmailAndPasswordEquals(userName, password).getSingleResult();
		SimpleGrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_USER");
		authorities.add(grantedAuthority);
		return new User(userName, password, authorities);
	}

}
