// JavaScript Document
function Delete(deleteType, id) {
	if (confirm("确定要删除吗？")) {
		$.ajax({
			url : "delete?deleteType=" + deleteType + "&deleteDataId=" + id,
			type : "post",
			async : false,
			success : function(number) {
				number = parseInt(number);// 字符串转数字
				alert(number);//调试，弹出数据数量
				if (number > 0) {
					if (confirm("您要删除的存在" + number + "条直属子级数据，是否一同删除？")) {
						location.href = "delete?deleteType=do_"+deleteType+"&deleteDataId="
								+ id;
						window.event.returnValue = false;// location.href不跳转，这句用来实现跳转；但是这句话具体啥意思不清楚
						return false;
					} else {
						location.href = "adminServlet?type=productClass";
						window.event.returnValue = false;// location.href不跳转，这句用来实现跳转；但是这句话具体啥意思不清楚
						return false;
					}
				} else {
					location.href = "delete?deleteType=do_"+deleteType+"&deleteDataId="
							+ id;
					window.event.returnValue = false;// location.href不跳转，这句用来实现跳转；但是这句话具体啥意思不清楚
					return false;
				}
			},
		});

		location.href = "adminServlet?type=delete&delete=" + deleteType
				+ "&id=" + id;
	}
}