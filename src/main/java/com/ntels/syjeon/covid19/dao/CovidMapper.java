package com.ntels.syjeon.covid19.dao;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author syjeon@ntels.com
 */
@Mapper
public interface CovidMapper {

    /**
     * Item Model 저장
     * @param item
     */
    void insert(Item item);

    /**
     * 금일 날짜를 입력 받아 금일의 List
     * @param stdDay
     * @return
     */
    List<Item> getTodayItems(String stdDay);

    /**
     * 단일 데이터 조회
     * @return
     * @param gubun
     */
    Item getItem(String gubun);

    /**
     * 시 / 도 이름을 입력하여 최근 6개의 정보를 리턴
     * @param gubun
     * @return
     */
    List<Item> getHistory(String gubun);

}
