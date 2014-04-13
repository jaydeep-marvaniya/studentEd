<body>
	
<form class="form-horizontal" action="<?php echo URL;?>register/registerPrivateInstitute/" id="registerInfo"  method="post" onsubmit="return checkpass();">
		<fieldset>
         
           <legend>New Institute Registration </legend>
        
         <div class="control-group">
            <label class="control-label" for="userid">Your User name</label>
            <div class="controls">
              <input type="text" name="userid" class="input-xlarge" id="userid" placeholder="enter your username"  required>
           
            </div>
          </div>
    	 <div class="control-group">
            <label class="control-label" for="password1">Password</label>
            <div class="controls">
              <input type="password" name="password1" class="input-xlarge" pattern=".{5,}"  id="password1" placeholder="enter password of minimum 5 digit"  required>
              
            </div>
          </div>
          
		   <div class="control-group">
            <label class="control-label" for="password2">Confirm Password</label>
            <div class="controls">
              <input type="password" name="password2" class="input-xlarge" pattern=".{5,}"  id="password2" placeholder="confirm password"  required> 
            </div>
          </div>
          
          
          <div class="control-group">
            <label class="control-label" for="email">email id</label>
            <div class="controls">
              <input type="email" class="input-xlarge" name="email" id="email" placeholder="enter email address"  required>
            </div>
          </div>
		  
		  <div class="control-group">
            <label class="control-label" for="mobileNumber">Mobile Number</label>
			 <div class="controls">
              <input type="tel" pattern="[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}" name="mobileNumber" class="input-xlarge" id="mobileNumber" placeholder="enter Mobile number">
             </div>
		   </div>
		  
		  
		  
		  <div class="control-group">
            <label class="control-label" for="phoneNumber">Phone Number</label>
			<div class="controls">
              <input type="tel"  name="phoneNumber" class="input-xlarge" id="phoneNumber" placeholder="Enter Phone number">
             </div>
			
          </div>
		  
		  <div class="control-group">
            <label class="control-label" for="facebookLink">Facebook link</label>
			<div class="controls">
              <input type="text" name="facebookLink" class="input-xlarge" id="facebookLink" placeholder="your Facebook account link">
             </div>
			
          </div>
		  
 
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
              <input type="text" pattern="[0-9]{6}" name="pinCode" class="input-xlarge" id="pinCode" placeholder="Pincode"  required>
             </div>
		  </div>
		  
		  <div class="control-group">
            <label class="control-label" for="land Mark">Land Mark</label>
			<div class="controls">
              <input type="text" name="landMark" class="input-xlarge" id="landMark" placeholder="Landmark">
             </div>
		  </div>
          
          
                   
          
		
		  
		  
		</fieldset>
		<input type="submit" value="Sign up"></input>
		</form>


</body>
