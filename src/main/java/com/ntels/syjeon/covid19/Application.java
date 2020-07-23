package com.ntels.syjeon.covid19;


import com.ntels.syjeon.covid19.util.StringUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class Application extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    public static void main(String[] args){
        SpringApplication.run(Application.class, args);
        StringUtil stringUtil = new StringUtil();
        System.out.println(stringUtil.yesterDay());
    }
}

