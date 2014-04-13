

<div class="tabbable" align="center" style="margin-top: 60px;">
		<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
			<li class="active"> <a  href="#GeneralInformation" data-toggle="tab"  > General Information </a> </li>
			
			<li> <a  href="#ContactInformation" data-toggle="tab" > Contact Information </a> </li>
			<li> <a  href="#AddressInformation" data-toggle="tab"   > Address Information </a> </li>
			
		</ul>
</div>  

<form  action="<?php echo URL;?>register/registerStudent/" id="registerInfo"  method="post" onsubmit="return checkpass();" >

<div class="tab-content">

   

        
         <div class="tab-pane active" id="GeneralInformation">
        <fieldset>
          <legend>General information</legend>
          
          
              
          <div class="control-group">
            <label class="control-label" for="userid">Your User name</label>
            <div class="controls">
              <input type="text" name="userid" class="input-xlarge" id="userid" placeholder="enter your username"  required>
           
            </div>
          </div>
		  
          
		  <div class="control-group">
            <label class="control-label" for="studentInformation">Name</label>
			<div class="controls">

           <input class="span3" type="text"  name="firstName" id="firstName" placeholder="First Name"  required>
		  <input class="span3" type="text" name="middleName" id="middleName" placeholder="Middle Name"  >
		  <input class="span3"  type="text" name="lastName" id="lastName" placeholder="last Name"  required>

             </div>
		  </div>
		  
		  
		  <div class="control-group">
            <label class="control-label" for="password1">Password</label>
            <div class="controls">
              <input type="password" name="password1" class="input-xlarge" id="password1" pattern=".{5,}"  placeholder="enter password of minimum 5 digit"   required>
              
            </div>
            
          </div>
          
		  
		   <div class="control-group">
            <label class="control-label" for="password2">Confirm Password</label>
            <div class="controls">
              <input type="password" name="password2" class="input-xlarge" id="password2" pattern=".{5,}"  placeholder="confirm password" required>
              
            </div>
          </div>
          
          <div class="control-group">
            <label class="control-label" for="email">email id</label>
            <div class="controls">
              <input type="email" class="input-xlarge" name="email" id="email" placeholder="enter email address"  required>
            </div>
          </div>
          
          </fieldset>
          
          
			
			
          
          
          </div>
          
          
          
           <div class="tab-pane" id="ContactInformation">
          
          <fieldset>
          
          <legend>Contact Information</legend>
		
		<div class="control-group">
            <label class="control-label" for="mobileNumber">Mobile Number</label>
			 <div class="controls">
              <input type="tel"   name="mobileNumber" class="input-xlarge" id="mobileNumber" placeholder="enter Mobile number">
             </div>
		   </div>
		  
		  
		  
		  <div class="control-group">
            <label class="control-label" for="phoneNumber">Phone Number</label>
			<div class="controls">
              <input type="tel"   name="phoneNumber" class="input-xlarge" id="phoneNumber" required placeholder="Enter Phone number">
             </div> 
			
          </div>
		  
		  <div class="control-group">
            <label class="control-label" for="facebookLink">Facebook link</label>
			<div class="controls">
              <input type="text" name="facebookLink" class="input-xlarge" id="facebookLink" placeholder="your Facebook account link">
             </div>
			
          </div>
          
          			
          
          </fieldset>
          
	       
		
		
	
		          
          
          </div>
          
  <div class="tab-pane" id="AddressInformation">
	<fieldset>	  
	<legend>Address Information</legend>
		 
		 <div class="control-group">
            <label class="control-label" for="addressLine1">Address line 1 </label>
			<div class="controls">
              <input type="text" name="addressLine1" class="input-xlarge" id="addressLine1" placeholder="Address line 1">
             </div>
		</div>
		
		 <div class="control-group">
            <label class="control-label" for="addressLine2">Address Line 2</label>
			<div class="controls">
              <input type="text" name="addressLine2" class="input-xlarge" id="addressLine2" placeholder="Address line 2">
             </div>
		  </div>
		  
		<div class="control-group">
        <label class="control-label" for="city">City</label>
            <div class="controls">
              <select id="city" name="city" >
                <option>city1</option>
                <option>city2</option>
                <option>city3</option>
                <option>city4</option>
                <option>city5</option>
              </select>
            </div>
          </div>
		
		<div class="control-group">
            <label class="control-label" for="state">state</label>
			<div class="controls">
              <input type="text" name="state" class="input-xlarge" id="state" placeholder="state">
             </div>
             </div>
       <div class="control-group">
            <label class="control-label" for="pinCode">Pin Code</label>
			<div class="controls">
              <input type="text" name="pinCode" pattern="[0-9]{6}"  class="input-xlarge" id="pinCode" placeholder="Pincode"  required>
             </div>
		  </div>
		  
		  <div class="control-group">
            <label class="control-label" for="landMark">Land Mark</label>
			<div class="controls">
              <input type="text" name="landMark" class="input-xlarge" id="landMark" placeholder="Landmark">
             </div>
		  </div>
		
				
		
		
		</fieldset>
		</div>
		
		
		
		<input type="submit" id="submitbutton" value="signup">
			
		<div class="btn-toolbar clearfix">
		    <div class="btn-group pull-right _tabs_navigation span3" data-toggle="buttons-radio"  >
		        <a   class="btn btn-small btn-info"  href="#">
		            <i class="icon-arrow-left icon-white"></i>
		        </a>
		        <a id="next" class="btn btn-small btn-info"  href="#">
		            <i class="icon-arrow-right icon-white"></i>
		        </a>
		    </div>
		</div>
				

		</div>
		
		</form>


<script>

$(document).ready(function() {
    var tabIndex;
    var tabs = $('a[data-toggle="tab"]');

    tabs.on('shown', function(e) {
        tabIndex = $(e.target).closest('li').index();
    }).eq(0).trigger('shown');

    $('._tabs_navigation').on('click', 'a', function() {
    	
    	 try{
    		    alert($('#registerInfo')['0'].checkValidity());
    		 }
    		    catch(err){alert('err='+err)};

    		    
        var index = tabIndex + ($(this).index() ? 1 : -1);
        if (index >= 0 && index < tabs.length) {
        	
            tabs.eq(index).tab('show');
            
            
        }
        return false;
    });

     
});







</script>

