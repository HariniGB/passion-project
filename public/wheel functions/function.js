firstTime=1;
colors = [ "yellow", "red", "white", "orange", "purple","green","brown","pink","blue"];
entries = ["Entertainment", "Geography", "Mathematics", "Sports", "Technology", "Ruby", "HTML", "jQuery", "CSS", "JavaScript"];
origentries = ["Entertainment", "Geography", "Mathematics", "Sports", "Technology", "Ruby", "HTML", "jQuery", "CSS", "JavaScript"];

if(loadedData!="")
  {
  entries=loadedData.split("\n");
  origentries=loadedData.split("\n");
  }


// //PREMIUM SAVE
// function savethefave()
// {
// saveFave(self.location+"","wheel")//function called from _login.inc.php.
// }


function init()
{
canv = document.getElementById("wheelcanvas");
// if(!canv.getContext)
// {self.location="http://www.classtools.net/education-games-php/fruit_machine"}

if(createdByPremiumUser==1 || premiumUserName!=""){removAds()}
else{showAds()}
addingNames=0
spinning=0
$("#textboxWrap").fadeOut("slow")
choiceTextSize = [];
intTextBox=100;
choiceCount=100;
numcolors = colors.length;
numoptions = entries.length;
intTextBox = 5;
choiceCount = intTextBox;
startAng = 0;
arc = Math.PI / (numoptions / 2);
spinTimeout = null;
spinArcStart = 10;
spinTime = 0;
spinTimeTotal = 0;
var canvasContext;
  // Check available screen size so wheel doesn't go outside
  maxHeight = window.screen.availHeight;
  maxWidth = window.screen.availWidth;
  wheelSize = 280;
  t=self.location+""
  if(t.indexOf("stools")==-1){return}

  if (maxWidth > 500 && maxHeight > 500 && (canv.getContext) ) {
    canvasWidth = 500;
    canv.width = canvasWidth;
    canv.height = canvasWidth;
    wheelSize = canvasWidth-2;
    context = canv.getContext('2d');
  }
  wheelRadius = wheelSize * 0.5;
  outsideRadius = wheelRadius;
  textRadius = wheelRadius * 0.9;
  insideRadius = wheelRadius *0.1;
  setChoiceFontSizes();
  drawWheel(firstTime);

  if(firstTime==1)
    {
    $("#wellDone").show();
    $("#wellDone").html("<span class='editit'><a href='javascript:spin()'>Click to Spin</a></span>")

      w=$(this).width()
          wd=$("#wellDone").width()
          h=$(this).height()
          wh=$("#wellDone").height()
          $("#wellDone").css("left",((w-wd)/2)-20+"px");
          $("#wellDone").css("top",((h-wh)/2)-80+"px");

    if($(window).width()==1024)//IPAD Landscape
      {
      $("#wheelcanvas").css("margin-left",((w-canvasWidth)/2)-20+"px");
      }
    if($(window).width()==768)//IPAD Portrait
      {
      $("#wheelcanvas").css("margin-left","70px");
      }
      }
  firstTime=0;
}

function drawWheel(isStart) {
    canvas = document.getElementById("wheelcanvas");
    if (canvas.getContext) {
      canvasContext = canvas.getContext("2d");
      canvasContext.clearRect(0,0,wheelSize,wheelSize);
      canvasContext.strokeStyle = "black";
      canvasContext.lineWidth = 2;
      canvasContext.font = 'bold 12px sans-serif';
      for(i = 0; i < numoptions; i++) {
        angle = startAng + i * arc;
        canvasContext.fillStyle = colors[i%numcolors];
        canvasContext.beginPath();
        canvasContext.arc(wheelRadius, wheelRadius, outsideRadius, angle, angle + arc, false);
        canvasContext.arc(wheelRadius, wheelRadius, insideRadius, angle + arc, angle, true);
        canvasContext.stroke();
        canvasContext.fill();
        canvasContext.save();
      canvasContext.fillStyle = "black";         if (isStart || drawText) {
      angHalfArc = angle + arc * 0.5-0.04;
            canvasContext.translate(wheelRadius + Math.cos(angHalfArc) * textRadius, wheelRadius + Math.sin(angHalfArc) * textRadius);
            canvasContext.rotate(angHalfArc + Math.PI);
            text = entries[i];
        canvasContext.font = 'bold '+choiceTextSize[i]+'px sans-serif';
        canvasContext.fillText(text, 0, 0);
        }
        canvasContext.restore();
      }
      //Arrow
      canvasContext.fillStyle = "black";
      canvasContext.beginPath();
    // Left Side
    canvasContext.moveTo(0, wheelRadius + 5);
    canvasContext.lineTo(0, wheelRadius-5);
      canvasContext.lineTo(13, wheelRadius );
      canvasContext.lineTo(0, wheelRadius + 5);
    canvasContext.fill();
    }
  }

function spin() {
  if(spinning==1){return}
  spinning=1
  $("#wellDone").hide()
    minTimeToSpin = 8; // 4
   timeRange = 2; // 3
   minAngToStartRotating = 30; // 10
   angleRange = 10; // 10
    spinAngStart = Math.random() * angleRange + minAngToStartRotating;
    spinTime = 0;
    spinTimeTotal = minTimeToSpin * 1000;
    rotateWheel();
  playSound();
  }

function setChoiceFontSizes() {
  // get the font size of each choice
   canvas = document.getElementById("wheelcanvas");
    if (canvas.getContext) {
      canvasContext = canvas.getContext("2d");
    choiceTextSize = [];
    for(i = 0; i < numoptions; i++) {
      text = entries[i];
      canvasContext.font = 'bold 18px sans-serif';
      textHWidth = canvasContext.measureText(text).width;
      if (textHWidth > textRadius-30) {
        choiceTextSize.push("12");
      } else {
        choiceTextSize.push("18");
      }
    }
  }
  }

function rotateWheel() {
    spinTime += 50;
    if(spinTime >= spinTimeTotal) {
      stopRotateWheel();
      return;
    }
    spinAng = spinAngStart-easeOut(spinTime, 0, spinAngStart, spinTimeTotal);
    startAng += (spinAng * Math.PI / 180);
    drawWheel(false);
    spinTimeout = setTimeout('rotateWheel()', 30);//30
  }

function stopRotateWheel() {
    clearTimeout(spinTimeout);

  $('#aud').animate({'bottom': '-50px'},500,'easeInOutBounce');
    setTimeout("$('#aud').animate({'bottom': '-500px'}, 1000, 'easeInOutBounce');",2500)

  spinning=0;
  playClap()
   degrees = startAng * 180 / Math.PI + 180; // left side, not top
    arcd = arc * 180 / Math.PI;
    index = Math.floor((360-degrees % 360) / arcd);
   text = entries[index];
     canvasContext.font = 'bold 30px sans-serif';
     fsize="30px"
   textHWidth = canvasContext.measureText(text).width*0.5;
   if (textHWidth > wheelRadius) {
    canvasContext.font = 'bold 12px sans-serif';
    fsize="12px"
    textHWidth = canvasContext.measureText(text).width*0.5;
   }
    $("#wellDone").css("left","-500px")
    $("#wellDone").show()
  // Display the selected TOPIC on the screen
    $("#wellDone").html(text)
    $("#wellDone").css("font-size",fsize)
    w=$(this).width()
    wd=$("#wellDone").width()
    h=$(this).height()
    wh=$("#wellDone").height()



    $("#wellDone").stop().animate(
      {
      left:((w-wd)/2)-25+"px"
      },
      {
      easing:"easeInOutBack"
      }
      );
      $("#wellDone").css("top",((h-wh)/2)-65+"px");


  }

function easeOut(t, b, c, d) {
    ts = (t/=d)*t;
    tc = ts*t;
    return b+c*(tc + -3*ts + 3*t);
  }

