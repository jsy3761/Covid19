package com.ntels.syjeon.covid19.model;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 19개 시 / 도 코로나 현황 일급 컬렉션 객체 모델
 *
 * @author syjeon@ntels.com
 */
public class ItemList {
    private List<Item> itemList;

    public ItemList(List<Item> itemList){
        this.itemList = new ArrayList<>(itemList);
    }

    public List<Item> getItemList(){
        return Collections.unmodifiableList(itemList);
    }
}
