package com.ntels.syjeon.covid19.service;

import com.ntels.syjeon.covid19.model.ItemList;
import com.ntels.syjeon.covid19.model.Names;
import com.ntels.syjeon.covid19.model.response.body.items.item.Item;

/**
 * Covid Service
 * @author syjeon@ntels.com
 */
public interface CovidService {

    /**
     * 오늘날짜를 생성하여 DB 조회후 데이터가 존재 하지 않으면 
     * API콜하여 Insert 후 True 리턴
     * @return boolean
     */
    boolean getApiList();

    /**
     * DB에서 최신 단일 데이터 조회
     * @param gubun 시/도 이름
     * @return Item
     */
    Item getItem(String gubun);

    /**
     * 해당지역의 최근 6일간의 Data를 DB 조회하여 리턴
     * @param gubun
     * @return Item List
     */
    ItemList getHistory(String gubun);

    /**
     * 모든 시/도의 이름의 배열을 반환
     * @return
     */
    Names getNames();
}
