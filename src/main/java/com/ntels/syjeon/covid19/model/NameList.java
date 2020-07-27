package com.ntels.syjeon.covid19.model;

/**
 * @author syjeon@ntels.com
 */
public class NameList {
    private String[] names;
    public NameList(){
        names = new String[]{"합계","서울","부산","대구","인천","광주","대전", "울산","세종",
                "경기","강원","충북","충남","전북","전남","경북","경남","제주","검역"};
    }
    public String[] getNames() {
        return names;
    }
}
