//获取全部商品总价
function getTotal() {
    var total = 0;
    $(".white.four").each(function(i,e) {
        total += parseFloat($(e).text().substr(1));
    })
    return total;
}
//渲染底部商品总价并post修改购物车数量与商品存量做比较
function calculateTotal() {
    console.log("doCal...");
    var $inputs = $(".col-lg-6").children();
    $inputs.each(function(i,e) {
        if ($(e).val() <= 0) {
            $(e).val(1);
        }
    })
    changePrice();
    console.log("总价：￥"+getTotal());
    $(".box_sub_total h2").text("总价：￥"+getTotal());
}

$("input.form-control[type='number']").change(function() {
    console.log("do number.change");
    let $this = $(this);
    let num = $(this).val();
    let cartId = $(this).prev().text();
    if (num > 0) {
        $.post(
            "/shoppingCart/updateNum",
            {
                'count':num,
                "shoppingCartId":cartId
            },
            function (result) {
                console.log(result.code,result.msg);
                if (result.count != undefined) {
                    $this.val(result.count);
                }
                if (result.code != 0) {
                    $this.next().text(result.msg);
                } else if (result.code == 0){
                    $this.next().text("");
                }
            }
        )
    }
})
$(function() {
    changePrice();
    console.log("onready:总价：￥"+getTotal());
    $(".box_sub_total h2").text("总价：￥"+getTotal());
});
//计算各个商品的总价
function changePrice() {
    var total = 0;
    $(".white.two").each(function(i,e){
        let num = $(e).next().find("input").val();
        total = parseFloat($(e).text().substr(1)) * num;
        $(".white.four").eq(i).text("￥"+total);
    });
}

$(".btn_finalize").click(function() {
    console.log("结算..");
});

//删除购物车的商品
function del(productId) {
    console.log("del"+productId);
    $.post(
        "/shoppingCart/del",
        {
            productId:productId
        },
        function(result) {
            console.log("success..");
            console.log(result);
            if (result['code'] == 0) {
                $('#'+productId).remove();
                $(".box_sub_total h2").text("总价：￥"+getTotal());
            } else {
                alert("删除失败");
            }
        }
    )
}