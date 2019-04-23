<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="cn.com.database.ConnectionDb"%>
<%@ page import="org.field.servlet.LoginServlet"%>
<!-- 文件部分3 -->
<!Doctype html>
<html lang='en'>
<jsp:include page="./common/head.jsp" flush="true">
<jsp:param value="衣佳首页"  name="title"/></jsp:include>
 <style>


</style>


<body>
  <div class="LoginPage container-login">
    <div class="header-color">
      <div class="login-header">
        <a href="index.jsp"><img src="static/img/login/01.png">
        </a>
      </div>
    </div>
    <div class="center">
      <div class="like-table">
        <div class="phone-email">
          <em>手机号登录</em><em>邮箱登录</em>
        </div>
        <div class="table-center">
          <form method="post" action="LoginServlet">
            <div class="clearfix">
              <em class="vail"> <i class="iconfont icon-suo mr-1"></i>使用密码验证登录</em>
            </div>
            <div class="my-input">
              <!--i class="iconfont icon-shouji"></i--> 
              <input type="text" id="uname" name="uname" placeholder="请输入手机号">
            </div>
            <div class="huakuai">
              <i class="iconfont icon-huadong"></i> <em>按住滑块，拖动完成上方拼图</em>
            </div>
            
            <div class="get-code">
              <input  type="text"   name="code"  placeholder="请输入短信验证码">
              <button type="button" class="code" id="code" >获取验证码</button>
            </div>
            
            <div class="show-msg"></div>
            <button disabled type="button" class="btn-login">登录</button>
          </form>
        </div>
        <div class="phone-email">
          <div class="icons">
            <i class="iconfont icon-weixin"></i>
            <i class="iconfont icon-zhifubao"></i>
            <i class="iconfont icon-weibo"></i>
            <i class="iconfont icon-tubiao215"></i>
          </div>
        </div>
      </div>
    </div>
    <%@ include file='../common/footer.jsp'%>
  </div>
  <script src="static/javascript/common.js"></script>
  <script>
    $(function () {
      var $div = $("div.my-input");
      var $div_0 = $(".get-code");
      $(".btn-login").click(function () {
      	var uname = $("[name=uname]").val();
      	var code = $("[name=code]").val(); 
        $.ajax({
          url: "LoginServlet",
          type: "POST",
          dataType: "json",
          data:{uname:uname,code:code},
          success: function (res) {
            if(res.code == 200){
            	window.location.href="index.jsp";
            }else{
            	console.log(res);
            }
          }
        });
      });
      $("[name=code]").focus(function () {
        $div_0.css({
          "outline": "1px solid #4AAFE9"
        });
      }).blur(function () {
        $div_0.css({
          "outline": "none"
        });
        var val = $("[name=code]").val();
        var $msg = $(".show-msg");
        var code = getCookie("code");
        if (code && val) {
          if (code == val) {
            $msg.html('<i class="mr-1 iconfont icon-success"></i>验证码输入正确').css({
              "color": "#28A745"
            });
          } else {
            $msg.html('<i class="mr-1 iconfont icon-shibai"></i>验证码输入错误').css({
              color: "#DC3545"
            });
          }
        }
      });

      $("[name=uname]")
        .focus(function () {
          $div.css({
            "outline": "1px solid #4AAFE9"
          });
        })
        .blur(
          function () {
            $div.css({
              "outline": "none"
            });
            var uname = $("[name=uname]").val();
            vail(
              uname,
              /^1[345678][0-9]{9}$/,
              '<i class="mr-1 iconfont icon-success"></i>手机号码格式输入正确',
              "<i class='mr-1 iconfont icon-shibai'></i>手机格式输入错误");
          });
    });

    $("[name=uname],[name=code]").on("input", function () {
      if ($("[name=uname]").val() && $("[name=code]").val()) {
        $(".btn-login").removeAttr('disabled').css({
          opacity: 1
        });
      } else {
        $(".btn-login").attr({
          disabled: true
        }).css({
          opacity: 0.7
        });
      }
    });

    $("#code").click(function () {
      var $code = $(this);
      var time = 30;
      $('[name=code]').val("");
      $code.html(time + "秒后重发").attr("disabled", true);
      var timer = setInterval(function () {
        time--;
        $code.html(time + "秒后重发");
        if (time === 0) {
          clearInterval(timer);
          $code.html("获取验证码").attr("disabled", false);
        }
      }, 1000);
      //调用阿里云的短信接口
      getCodeALi();
    });
    //正则校验
    function vail(val, reg, real, err) {
      var $msg = $(".show-msg");
      if (reg.test(val)) {
        $msg.html(real).css({
          "color": "#28A745"
        });
      } else {
        $msg.html(err).css({
          color: "#DC3545"
        });
      }
    }
    //执行接口调用
    function getCodeALi() {
      $.ajax({
        url: "LoginServlet",
        type: "GET",
        success: function (data) {
          //存储到cookie中，5分钟有效
          setCookie("code", data, 0);
          layer.msg("您的验证码是" + data, {
            time: 30000
          });
        },
        error: function (err) {
          console.log(err);
        }
      });
    }
  </script>
</body>

</html>