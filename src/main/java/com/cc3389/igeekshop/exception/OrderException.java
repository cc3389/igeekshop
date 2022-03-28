package com.cc3389.igeekshop.exception;

import com.cc3389.igeekshop.result.ResponseEnum;

public class OrderException extends RuntimeException {

    private ResponseEnum responseEnum;

    public OrderException(ResponseEnum responseEnum) {
        super(responseEnum.getMsg());
        this.responseEnum = responseEnum;
    }

    public ResponseEnum getResponseEnum() {
        return responseEnum;
    }
}
