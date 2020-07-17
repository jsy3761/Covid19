package com.ntels.syjeon.covid19.model.response.body.items;

import com.ntels.syjeon.covid19.model.response.body.items.item.Item;

import java.util.List;

public class Items {
    private List<Item> item;

    public void setItem(List<Item> item){
        this.item = item;
    }
    public List<Item> getItem(){
        return this.item;
    }

    @Override
    public String toString() {
        return "Items{" +
                "item=" + item +
                '}';
    }
}
