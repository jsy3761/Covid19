package com.ntels.syjeon.covid19.model.response.body.items.item;

public class Item {
    private String createDt;

    private Integer deathCnt;

    private Integer defCnt;

    private String gubun;

    private String gubunCn;

    private String gubunEn;

    private Integer incDec;

    private Integer isolClearCnt;

    private Integer isolIngCnt;

    private Integer localOccCnt;

    private Integer overFlowCnt;

    private String qurRate;

    private Integer seq;

    private String stdDay;

    private String updateDt;

    public void setCreateDt(String createDt){
        this.createDt = createDt;
    }
    public String getCreateDt(){
        return this.createDt;
    }
    public void setDeathCnt(Integer deathCnt){
        this.deathCnt = deathCnt;
    }
    public Integer getDeathCnt(){
        return this.deathCnt;
    }
    public void setDefCnt(Integer defCnt){
        this.defCnt = defCnt;
    }
    public Integer getDefCnt(){
        return this.defCnt;
    }
    public void setGubun(String gubun){
        this.gubun = gubun;
    }
    public String getGubun(){
        return this.gubun;
    }
    public void setGubunCn(String gubunCn){
        this.gubunCn = gubunCn;
    }
    public String getGubunCn(){
        return this.gubunCn;
    }
    public void setGubunEn(String gubunEn){
        this.gubunEn = gubunEn;
    }
    public String getGubunEn(){
        return this.gubunEn;
    }
    public void setIncDec(Integer incDec){
        this.incDec = incDec;
    }
    public Integer getIncDec(){
        return this.incDec;
    }
    public void setIsolClearCnt(Integer isolClearCnt){
        this.isolClearCnt = isolClearCnt;
    }
    public Integer getIsolClearCnt(){
        return this.isolClearCnt;
    }
    public void setIsolIngCnt(Integer isolIngCnt){
        this.isolIngCnt = isolIngCnt;
    }
    public Integer getIsolIngCnt(){
        return this.isolIngCnt;
    }
    public void setLocalOccCnt(Integer localOccCnt){
        this.localOccCnt = localOccCnt;
    }
    public Integer getLocalOccCnt(){
        return this.localOccCnt;
    }
    public void setOverFlowCnt(Integer overFlowCnt){
        this.overFlowCnt = overFlowCnt;
    }
    public Integer getOverFlowCnt(){
        return this.overFlowCnt;
    }
    public void setQurRate(String qurRate){
        this.qurRate = qurRate;
    }
    public String getQurRate(){
        return this.qurRate;
    }
    public void setSeq(Integer seq){
        this.seq = seq;
    }
    public Integer getSeq(){
        return this.seq;
    }
    public void setStdDay(String stdDay){
        this.stdDay = stdDay;
    }
    public String getStdDay(){
        return this.stdDay;
    }
    public void setUpdateDt(String updateDt){
        this.updateDt = updateDt;
    }
    public String getUpdateDt(){
        return this.updateDt;
    }

    @Override
    public String toString() {
        return "Item{" +
                "createDt='" + createDt + '\'' +
                ", deathCnt=" + deathCnt +
                ", defCnt=" + defCnt +
                ", gubun='" + gubun + '\'' +
                ", gubunCn='" + gubunCn + '\'' +
                ", gubunEn='" + gubunEn + '\'' +
                ", incDec=" + incDec +
                ", isolClearCnt=" + isolClearCnt +
                ", isolIngCnt=" + isolIngCnt +
                ", localOccCnt=" + localOccCnt +
                ", overFlowCnt=" + overFlowCnt +
                ", qurRate='" + qurRate + '\'' +
                ", seq=" + seq +
                ", stdDay='" + stdDay + '\'' +
                ", updateDt='" + updateDt + '\'' +
                '}';
    }
}
