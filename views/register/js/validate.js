function checkpass()
{   var flag =0;
    var flag1=0;
	var data='username='+document.getElementById('userid').value;
	
//	$.post('checkUsername',data, function(o) {
//		if(o==0)
//		{flag=1;} else { alert("Username already in use");} flag1=1;},'json');
//	
	$.ajax(
			{
				url :'checkUsername',
			    datatype : 'json',
			    data :data,
			    type : 'POST',
			    success : function(o) {
					if(o==0)
					{flag=1;} else { alert("Username already in use");} flag1=1;},
				async: false
			});
	
	var password1 = document.getElementById('password1');
	var password2 = document.getElementById('password2');
		
	if(password1.value == password2.value)
		{
		if(flag==0)
        {
			
			return false;
        }
		else
			{
			
			return true;
			}
		
		}
	else
		{
		alert("password Do not match");
        return false;
		
		}
	
	}
	





