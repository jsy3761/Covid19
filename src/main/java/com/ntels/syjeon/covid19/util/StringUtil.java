package com.ntels.syjeon.covid19.util;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * String Util
 * @author syjeon@ntels.com
 */
@Component
public class StringUtil {

    /**
     * 금일 날짜의 stdDay String 값을 생성하여 리턴
     * @return ex) "YYYY년 MM월 dd일 00시"
     */
    public String stdDay(){
        String stdday = new SimpleDateFormat("yyyy년 MM월 dd일 ").format(new Date()) + "00시";

        return stdday;
    }
}
