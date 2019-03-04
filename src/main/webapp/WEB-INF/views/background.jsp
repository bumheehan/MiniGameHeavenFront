<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/resources/js/pixi.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js" ></script>
    <script src="${pageContext.request.contextPath}/resources/js/pixi-filters.js"></script>
    <style>
    *{
  margin:0;
  padding:0;
  background-image: linear-gradient(130deg,black 80%,#333333);

}

 
    </style>
</head>
<body>

</body>

<script>


const MAX_SIZE = 60;
const MIN_SIZE = 20;
const SNOW_DENSITY = 100;//단위 kg/m^3 , 눈은 물의 1/10밀도
const MAX_COUNT=100; //눈 개수
const ACC_GRAVITY=-9.81;//단위 m/s^2
const CTIME = 1//  바람변경시간
//공기저항력 = 0.5*밀도 *속도^2 *항력계수 * 면적
//공기저항 가속도(질량으로나눔) = 2 * Cd  *V^2 / (3 * R) = K *V^2/R
// K = 2/3 * Cd
// 층류에서 구의 Cd =0.1
const Cd = 0.1; // drag coefficient
const K = 2*Cd/3;
var Vel_Wind=50;
var Deg_Wind=150;
var Vel_WindX = Vel_Wind*Math.cos(Math.PI/180*Deg_Wind);
var Vel_WindY = Vel_Wind*Math.sin(Math.PI/180*Deg_Wind);

var curTime = new Date().getTime();
var preTime = 0;
var windTime = CTIME;



/////////////////////////////// blur 이미지 만들기

$(document).ready(function(){
	function Cblur(radius,blur){
		let gra = new PIXI.Graphics();

		let blurFilter = new PIXI.filters.BlurFilter({quality:10});
		gra.beginFill(0xffffff,0);
		gra.drawRect(0,0,radius*6,radius*6);
		gra.endFill();
		let cir = new PIXI.Graphics();
		blurFilter.blur =blur;
		cir.filters =  [blurFilter];
		cir.beginFill(0xffffff,0.9);
		cir.drawCircle(radius*3,radius*3,radius);
		cir.endFill();


		let renderer = PIXI.autoDetectRenderer(radius,radius,{
		resolution:2,
		antialiasing:true,
		transparent:true
		});

		let stage = new PIXI.Container();
		stage.addChild(gra);
		stage.addChild(cir);
		let aa =renderer.extract.image(stage);

		return aa;
		}

		function create(){
		    let x = Math.floor(innerWidth*(Math.random()*2-1));
		    let randR = Math.floor(Math.random()*MAX_SIZE);
		    if(randR<MIN_SIZE){
		      randR = MIN_SIZE;
		    }
		    let c =Math.floor(Math.random()*imgList.length);
		    let snow = PIXI.Sprite.from(imgList[c]);

		    snow.x=-snow.width/2;
		    snow.y=-snow.height/2;
		    snow.scale.set(randR/600,randR/600);
		    snow.position.set(x,-randR);
		    snow.vx=Math.random()*1000;
		    snow.vy =Math.random()*1000;
		    ctx.addChild(snow);
		    return snow;
		}

		function calState(snow){
		  //y좌표 밑이 -라서 
		  snow.y *=-1;
		  
		  let radius=snow.width/2;
		  let Acc_dragX = (K /radius)*(Math.pow(snow.vx,2)*Math.sign(-1*snow.vx)+Math.sign(Vel_WindX)*Math.pow(Vel_WindX,2));
		  let Acc_dragY = (K /radius)*(Math.pow(snow.vy,2)*Math.sign(-1*snow.vy)+Math.sign(Vel_WindY)*Math.pow(Vel_WindY,2));
		  let AccX =  Acc_dragX;
		  let AccY =  Acc_dragY+ACC_GRAVITY;
		  snow.x += 0.5*AccX*Math.pow(time,2)+snow.vx*time;
		  snow.y += 0.5*AccY*Math.pow(time,2)+snow.vy*time;
		  snow.vx += AccX*time;
		  snow.vy += AccY*time;
		  
		  snow.y *=-1;
		}
		function wind(){
		  Vel_WindX = Vel_Wind*Math.cos(Math.PI/180*Deg_Wind);
		  Vel_WindY = Vel_Wind*Math.sin(Math.PI/180*Deg_Wind);
		}
		function eachDraw(value,index){
		     //console.log("px : "+value.x+" py : "+value.y);
		    calState(value);
		   
		    if (value.y <-MAX_SIZE*3||value.y >(innerHeight+MAX_SIZE*3)||value.x > (innerWidth+MAX_SIZE*3) ||
		        value.x < (-MAX_SIZE*3)) {
		        //범위 밖으로나가면 초기화
		        
		    let rcase = Math.random()*4;
		    if (rcase>3){//상단
		        value.x = Math.floor((innerWidth+(MAX_SIZE*4))*(Math.random())-MAX_SIZE*2);
		        value.y = -(MAX_SIZE*2);
		    }else if(rcase>2){//왼쪽
		        value.x = -MAX_SIZE*2;
		        value.y = Math.floor((innerHeight+(MAX_SIZE*4))*(Math.random())-MAX_SIZE*2);
		    }else if(rcase>1){
		        value.x =innerWidth+MAX_SIZE*2;
		        value.y = Math.floor((innerHeight+(MAX_SIZE*4))*(Math.random())-MAX_SIZE*2);
		    }else{
		        value.x = Math.floor((innerWidth+(MAX_SIZE*4))*(Math.random())-MAX_SIZE*2);
		        value.y = innerHeight+MAX_SIZE*2;
		    }                  
		    }     
		   }

		function draw() {
		  godf.time +=0.005;
		  preTime = curTime;
		  let date = new Date();
		  curTime = date.getTime();
		  time = (curTime-preTime)/1000; // 초단위만들기
		  if(windTime<0){
		    wind();
		    windTime=CTIME;
		  }else{
		    windTime-=time;
		  }
		 
		  snowArr.forEach(eachDraw);
		}
var imgList=[Cblur(100,10),Cblur(100,20),Cblur(100,30),Cblur(100,40),Cblur(100,50),Cblur(100,60),Cblur(100,70)];

var app = new PIXI.Application(innerWidth, innerHeight, { antialias: true,
                                                      transparent:true
                                                        });
document.body.appendChild(app.view);
    
/*  //모양 하나만 가능  
var ctx =new PIXI.particles.ParticleContainer(MAX_COUNT, {
  scale: true,
  position: true,
  alpha: true,
  uvs:true
})
*/
//여러모양
var ctx = new PIXI.Container();

var snowArr = new Array(MAX_COUNT).fill().map(()=>{return create()});
app.stage.addChild(ctx);
let godf = new PIXI.filters.GodrayFilter();
app.stage.filters = [godf];

    
app.ticker.add(function(delta) {
  if (
    app.renderer.height !== innerHeight ||
    app.renderer.width !== innerWidth
  ) {
    app.renderer.resize(innerWidth, innerHeight)
  }
  draw();
});

});
    </script>
</html>
