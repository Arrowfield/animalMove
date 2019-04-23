$(function() {
    //功能：单击对应的LI切换不同的面板panel
    $('.my_right').on('click', 'li:not(:nth-child(1))', function () {
        let $li = $(this);
        var _index = $li.index() - 1;
        var $div = $li.parent().parent().prev();
        $div.children().eq(_index).css({
            zIndex: "10"
        }).siblings().css({
            zIndex: "0"
        });
    });
    //功能：完成新的开始功能
    $('[class=my_click_1]').click(function () {
        //console.log('新的开始');
    });
    $('.my_visitor').click(function () {
        //console.log('触发游客事件');
        let uname = getString();
        setCookie("uname", uname, 2);
        showProgress();
        setTimeout(function(){
            $('[class=my_showProgress]').css({
                display:"none",
                zIndex:0
            });
            showAlert();
        },3000);
        setTimeout(playMusic,5000);
        showDiv();
    });
    function getString() {
        let data = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                    "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d",
                    "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
                    "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                    "y", "z"];
        let str = "";
        for (let i = 0; i < 20; i++) {
            let index = Math.ceil(Math.random() * 61);
            str += data[index];
        }
        return str;
    }
    //单击按钮触发多个事件
    //设置cookie
    function setCookie(cname, cvalue, expire) {
        var d = new Date();
        var expireday = d.setTime(d.getDate() + expire);
        var expires = "expires=" + expireday.toLocaleString();
        document.cookie = cname + "=" + cvalue + ";" + expires;
    }
    //获取cookie
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(";");//去掉过期日期的部分 返回数组
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i].trim();//去掉字符串所有的空格
            if (c.indexOf(name) === 0) {
                return c.substring(name.length, c.length);//起始 -- 终点 获取值
            }
        }
        return "";
    }
    //定以函数展示用户登录成功
    function showDiv() {
        var uname = getCookie("uname");
        //console.log(uname);
       let $div = $('[class=my_showDiv]').css({
            display:"block",
            zIndex:10
        })
    }
    //实现5秒后自动关闭画面 关闭后显示用户的名字 跳到喜洋洋的画面
    function showProgress() {
        let $div = $('[class=my_showProgress]').css({
            display: "block",
            zIndex:10
        })
    }
    //自动播放音乐
    function playMusic(){
        var audio = document.getElementById("my_music");
        if(audio !== null){
            if(audio.paused){
                audio.play();
                audio.loop;
            }
        }
        //$('my_music')
    }
    //音乐的播放与暂停
    $("[class=my_img1]").click(function(){
        var $img = $(this);
        var audio = document.getElementById("my_music");
        if(audio !== null){
            if(!audio.paused){
                var md = $img.data('md');//非data属性 attr（可以获取自定义扩展属性） prop（不能获取自定义扩展属性）
                $img.attr({src:md});
                audio.pause();
            }else{
                var sm = $img.data('sm');
                $img.attr({src:sm});
                audio.play();
            }
        }
    });
    //制作顶部信息提示框 显示欢迎用户登录小游戏
    function showAlert(){
        var uname = getCookie("uname");
        //console.log(uname);
        var $alert = $(".my_showDiv div.alert");
        //console.log($alert);
        if(uname){
            $alert.slideDown("slow",function(){
                setTimeout(function(){
                    $alert.slideUp('slow')
                },9000)
            });//显示的div设置为display:none;
            $alert.html(`欢迎游客${uname}来到拼图小游戏`);
        }
    }
    //用户单击开始游戏弹出界面
    $('.my_btn>button').click(function(){
        $('.my_handle').css({
            zIndex:100,
            display:"block"
        })
    });
    //出现迷宫画面
    $('[class=my_maze]').click(function(){
        console.log('欢迎进入迷你小迷宫');
        $('[class=my_showMaze]').css({
            zIndex:100,
            display:"block"
        });
        showUser();
        //showCanvas();//展示画布
    });
    function showUser(){
        //将所有用户的相关信息存储到user对象中
        let uname = getCookie("uname");
        $(".my_showMaze div:nth-child(1) span b").html(uname);
    }
    //直接通过ajax引入功能文件canvas.html canvas.css canvas.js 用来代替<div class="my_canvas"></div>
    /*function showCanvas() {
        $('<link rel="stylesheet" href="css/canvas.css"/>').appendTo('head');
        $('<script src="js/canvas.js"></script>').appendTo('body');
        $.ajax({
            url:'/canvas.html',
            type:"get",
            success:function(res){
                //console.log(res);
                $(res).replaceAll('[class=my_canvas]');
            },
            error:function(err){
                throw err;
            }
        })
    }*/
});
//游戏：迷宫(MAZE)类 等级：简单 困难 超难 地图：可选
//排名：用户名 通关时间 所选等级 （可以是游客 可以是账号）
//存档：用户名 通关关卡 所选地图 （只能登录账号）
//函数定义 函数调用
//问题：通过ajax引入的HTML 与 JS 与 CSS 进行运用
