package com.ntels.syjeon.covid19.model.response.body;

import com.ntels.syjeon.covid19.model.response.body.items.Items;

public class Body {
    private Items items;

    private Integer numOfRows;

    private Integer pageNo;

    private Integer totalCount;

    public void setItems(Items items){
        this.items = items;
    }
    public Items getItems(){
        return this.items;
    }
    public void setNumOfRows(Integer numOfRows){
        this.numOfRows = numOfRows;
    }
    public Integer getNumOfRows(){
        return this.numOfRows;
    }
    public void setPageNo(Integer pageNo){
        this.pageNo = pageNo;
    }
    public Integer getPageNo(){
        return this.pageNo;
    }
    public void setTotalCount(Integer totalCount){
        this.totalCount = totalCount;
    }
    public Integer getTotalCount(){
        return this.totalCount;
    }

    @Override
    public String toString() {
        return "Body{" +
                "items=" + items +
                ", numOfRows=" + numOfRows +
                ", pageNo=" + pageNo +
                ", totalCount=" + totalCount +
                '}';
    }
}
