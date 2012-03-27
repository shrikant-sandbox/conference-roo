package com.shri.conference.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.shri.conference.domain.Speaker;
import com.shri.conference.domain.Talk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/talks")
@Controller
@RooWebScaffold(path = "talks", formBackingObject = Talk.class)
public class TalkController {

    @Autowired
    private transient MailSender mailTemplate;

    public void sendMessage(String mailFrom, String subject, String mailTo, String message) {
        org.springframework.mail.SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage();
        mailMessage.setFrom(mailFrom);
        mailMessage.setSubject(subject);
        mailMessage.setTo(mailTo);
        mailMessage.setText(message);
        mailTemplate.send(mailMessage);
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Talk talk, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, talk);
            return "talks/create";
        }
        uiModel.asMap().clear();
        talk.persist();
        sendMessage("spring.roo.playground@gmail.com", "Your talk is created",
				talk.getSpeaker().getEmail(), "Congrats your talk is created");
        return "redirect:/talks/" + encodeUrlPathSegment(talk.getId().toString(), httpServletRequest);
    }
    
    private void populateEditForm(Model uiModel, Talk talk) {
        uiModel.addAttribute("talk", talk);
        uiModel.addAttribute("speakers", Speaker.findAllSpeakers());
    }
    
    String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}
