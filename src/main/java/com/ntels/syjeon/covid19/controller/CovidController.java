package com.ntels.syjeon.covid19.controller;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;
import com.ntels.syjeon.covid19.service.CovidService;
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
 * @author syjeon@ntels.com
 */
@Controller
public class CovidController {

    /**
     * Logger
     */
    private static final Logger logger = LoggerFactory.getLogger(CovidController.class);

    /**
     * Covid Service
     */
    @Autowired
    private CovidService covidService;

    /**
     * 초기 view Load
     * @return
     */
    @GetMapping(value = "/")
    public String index() {
        return "covid";
    }

    /**
     * Ajax
     * 시 / 도 리스트 반환
     * @return
     */
    @ResponseBody
    @GetMapping(value = "/names.ajax")
    public String getNameList(){
        return covidService.getNames().toJson();
    }

    /**
     * Ajax
     * 시 / 도 History 반환
     * @param gubun
     * @return List<Item>
     */
    @ResponseBody
    @GetMapping(value = "/history.ajax")
    public List<Item> getNameList(String gubun){
        return covidService.getHistory(gubun).getItemList();
    }

    /**
     * Ajax
     * Data Refresh 처리
     * @return boolean
     */
    @ResponseBody
    @GetMapping(value = "/refresh.ajax")
    public boolean refresh(){
        return covidService.getApiList();
    }

    /**
     * 시 / 도 상세 현황 조회
     * @param gubun
     * @return View and Item
     */
    @GetMapping(value = "/{gubun}")
    public ModelAndView view(@PathVariable(value = "gubun") String gubun) {
        ModelAndView mv = new ModelAndView("covid");
        mv.addObject("item", covidService.getItem(gubun));

        return mv;
    }
}
