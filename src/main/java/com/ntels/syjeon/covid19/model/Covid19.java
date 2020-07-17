package com.ntels.syjeon.covid19.model;

import com.ntels.syjeon.covid19.model.response.Response;
/**
 * @author syjeon@ntels.com
 */
public class Covid19 {
    private Response response;

    public void setResponse(Response response){
        this.response = response;
    }
    public Response getResponse(){
        return this.response;
    }

    @Override
    public String toString() {
        return "Covid19{" +
                "response=" + response +
                '}';
    }
}
