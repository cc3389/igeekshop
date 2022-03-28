var addressId;
//加载地址信息
function renderAddress() {
    $.get(
        "/address/get",
        function(result) {
            console.log("get address..");
            let dataArray = result['data'];
            $("#manyAddress").text("");
            for (let i = 0;i < dataArray.length;i++) {
                let $parentDiv = $("<div class='row clearfix'></div>")
                let $childDiv1 = $("<div class='col-md-8 column'></div>");
                let $childDiv2 = $("<div class=\"col-md-4 column\"></div>");
                let $label = $("<label class=\"radio-inline\"></label>");
                let $radio = $("<input type=\"radio\" name='addressRadio'/>");
                let $spanAddress = $("<span></span>");
                let $spanName = $("<span></span>");
                let $spanmobile = $("<span></span>");
                let $buttonEdit = $("<button class=\"btn btn-info\" data-toggle=\"modal\" data-target=\"#editLocationModal\"></button>").text("修改");
                let $buttonDelete = $("<button class=\"btn btn-danger col-md-offset-1\"></button>").text("删除");
                let address = dataArray[i].province + dataArray[i].city + dataArray[i].area + dataArray[i].detail;
                let receiveName = "("+dataArray[i].name +"收)";
                $spanAddress.text(address)
                    .attr("id",dataArray[i].addressId)
                    .attr("class",'span-address');
                $spanName.text(receiveName);
                $spanmobile.text(dataArray[i].mobile);
                if (i == 0) {
                    $radio.attr('checked',"checked");
                    $("#toAddress").text(address);
                    $("#receiveName").text(receiveName);
                    addressId = dataArray[i].addressId;
                }
                $radio.appendTo($label);
                $spanAddress.appendTo($label);
                $spanName.appendTo($label);
                $spanmobile.appendTo($label);
                $label.appendTo($childDiv1);
                $buttonEdit.appendTo($childDiv2);
                $buttonDelete.appendTo($childDiv2);
                $childDiv1.appendTo($parentDiv);
                $childDiv2.appendTo($parentDiv);
                $parentDiv.appendTo($("#manyAddress"));
            }
        }
    )
}
//加载底部的订单信息

function changeCheckedAddress() {
    console.log("加载底部的订单信息");
    let address = $("input:radio:checked").next().text();
    let name = $("input:radio:checked").next().next().text();
    $("#receiveName").text(name);
    $("#toAddress").text(address);
    console.log('address',address);
    console.log('name',name);

}
//加载购物车商品信息
function renderProduct() {
    $.get(
        "/shoppingCart/get",
        function(result) {
            console.log("get cart products..");
            let products = result['data'];
            let totalToPay = 0;
            for (let i = 0; i <products.length; ++i) {
                let $tr = $("<tr></tr>");
                let $productLink = $("<a></a>").text(products[i].name)
                    .attr("href",'product/'+products[i].categoryId+'/'+products[i].productId);
                let $tdName = $("<td></td>");
                $productLink.appendTo($tdName);
                let $tdPrice = $("<td></td>").text(products[i].price);
                let $tdCount = $("<td></td>").text(products[i].count);
                let totalPrice = parseInt(products[i].count) * parseFloat(products[i].price);
                totalToPay += totalPrice;
                let $tdTotal = $("<td></td>").text(totalPrice);
                $tdName.appendTo($tr);
                $tdPrice.appendTo($tr);
                $tdCount.appendTo($tr);
                $tdTotal.appendTo($tr);
                $tr.appendTo($("#productTable tbody"));
            }
            $("#totalPay").text(totalToPay);
        }
    )
}
//初始化界面
$(function() {
    console.log("on ready..");
    renderAddress();
    renderProduct();
    $("#manyAddress").on("click",'input',function () {
        changeCheckedAddress();
    });
})
//字符串判空
function isEmpty(obj){
    if(typeof obj == "undefined" || obj == null || obj == ""){
        return true;
    }else{
        return false;
    }
}
//删除地址
$("#manyAddress").on("click","button.btn-danger",function () {
    console.log("删除地址。。");
    let addressId = $(this).parent().prev().find(".span-address").attr('id');
    $.post(
        "address/delete",
        {
            "addressId":addressId
        },
        function (result) {
            if (result['msg'] != 'success') {
                alert('删除失败');
            } else {
                console.log("删除成功");
                renderAddress();
            }
        }
    )
})
//渲染修改地址

$("#manyAddress").on("click","button.btn-info",function () {
    console.log("修改地址");
    addressId = $(this).parent().prev().find(".span-address").attr('id');
    //根据id获取地址信息，然后再渲染到模态框中
    $.post(
        "/address/getone",
        {
            'addressId':addressId
        },
        function (result) {
          if (result['msg'] =='success') {
              console.log("获取成功");
              let address = result['data'];
                $("#edit-province").val(address.province);
                $("#edit-city").val(address.city);
                $("#edit-area").val(address.area);
                $("#edit-detail").val(address.detail);
                $("#edit-name").val(address.name);
                $("#edit-mobile").val(address.mobile);
          } else {
              alert("获取地址失败,请刷新页面");
          }
        }
    )

} )
//保存修改地址
$("#edit-save").click(function () {
    let province = $("#edit-province").val();
    let city = $("#edit-city").val();
    let area = $("#edit-area").val();
    let detail = $("#edit-detail").val();
    let name = $("#edit-name").val();
    let mobile = $("#edit-mobile").val();
    console.log(province,city,area,detail,name,mobile,addressId);
    if (isEmpty(province) || isEmpty(city) || isEmpty(area) || isEmpty(detail) || isEmpty(name) || isEmpty(mobile) || isEmpty(addressId))  {
        console.log("地址不能为空");
        alert("地址不能为空");
    } else {
        $.post(
            "/address/update",
            {
                'province': province,
                'city': city,
                'area': area,
                'detail': detail,
                'name': name,
                'mobile': mobile,
                'addressId':addressId
            },
            function (result) {
                if (result['msg'] == 'success') {
                    console.log("修改成功");
                    renderAddress();
                } else {
                    alert("修改失败");
                }
            }
        )
    }
})
//添加新地址
function addNewAddress() {
    console.log("添加新地址");
    let province = $("#add-province").val();
    let city = $("#add-city").val();
    let area = $("#add-area").val();
    let detail = $("#add-detail").val();
    let name = $("#add-name").val();
    let mobile = $("#add-mobile").val();
    console.log(province,city,area,detail,name,mobile);
    if (isEmpty(province) || isEmpty(city) || isEmpty(area) || isEmpty(detail) || isEmpty(name) || isEmpty(mobile))  {
        console.log("地址不能为空");
        alert("地址不能为空");
    } else{
        $.post(
            "/address/add",
            {
                'province':province,
                'city':city,
                'area':area,
                'detail':detail,
                'name':name,
                'mobile':mobile
            },
            function (result){
                if (result['msg'] == 'success') {
                    console.log("添加成功");
                    renderAddress();
                } else {
                    alert("添加失败")
                }
            }

        )
    }
}
$("#add-save").click(function(){
    addNewAddress();
})

//确认订单 生成订单
$(".btn.btn-primary.btn-lg").click(function () {
    console.log("生成订单");

    console.log("addressId",addressId);
    $.post(
        '/order/create',
        {
            'addressId':addressId
        },
        function(result) {
            console.log(result);
            if (result.msg == 'success') {
                console.log("生成订单成功");
                window.location = "/redirect";
            } else {
                alert("提交失败");
            }
        }
    )
})