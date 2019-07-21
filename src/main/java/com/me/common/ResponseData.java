package com.me.common;

import java.io.Serializable;


public class ResponseData implements Serializable {

    private static final long serialVersionUID = 8622400871012418599L;

    private Boolean success;
    private String message;
    private Object data;

    public ResponseData(){}

    public ResponseData(Boolean success) {
        this.success = success;
    }

    public ResponseData(Boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public ResponseData(Boolean success, String message, Object data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
