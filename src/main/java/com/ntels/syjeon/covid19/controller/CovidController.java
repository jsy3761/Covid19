package com.ntels.syjeon.covid19.controller;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;
import com.ntels.syjeon.covid19.service.CovidService;
import com.ntels.syjeon.covid19.service.CovidServiceImpl;
import com.ntels.syjeon.covid19.util.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Covid Controller
 *
 * @author syjeon@ntels.com
 */
@Controller
public class CovidController {

    private static final Logger logger = LoggerFactory.getLogger(CovidController.class);
    /**
     * Covid Service
     */
    @Autowired
    private CovidService covidService;


    @GetMapping(value = "/")
    public String  index() {
        return "dashboard";
    }

    @GetMapping(value = "/names.ajax")
    @ResponseBody
    public String[] getNameList(){
        return covidService.getNames();
    }

    @GetMapping(value = "/history.ajax")
    @ResponseBody
    public List<Item> getNameList(String gubun){
        return covidService.getHistory(gubun);
    }

    @GetMapping(value = "/refrash")
    @ResponseBody
    public boolean refrash(){
        logger.debug("리프레쉬 실행 !!!!");
        return covidService.getApiList();
    }

    @GetMapping(value = "/{gubun}")
    public ModelAndView view(@PathVariable(value = "gubun") String gubun) {
        ModelAndView mv = new ModelAndView("dashboard");
        mv.addObject("item", covidService.getItem(gubun));

        return mv;
    }
}
