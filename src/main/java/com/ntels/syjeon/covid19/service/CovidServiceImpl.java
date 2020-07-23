package com.ntels.syjeon.covid19.service;

import com.google.gson.Gson;
import com.ntels.syjeon.covid19.dao.CovidMapper;
import com.ntels.syjeon.covid19.model.Covid19;
import com.ntels.syjeon.covid19.model.response.body.items.item.Item;
import com.ntels.syjeon.covid19.util.StringUtil;
import com.ntels.syjeon.covid19.util.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * CovidServiceImpl
 *
 * @author syjeon@ntels.com
 */
@Service
public class CovidServiceImpl implements CovidService {

    /**
     * Logger
     */
    private static final Logger logger = LoggerFactory.getLogger(CovidServiceImpl.class);

    /**
     * Http Util
     */
    @Autowired
    private HttpUtil httpUtil;

    /**
     * String Util
     */
    @Autowired
    private StringUtil stringUtil;

    /**
     * Covid Mapper
     */
    @Autowired
    private CovidMapper covidMapper;


    @Override
    public boolean getApiList() {
        boolean result = false;
        List<Item> itemList = covidMapper.getTodayItems(stringUtil.stdDay());

        if (itemList.size() < 1) {
            try {
                Gson gson = new Gson();
                itemList = gson.fromJson(httpUtil.apiCall(), Covid19.class).getResponse().getBody().getItems().getItem();
                itemList.forEach(item -> covidMapper.insert(item));
                result = true;
                logger.debug("금일 데이터 갱신");
            } catch (Exception e) {
                logger.debug("금일 데이터가 없음");
            }
        }

        return result;
    }

    @Override
    public boolean isIncrese(String gubun) {
        boolean result = false;
        if (getApiList()){
            List<Item> todayList = covidMapper.getTodayItems(stringUtil.stdDay());
            List<Item> yesterList = covidMapper.getTodayItems(stringUtil.yesterDay());
            int today = todayList.stream().filter(l -> l.getGubun().equals(gubun)).collect(Collectors.toList()).get(0).getIncDec();
            int yesterday = yesterList.stream().filter(l -> l.getGubun().equals(gubun)).collect(Collectors.toList()).get(0).getIncDec();
            if (today > yesterday){
                result = true;
            }
        }
        return result;
    }

    @Override
    public Item getItem(String gubun) {
        List<Item> items = covidMapper.getRecentItems();
        logger.debug("사이즈: {}",items.size());

        Item item = items.stream().filter(i -> i.getGubun().equals(gubun))
                .collect(Collectors.toList()).get(0);

        logger.debug("구분: {}",item);
        return item;
    }

    @Override
    public String[] getNames() {
        return covidMapper.getNames();
    }
}
