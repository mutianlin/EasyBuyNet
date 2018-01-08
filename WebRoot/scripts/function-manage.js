// JavaScript Document
function Delete(deleteType,id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "adminServlet?type=delete&delete="+deleteType+"&id=" + id;
	}
}