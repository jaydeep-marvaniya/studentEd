<h1>Sign up</h1>
<div id="registerType">
<p>
Please choose your account type
</p>
<form id="registerType"  name="registerType" action="<?php echo URL;?>register/selectType/" method="post">
    <label>Type</label>
    <select name="type">
            <option value="student"  >Student</option>
            <option value="teacher"  >Teacher</option>
            <option value="privateInstitute"  >Private Institute</option>
        </select><br />
    <input type="submit"></input> 
</form>
</div>

</div>