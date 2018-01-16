// JavaScript Document
function Delete(deleteType, id) {
	if (confirm("确定要删除吗？")) {
		$
				.ajax({
					url : "delete?deleteType=" + deleteType + "&deleteDataId="
							+ id,
					type : "post",
					async : false,
					success : function(number) {
						number = parseInt(number);// 字符串转数字
						if (number > 0) {
							if (confirm("您要删除的存在条" + number + "关联数据是否一同删除")) {
								alert(123);
//								location.href = "delete?deleteType=doBClassD&deleteDataId="
//										+ id;
								location.href = "www.baidu.com";
							} else {
								return false;
							}
						} else {
							alert("删除");
							alert(number);
							location.href = "delete?deleteType=doBClassD&deleteDataId=" + id;
							//adminServlet?type=productClass
						}
					},
					error : function(as) {
						alert(as);
					}
				});

		location.href = "adminServlet?type=delete&delete=" + deleteType
				+ "&id=" + id;
	}
}