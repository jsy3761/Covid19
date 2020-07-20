package com.ntels.syjeon.covid19.service;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;

import java.util.List;
/**
 * Covid Service
 * @author syjeon@ntels.com
 */
public interface CovidService {



    boolean getApiList();

    /**
     * 정의된 기간내의 데이터를 조회하여 시/도 이름에 해당하는 단일 Item을 반환
     * @param gubun 시/도 이름

     * @return Item
     */
    Item getItem(String gubun);

    String[] getNames();
}
