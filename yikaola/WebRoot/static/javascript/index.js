$(function () {
    //判断用户是否在线
    $.ajax({
        url: "IsLogin",
        type: "GET",
        dataType: "json",
        success: function (res) {
            if (res.code == 200) {
                $("span.login-after").html(res.uname);
                $(".login-after").show();
                $(".login-before").hide();
                console.log("用户已经登录");
            } else {
                $("span.login-after").html("");
                $(".login-after").hide();
                $(".login-before").show();
                console.log("用户没有登录");
            }
        }
    });
    //注销功能
    $("#destory").click(function () {
        $.ajax({
            url: "ExitServlet",
            type: "GET",
            success: function (res) {
                window.location.reload();
                console.log(res);
            }
        });
    });
    /*易考拉官网：https://www.kaola.com*/
    $('.my-hide-img').click(function (e) {
        e.stopPropagation();
        $(this).parent("a").hide();
    });
});
