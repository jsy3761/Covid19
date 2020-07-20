package com.ntels.syjeon.covid19.controller;

import com.ntels.syjeon.covid19.service.CovidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Covid Controller
 *
 * @author syjeon@ntels.com
 */
@Controller
public class CovidController {

    /**
     * Covid Service
     */
    @Autowired
    private CovidService covidService;

    @GetMapping(value = "/")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("covid");
        return mv;
    }

    @GetMapping(value = "/names.ajax")
    @ResponseBody
    public String[] getNameList(){
        return covidService.getNames();
    }

    @GetMapping(value = "/refrash")
    @ResponseBody
    public boolean refrash(){
        return covidService.getApiList();
    }

    @GetMapping(value = "view/{gubun}")
    public ModelAndView view(@PathVariable(value = "gubun") String gubun) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("item", covidService.getItem(gubun));
        mv.setViewName("covid");

        return mv;
    }
}
