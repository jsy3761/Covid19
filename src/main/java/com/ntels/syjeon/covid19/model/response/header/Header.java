package com.ntels.syjeon.covid19.model.response.header;

public class Header {
    private String resultCode;

    private String resultMsg;

    public void setResultCode(String resultCode){
        this.resultCode = resultCode;
    }
    public String getResultCode(){
        return this.resultCode;
    }
    public void setResultMsg(String resultMsg){
        this.resultMsg = resultMsg;
    }
    public String getResultMsg(){
        return this.resultMsg;
    }

    @Override
    public String toString() {
        return "Header{" +
                "resultCode='" + resultCode + '\'' +
                ", resultMsg='" + resultMsg + '\'' +
                '}';
    }
}
