$("button:submit").click(function () {
    console.log("商家注册")
    let shopName = $("#shopname").val();
    let password = $("#password").val();
    let confirmPasword = $("#confirmPassword").val();
    if (password != confirmPasword) {
        $("#confirmPassError").val("两次密码不一致");
        return;
    }
    if (isEmpty(shopName) || isEmpty(password) || isEmpty(confirmPasword)) {
        console.log("字符串空")
        return;
    }
    console.log("正常提交")
    $.post(
        "user/shopRegister",
        {
            'userName':shopName,
            'password':password,
            'rePassword':confirmPasword,
            'type':'shop'
        },
        function (result) {
            console.log(result);
            if (result.code == 0) {
                window.location = "/manage";
            }
        }
    )
})

function isEmpty(obj){
    if(typeof obj == "undefined" || obj == null || obj == ""){
        return true;
    }else{
        return false;
    }
}