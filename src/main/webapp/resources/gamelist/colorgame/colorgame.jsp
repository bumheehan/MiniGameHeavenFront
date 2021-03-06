 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/card.css">

    <!-- 모바일웹앱 필수-->
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <script src="js/pixi.js"></script>
    <script src="js/pixi-filter.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
</head>

<body>




<div class="rank">
<div class="rankoption">
    <div class="opcolor1">
        <div id="selc1" class="redop"></div>
        <ul id="color1">
            <li class="redop"></li>
            <li class="yellowop"></li>
            <li class="greenop"></li>
            <li class="blueop"></li>
            <li class="purpleop"></li>
            <li class="cyanop"></li>
            <li class="blackop"></li>
            <li class="whiteop"></li>
        </ul>
    </div>
    <div class="opcolor2">
        <div id="selc2" class="yellowop"></div>
        <ul id="color2">
            <li class="redop"></li>
            <li class="yellowop"></li>
            <li class="greenop"></li>
            <li class="blueop"></li>
            <li class="purpleop"></li>
            <li class="cyanop"></li>
            <li class="blackop"></li>
            <li class="whiteop"></li>
        </ul>

    </div>
    <div class="opcount">
        <div id="blo">3x3</div>
        <ul id="blosel">
            <li class="x3">3x3</li>
            <li class="x4">4x4</li>
            <li class="x5">5x5</li>
            <li class="x6">6x6</li>
        </ul>

    </div>
</div>


    <table id="tab">
    </table>


</div>




<script>
var csrf_name = "${_csrf.headerName}";
var csrf_token = "${_csrf.token}";
        let selectionlist1 = document.getElementById("color1");
        let selectedbox1 = document.getElementById("selc1");
        let opcolor1 = document.getElementsByClassName("opcolor1");
        opcolor1[0].addEventListener("click",()=>{
            selectionlist2.classList.remove("showlist");
            selectionblock.classList.remove("showlist");
            if(selectionlist1.classList[0]==null) {
                selectionlist1.classList.add("showlist");
            }else{
                selectionlist1.classList.remove("showlist");
            }

        })
        for (var i = 0; i < selectionlist1.children.length; i++) {
             selectionlist1.children[i].addEventListener("click",(event)=>{
                selectedbox1.classList.remove(selectedbox1.classList[0]);
                selectedbox1.classList.add(event.target.classList[0]);
                receiveRank();


                //console.log(event.target);
            })
        }

        let selectionlist2 = document.getElementById("color2");
        let selectedbox2 = document.getElementById("selc2");
        let opcolor2 = document.getElementsByClassName("opcolor2");

        opcolor2[0].addEventListener("click",()=>{
                selectionlist1.classList.remove("showlist");
                selectionblock.classList.remove("showlist");
            if(selectionlist2.classList[0]==null) {
                selectionlist2.classList.add("showlist");
            }else{
                selectionlist2.classList.remove("showlist");
            }

        })
        for (var i = 0; i < selectionlist2.children.length; i++) {
             selectionlist2.children[i].addEventListener("click",(event)=>{
                selectedbox2.classList.remove(selectedbox2.classList[0]);
                selectedbox2.classList.add(event.target.classList[0]);
                //console.log(event.target);
                receiveRank();
            })
        }


        let selectionblock = document.getElementById("blosel");
        let selectedblockbox = document.getElementById("blo");
        let opcount = document.getElementsByClassName("opcount");
        opcount[0].addEventListener("click",()=>{
            selectionlist1.classList.remove("showlist");
            selectionlist2.classList.remove("showlist");
            if(selectionblock.classList[0]==null) {
                selectionblock.classList.add("showlist");
            }else{
                selectionblock.classList.remove("showlist");
            }

        })
        for (var i = 0; i < selectionblock.children.length; i++) {
             selectionblock.children[i].addEventListener("click",(event)=>{

                selectedblockbox.innerText=event.target.innerText;
                //console.log(event.target);
                receiveRank();
            })
        }

        let colorClassList = ["redop","yellowop","greenop","blueop","purpleop","cyanop","blackop","whiteop"];
        function receiveRank(){
            let c1 = colorClassList.indexOf(selectedbox1.classList[0]);
            let c2 = colorClassList.indexOf(selectedbox2.classList[0]);
            let co = selectedblockbox.innerText.charAt(0);
			console.log(c1);
			console.log(c2);
			console.log(co);
            if(c1!=null&&c2!=null){
                if(c1!=c2){
                    document.getElementById("tab").innerHTML = "Loading";
 				     var request = $.ajax({
                            url: "http://www.applabo.xyz/colorgame/rank",
                            beforeSend: function(xhr){
                          	xhr.setRequestHeader(csrf_name,csrf_token);  
                            },
                            method: "POST",
                            data:{
                                c1:c1,
                                c2:c2,
                                co:co
                            },
                            dataType: "html",
                          	success: function(result) {
                                  document.getElementById("tab").innerHTML=result;
                              }

                    });
                }else{
                    document.getElementById("tab").innerHTML="Again Select Color";
                }
            }else{
                document.getElementById("tab").innerHTML="COLOR ERROR";
            }

        }
    </script>
</body>

<script>
    const width = 400,
        height = 400;
    let appw = 600,
        apph = 800;
    let count = 2; // X x X 원하는크기로 바꿀수 있음
    let MAXNUM = count * count;
    let items = [];
    var num = 0; //시작 넘버
    let color1 = null;
    let color2 = null;
    let colorSet = [];
    let numList = [];
    let shockList = [];
    let ctime;
    let ptime;
    let otime; //맞출때 시간입력
    let hintc = 65793 //힌트컬러
    let inGame = false;
    let sendchk = false; // 보낼때 안겹치게

    const START = 0;
    const CLOSE = 1;
    const SETTING = 2;
    const END = 3;
    const INIT = 4;
    const RANKING = 5;
    const GAMESETTING = 6;

    let settingSnd = false;
    let settingEff = true;

    let backSound = new Audio("sound/back.mp3");
    let s = new Audio("sound/s.wav");
    let f = new Audio("sound/f.wav");

    function soundon(){
        backSound.play();
    }
    function soundoff(){
        backSound.pause();
    }

    // 게임세팅관련 변수
    let colorList = [];
    let colorListC= [[255,0,0],[255,255,0],[0,255,0],[0,0,255],[255,0,255],[0,255,255],[0,0,0],[255,255,255]];
    let colorListP=[[(120/9*1+60*0),550],[(120/9*2+60*1),550],[(120/9*3+60*2),550],[(120/9*4+60*3),550],[(120/9*5+60*4),550],[(120/9*6+60*5),550],[(120/9*7+60*6),550],[(120/9*8+60*7),550]];
    let select=null;

    function loading (){

        backSound.loop = true;

        gamestate(INIT);
    }




    PIXI.loader
        .add("images/rcs.svg")
        .on('error', () => {})
        .load(() => {
            console.log("pixi load complete")
            loading();

        });


    ////////////////////////////////
    ///컬러 리스트
    ////////////////////////////////

    function CreateColorSet(){

        let length =0
        for(i =0 ;i<3 ;i++){
            length += Math.pow(color1[i]-color2[i],2);
        }
        length = Math.sqrt(length);

        if(length>=255){
            let delta = [(color2[0]-color1[0])/MAXNUM,(color2[1]-color1[1])/MAXNUM,(color2[2]-color1[2])/MAXNUM];
            let color = [color1[0],color1[1],color1[2]];
            for(j=0;j<MAXNUM;j++){
                for(k=0;k<3;k++){
                    color[k]+=delta[k];
                }

                if(colorSet.length>1){
                    while(colorSet[colorSet.length-1]==[Math.round(color[0]),Math.round(color[1]),Math.round(color[2])]){
                        for(k=0;k<3;k++){
                            color[k]+=delta[k];
                        }
                    }
                }
                let R =Math.round(color[0])/255
                let G =Math.round(color[1])/255
                let B =Math.round(color[2])/255

                if (R>1) R=1;
                if (G>1) G=1;
                if (B>1) B=1;
                colorSet.push(PIXI.utils.rgb2hex([R,G,B]));
            }

        }else{
            alert("길이가 255 보다 적음")
        }
    }//0~1 , 2~3 , 4~5
    ////////////////////////////////////////////////////////////////////////////////////////////////
    let Application = PIXI.Application,
        Container = PIXI.Container,
        loader = PIXI.loader,
        resources = PIXI.loader.resources,
        Graphics = PIXI.Graphics,
        TextureCache = PIXI.utils.TextureCache,
        Sprite = PIXI.Sprite,
        Text = PIXI.Text,
        TextStyle = PIXI.TextStyle;

    //상자
    let app = new Application(1000, 2000, {
        antialiasing: true,
        transparent: false,
        resolution: 2
    });
     //픽시 폰트스타일
    const style = new PIXI.TextStyle({
    dropShadowColor: "#979797",
    fill: "#ffcacb",
    fillGradientType: 1,
    fillGradientStops: [
        0.1,
        0.5,
        0.9
    ],
    fontFamily: 'MyFont',
    fontSize: 40,
    fontVariant: "small-caps",
    letterSpacing: 8,
    lineJoin: "round",
    miterLimit: 24,
    strokeThickness: 16
});
    //아이템컨테이너 배경

    app.renderer.autoResize = true;
    app.renderer.backgroundColor = 0x000000;
    document.body.appendChild(app.view);

    let frame = new PIXI.Graphics();
    frame.lineStyle(5, 0xffffFF, 1, 0);
    frame.beginFill(0xffffff, 0.5);
    frame.drawRoundedRect(0, 0, appw, apph);
    frame.endFill();


    ///////
    /// 컨테이너
    ///////
    let colorCont = new Container();
    let startCont = new Container();
    let gameCont = new Container;
    let endCont = new Container();
    let setCont = new Container();
    let rankCont = new Container();
    ////////////////////////////////
    //시작창
    ////////////////////////////////



    function Start() {
         let t = new PIXI.Graphics();
        t.lineStyle(5, 0xffffFF, 1, 0);
        t.beginFill(0xffffff, 0);
        t.drawRoundedRect(0, 0, width, 500);
        t.endFill();




        let start = new Text("START", style);
        let setting = new Text("SETTING", style);
        let ranking = new Text("RANKING", style);

        start.anchor.set(0.5, 0.5);
        ranking.anchor.set(0.5, 0.5);
        setting.anchor.set(0.5, 0.5);

        start.position.set(width / 2, height / 4 );
        ranking.position.set(width / 2, height / 4+100);
        setting.position.set(width / 2, height / 4 + 200);

        start.interactive = true;
        start.buttonMode = true;
        start.on('pointerdown', () => {
            gamestate(GAMESETTING)
        });


        ranking.interactive = true;
        ranking.buttonMode = true;
        ranking.on('pointerdown', () => {
            gamestate(RANKING)
        });


        setting.interactive = true;
        setting.buttonMode = true;
        setting.on('pointerdown', () => {
            gamestate(SETTING)
        });

        startCont.addChild(start);
        startCont.addChild(ranking);
        startCont.addChild(setting);

        startCont.addChild(t);
    }
    Start();
    ////////////////////////////////
    //컬러선택
    ////////////////////////////////

    ColorSelct();


    function ColorSelct() {
        let t = new PIXI.Graphics();
        t.lineStyle(5, 0xffffFF, 1, 0);
        t.beginFill(0xffffff, 0);
        t.drawRoundedRect(0, 0, 600, 800);
        t.endFill();

        let count = new Text("BUTTON COUNT", style);
        let colort1 = new Text("COLOR 1", style);
        let colort2 = new Text("COLOR 2", style);
        let st = new Text("START", style);
        let bc = new Text("BACK", style);

        colorCont.addChild(count);
        colorCont.addChild(colort1);
        colorCont.addChild(colort2);
        colorCont.addChild(st);
        colorCont.addChild(bc);

        count.position.set(25,50);
        colort1.position.set(25,300);
        colort2.position.set(325,300);
        st.anchor.set(0.5,0.5);
        st.position.set(200,700);
        bc.anchor.set(0.5,0.5);
        bc.position.set(400,700);
        st.interactive = true;
        st.buttonMode = true;
        bc.interactive = true;
        bc.buttonMode = true;

        st.on('pointerdown',()=>{

            if(colorCont.children[9].children.length==2){
                color1 = colorListC[colorList.indexOf(colorCont.children[9].children[0])]
            }
            if(colorCont.children[10].children.length==2){
                color2 = colorListC[colorList.indexOf(colorCont.children[10].children[0])]
            }
            if(count!=null&&color1!=null&&color2!=null){
                gamestate(START);
            }
        });
        bc.on('pointerdown',()=>{
            gamestate(INIT);
        });


        rect2("3x3",[25,150]).on('pointerdown', fb);
        rect2("4x4",[175,150]).on('pointerdown', fb);
        rect2("5x5",[325,150]).on('pointerdown', fb);
        rect2("6x6",[475,150]).on('pointerdown', fb);


        rect2("",[100,400]).on('pointerdown', fcc);
        rect2("",[400,400]).on('pointerdown', fcc);

        colorList.push(rect(0xff0000,[(120/9*1+60*0),550],"0").on('pointerdown', fc));
        colorList.push(rect(0xffff00,[(120/9*2+60*1),550],"1").on('pointerdown', fc));
        colorList.push(rect(0x00ff00,[(120/9*3+60*2),550],"2").on('pointerdown', fc));
        colorList.push(rect(0x0000ff,[(120/9*4+60*3),550],"3").on('pointerdown', fc));
        colorList.push(rect(0xff00ff,[(120/9*5+60*4),550],"4").on('pointerdown', fc));
        colorList.push(rect(0x00ffff,[(120/9*6+60*5),550],"5").on('pointerdown', fc));
        colorList.push(rect(0x000000,[(120/9*7+60*6),550],"6").on('pointerdown', fc));
        colorList.push(rect(0xffffff,[(120/9*8+60*7),550],"7").on('pointerdown', fc));

        colorCont.addChild(t);

    }


    function rect(color,position,text){
        let grp=new Graphics();
        grp.lineStyle(5,0xffffff,1,0);
        grp.beginFill(color, 1);
        grp.drawRoundedRect(0, 0, 60, 60, 15);
        grp.endFill();
        grp.interactive = true;
        grp.buttonMode = true;
        grp.position.set(position);
        grp.x=position[0];
        grp.y=position[1];
        let t =  new Text(text);
        t.alpha=0;
        grp.addChild(t);
        return grp;
    }
    function rect2(text,position){
        let grp=new Graphics();
        grp.lineStyle(5,0xffffff,1,0);
        grp.beginFill(0x000000, 0);
        grp.drawRoundedRect(0, 0, 100, 100, 100 / 3);
        grp.endFill();
        grp.interactive = true;
        grp.buttonMode = true;
        grp.x=position[0];
        grp.y=position[1];

        //grp.on('pointerdown', onClick);

        let t =  new Text(text, style);
        t.anchor.set(0.5,0.5);
        t.position.set(grp.width/2,grp.height/2);
        grp.addChild(t);
        colorCont.addChild(grp);
        return grp;
    }

    function fb(){ // 버튼클릭
        colorCont.children[8].tint = 0xffffff;
        colorCont.children[5].tint = 0xffffff;
        colorCont.children[6].tint = 0xffffff;
        colorCont.children[7].tint = 0xffffff;
        this.tint=0xff0000;
        count = parseInt(this.children[0].text.charAt(0));
        MAXNUM = count*count;
    }

   function fcc(){ //컬러클릭
        if(colorCont.children[9] ==this){//버튼1 선택
            if(colorCont.children[10].children.length==2){ //선택되어있음
                for(i=0;i<colorList.length;i++){
                    if(colorCont.children[10].children[0]==colorList[i]){
                        continue;
                    }

                    colorCont.addChild(colorList[i]);
                    colorList[i].position.set(colorListP[i][0],colorListP[i][1]);
                }
            }else{//선택안됨
                for(i=0;i<colorList.length;i++){
                    colorCont.addChild(colorList[i]);
                    colorList[i].position.set(colorListP[i][0],colorListP[i][1]);
                }
            }
        }else{//버튼2 선택
               if(colorCont.children[9].children.length==2){ //선택되어있음
                for(i=0;i<colorList.length;i++){
                    if(colorCont.children[9].children[0]==colorList[i]){
                        continue;
                    }
                    colorCont.addChild(colorList[i]);
                    colorList[i].position.set(colorListP[i][0],colorListP[i][1]);
                }
            }else{//선택안됨
                for(i=0;i<colorList.length;i++){
                    colorCont.addChild(colorList[i]);
                    colorList[i].position.set(colorListP[i][0],colorListP[i][1]);
                }
            }
        }
        select = this;
    }
    function fc(){  //컬러선택
        if(select.children.length<2){
            select.addChildAt(this,0);
            this.position.set(20,20);

        }else{
            select.removeChildAt(0);
            fcc.call(select);
            select.addChildAt(this,0);
            this.position.set(20,20);
        }
    }

    ////////////////////////////////
    //세팅
    ////////////////////////////////


    function Setting() {
        let t = new PIXI.Graphics();
        t.lineStyle(5, 0xffffFF, 1, 0);
        t.beginFill(0xffffff, 0);
        t.drawRoundedRect(0, 0, 550, 500);
        t.endFill();



        let sound = new Text("SOUND \t: OFF", style);
        let effect = new Text("EFFECT \t: OFF", style);
        let back = new Text("BACK", style);

        if (settingSnd) sound.text = "SOUND \t: ON"
        if (settingEff) effect.text = "EFFECT \t: ON"

        sound.anchor.set(0.5, 0.5);
        effect.anchor.set(0.5, 0.5);
        back.anchor.set(0.5, 0.5);

        sound.position.set(550 / 2, height / 4 );
        effect.position.set(550 / 2, height / 4 + 100);
        back.position.set(550 / 2, height / 4 + 300);

        sound.interactive = true;
        sound.buttonMode = true;
        sound.on('pointerdown', () => {
            settingSnd = !settingSnd;
            if (settingSnd) {
                sound.text = "SOUND \t: ON"
                backSound.play();
            }
            else {
                sound.text = "SOUND \t: OFF"
                backSound.pause();
            }
        });

       

        effect.interactive = true;
        effect.buttonMode = true;
        effect.on('pointerdown', () => {
            settingEff = !settingEff;
            if (settingEff) effect.text = "EFFECT \t: ON"
            else effect.text = "EFFECT \t: OFF"

        });

        back.interactive = true;
        back.buttonMode = true;
        back.on('pointerdown', () => {
            gamestate(INIT)
        });

        setCont.addChild(sound);
        setCont.addChild(effect);
        setCont.addChild(back);
        setCont.addChild(t);
    }
    Setting();
    ////////////////////////////////
    //랭킹
    ////////////////////////////////


    function Ranking() {
        let t = new PIXI.Graphics();
        t.lineStyle(5, 0xffffFF, 1, 0);
        t.beginFill(0xffffff, 0);
        t.drawRoundedRect(0, 0, 500, 700);
        t.endFill();

        let back = new Text("BACK", style);

        back.anchor.set(0.5, 0.5);

        back.position.set(500 / 2, 650);

        back.interactive = true;
        back.buttonMode = true;

        back.on('pointerdown', () => {
            gamestate(INIT)
            document.getElementsByClassName("rank")[0].style.display="none";
        });

        rankCont.addChild(back);
        rankCont.addChild(t);
    }
    Ranking();
    /////////////////////////////////
    //상단바
    /////////////////////////////////

const tst = new PIXI.TextStyle({
    dropShadowColor: "#979797",
    fill: "#c6c5e7",
    fillGradientType: 1,
    fillGradientStops: [
        0.1,
        0.5,
        0.9
    ],
    fontFamily: 'MyFont',
    fontSize: 40
});
    let timerT = new PIXI.Text("00 : 00 : 00", tst);
    timerT.position.set(width / 2, -60);
    timerT.anchor.set(0.5, 0.5);
    let timer = new PIXI.Graphics();
    timer.lineStyle(5, 0xffffFF, 1, 0);
    timer.drawRoundedRect(0, -100, width, 80);
    timer.interactive = true;
    timer.on('mouseover', mouseover);
    timer.on('mouseout', mouseout);
    timer.addChild(timerT);


    ////////////////////////////////
    ///게임종료
    ////////////////////////////////

    function End() {
        let t = new PIXI.Graphics();
        t.lineStyle(5, 0xffffFF, 1, 0);
        t.beginFill(0xffffff, 0);
        t.drawRoundedRect(0, 0, width, 500);
        t.endFill();

        let record = new Text("RECORD",style);
        let restart = new Text("RESTART", style);
        let rank = new Text("UPLOAD", style);
        let close = new Text("BACK", style);

        record.anchor.set(0.5, 0.5);
        restart.anchor.set(0.5, 0.5);
        rank.anchor.set(0.5, 0.5);
        close.anchor.set(0.5, 0.5);

        record.position.set(width / 2, height / 4);
        restart.position.set(width / 2, height / 4+100);
        rank.position.set(width / 2, height / 4 + 200);
        close.position.set(width / 2, height / 4 + 300);

        restart.interactive = true;
        restart.buttonMode = true;
        restart.on('pointerdown', () => {
            gamestate(GAMESETTING);
        });

        close.interactive = true;
        close.buttonMode = true;
        close.on('pointerdown', () => {
            gamestate(INIT)
        });

        rank.interactive = true;
        rank.buttonMode = true;
        rank.on('pointerdown', () => {

        	<sec:authorize access="isAuthenticated()">

        		let name = '<sec:authentication property="principal.member.email"/>'
        		let ele = document.createElement("div");
        		ele.innerHTML=name;
        		sendRecord(ele.innerText);
        	</sec:authorize>

	        <sec:authorize access="isAnonymous()">
	        alert("Please login to regiser your record")
	        </sec:authorize>
            
            
        });

        endCont.addChild(record);
        endCont.addChild(restart);
        endCont.addChild(rank);
        endCont.addChild(close);
        endCont.addChild(t);
    }
    End();

    ///////////////////////////////
    /// 버튼
    ///////////////////////////////
    function Grid() {
        num = 0;
        numList = createList();
        let gap = 10;
        let buttonSize = (width - (count + 1) * gap) / count;
        for (i = 0; i < count; i++) {
            items[i] = [];
            for (j = 0; j < count; j++) {
                let inputNum = numList[num++];
                let text = new PIXI.Text(inputNum);
                text.alpha = 0;
                text.position.set((width / count) / 2 - gap / 2, (height / count) / 2 - gap / 2);
                text.anchor.set(0.5, 0.5);

                let rrect = new PIXI.Graphics();
                rrect.beginFill(colorSet[inputNum - 1], 1);
                rrect.drawRoundedRect(0, 0, buttonSize, buttonSize, buttonSize / 3);
                rrect.endFill();
                rrect.x = i * (buttonSize + gap) + gap;
                rrect.y = j * (buttonSize + gap) + gap;
                rrect.interactive = true;
                rrect.buttonMode = true;
                rrect.on('pointerdown', onClick);
                rrect.addChild(text);
                let sp = PIXI.Sprite.from("images/rcs.svg");
                sp.position.set(0, 0);
                sp.scale.set(buttonSize / 512, buttonSize / 512);
                rrect.addChild(sp);

                gameCont.addChild(rrect);
                items[i][j] = rrect;
            }
        }
        // 틀
        let t = new PIXI.Graphics();
        t.lineStyle(5, 0xffffFF, 1, 0);
        t.beginFill(0xffffff, 0);
        t.drawRoundedRect(0, 0, width, height);
        t.endFill();


        gameCont.addChild(t);
        // Back
        let close = new Text("BACK", style);
        close.anchor.set(0.5, 0.5);
        close.position.set(width / 2, height+100 );
        close.interactive = true;
        close.buttonMode = true;
        close.on('pointerdown', () => {
            gameCont.removeChildren();
            gamestate(INIT);
        });

        gameCont.addChild(close);

        gameCont.addChild(timer);
        //
        num = 1;
    }

    ///////////////////////////////
    ///클릭
    ///////////////////////////////
    function onClick() {


        if (this.children[0].text == num) {
            this.alpha = 0;

            //effect
            let shock = new PIXI.filters.ShockwaveFilter();
            shockList.push(shock);
            shock.time = 0;
            shock.center = {
                x: this.x + (width / count) / 2,
                y: this.y + (height / count) / 2
            };
            shock.amplitude = 5;
            shock.wavelength = 50;
            shock.speed = 2000;
            shock.brightness = 1;
            //sound
            if(settingSnd) correctSound();

            //여유되면 이전거 필터제거

            if (num != MAXNUM) {
                frame.tint = colorSet[num++];
                //app.renderer.backgroundColor =
                otime = new Date().getTime(); //맞춘거 확인
            } else {
                inGame = false;
                gamestate(END);


            }

        } else {
            //틀림

            if(settingSnd) incorrectSound();
        }
    }
    ////////////////////////////////
    ///기록
    ////////////////////////////////
    function sendRecord(name) {
        if(sendchk){
            if(name!=null){
                 //application/x-www-form-urlencoded
                endCont.children[2].text="UPLOADING..."
                	 var request = $.ajax({
                         url: "http://www.applabo.xyz/colorgame/send",
                         beforeSend: function(xhr){
                       	xhr.setRequestHeader(csrf_name,csrf_token);  
                         },
                         method: "POST",
                         data: {
                             email: name,
                             mm: mm,
                             ss: ss,
                             ms: ms,
                             c1:colorListC.indexOf(color1),
                             c2:colorListC.indexOf(color2),
                             co: count
                         },
                         dataType: "html",
                         success: function(result) {
                             //alert("업로드 성공!!");
                             sendchk=false;
                             endCont.children[2].text = "RANK : " + result;
                         },
                         error: function(jqXHR,textStatus,errorThrown){
                             alert("Error Uploading");
                             sendchk=true;
                         }

                 });
             
                //file ~~color2에서 서버 http:205~~~로 ajax로보내면
            }

        }



    }

    function mouseover() {
        if (this.alpha != 0) this.alpha = 0.5;
    }

    function mouseout() {
        if (this.alpha != 0) this.alpha = 1;
    }
    function correctSound(){
        s.currentTime=0;
        s.play();
    }
    function incorrectSound(){
        f.currentTime=0;
        f.play();
    }


    function createList() {
        let list = [];
        let chk = true;
        while (list.length < MAXNUM) {
            chk = true;
            let num = Math.floor(Math.random() * MAXNUM) + 1;
            list.forEach(function(currentValue, index, arr) {
                if (num == currentValue) {
                    chk = false;
                }
            });
            if (chk) {
                list.push(num);
            }
        }
        return list;
    }

    function effect() {
        shockList.forEach((shock) => {
            shock.time = (shock.time >= 0.4 || shock.time == -1) ? -1 : shock.time + 0.01;
            if (shock.time == -1) {
                shock.enabled = false;
            }
            gameCont.filters = [shock];
        });
    }
    let ms = 0;
    let mm = 0;
    let ss = 0;

    function timechk() {
        ctime = new Date().getTime();
        let timed = ctime - ptime;
        ms = Math.floor((timed % 1000) / 10);
        if (ms < 10) ms = "0" + ms;
        mm = Math.floor(timed / 60000);
        if (mm < 10) mm = "0" + mm;
        ss = Math.floor(timed / 1000) - mm * 60;
        if (ss < 10) ss = "0" + ss;
        timerT.text = mm + " : " + ss + " : " + ms;

    }

    function hint() {
        let octime = new Date().getTime();
        if ((octime - otime) / 1000 > 2) {
            //다음거 필터넣기
            let nn = numList.indexOf(num);
            let i = Math.floor(nn / count);
            let j = Math.floor(nn % count);

            if (items[i][j].children[1].tint < Math.abs(hintc) * 8) {
                hintc = Math.abs(hintc);
            } else if (items[i][j].children[1].tint > (0xffffff - Math.abs(hintc) * 8)) {
                hintc = -1 * Math.abs(hintc);
            }
            items[i][j].children[1].tint += hintc * 8;
        }
    }

    function resize() {
        gameCont.x = (frame.width - gameCont.width) / 2
        gameCont.y = 200;
        endCont.x = (frame.width - endCont.width) / 2
        endCont.y = 100;
        startCont.x = (frame.width - startCont.width) / 2
        startCont.y = 100;
        setCont.x = (frame.width - setCont.width) / 2
        setCont.y = 100;
        rankCont.x = (frame.width - rankCont.width) / 2
        rankCont.y = 50;

        let cappw = window.innerWidth*0.9;
        let capph = cappw*4/3;
        if (window.innerWidth *4/3 > window.innerHeight) {
            //height에 맞춤
            capph = window.innerHeight*0.9;
            cappw = capph*3/4;

        }
        app.stage.scale.set(cappw/appw,capph/apph);


        //console.log("cappw :" + cappw +" ,appw :"+appw+", capph :"+capph+", apph :"+apph );
        // cappw :1296 ,appw :600, capph :1728, apph800
        document.getElementsByClassName("rank")[0].style.transform=["scale("+cappw/appw+","+capph/apph+")"];
        document.getElementsByClassName("rank")[0].style.transformOrigin="top";
        document.getElementsByClassName("rank")[0].style.top=(app.renderer.height/4-app.stage.height*2/5)+"px";
        //document.getElementsByClassName("rank")[0].style.height=app.stage.height+"px";


        app.stage.x = (app.screen.width - app.stage.width) / 2;
        app.stage.y = (app.screen.height - app.stage.height) / 2;
    }

    function gamestate(state) {
        switch (state) {
            case START: //start
                app.stage.removeChildren();
                app.stage.addChild(frame);
                app.stage.addChild(gameCont);
                items = [];
                num = 0; //시작 넘버
                colorSet = [];
                numList = [];
                inGame = true;
                ptime = new Date().getTime();
                otime = new Date().getTime();
                CreateColorSet();
                frame.tint = colorSet[0];
                Grid();
                //
                break;
            case CLOSE:
                backSound.pause();
                //Android.clos();
                break;
            case SETTING:

                app.stage.removeChildren();
                app.stage.addChild(frame);
                app.stage.addChild(setCont);
                break;
            case END:
                inGame=false;
                sendchk=true;
                endCont.children[2].text= "UPLOAD";
                app.stage.removeChildren();
                app.stage.addChild(frame);
                endCont.children[0].text = mm+" : "+ss+" : "+ms;
                app.stage.addChild(endCont);
                break;
            case INIT:
                inGame=false;
                app.stage.removeChildren();
                app.stage.addChild(frame);
                app.stage.addChild(startCont);

                break;
            case RANKING:
                frame.tint = 0xeeeeee;
                app.stage.removeChildren();
                app.stage.addChild(frame);
                app.stage.addChild(rankCont);

                document.getElementsByClassName("rank")[0].style.display="block";
                receiveRank();
                break;
                case GAMESETTING:
                colorCont.children[8].tint = 0xffffff;
                colorCont.children[5].tint = 0xff0000;
                colorCont.children[6].tint = 0xffffff;
                colorCont.children[7].tint = 0xffffff;

                count =3;
                MAXNUM = count*count;
                color1=null;
                color2=null;

                app.stage.removeChildren();
                app.stage.addChild(colorCont);
                for(i=0;i<colorList.length;i++){
                    if(colorList[i].parent!=null){
                        colorList[i].parent.removeChild(colorList[i]);
                    }
                    colorList[i].position.set(colorListP[i][0],colorListP[i][1]);
                }

                break;
        }
    }

    app.ticker.add(function(time) {
        if (inGame) {
            timechk();
            try{
                hint()
            }catch(exception_var_1){
                console.log(exception_var_1);

        }
        }
        if(settingEff) effect();
        resize();
        app.renderer.resize(window.innerWidth, window.innerHeight)

    });
</script>

</html>
