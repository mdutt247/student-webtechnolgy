var doc = document;

function runIt(){

	var start = Number(doc.getElementById('txt1').value);
	var end = Number(doc.getElementById('txt2').value);
	
	if(start > 59 || start < 0 || isNaN(start) || start == '')
		start = 0;
	if(end > 59 || end < 0 || isNaN(end) || end == '')
		end = 0;
		
	if(end > start)
		incrLoop(start, end);
	else
		decrLoop(start, end);
}

function decrLoop(start, end){
	doc.getElementById("loop").innerHTML = "decrLoop: Start= " + start + " End= " + end +"<br>";
    setTimeout(function () {  displayTime(start);    if (start-- > end)    {      decrLoop(start,end);     }   }, 1000);
}

function incrLoop(start, end) {
    doc.getElementById("loop").innerHTML = "incrLoop: Start= " + start + " End= " + end +"<br>";
    setTimeout(function () {  displayTime(start);    if (start++ < end)    {      incrLoop(start,end);     }   }, 1000);
}

function displayTime(input){
	var T=0;
	var O=0;
	var var1 = input;
	var var2 = input;
	
	if(input <= 9){
		T = 0;
		O = input;
		doc.getElementById("disp").innerHTML = "IN<=9 -- T= " + T + " O= " + O +"<br>";
	}
	else if(input <= 59){
		T = Math.floor(var1/10);
		O = Math.floor(var2%10);
		doc.getElementById("disp").innerHTML = "IN<=59 -- T= " + T + " O= " + O +"<br>";
	} 

	switch(O){
		case 0:
			ones0();
			break;
		case 1:
			ones1();
			break;
		case 2:
			ones2();
			break;
		case 3:
			ones3();
			break;
		case 4:
			ones4();
			break;
		case 5:
			ones5();
			break;
		case 6:
			ones6();
			break;
		case 7:
			ones7();
			break;
		case 8:
			ones8();
			break;
		case 9:
			ones9();
			break;
	}
 
	switch(T){
		case 0:
			tens0();
			break;
		case 1:
			tens1();
			break;
		case 2:
			tens2();
			break;
		case 3:
			tens3();
			break;
		case 4:
			tens4();
			break;
		case 5:
			tens5();
			break;
		case 6:
			tens6();
			break;
		case 7:
			tens7();
			break;
		case 8:
			tens8();
			break;
		case 9:
			tens9();
			break;
	}
}

function ones1(){
                doc.getElementById("btn3").className = "active";
				doc.getElementById("btn6").className = "active";
                  
                doc.getElementById("btn1").className = "inactive";
                doc.getElementById("btn2").className = "inactive";
                doc.getElementById("btn4").className = "inactive";
                doc.getElementById("btn5").className = "inactive";
                doc.getElementById("btn7").className = "inactive";
}
function tens1(){
                doc.getElementById("btn10").className = "active";
		doc.getElementById("btn13").className = "active";
                  
                doc.getElementById("btn8").className = "inactive";
                doc.getElementById("btn9").className = "inactive";
                doc.getElementById("btn11").className = "inactive";
                doc.getElementById("btn12").className = "inactive";
                doc.getElementById("btn14").className = "inactive";
}

function ones2(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn5").className = "active";
                doc.getElementById("btn7").className = "active";

                doc.getElementById("btn2").className = "inactive";
                doc.getElementById("btn6").className = "inactive";
}
function tens2(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn12").className = "active";
                doc.getElementById("btn14").className = "active";

                doc.getElementById("btn9").className = "inactive";
                doc.getElementById("btn13").className = "inactive";
}

function ones3(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn6").className = "active";
                doc.getElementById("btn7").className = "active";

                doc.getElementById("btn2").className = "inactive";
                doc.getElementById("btn5").className = "inactive";
}
function tens3(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn13").className = "active";
                doc.getElementById("btn14").className = "active";

                doc.getElementById("btn9").className = "inactive";
                doc.getElementById("btn12").className = "inactive";
}

function ones4(){
                doc.getElementById("btn2").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn6").className = "active";

                doc.getElementById("btn1").className = "inactive";
                doc.getElementById("btn5").className = "inactive";
                doc.getElementById("btn7").className = "inactive";
}
function tens4(){
                doc.getElementById("btn9").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn13").className = "active";

                doc.getElementById("btn8").className = "inactive";
                doc.getElementById("btn12").className = "inactive";
                doc.getElementById("btn14").className = "inactive";
}
function ones5(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn2").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn6").className = "active";
                doc.getElementById("btn7").className = "active";

                doc.getElementById("btn3").className = "inactive";
                doc.getElementById("btn5").className = "inactive";
}
function tens5(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn9").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn13").className = "active";
                doc.getElementById("btn14").className = "active";

                doc.getElementById("btn10").className = "inactive";
                doc.getElementById("btn12").className = "inactive";
}
function ones6(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn2").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn5").className = "active";
                doc.getElementById("btn6").className = "active";
                doc.getElementById("btn7").className = "active";

                doc.getElementById("btn3").className = "inactive";
}
function tens6(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn9").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn12").className = "active";
                doc.getElementById("btn13").className = "active";
                doc.getElementById("btn14").className = "active";

                doc.getElementById("btn10").className = "inactive";
}

function ones7(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn6").className = "active";

                doc.getElementById("btn2").className = "inactive";
                doc.getElementById("btn4").className = "inactive";
                doc.getElementById("btn5").className = "inactive";
                doc.getElementById("btn7").className = "inactive";
}
function tens7(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn13").className = "active";

                doc.getElementById("btn9").className = "inactive";
                doc.getElementById("btn11").className = "inactive";
                doc.getElementById("btn12").className = "inactive";
                doc.getElementById("btn14").className = "inactive";
}

function ones8(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn2").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn5").className = "active";
                doc.getElementById("btn6").className = "active";
                doc.getElementById("btn7").className = "active";
}
function tens8(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn9").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn12").className = "active";
                doc.getElementById("btn13").className = "active";
                doc.getElementById("btn14").className = "active";
}

function ones9(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn2").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn4").className = "active";
                doc.getElementById("btn6").className = "active";
                doc.getElementById("btn7").className = "active";

                doc.getElementById("btn5").className = "inactive";
}
function tens9(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn9").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn11").className = "active";
                doc.getElementById("btn13").className = "active";
                doc.getElementById("btn14").className = "active";

                doc.getElementById("btn12").className = "inactive";
}

function ones0(){
                doc.getElementById("btn1").className = "active";
                doc.getElementById("btn2").className = "active";
                doc.getElementById("btn3").className = "active";
                doc.getElementById("btn5").className = "active";
                doc.getElementById("btn6").className = "active";
                doc.getElementById("btn7").className = "active";

                doc.getElementById("btn4").className = "inactive";
}
function tens0(){
                doc.getElementById("btn8").className = "active";
                doc.getElementById("btn9").className = "active";
                doc.getElementById("btn10").className = "active";
                doc.getElementById("btn12").className = "active";
                doc.getElementById("btn13").className = "active";
                doc.getElementById("btn14").className = "active";

                doc.getElementById("btn11").className = "inactive";
}



