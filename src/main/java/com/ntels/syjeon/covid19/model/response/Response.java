package com.ntels.syjeon.covid19.model.response;

import com.ntels.syjeon.covid19.model.response.body.Body;
import com.ntels.syjeon.covid19.model.response.header.Header;

public class Response {
    private Header header;

    private Body body;

    public void setHeader(Header header){
        this.header = header;
    }
    public Header getHeader(){
        return this.header;
    }
    public void setBody(Body body){
        this.body = body;
    }
    public Body getBody(){
        return this.body;
    }
}
