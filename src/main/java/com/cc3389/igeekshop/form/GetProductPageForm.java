package com.cc3389.igeekshop.form;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

@Data
public class GetProductPageForm {
    @NotNull(message = "页面大小不能为空")
    @Max(value = 50,message = "最多请求数量为50")
    private int pageSize;//每页大小
    @NotNull(message = "页数不能为空")
    private int pageNum;//第几页
}
