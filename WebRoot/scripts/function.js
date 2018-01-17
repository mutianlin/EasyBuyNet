// JavaScript Document
window.onload = function() {
	showChater();
	scrollChater();
}
window.onscroll = scrollChater;
window.onresize = scrollChater;

function FocusItem(obj) {
	obj.parentNode.parentNode.className = "current";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	msgBox.innerHTML = "";
	msgBox.className = "";
}

function CheckItem(obj) {
	obj.parentNode.parentNode.className = "";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	switch (obj.name) {
	case "userName":
		if (obj.value == "") {
			msgBox.innerHTML = "用户名不能为空";
			msgBox.className = "error";
			return false;
		}
		break;
	case "passWord":
		if (obj.value == "") {
			msgBox.innerHTML = "密码不能为空";
			msgBox.className = "error";
			return false;
		}
		break;
	case "rePassWord":
		if (obj.value == "") {
			msgBox.innerHTML = "确认密码不能为空";
			msgBox.className = "error";
			return false;
		} else if (obj.value != document.getElementById("passWord").value) {
			msgBox.innerHTML = "两次输入的密码不相同";
			msgBox.className = "error";
			return false;
		}
		break;
	 case "veryCode":
	 if(obj.value == "") {
	 msgBox.innerHTML = "验证码不能为空";
	 msgBox.className = "error";
	 return false;
	 }else if(!verifyCode.validate(obj.value)){
	 // }else if(obj.value == code){
		msgBox.innerHTML = "验证码不正确";
		msgBox.className = "error";
		return false;
	 }
	 break;
	}
	return true;
}

function checkForm(frm) {
	var els = frm.getElementsByTagName("input");
	for ( var i = 0; i < els.length; i++) {
		// if(typeof(els[i].getAttribute("onblur")) == "function") {
		if (!CheckItem(els[i]))
			return false;
		// }
	}
	return true;
}

function showChater() {
	var _chater = document.createElement("div");
	_chater.setAttribute("id", "chater");
	var _dl = document.createElement("dl");
	var _dt = document.createElement("dt");
	var _dd = document.createElement("dd");
	var _a = document.createElement("a");
	_a.setAttribute("href", "#");
	_a.onclick = openRoom;
	_a.appendChild(document.createTextNode("在线聊天"));
	_dd.appendChild(_a);
	_dl.appendChild(_dt);
	_dl.appendChild(_dd);
	_chater.appendChild(_dl);
	document.body.appendChild(_chater);
}

function openRoom() {
	window.open("chat-room.jsp", "chater",
			"status=0,scrollbars=0,menubar=0,location=0,width=600,height=400");
}

function scrollChater() {
	var chater = document.getElementById("chater");
	var scrollTop = document.documentElement.scrollTop;
	var scrollLeft = document.documentElement.scrollLeft;
	chater.style.left = scrollLeft + document.documentElement.clientWidth - 92
			+ "px";
	chater.style.top = scrollTop + document.documentElement.clientHeight - 25
			+ "px";
}

function inArray(array, str) {
	for (a in array) {
		if (array[a] == str)
			return true;
	}
	return false;
}

function setCookie(name, value) {
	var Days = 30;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = name + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}

function getCookie(name) {
	var arr = document.cookie
			.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
	if (arr != null)
		return unescape(arr[2]);
	return null;
}

function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function goBuy(id, price) {
	var newCookie = "";
	var oldCookie = getCookie("product");
	if (oldCookie) {
		if (inArray(oldCookie.split(","), id)) {
			newCookie = oldCookie;
		} else {
			newCookie = id + "," + oldCookie;
		}
	} else {
		newCookie = id;
	}
	setCookie("product", newCookie);
// location.href = "goodsServlet?type=goods&name=?????????";
}

function delShopping(id) {
	var tr = document.getElementById("product_id_" + id);
	var oldCookie = getCookie("product");
	if (oldCookie) {
		var oldCookieArr = oldCookie.split(",");
		var newCookieArr = new Array();
		for (c in oldCookieArr) {
			var cookie = parseInt(oldCookieArr[c]);
			if (cookie != id)
				newCookieArr.push(cookie);
		}
		var newCookie = newCookieArr.join(",");
		setCookie("product", newCookie);
	}
	if (tr)
		tr.parentNode.removeChild(tr);
}

function reloadPrice(id, status) {
	var price = document.getElementById("price_id_" + id).getElementsByTagName(
			"input")[0].value;
	var priceBox = document.getElementById("price_id_" + id)
			.getElementsByTagName("span")[0];
	var number = document.getElementById("number_id_" + id);
	if (status) {
		number.value++;
	} else {
		if (number.value == 1) {
			return false;
		} else {
			number.value--;
		}
	}
	priceBox.innerHTML = "￥" + price * number.value;
}

// 网上摘抄的js验证码
$(function() {
	verifyCode = new GVerify("v_container");
})

!(function(window, document) {
	var size = 6; // 设置验证码长度
	function GVerify(options) { // 创建一个图形验证码对象，接收options对象为参数
		this.options = { // 默认options参数值
			id: "", // 容器Id
			canvasId: "verifyCanvas", // canvas的ID
			width: "100", // 默认canvas宽度
			height: "30", // 默认canvas高度
			type: "blend", // 图形验证码默认类型blend:数字字母混合类型、number:纯数字、letter:纯字母
			code: "",
		}
		if(Object.prototype.toString.call(options) == "[object Object]") { // 判断传入参数类型
			for(var i in options) { // 根据传入的参数，修改默认参数值
				this.options[i] = options[i];
			}
		} else {
			this.options.id = options;
		}

		this.options.numArr = "0,1,2,3,4,5,6,7,8,9".split(",");
		this.options.letterArr = getAllLetter();

		this._init();
		this.refresh();
	}

	GVerify.prototype = {
			/** 版本号* */
			version: '1.0.0',

			/** 初始化方法* */
			_init: function() {
				var con = document.getElementById(this.options.id);
				var canvas = document.createElement("canvas");
				this.options.width = con.offsetWidth > 0 ? con.offsetWidth : "100";
				this.options.height = con.offsetHeight > 0 ? con.offsetHeight : "30";
				canvas.id = this.options.canvasId;
				canvas.width = this.options.width;
				canvas.height = this.options.height;
				canvas.style.cursor = "pointer";
				canvas.innerHTML = "您的浏览器版本不支持canvas";
				con.appendChild(canvas);
				var parent = this;
				canvas.onclick = function() {
					parent.refresh();
				}
			},

			/** 生成验证码* */
			refresh: function() {
				this.options.code = "";
				var canvas = document.getElementById(this.options.canvasId);
				if(canvas.getContext) {
					var ctx = canvas.getContext('2d');
				} else {
					return;
				}

				ctx.textBaseline = "middle";

				ctx.fillStyle = randomColor(180, 240);
				ctx.fillRect(0, 0, this.options.width, this.options.height);

				if(this.options.type == "blend") { // 判断验证码类型
					var txtArr = this.options.numArr.concat(this.options.letterArr);
				} else if(this.options.type == "number") {
					var txtArr = this.options.numArr;
				} else {
					var txtArr = this.options.letterArr;
				}

				for(var i = 1; i <= size; i++) {
					var txt = txtArr[randomNum(0, txtArr.length)];
					this.options.code += txt;
					ctx.font = randomNum(this.options.height, this.options.height) + 'px SimHei'; // 随机生成字体大小
					ctx.fillStyle = randomColor(50, 160); // 随机生成字体颜色
					ctx.shadowOffsetX = randomNum(-3, 3);
					ctx.shadowOffsetY = randomNum(-3, 3);
					ctx.shadowBlur = randomNum(-3, 3);
					ctx.shadowColor = "rgba(0, 0, 0, 0.3)";
					var x = this.options.width / (size + 1) * i;
					var y = this.options.height / 2;
					var deg = randomNum(-30, 30);
					/** 设置旋转角度和坐标原点* */
					ctx.translate(x, y);
					ctx.rotate(deg * Math.PI / 180);
					ctx.fillText(txt, 0, 0);
					/** 恢复旋转角度和坐标原点* */
					ctx.rotate(-deg * Math.PI / 180);
					ctx.translate(-x, -y);
				}
				/** 绘制干扰线* */
				for(var i = 0; i < 4; i++) {
					ctx.strokeStyle = randomColor(40, 180);
					ctx.beginPath();
					ctx.moveTo(randomNum(0, this.options.width), randomNum(0,
						this.options.height));
					ctx.lineTo(randomNum(0, this.options.width), randomNum(0,
						this.options.height));
					ctx.stroke();
				}
				/** 绘制干扰点* */
				for(var i = 0; i < this.options.width / 4; i++) {
					ctx.fillStyle = randomColor(0, 255);
					ctx.beginPath();
					ctx.arc(randomNum(0, this.options.width), randomNum(0, this.options.height), 1, 0, 2 * Math.PI);
					ctx.fill();
				}
			},

			/** 验证验证码* */
			validate: function(code) {
				var code = code.toLowerCase();
				var v_code = this.options.code.toLowerCase();
				if(code == v_code) {
					return true;
				} else {
					this.refresh();
					return false;
				}
			}
		}
		/** 生成字母数组* */
	function getAllLetter() {
		var letterStr = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
		return letterStr.split(",");
	}
	/** 生成一个随机数* */
	function randomNum(min, max) {
		return Math.floor(Math.random() * (max - min) + min);
	}
	/** 生成一个随机色* */
	function randomColor(min, max) {
		var r = randomNum(min, max);
		var g = randomNum(min, max);
		var b = randomNum(min, max);
		return "rgb(" + r + "," + g + "," + b + ")";
	}
	window.GVerify = GVerify;
})(window, document);