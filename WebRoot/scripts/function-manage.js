// JavaScript Document
function Delete(deleteType,id)
{
	if(confirm("确定要删除吗？")) {
		
		
		$.ajax({
			url:"deleteServlet?"+deleteType+"&"+id,
			type:"post",	
			success:function(data){
				
			}
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		location.href = "adminServlet?type=delete&delete="+deleteType+"&id=" + id;
	}
}