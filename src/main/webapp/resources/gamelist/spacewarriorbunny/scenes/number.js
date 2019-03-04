//class GamePlay extends Phaser.scene{
//    contructor(){
//        super({key:"GamePlay"});
//    }
var scale =0.5;
var bomb;
var bombTimer;
var camera;
var expl1 ;
// Declare objects
var player;
var enemies = [];
var repeat=3;
var difficulty;
var enemiesAreSafe = true;
var first;
var second;
var third;
var playerX = 400;
var playerY = 250;
var delay = 5000;

// HP
var hitPoints = 3;
var hitPointsString = "Life: ";
var hitPointsText;
var answer;
var timer;
var roButton; 
var graphics;
var clockSize = 69;
var OX;
var button;
var button2;
var button3;
var gameOverButton;
var gameOverButton2;
var cursors;

// score
var score = 0;
var scoreString = "Score: ";
var scoreText;
var questionString ="";
var questionText;
var introText;

var option="2";
var option2="2";

// Game started boolean
var gameStarted;

// Game ended boolean
var finishedGame;
var camera2;
var gamePlay= new Phaser.Class({
  // Define scene
  Extends: Phaser.Scene, 
  initialize: function () {
      
    Phaser.Scene.call(this, { key: 'GamePlay' });
      
  },
  
    
  /*--- THE PRELOAD FUNCTION: LOAD THE ASSETS ---*/
  
  preload: function() {
      cam= this.cameras.main;
    // Preload images
      
    this.load.image(
      "sky",
      "assets/space.png"
    );
    this.load.spritesheet(
      "dude",
      "assets/real_warrior.png",
      {
        frameWidth: 96,
        frameHeight: 96
      }
    );
    this.load.spritesheet(
      "baddie",
      "assets/alien.png",
      {
        frameWidth: 128,
        frameHeight: 128
      }
    );
    this.load.spritesheet(
      "easy",
      "assets/easy.png",
      {
        frameWidth: 192,
        frameHeight: 192
      }
    );
      
    this.load.spritesheet(
      "normal",
      "assets/normal.png",
      {
        frameWidth: 192,
        frameHeight: 192
      }
    );
    this.load.spritesheet(
      "hard",
      "assets/hard.png",
      {
        frameWidth: 192,
        frameHeight: 192
      }
    );
      this.load.spritesheet(
      "bomb",
      "assets/bomb6.png",
      {
        frameWidth: 192,
        frameHeight: 192
      }
    );
       this.load.spritesheet(
      "retry",
      "assets/retry.png",
      {
        frameWidth: 192,
        frameHeight: 192
      }
    );
       this.load.spritesheet(
      "back",
      "assets/back.png",
      {
        frameWidth: 192,
        frameHeight: 192
      }
    );
  },
    
    
    

  
  
  create: function() {
    
    this.physics.add.sprite(config.width / 2, config.height / 2, "sky");

    // Create player
    player = this.physics.add.sprite(playerX,playerY, "dude");
      
      player.setCircle(30);
     
console.log(this);
      console.log("test");

 this.cameras.main.setBounds(0, 0, 800, 600);

    this.cameras.main.setZoom(1);
    this.cameras.main.centerOn(0, 0);

    
    
    this.anims.create({
      key: "left",
      frames: this.anims.generateFrameNumbers("dude", { start: 0, end: 0 }),
      repeat: -1
    });
    this.anims.create({
      key: "down",
      frames: this.anims.generateFrameNumbers("dude", { start: 1, end: 1 }),
      repeat: -1
    });
    this.anims.create({
      key: "right",
      frames: this.anims.generateFrameNumbers("dude", { start: 2, end: 2 })
    });
    this.anims.create({
      key: "up",
      frames: this.anims.generateFrameNumbers("dude", { start: 3, end: 3 })
    });

    // Player should collide with edges of the screen
    player.setCollideWorldBounds(true);
    player.visible=false;
    
    // Keyboard input
    cursors = this.input.keyboard.createCursorKeys();

    // Start enemies as unsafe
    enemiesAreSafe = false;

    // Create enemies
    enemies = this.physics.add.staticGroup({
      key: "baddie",
      repeat: 2
    });
      
    // Go thru each child and make sure it's on screen
      var x = 2;
      var tmpX = 200;
      enemies.children.iterate(function(enemy) {
          enemy.number = x-2;
          enemy.answer = false;
 
      enemy.setX(tmpX);
      enemy.setY(450);
//          enemy.setOffset(500,500);
//          enemy.anchor.setTo(0.5, 0.5);
          enemy.setCircle(40);
//          enemy.setSize(50,50);
//          enemy.setDragY=500;
//          enemy.setDragX=tmpX+100;
          
    enemy.visible = false;
          tmpX+=200;
      
    });

    // Create animations for enemy
    this.anims.create({
      key: "safe",
      frames: this.anims.generateFrameNumbers("baddie", { start: 1, end: 1 })
    });

    this.anims.create({
      key: "unsafe",
      frames: this.anims.generateFrameNumbers("baddie", { start: 0, end: 0 })
    });

    // Update the physics colliders
    enemies.refresh();

    // Generate text for score
    scoreText = this.add.text(32, 24, scoreString + score);
    scoreText.setFontFamily('font1');  
    scoreText.visible = false;
      questionText = this.add.text(300, 130, scoreString + score);
    questionText.visible = false;

      
    // Generate text for HP
    hitPointsText = this.add.text(32, 64, hitPointsString + hitPoints);
    hitPointsText.visible = false;

    // Generate intro text
    introText = this.add.text(
      40,
      20,
      "\n          ##Space Warrior Bunny##\n\nEliminate aliens trying to colonize moon\n\n\n\n  Select level"
    );
     ;
      OX = this.add.text(
      600,
      100,
      ""
    );
      introText.setFontSize(40);
      introText.setFontFamily('font1');
      scoreText.setFontSize(30);
      questionText.setFontSize(40);
      OX.setFontSize(30);
      hitPointsText.setFontSize(30);
      
      
      
      var sparks = this.add.particles('exImgs');
		this.coinspark = sparks.createEmitter({
			frame: [ 'sparkle1', 'sparkle2' ],
			quantity: 15,
			scale: { start: 1.0, end: 0 },
			on: false,
			speed: 200,
			lifespan: 500
		});
      
      
      
      var expl1 = this.add.particles('exImgs');
		this.bombexpl1 = expl1.createEmitter({
			frame: [ 'bombexpl1' ],
			frequency: 100,
			quantity: 10,
			scale: { start: 1.0, end: 0 },
			speed: { min: -1000, max: 1000 },
			lifespan: 800,
			on: false
		});
      
      var expl2 = this.add.particles('exImgs');
		this.bombexpl2 = expl2.createEmitter({
			frame: [ 'bombexpl2' ],
			quantity: 3,
			scale: { start: 2.0, end: 0 },
			frequency: 500,
			on: false,
			speed: { min: -200, max: 200 },
			lifespan: 1000
		});
      
      bomb = this.add.sprite(620,240,'bomb');
      bomb.setScale(scale);
      bomb.visible = false;
    button = this.add.sprite(400, 250, 'easy').setInteractive();
      button2= this.add.sprite(400, 350, 'normal').setInteractive();
      button3 = this.add.sprite(400, 450, 'hard').setInteractive();
      gameOverButton= this.add.sprite(400, 250, 'retry').setInteractive();
      gameOverButton2 = this.add.sprite(400, 350, 'back').setInteractive();
      
      button.on('pointerup', function (pointer) {

        if (!gameStarted) {
            difficulty=5;
        startGame();
      }

        }).on('pointerover',function(){
          button.setScale(1.2);
          }).on('pointerout',function(){
            button.setScale(1);
          });
      
        button2.on('pointerup', function (pointer) {

           if (!gameStarted) {
            difficulty=10;
               
        startGame();
      }

    }).on('pointerover',function(){
          button2.setScale(1.2);
            
          }).on('pointerout',function(){
            button2.setScale(1);
            
          });
        button3.on('pointerup', function (pointer) {
            
           if (!gameStarted) {
            difficulty=15;
        startGame();
      }

    }).on('pointerover',function(){
          button3.tint = 800000000;
            button3.setScale(1.3);
            roButton=3;
          }).on('pointerout',function(){
            button3.tint = 16777215;
            button3.setScale(1);
            roButton=-1;
            
          });
      
      
          gameOverButton.on('pointerup', function (pointer) {

        if (!gameStarted) {
        startGame();
      }

    }).on('pointerover',function(){
          gameOverButton.tint = 11777215;
              gameOverButton.setScale(1.2);
          }).on('pointerout',function(){
            gameOverButton.tint = 16777215;
              gameOverButton.setScale(1);
              
          });
      
      
          gameOverButton2.on('pointerup', function (pointer) {

        if (!gameStarted) {
        selectLevel();
      }

    }).on('pointerover',function(){
          gameOverButton2.tint = 11777215;
              gameOverButton2.setScale(1.2);
              
          }).on('pointerout',function(){
            gameOverButton2.tint = 16777215;
              gameOverButton2.setScale(1);
              
          });
      
      gameOverButton.visible=false;
      gameOverButton2.visible=false;

    // Add game start click event
    this.input.on("pointerdown", function() {

    });

    // Generate timer
  
      
    timer = this.time.addEvent({ 
        delay: delay, 
        callback: plusQuestions,
        
        timeScale: 1, 
        loop: true
    });  
      
    
    
       graphics = this.add.graphics({ x: 0, y: 0 });
    // On overlap, run function
    this.physics.add.overlap(player, enemies, collideWithEnemy, null, this);
      
      
      
         first = this.add.text(190, 370, "option").setInteractive();
         first.setFontSize(30);

      first.visible=false;
      
   second = this.add.text(390, 370, option2).setInteractive();
 
          second.setFontSize(30);
      second.visible=false;
      
   
      
      
      third = this.add.text(590, 370, "dsadsa").setInteractive();
    third.setFontSize(30);
      
      third.visible=false;
      
      
           


    

   
  },
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
   

  /*--- THE UPDATE FUNCTION: MAKE CHANGES TO THE GAME OVER TIME ---*/
  update: function() {
      
      if(roButton==1)button.angle+=5;
          else if(roButton==2)button2.angle+=5;
          else if(roButton==3)button3.angle+=3;
          else if(roButton==4)gameOverButton.angle+=5;
          else if(roButton==5)  gameOverButton2.angle+=5;
        else{
            button.angle=0;
            button2.angle=0;
            button3.angle=0;
            gameOverButton.angle=0;
            gameOverButton2.angle=0;
        }
      
    // Update objects & variables
    player.setVelocity(0, 0);
    if (gameStarted && !finishedGame) {
      if (cursors.left.isDown) {
        //  Move to the left
        player.setVelocityX(-150);
        player.anims.play("left");
      } else if (cursors.right.isDown) {
        //  Move to the right
        player.setVelocityX(150);
        player.anims.play("right");
      }
      if (cursors.up.isDown) {
        //  Move up
        player.setVelocityY(-150);
        player.anims.play("up");
      } else if (cursors.down.isDown) {
        //  Move down
        player.setVelocityY(150);
        player.anims.play("down");
      }
        
  


      // Update score
      scoreText.setText(scoreString + score);
      hitPointsText.setText(hitPointsString + hitPoints);
              questionText.setText(questionString);
        

        
        graphics.clear();

    drawClock(100, 250, timer);
        
    }
      
  }
    



}
                               
                               
                               
                               );





function drawClock (x, y, timer)
{
    //  Progress is between 0 and 1, where 0 = the hand pointing up and then rotating clockwise a full 360

    //  The frame
    graphics.lineStyle(3, 0xffffff, 1);
    graphics.strokeCircle(x, y, clockSize);

    var angle;
    var dest;
    var p1;
    var p2;
    var size;

    //  The overall progress hand (only if repeat > 0)
    if (timer.repeat > 0)
    {
        size = clockSize * 0.9;

        angle = (360 * timer.getOverallProgress()) - 90;
        dest = Phaser.Math.RotateAroundDistance({ x: x, y: y }, x, y, Phaser.Math.DegToRad(angle), size);

        graphics.lineStyle(2, 0xff0000, 1);

        graphics.beginPath();

        graphics.moveTo(x, y);

        p1 = Phaser.Math.RotateAroundDistance({ x: x, y: y }, x, y, Phaser.Math.DegToRad(angle - 5), size * 0.7);

        graphics.lineTo(p1.x, p1.y);
        graphics.lineTo(dest.x, dest.y);

        graphics.moveTo(x, y);

        p2 = Phaser.Math.RotateAroundDistance({ x: x, y: y }, x, y, Phaser.Math.DegToRad(angle + 5), size * 0.7);

        graphics.lineTo(p2.x, p2.y);
        graphics.lineTo(dest.x, dest.y);

        graphics.strokePath();
        graphics.closePath();
    }

    //  The current iteration hand
    size = clockSize * 0.95;

    angle = (360 * timer.getProgress()) - 90;
    dest = Phaser.Math.RotateAroundDistance({ x: x, y: y }, x, y, Phaser.Math.DegToRad(angle), size);

    graphics.lineStyle(2, 0xffff00, 1);

    graphics.beginPath();

    graphics.moveTo(x, y);

    p1 = Phaser.Math.RotateAroundDistance({ x: x, y: y }, x, y, Phaser.Math.DegToRad(angle - 5), size * 0.7);

    graphics.lineTo(p1.x, p1.y);
    graphics.lineTo(dest.x, dest.y);

    graphics.moveTo(x, y);

    p2 = Phaser.Math.RotateAroundDistance({ x: x, y: y }, x, y, Phaser.Math.DegToRad(angle + 5), size * 0.7);

    graphics.lineTo(p2.x, p2.y);
    graphics.lineTo(dest.x, dest.y);

    graphics.strokePath();
    graphics.closePath();
}





 

/*--- GLOBAL FUNCTIONS ---*/

// Change enemies from safe to unsafe
function switchEnemyState(number) {
    
                
  if (gameStarted && !finishedGame) {
    if (enemiesAreSafe == false) {
      enemiesAreSafe = true;
      enemies.children.iterate(function(enemy) {
        enemy.anims.play("safe");
        // Set to safe
      });
    } else {
      enemiesAreSafe = false;
      enemies.children.iterate(function(enemy) {
        enemy.anims.play("unsafe");
        // Set to unsafe
      });
    }
//      enemiesAreSafe = true;
  }
    
}
// Change enemies from safe to unsafe
function switchEnemyState2(enemy) {
  if (gameStarted && !finishedGame) {
    if (enemiesAreSafe == false) {
      enemiesAreSafe = true;
      
        enemy.anims.play("safe");
        // Set to safe
      
    } else {
      enemiesAreSafe = false;
     
        enemy.anims.play("unsafe");
        // Set to unsafe
     
    }
      enemiesAreSafe = false;
  }
}
var cam;
function refreshByTimer(){
    
    if (gameStarted && !finishedGame) {
        OX.visible=true;
        OX.setText("Time out!")
        enemiesAreSafe = true;
         switchEnemyState();
        hitPoints--;
        
        
        console.log(gamePlay);
        cam.shake(500, 0.004, true, null);
        if (hitPoints <= 0) {
            
            cam.shake(2500, 0.004, true, null);
        cam.alpha = 1;
        cam.pan(650, 250, 2000, 'Sine.easeInOut');
        cam.zoomTo(3, 3000);
      killGame();
            if(gameStarted&&hitPoints<=0){
//                timedEvent();
                timedEvent = this.time.addEvent({ 
                    delay: 3000, 
                    callback: killGame,
                    timeScale: 1, 
                   
                }); 
                gameStarted=false;
        }
      
    }
        plusQuestions();
    }
}
function showButtons(){
    gameOverButton.visible=true;
    gameOverButton2.visible=true;
    
}


///questions
function plusQuestions(){
//    if (gameStarted && !finishedGame) {
        if (true) {
         enemies.children.iterate(function(enemy) {
        enemy.answer=false;

    });
    questionString="";
    var i;
    var sum=0;
    var operator;
    
    for(i=0;i<repeat;i++){
        var num = Math.floor(Math.random()*difficulty)+1;
        var num2 = Math.floor(Math.random()*2);
        console.log("test");
        if(i==0){
                    operator="";
        }
        else if((num2%2)==0){
                
                    operator="+";     
        }
        else{ 
            operator="-";    
        }
        
                
        if(i==repeat-1){
            questionString+=operator+num.toString()+"= ?";
        }
        else{
            
            questionString+=operator+num.toString();
        }
        if(operator=="+"||operator==""){
            sum+=num;
        }else if (operator=="-"){
            sum-=num;
        }

    }
//    questionString+=sum.toString();
    
    var variation = (Math.floor(Math.random()*4)+1);
    option = sum+variation;
    option2 = sum-(Math.floor(Math.random()*4)+1);
    
    var list = [option.toString(),sum.toString(),option2.toString()];
    var count,tmpNum;
    
    for(count = 0; count<list.length;count++){
        var ranNum = (Math.floor(Math.random()*(list.length)));
        
        tmpNum=list[count];
        list[count] = list[ranNum];
        list[ranNum]  = tmpNum;
    }
    
    first.setText(list[0]);
    second.setText(list[1]);
    third.setText(list[2]);
    answer = enemies.getChildren()[list.indexOf(sum.toString())];
    answer.answer=true;
    
    
    
    
    timer.reset({delay: delay, 
        callback: refreshByTimer,
        timeScale: 1, 
        loop: true});
    
    }
}
var warning = 1;

// Collision with enemy
function collideWithEnemy(player, enemy) {
  if (gameStarted && !finishedGame) {
      OX.visible=true;
    if (enemy.answer == true) {
        
        
        
        this.coinspark.setPosition(enemy.x, enemy.y);
        this.coinspark.explode();
        score+=300;
        OX.setText("Correct !")
        enemiesAreSafe = true;
        switchEnemyState();
        plusQuestions();       
    } else {        
        scale+=0.3;
        bomb.setScale(scale);
       console.log(this);
        
        camera2 = this;
        cam = this.cameras.main; 
        
        cam.shake(500, 0.004, false, null);
        
        if(hitPoints==3){            
            bombTimer = this.time.addEvent({ 
                delay: 300, 
                callback: function blink(){
                    if(warning==1){
                        bomb.tint = 800000000;
                        warning=2;
                    }else if(warning==2){
                        warning = 1;
                        bomb.tint = 500000000;
                    }
                },  
                timeScale: 1, 
                loop: true
            });  
        }
        
        else if(hitPoints==2)
            bomb.tint = 800000000;
        this.bombexpl1.setPosition(enemy.x, enemy.y);
        this.bombexpl1.explode();
        this.bombexpl2.setPosition(enemy.x, enemy.y);
		this.bombexpl2.explode();
        switchEnemyState2(enemy);
        OX.setText("Incorrect !");
        hitPoints--;
    }
  
    player.setX(playerX);
    player.setY(playerY);
    
    if (hitPoints <= 0) {
        bombTimer.destroy();
        this.bombexpl1.setPosition(bomb.x, bomb.y);
		this.bombexpl1.explode();
        this.bombexpl2.setPosition(bomb.x, bomb.y);
		this.bombexpl2.explode();
        cam.shake(2500, 0.004, true, null);
        cam.alpha = 1;
        cam.pan(650, 250, 2000, 'Sine.easeInOut');
        cam.zoomTo(3, 3000);
        if(gameStarted){
            gameOverEffect(this);
//            killGame();
            
        }
        
        gameStarted=false;
    }
  }
}
function gameOverEffect(a){
    timedEvent = a.time.addEvent({ 
                delay: 3000, 
                callback: killGame,
                timeScale: 1 
//                loop:true
            }); 
    
//    killGame();
}
function bombEffect(a){
    
    a.bombexpl1.setPosition(bomb.x, bomb.y);
		a.bombexpl1.explode();
        a.bombexpl2.setPosition(bomb.x, bomb.y);
		a.bombexpl2.explode();
}
var timedEvent;

// Start the game
function startGame() {
    plusQuestions();
    bomb.visible=true;
    graphics.visible=true;
    timer.reset({delay: delay, 
        callback: refreshByTimer,
        timeScale: 1, 
        loop: true});
     gameStarted = true;
            gameOverButton.visible = false;
    gameOverButton2.visible = false;
         first.visible=true;
         second.visible=true;
         third.visible=true;
    enemies.children.iterate(function(enemy) {
        enemy.visible = true;
    });
  introText.visible = false;
    player.visible=true;
    
  scoreText.visible = true;
    plusQuestions();
  questionText.visible = true;
  hitPointsText.visible = true;
 
  finishedGame = false;
    enemiesAreSafe=true;
    switchEnemyState();
    button.visible = false;
    button2.visible = false;
    button3.visible = false;
   
}

function selectLevel(){
    
              gameOverButton.visible = false;
    gameOverButton2.visible = false;
    first.visible=false;
         second.visible=false;
         third.visible=false;
     enemies.children.iterate(function(enemy) {
        enemy.visible = false;
    });
    introText.setText("\n                  Select level");
  introText.visible = true;
    player.visible=false;
    scoreText.visible = false;
    
  questionText.visible = false;
  hitPointsText.visible = false;
  gameStarted = false;
  finishedGame = true;
    button.visible = true;
    button2.visible = true;
    button3.visible = true;
    
}

// End the game
function killGame() {
    
    scale=0.5;
    bomb.setScale(scale);
    bomb.visible=false;
    graphics.visible=false;
    gameStarted = false;
    var cam2 = camera2.cameras.main;
     cam2.pan(cam2.originX, cam2.originY, 0, 'Sine.easeInOut');
             cam2.zoomTo(1, 0);
   
    timedEvent.destroy();
    bombTimer.destroy();
    bomb.tint = 16777215;
    
    hitPoints=3;
  finishedGame = true;
  player.setVelocity(0, 0);
  introText.visible = true;

  scoreText.visible = false;
  hitPointsText.visible = false;
             first.visible=false;
         second.visible=false;
         third.visible=false;
    enemies.children.iterate(function(enemy) {
        enemy.visible = false;
    });
  
    player.visible=false;
    
  
    
  questionText.visible = false;
  hitPointsText.visible = false;
  
    OX.visible = false;
    
    showButtons(); 
    introText.setText("\n             Game Over! Retry?\n           "+"        score : "+score);
    score=0;
}
export default gamePlay;
/*--- CONFIG + RUNNING THE GAME ---*/

//Define the game config once everything else is defined
var config = {
  type: Phaser.AUTO,
  width: 800,
  height: 600,
  pixelArt: true,
  physics: {
    default: "arcade",
    arcade: {
      gravity: { y: 0 },
      debug: true
    }
  },
  scene: gamePlay
};

//Instantiate the game with the config
//var game = new Phaser.Game(config);
