package com.gestiondatos.http;

import com.google.gson.Gson;
import spark.ResponseTransformer;

/**
 * Created by kiriost on 15/06/15.
 */
public class JSONTransformer implements ResponseTransformer {
    private Gson gson = new Gson();

    public String render(Object obj) {
        return gson.toJson(obj);
    }
}
