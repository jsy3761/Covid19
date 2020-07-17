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

import java.util.List;

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
    public List<Item> getItemList(String startDate, String endDate) {
        List<Item> items = covidMapper.getTodayItems(stringUtil.stdDay());
        logger.debug("Params startDate: {} endDate: {} DbItemsSize: {}",startDate,endDate,items.size());

        if (items.size() < 1) {
            Gson gson = new Gson();
            items = gson.fromJson(httpUtil.apiCall(), Covid19.class).getResponse().getBody().getItems().getItem();
            items.forEach(item -> covidMapper.insert(item));
        }
        return items;
    }

    @Override
    public Item getItem(String gubun, String startDate, String endDate) {
        return null;
    }

}
