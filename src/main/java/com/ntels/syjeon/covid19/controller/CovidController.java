package com.ntels.syjeon.covid19.controller;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;
import com.ntels.syjeon.covid19.service.CovidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Covid Controller
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
    @ResponseBody
    public List<Item> test(){
        return covidService.getItemList("","");

    }
}
