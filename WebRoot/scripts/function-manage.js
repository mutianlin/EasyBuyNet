// JavaScript Document
function Delete(deleteType,id)
{
	if(confirm("确定要删除吗？")) {
		$.ajax({
			url:"deleteServlet?"+deleteType+"&"+id,
			type:"post",	
			success:function(result){
				if(result>0){
					alert("您要删除的存在关联数据，无法删除");
					return false;
				}else{
					location.href = "deleteServlet?"+deleteType+"&"+id;
				}
			}
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		location.href = "adminServlet?type=delete&delete="+deleteType+"&id=" + id;
	}
}