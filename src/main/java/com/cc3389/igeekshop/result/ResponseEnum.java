package com.cc3389.igeekshop.result;

public enum ResponseEnum {
    REGISTER_ERROR(98,"注册失败"),
    REGISTER_FORM_NULL(99,"注册信息不能为空"),
    USER_NAME_NULL(100,"用户名不能为空"),
    PASSWORD_NULL(101,"密码不能为空"),
    USER_NAME_EXIST(102,"用户名已存在"),
    USER_NAME_FORMAT_ERROR(103,"用户名格式错误"),
    PASSWORD_FORMAT_ERROR(104,"密码格式错误"),
    REPASSWORD_ERROR(105,"两次密码不一致"),
    LOGIN_FORM_NULL(106,"登录信息不能为空"),
    USER_NAME_OR_PASSWORD_ERROR(107,"用户名或密码错误"),
    CATEGORY_NULL_ERROR(108,"商品列表为空"),
    PRODUCT_NOT_FOUND(109,"商品未找到"),
    SHOPPING_CART_ADD_ERROR(110,"购物车添加失败"),
    SHOPPING_CART_EXIST(111,"购物车商品已存在" ),
    INSERT_DETAIL_ERROR(112,"添加详细订单失败"),
    INSERT_ORDER_ERROR(113,"添加订单失败"),
    ADDRESS_NULL(114,"地址为空或总价不大于0"),
    REGISTER_TYPE_ERROR(115,"身份类型错误");

    private int code;
    private String msg;

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    ResponseEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
