
        
function theLoop (start, end) {
    if(end > start){
      setTimeout(function () {  displayTime(start);    if (start++ < end)    {      theLoop(start,end);     }   }, 1000);
    }
    else{
      setTimeout(function () {  displayTime(start);    if (start-- > end)    {      theLoop(start,end);     }   }, 1000);
    }
}
       
function displayTime(myVar)
{
	var doc = document;
		if(myVar == 1){
		  doc.getElementById("btn3").className = "active";
		  doc.getElementById("btn6").className = "active";
                  
                doc.getElementById("btn1").className = "inactive";
                doc.getElementById("btn2").className = "inactive";
                doc.getElementById("btn4").className = "inactive";
                doc.getElementById("btn5").className = "inactive";
                doc.getElementById("btn7").className = "inactive";
		}
		else if(myVar ==2)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn5").className = "active";
			doc.getElementById("btn7").className = "active";
                        
                        doc.getElementById("btn2").className = "inactive";
                        doc.getElementById("btn6").className = "inactive";
		}
		else if(myVar ==3)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn6").className = "active";
			doc.getElementById("btn7").className = "active";
                        
                        doc.getElementById("btn2").className = "inactive";
                        doc.getElementById("btn5").className = "inactive";
		}
		else if(myVar ==4)
		{
			doc.getElementById("btn2").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn6").className = "active";
			
                        doc.getElementById("btn1").className = "inactive";
                        doc.getElementById("btn5").className = "inactive";
                        doc.getElementById("btn7").className = "inactive";
		}
		else if(myVar ==5)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn2").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn6").className = "active";
			doc.getElementById("btn7").className = "active";
                        
                        doc.getElementById("btn3").className = "inactive";
                        doc.getElementById("btn5").className = "inactive";
		}
		else if(myVar ==6)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn2").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn5").className = "active";
			doc.getElementById("btn6").className = "active";
			doc.getElementById("btn7").className = "active";
                        
                        doc.getElementById("btn3").className = "inactive";
			
		}
		else if(myVar ==7)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn6").className = "active";
                        
                        doc.getElementById("btn2").className = "inactive";
                        doc.getElementById("btn4").className = "inactive";
                        doc.getElementById("btn5").className = "inactive";
                        doc.getElementById("btn7").className = "inactive";
		}
		else if(myVar ==8)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn2").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn5").className = "active";
			doc.getElementById("btn6").className = "active";
			doc.getElementById("btn7").className = "active";
		}
		else if(myVar ==9)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn2").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn4").className = "active";
			doc.getElementById("btn6").className = "active";
			doc.getElementById("btn7").className = "active";
                        
                        doc.getElementById("btn5").className = "inactive";
		}
		else if(myVar ==0)
		{
			doc.getElementById("btn1").className = "active";
			doc.getElementById("btn2").className = "active";
			doc.getElementById("btn3").className = "active";
			doc.getElementById("btn5").className = "active";
			doc.getElementById("btn6").className = "active";
			doc.getElementById("btn7").className = "active";
                        
                        doc.getElementById("btn4").className = "inactive";
		}
		//else{
		//  doc.getElementById("b3").className = "normal";
		//  doc.getElementById("b6").className = "normal";
		//}
	//return;
}