function alpha_s_d(inputtxt)  
{   
var letters = /^[a-zA-Z\.\s]+$/;  
if (inputtxt.value.match(letters))  
return true;  
else
return false;
}

function numvaliadtion(inputtxt)
{
var numbers = /^[\d]+$/;   // /^[0-9]+$/;
if (inputtxt.value.match(numbers))  
return true;  
else
return false;
}
/*
 function numvaliadtion(tempvar)
 {
 var i,j=0;  
 var temp=tempvar;
   for(i=0; i<temp.length; i++)
      {
    	if( (temp.substring(i,i+1) != '0') &&
			(temp.substring(i,i+1) != '1') &&
			(temp.substring(i,i+1) != '2') &&
			(temp.substring(i,i+1) != '3') &&
			(temp.substring(i,i+1) != '4') &&
			(temp.substring(i,i+1) != '5') &&
			(temp.substring(i,i+1) != '6') &&
			(temp.substring(i,i+1) != '7') &&
			(temp.substring(i,i+1) != '8') &&
			(temp.substring(i,i+1) != '9') &&
			(temp.substring(i,i+1) != ' ') )
        
			{	      
				j++; 
			}
      }
   return j;
 }
*/
function checkform(f1) 
{
// name blank validation
if(f1.txtName.value=='')
{
		alert ('Name can not be blank.');
		document.f1.txtName.focus();
		return false;
}
// name alphabet, space n dot only validation
if(f1.txtName.value!='')
{
var r;
r=alpha_s_d(f1.txtName);
if(r==false)
{
alert('Enter alphabet only [space and dot allowed].'); 
document.f1.txtName.focus();
return false;
}
}
//number BLANK VALIDATION
	if(f1.txtNo.value=='')
	{
		alert ('Phone number can not be blank');
		document.f1.txtNo.focus();
		return false;
	}
//number validation
/*if(f1.txtNo.value!='')
{
		var i,j=0;
		var temp=f1.txtNo.value;
 		var j=0;
 		j=numvaliadtion(temp);
 		if(j>0)
 		{
		alert('Enter correct Phone Number'); 
		document.f1.txtNo.focus();
		return false;
		}
}
*/
if(f1.txtNo.value!='')
{
var r;
r=numvaliadtion(f1.txtNo);
if(r==false)
{
alert('Enter correct phone.'); 
document.f1.txtNo.focus();
return false;
}
}
return true;
}