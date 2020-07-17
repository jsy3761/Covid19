package com.ntels.syjeon.covid19.service;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;

import java.util.List;

/**
 * Covid Service
 * @author syjeon@ntels.com
 */
public interface CovidService {

    /**
     * 기간내의 데이터를 조회하여 Item모델의 List를 반환
     * DB 선조회 후 데이터가 존재하지 않으면 API 콜
     * @param startDate 데이터 생성일 시작범위
     * @param endDate   데이터 생성일 종료범위
     * @return Item List
     */
    List<Item> getItemList(String startDate, String endDate);

    /**
     * 정의된 기간내의 데이터를 조회하여 시/도 이름에 해당하는 단일 Item을 반환
     * @param gubun 시/도 이름
     * @param startDate 데이터 생성일 시작범위
     * @param endDate   데이터 생성일 종료범위
     * @return Item
     */
    Item getItem(String gubun,String startDate, String endDate);
}
