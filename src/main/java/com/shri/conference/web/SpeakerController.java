package com.shri.conference.web;

import com.shri.conference.domain.Speaker;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/speakers")
@Controller
@RooWebScaffold(path = "speakers", formBackingObject = Speaker.class)
public class SpeakerController {
}
