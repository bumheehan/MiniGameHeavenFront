import SceneA from './scenes/SceneA.js';
import GamePlay from './scenes/number.js';


var sceneA = new SceneA();

var config = {
   
  type: Phaser.AUTO,
  width: 800,
  height: 600,
  pixelArt: true,
  physics: {
    default: "arcade",
    arcade: {
      gravity: { y: 0 },
      debug: false
    }
  },
  scene: [SceneA,GamePlay]
};

var game = new Phaser.Game(config);
//game.scene.add('SceneA',sceneA);
//game.scene.start('SceneA');
//start();
//function start(){
//    alert("start");
//                        for (var i = 0; i < 150; i++) {
//                game.load.image('logo'+i, '../zenvalogo.png');
//                        }
//            
//    
//}
