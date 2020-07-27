package com.ntels.syjeon.covid19.service;

import com.google.gson.Gson;
import com.ntels.syjeon.covid19.dao.CovidMapper;
import com.ntels.syjeon.covid19.model.Covid19;
import com.ntels.syjeon.covid19.model.NameList;
import com.ntels.syjeon.covid19.model.response.body.items.item.Item;
import com.ntels.syjeon.covid19.util.StringUtil;
import com.ntels.syjeon.covid19.util.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
/**
 * CovidServiceImpl
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
    public Item getItem(String gubun) {
        Item item = covidMapper.getItem(gubun);
        return item;
    }

    @Override
    public List<Item> getHistory(String gubun) {
        return covidMapper.getHistory(gubun);
    }

    @Override
    public String[] getNames() {
        return new NameList().getNames();
    }
}
