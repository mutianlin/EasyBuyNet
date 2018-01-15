// JavaScript Document
function Delete(deleteType,id)
{
	if(confirm("确定要删除吗？")) {
		$.ajax({
			url:"delete?deleteType="+deleteType+"&deleteDataId="+id,
			type:"post",
			success:function(number){
				if(number>0){
					alert("您要删除的存在关联数据，无法删除");
					return false;
				}else{
					alert(number);
					location.href = "delete?deleteType="+deleteType+"&deleteDataId="+id;
				}
			},
		error:function(as){
			alert(as);
		}
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		location.href = "adminServlet?type=delete&delete="+deleteType+"&id=" + id;
	}
}