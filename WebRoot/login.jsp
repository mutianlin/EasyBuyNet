<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>
<body>
	<%@ include file="common/head.jsp"%>
	<div id="register" class="wrap">
			<div class="shadow">
				<em class="corner lb"></em>
				<em class="corner rt"></em>
				<div class="box">
					<h1>欢迎回到易买网</h1>
					<form id="loginForm" method="post" action="servlet" onsubmit="return checkForm(this)">
						<input type="hidden" name="type" value="login" />
						<table>
							<tr style="color: red;">
								<td>${err}</td>
							</tr>
							<tr>
								<td class="field">用户名：</td>
								<td>
									<input class="text" type="text" name="userName" onfocus="FocusItem(this)" onblur="CheckItem(this);" />
									<span></span>
								</td>
							</tr>
							<tr>
								<td class="field">登录密码：</td>
								<td>
									<input class="text" type="password" id="passWord" name="passWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" />
									<span></span>
								</td>
							</tr>
							<tr>
								<td class="field">验证码：</td>
								<td>
									<input class="text" type="text" name="veryCode" onfocus="FocusItem(this)" onblur="CheckItem(this);" />
									<!-- <img id="veryCode" src="validataCode" onclick="this.src+='?'+Math.floor(Math.random()*10);" alt="点击刷新" /> -->
									<span></span>
								</td>
							</tr>
							<tr><td></td><td><div id="v_container" style=" width: 200px;height: 30px;"></div></td></tr>
							<tr>
								<td></td>
								<td>
									<label class="ui-green">
										<input type="submit" name="submit" value="立即登录" />
									</label>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
		<script>
        
        /* document.getElementById("my_button").onclick = function(){
            var res = verifyCode.validate(document.getElementById("code_input").value);
            if(res){
                alert("验证正确");
            }else{
                alert("验证码错误");
            }
        } */
    </script>
</body>
</html>