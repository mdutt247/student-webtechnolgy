var doc = document;
function theLoop (start, end) {
    if(end > start){
      setTimeout(function () {  displayTime(start);    if (start++ < end)    {      theLoop(start,end);     }   }, 2000);
    }
    else{
      setTimeout(function () {  displayTime(start);    if (start-- > end)    {      theLoop(start,end);     }   }, 2000);
    }
}

function displayTime (input){
    var T=0;
    var O=0;
        if(input < 10){
            T = 0;
            O = input;
        }
        else if(input < 60){
            T = Math.floor(input/10);
            O = Math.floor(input%10);
        } 
        if(O === 1){
             ones1();
        }
        else if(O ===2)
        {
             ones2();
        }
        else if(O ===3)
        {
             ones3();
        }
        else if(O ===4)
        {
             ones4();
        }
        else if(O ===5)
        {
             ones5();
        }
        else if(O ===6)
        {
            ones6();
        }
        else if(O ===7)
        {
             ones7();
        }
        else if(O ===8)
        {
             ones8();
        }
        else if(O ===9)
        {
             ones9();
        }
        else if(O ===0)
        {
            ones0();
        }
        
        if(T === 1){
             tens1();
        }
        else if(T ===2)
        {
             tens2();
        }
        else if(T ===3)
        {
             tens3();
        }
        else if(T ===4)
        {
             tens4();
        }
        else if(T ===5)
        {
             tens5();
        }
        else if(T ===6)
        {
            tens6();
        }
        else if(T ===7)
        {
             tens7();
        }
        else if(T ===8)
        {
             tens8();
        }
        else if(T ===9)
        {
             tens9();
        }
        else if(T ===0)
        {
            tens0();
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



