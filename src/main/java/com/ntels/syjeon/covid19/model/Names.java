package com.ntels.syjeon.covid19.model;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author syjeon@ntels.com
 */
public class Names {
    private final List<Name> names;

    public Names(List<Name> names){
        this.names = new ArrayList<>(names);
    }

    public List<Name> getNames(){
        return Collections.unmodifiableList(names);
    }

    public String toJson(){
        return new Gson().toJson(this);
    }


}
