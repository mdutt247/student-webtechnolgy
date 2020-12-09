<html>
<style>
.button, input[type="button"], input[type="submit"]  {width: 100%; height: 100%;}

.active{
  
  background-color: red;
}
.normal{
	background-color:light gray;
}

  
</style>
<body>
	<form>
	<table>
		<tr>
			<td>First Number:</td>
			<td><input type="text" name="fnum" id="fnum"></td>
		</tr>
		<tr>
			<td>Second Number:</td>
			<td><input type="text" name="snum" id="snum"></td>
		</tr>
		<tr >
			<td colspan="2" height="40"><input type="button" name="btnstart" value="start" id="btnstart" onclick="perform();"></td>
		</tr>
	</table>
	<table>
	
		<tr>
			<td colspan="2" width="300px" height="50px"><input type="button" id="btn1"></td>
			<td colspan="2" width="300px" height="50px"><input type="button" id="btn8"></td>
		</tr>	
		<tr>
			<td width="50px" height="150px"><input type="button" id="btn2" style="width: 50px;"></td>
			<td width="50px" height="150px" align="right"><input type="button" id="btn3" style="width: 50px;"></td>
			<td width="50px" height="150px"><input type="button" id="btn9" style="width: 50px;"></td>
			<td width="50px" height="150px" align="right"><input type="button" id="btn10" style="width: 50px;"></td>
		</tr>
		<tr>
			<td colspan="2" width="300px" height="50px"><input type="button" id="btn4"></td>
			<td colspan="2" width="300px" height="50px"><input type="button" id="btn11"></td>
		</tr>
		<tr>
			<td width="50px" height="150px"><input type="button" id="btn5" style="width: 50px;"></td>
			<td width="50px" height="150px" align="right"><input type="button" id="btn6" style="width: 50px;"></td>
			<td width="50px" height="150px"><input type="button" id="btn12" style="width: 50px;"></td>
			<td width="50px" height="150px" align="right"><input type="button" id="btn13" style="width: 50px;"></td>
		</tr>
		<tr>
			<td colspan="2" width="300px" height="50px"><input type="button" id="btn7"></td>
			<td colspan="2" width="300px" height="50px"><input type="button" id="btn14"></td>
		</tr>
		
	
	</table>
	</form>
	<script>
  function fOne()
  {
	document.getElementById("btn1").className = "normal";
	document.getElementById("btn2").className = "normal";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "normal";
	document.getElementById("btn5").className = "normal";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "normal";
  }
  function fTwo()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "normal";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "active";
	document.getElementById("btn6").className = "normal";
	document.getElementById("btn7").className = "active";
  }
  function fThree()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "normal";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "normal";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "active";
  }
  function fFour()
  {
	document.getElementById("btn1").className = "normal";
	document.getElementById("btn2").className = "active";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "normal";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "normal";
  }
  function fFive()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "active";
	document.getElementById("btn3").className = "normal";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "normal";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "active";
  }
  function fSix()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "active";
	document.getElementById("btn3").className = "normal";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "active";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "active";
  }
  function fSeven()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "normal";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "normal";
	document.getElementById("btn5").className = "normal";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "normal";
  }
  function fEight()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "active";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "active";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "active";
  }
  function fNine()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "active";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "active";
	document.getElementById("btn5").className = "normal";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "active";
  }
  function fZero()
  {
	document.getElementById("btn1").className = "active";
	document.getElementById("btn2").className = "active";
	document.getElementById("btn3").className = "active";
	document.getElementById("btn4").className = "normal";
	document.getElementById("btn5").className = "active";
	document.getElementById("btn6").className = "active";
	document.getElementById("btn7").className = "active"; 
  }
  
  function sOne()
  {
	document.getElementById("btn8").className = "normal";
	document.getElementById("btn9").className = "normal";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "normal";
	document.getElementById("btn12").className = "normal";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "normal";
  }
  function sTwo()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "normal";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "active";
	document.getElementById("btn13").className = "normal";
	document.getElementById("btn14").className = "active";  
  }
  function sThree()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "normal";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "normal";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "active"; 
  }
  function sFour()
  {
	document.getElementById("btn8").className = "normal";
	document.getElementById("btn9").className = "active";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "normal";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "normal";
  }
  function sFive()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "active";
	document.getElementById("btn10").className = "normal";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "normal";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "active";
  }
  function sSix()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "active";
	document.getElementById("btn10").className = "normal";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "active";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "active";  
  }
  function sSeven()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "normal";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "normal";
	document.getElementById("btn12").className = "normal";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "normal";
  }
  function sEight()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "active";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "active";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "active";
  }
  function sNine()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "active";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "active";
	document.getElementById("btn12").className = "normal";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "active";
  }
  function sZero()
  {
	document.getElementById("btn8").className = "active";
	document.getElementById("btn9").className = "active";
	document.getElementById("btn10").className = "active";
	document.getElementById("btn11").className = "normal";
	document.getElementById("btn12").className = "active";
	document.getElementById("btn13").className = "active";
	document.getElementById("btn14").className = "active";
  }
 
function perform()
{
   alert("button was clicked");
	var start = document.getElementById('fnum').value;
	var end = document.getElementById('snum').value;
	alert("start value:" + start + "end:" + end);
	theLoop(start,end);
	function theLoop (start, end) 
	{
	    if(end > start)
	    {
	    	//alert("hhhhh");
	      setTimeout(function () {    

	      	if(start == 1)
			{
				fZero();sOne();
			}
			
			if(start == 2)
			{
				fZero();sTwo();
			}
			
			if(start == 3)
			{
				fZero();sThree();
			}
			if(start == 4)
			{
				fZero();sFour();
			}
			if(start == 5)
			{
				fZero();sFive();
			}
			if(start == 6)
			{
				fZero();sSix();
			}
			if(start == 7)
			{
				fZero();sSeven();
			}
			if(start == 8)
			{
				fZero();sEight();
			}
			if(start == 9)
			{
				fZero();sNine();
			}
			if(start == 10)
			{
				fOne();sZero();
			}
			if(start == 11)
			{
				fOne();sOne();
			}
			
			if(start == 12)
			{
				fOne();sTwo();
			}
			
			if(start == 13)
			{
				fOne();sThree();
			}
			if(start == 14)
			{
				fOne();sFour();
			}
			if(start == 15)
			{
				fOne();sFive();
			}
			if(start == 16)
			{
				fOne();sSix();
			}
			if(start == 17)
			{
				fOne();sSeven();
			}
			if(start == 18)
			{
				fOne();sEight();
			}
			if(start == 19)
			{
				fOne();sNine();
			}
			if(start == 20)
			{
				fTwo();sZero();
			}
	      	if (start++ <= end)    
	      	{   theLoop(start,end);     }  }, 3000);
	    }
	    else
	    {
	    	//alert("start reverse");
	      setTimeout(function () {      

	      	if(start == 1)
			{
				 fZero();sOne();
			}
			
			if(start == 2)
			{
				fZero();sTwo();
			}
			
			if(start == 3)
			{
				fZero();sThree();
			}
			if(start == 4)
			{
				fZero();sFour();
			}
			if(start == 5)
			{
				fZero();sFive();
			}
			if(start == 6)
			{
				fZero();sSix();
			}
			if(start == 7)
			{
				fZero();sSeven();
			}
			if(start == 8)
			{
				fZero();sEight();
			}
			if(start == 9)
			{
				fZero();sNine();
			}
			if(start == 10)
			{
				fOne();sZero();
			}
			if(start == 11)
			{
				fOne();sOne();
			}
			
			if(start == 12)
			{
				fOne();sTwo();
			}
			
			if(start == 13)
			{
				fOne();sThree();
			}
			if(start == 14)
			{
				fOne();sFour();
			}
			if(start == 15)
			{
				fOne();sFive();
			}
			if(start == 16)
			{
				fOne();sSix();
			}
			if(start == 17)
			{
				fOne();sSeven();
			}
			if(start == 18)
			{
				fOne();sEight();
			}
			if(start == 19)
			{
				fOne();sNine();
			}
			if(start == 20)
			{
				fTwo();sZero();
			}

	      	if (start-- > end)    
	      	{   
	         theLoop(start,end);     
	    	}   }, 3000);
	    }
	}
	
}
</script>
	<?php
		
	?>

</body>
</html>