package com.ntels.syjeon.covid19.model;

import com.ntels.syjeon.covid19.model.response.Response;

public class Covid19 {
    private Response response;

    public void setResponse(Response response){
        this.response = response;
    }
    public Response getResponse(){
        return this.response;
    }
}
