//分页渲染商品
$(function () {
    console.log("on ready")
    renderPage(1,10);

})
function renderPage(pageNum,pageSize) {
    $.post(
        "product/getPage",
        {
            'pageNum':pageNum,
            'pageSize':pageSize
        },
        function (result) {
            console.log(result);
            if (result.code == 0) {
                renderProduct(result.data)
                renderProductPage(result.data);
            } else {
                alert("获取商品失败");
            }
        }
    )
}
/* 计算中间页
 * return 中间页数组
 */
function mathPages(index, totalpage) { //页码和一共有多少页
    var indexs = [];
    for(var i = 1; i <= totalpage; i++) {
        indexs.push(i);   //先根据总页数创建数组，将全部页标添加到数组中
    }
    if(totalpage<=6){
        return indexs;  //总页数<=6页时，直接输出即可
    }
    if(index<=2){
        indexs = indexs.slice(0,6);   //当前页<=2时，当前页的页标就不能显示在第三位了，直接截取0~6输出
        return indexs;
    }else{
        var indexs2 = indexs.slice(index-3,index+3);
        //如果当前页标>2，则从当前页标-3开始截取总页标数组，截取6个
        if(indexs2.length>=6){
            return indexs2;  //如果当前页不是倒数后3页，则截取没问题，直接输出
        }else{
            indexs2 = indexs.slice(-6);
            return indexs2;  //如果当前页是倒数后3页，就截取不到6个页标，那么直接最后截取6个页标即可
        }
    }
}
//渲染分页
function renderProductPage(data) {
    console.log("render page");
    let pageArray = mathPages(data.current,data.pages);
    let firstPageHtml = "<li><a onclick=\"changePage(1)\" href='#'>首页</a></li>";
    let lastPageHtml = "<li><a onclick=\"changePage(" + (data.pages) + ")\" href='#'>尾页</a></li>";
    let prevPageHtml = "<li><a onclick=\"changePage(" + (data.current-1) + ")\" href='#'>上一页</a></li>";
    let nextPageHtml = "<li><a onclick=\"changePage(" + (data.current+1) + ")\" href='#'>下一页</a></li>";
    let strPageHtml = "";
    strPageHtml += firstPageHtml;
    if (pageArray[0]>1) {
        strPageHtml += prevPageHtml;
    }
    for (let i = 0;i < pageArray.length;i++) {
        let temp;
        if (pageArray[i] == data.current) {
            temp = '<li class="active"><a onclick=\"changePage('+pageArray[i]+')\" href=\'#\'>' + pageArray[i] + '</a></li>';
        } else {
            temp = '<li><a onclick=\"changePage('+pageArray[i]+')\" href=\'#\'>' + pageArray[i] + '</a></li>';
        }

        strPageHtml += temp;
    }
    if (pageArray[pageArray.length-1] < data.pages) {
        strPageHtml += nextPageHtml;
    }
    strPageHtml += lastPageHtml;
    $(".pagination").html(strPageHtml);
}
var productDescs = {};
//渲染商品
function renderProduct(data) {
    console.log("render product");
    $("tbody").text("");
    for(let i in data.records) {
        let id = data.records[i].productId;
        productDescs[id] = data.records[i].description;
        let $editBtn = $("<td></td>").html("<button class=\"btn btn-info\" data-toggle=\"modal\" data-target=\"#detail\">修改</button>");
        let $delBtn = $("<td></td>").html("<button class=\"btn btn-danger\" data-toggle=\"modal\" data-target=\"#delete\">删除</button>");
        let $num = $("<td></td>").text(id);
        let $name = $("<td></td>").text(data.records[i].name);
        let $price = $("<td></td>").text(data.records[i].price);
        let $surplus = $("<td></td>").text(data.records[i].surplus);
        let $tr = $("<tr></tr>");
        $num.appendTo($tr);
        $name.appendTo($tr);
        $price.appendTo($tr);
        $surplus.appendTo($tr);
        $editBtn.appendTo($tr);
        $delBtn.appendTo($tr);
        $tr.appendTo($("tbody"));
    }
}
//修改商品信息
$("tbody").on("click",".btn.btn-info",function () {
    console.log("edit product..");
    let surplus = $(this).parent().prev().text();
    let price = $(this).parent().prev().prev().text();
    let name = $(this).parent().prev().prev().prev().text();
    let id = $(this).parent().prev().prev().prev().prev().text();
    $("#name").val(name);
    $("#price").val(price);
    $("#stock").val(surplus);
    let desc = productDescs[id];
    $("#desc").text(desc)
    $("#productId").val(id);
})
$("#price").change(function (){
    if ($(this).val() < 0.01) {
        $(this).val(0.01);
    }
})
$("#stock").change(function (){
    if ($(this).val() < 0) {
        $(this).val(0);
    }
})
//删除商品
var delProductId = 0;

$("tbody").on("click","button.btn-danger",function () {
    delProductId = $(this).parent().prev().prev().prev().prev().prev().text();
    console.log("删除",delProductId);

})
$("#confirmDel").click(function () {
    console.log("确认删除",delProductId);
    $.post(
        "/product/delete",
        {
            'productId':delProductId
        },
        function (result) {
            console.log(result);
            $("#closeDel").click();
            if (result.code == 0) {
                renderPage(1,10);
                return;
            } else {
                alert(result.msg);
            }

        }
    )
})
//搜索商品

//翻页
function changePage(index) {
console.log("changePageTo",index);
    renderPage(index,10);
}